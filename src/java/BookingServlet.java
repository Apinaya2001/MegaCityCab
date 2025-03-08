import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/city_cab";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Booking> bookings = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String query = "SELECT * FROM bookings";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getString("phone_no"),
                        rs.getString("start_location"),
                        rs.getString("end_location"),
                        rs.getString("cab")
                );
                bookings.add(booking);
            }

            request.setAttribute("bookings", bookings);
            request.getRequestDispatcher("dashboard/bookingDetails.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?error=db_error");
        } finally {
            closeConnection(conn, stmt, rs);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("book".equals(action)) {
            bookCab(request, response);
        } else {
            response.sendRedirect("errorBooking.jsp?error=invalid_action");
        }
    }

    private void bookCab(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String fullName = request.getParameter("fullName");
    String phoneNo = request.getParameter("phone");
    String startLoc = request.getParameter("startLoc");
    String endLoc = request.getParameter("endLoc");
    String cab = request.getParameter("cab");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String bookingId = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

        String query = "INSERT INTO bookings (full_name, phone_no, start_location, end_location, cab) VALUES (?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        stmt.setString(1, fullName);
        stmt.setString(2, phoneNo);
        stmt.setString(3, startLoc);
        stmt.setString(4, endLoc);
        stmt.setString(5, cab);

        int rowsInserted = stmt.executeUpdate();
        if (rowsInserted > 0) {
            rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                bookingId = rs.getString(1);
            }
            response.sendRedirect("BillingServlet?bookingId=" + bookingId);
        } else {
            response.sendRedirect("bookingFailed.jsp?error=db_error");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        response.sendRedirect("bookingFailed.jsp?error=db_error");
    } finally {
        closeConnection(conn, stmt, rs);
    }
}
    private void closeConnection(Connection conn, PreparedStatement stmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Booking model class for storing booking data
    public static class Booking {
        private int id;
        private String fullName;
        private String phoneNo;
        private String startLocation;
        private String endLocation;
        private String cab;

        public Booking(int id, String fullName, String phoneNo, String startLocation, String endLocation, String cab) {
            this.id = id;
            this.fullName = fullName;
            this.phoneNo = phoneNo;
            this.startLocation = startLocation;
            this.endLocation = endLocation;
            this.cab = cab;
        }

        public int getId() { return id; }
        public String getFullName() { return fullName; }
        public String getPhoneNo() { return phoneNo; }
        public String getStartLocation() { return startLocation; }
        public String getEndLocation() { return endLocation; }
        public String getCab() { return cab; }
    }
}
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

    // Handle GET request - Fetch all bookings
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Booking> bookings = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("SELECT * FROM bookings");
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Booking booking = new Booking(
                            rs.getInt("id"),
                            rs.getString("full_name"),
                            rs.getString("phone"),
                            rs.getString("pickup_loc"),
                            rs.getString("dropoff_loc"),
                            rs.getString("cab")
                    );
                    bookings.add(booking);
                }
            }

            request.setAttribute("bookings", bookings);
            request.getRequestDispatcher("dashboard/booking.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?error=driver_not_found");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?error=db_error");
        }
    }

    // Handle POST request - Insert a new booking
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String startLocation = request.getParameter("startLoc");
        String endLocation = request.getParameter("endLoc");
        String cabType = request.getParameter("cab");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement(
                         "INSERT INTO bookings (full_name, phone, pickup_loc, dropoff_loc, cab) VALUES (?, ?, ?, ?, ?)",
                         Statement.RETURN_GENERATED_KEYS)) {

                stmt.setString(1, fullName);
                stmt.setString(2, phone);
                stmt.setString(3, startLocation);
                stmt.setString(4, endLocation);
                stmt.setString(5, cabType);

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    try (ResultSet rs = stmt.getGeneratedKeys()) {
                        if (rs.next()) {
                            String bookingId = rs.getString(1);
                            response.sendRedirect("BillingServlet?bookingId=" + bookingId);
                            return;
                        }
                    }
                }
            }
            response.sendRedirect("bookingFailed.jsp?error=db_error");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?error=driver_not_found");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("bookingFailed.jsp?error=db_error");
        }
    }

    // Booking model class
    public static class Booking {
        private int id;
        private String fullName;
        private String phone;
        private String pickupLoc;
        private String dropoffLoc;
        private String cab;

        public Booking(int id, String fullName, String phone, String pickupLoc, String dropoffLoc, String cab) {
            this.id = id;
            this.fullName = fullName;
            this.phone = phone;
            this.pickupLoc = pickupLoc;
            this.dropoffLoc = dropoffLoc;
            this.cab = cab;
        }

        public int getId() {
            return id;
        }

        public String getFullName() {
            return fullName;
        }

        public String getPhone() {
            return phone;
        }

        public String getPickupLoc() {
            return pickupLoc;
        }

        public String getDropoffLoc() {
            return dropoffLoc;
        }

        public String getCab() {
            return cab;
        }
    }
}
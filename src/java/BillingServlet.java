import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/city_cab";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");

        if (bookingId != null && !bookingId.isEmpty()) {
            generateBill(request, response, bookingId);
        } else {
            response.sendRedirect("error.jsp?error=no_booking_id");
        }
    }

    private void generateBill(HttpServletRequest request, HttpServletResponse response, String bookingId)
            throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("SELECT full_name, phone, pickup_loc, dropoff_loc, cab FROM bookings WHERE id = ?")) {
                
                stmt.setString(1, bookingId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String fullName = rs.getString("full_name");
                        String phone = rs.getString("phone");
                        String startLoc = rs.getString("pickup_loc");
                        String endLoc = rs.getString("dropoff_loc");
                        String cab = rs.getString("cab");

                        double fare = calculateFare(cab);
                        saveBillToDatabase(bookingId, fullName , phone, startLoc, endLoc, cab, fare);

                        request.setAttribute("fullName", fullName);
request.setAttribute("phone", phone);
request.setAttribute("startLoc", startLoc);
request.setAttribute("endLoc", endLoc);
request.setAttribute("cab", cab);
request.setAttribute("fare", fare);


                        RequestDispatcher dispatcher = request.getRequestDispatcher("billing.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        response.sendRedirect("error.jsp?error=booking_not_found");
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            response.sendRedirect("error.jsp?error=driver_not_found");
        } catch (SQLException e) {
            response.sendRedirect("error.jsp?error=db_error");
        }
    }

    private void saveBillToDatabase(String bookingId, String fullName, String phone, String pickup, String dropoff, String cabType, double fare) {
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO billing (booking_id, full_name, phone, pickup_location, dropoff_location, cab_type, fare) VALUES (?, ?, ?, ?, ?, ?, ?)");) {

            stmt.setString(1, bookingId);
            stmt.setString(2, fullName);
            stmt.setString(3, phone);
            stmt.setString(4, pickup);
            stmt.setString(5, dropoff);
            stmt.setString(6, cabType);
            stmt.setDouble(7, fare);

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private double calculateFare(String cabType) {
        switch (cabType.toLowerCase()) {
            case "car": return 800;
            case "van": return 1000;
            default: return 1200;
        }
    }
}
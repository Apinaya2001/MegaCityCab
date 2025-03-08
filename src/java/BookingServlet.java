import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import jakarta.servlet.*;

public class BookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Database connection variables
        String url = "jdbc:mysql://localhost:3308/city_cab";
        String username = "root";
        String password = "";

        // Initialize database connection and statement
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to database
            conn = DriverManager.getConnection(url, username, password);

            // Create statement
            stmt = conn.createStatement();

            // SQL query to fetch user data along with booking and cab details
            String query = "SELECT users.id, users.full_name, users.phone_number, bookings.start_location, " +
                    "bookings.end_location, GROUP_CONCAT(cabs.model) AS cabs " +
                    "FROM users " +
                    "LEFT JOIN bookings ON users.id = bookings.user_id " +
                    "LEFT JOIN cabs ON bookings.cab_id = cabs.cab_id " +
                    "GROUP BY users.id";

            // Execute query
            rs = stmt.executeQuery(query);

            // Set the result in request attribute for JSP
            request.setAttribute("userDetails", rs);

            // Forward the request to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("userDetails.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            // Handle exceptions and display error message
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

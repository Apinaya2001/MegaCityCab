import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class driverManagement extends HttpServlet {
    private Connection conn;

    @Override
    public void init() throws ServletException {
        // Set up the database connection
        try {
            String dbURL = "jdbc:mysql://localhost:3308/city_cab";
            String dbUsername = "root";
            String dbPassword = "";
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
        } catch (SQLException e) {
            throw new ServletException("DB connection error: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch the list of drivers
        try {
            String query = "SELECT * FROM drivers";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            // Store the drivers in the request scope for use in JSP
            request.setAttribute("drivers", rs);
            RequestDispatcher dispatcher = request.getRequestDispatcher("driverManagement.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Add a new driver
        String driverID = request.getParameter("driverID");
        String name = request.getParameter("name");
        String license = request.getParameter("license");
        String status = request.getParameter("status");

        try {
            String query = "INSERT INTO drivers (driverID, name, license, status) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, driverID);
            stmt.setString(2, name);
            stmt.setString(3, license);
            stmt.setString(4, status);

            int result = stmt.executeUpdate();

            if (result > 0) {
                // Redirect to the same page to refresh the driver list
                response.sendRedirect("driverManagement");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to add driver");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }

    @Override
    public void destroy() {
        // Close the database connection
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

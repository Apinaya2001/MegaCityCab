import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DriverManagementServlet")
public class DriverManagementServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/city_cab";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "save":
                saveDriver(request, response);
                break;
            case "edit":
                editDriver(request, response);
                break;
            case "delete":
                deleteDriver(request, response);
                break;
            default:
                response.sendRedirect("driverManagement.jsp?status=error&message=Invalid action");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getDrivers(request, response);
    }

    private void saveDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("driverName");
        String cab = request.getParameter("cabAssigned");
        String license = request.getParameter("licenseNumber");
        String status = request.getParameter("status");

        if (name == null || cab == null || license == null || status == null) {
            response.sendRedirect("dashboard/driverManagement.jsp?error=missing_fields");
            return;
        }

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO drivers (name, cab_assigned, license_number, status) VALUES (?, ?, ?, ?)")) {
            stmt.setString(1, name);
            stmt.setString(2, cab);
            stmt.setString(3, license);
            stmt.setString(4, status);

            int rowsAffected = stmt.executeUpdate();
            response.sendRedirect(rowsAffected > 0 ? "dashboard/driverManagement.jsp?success=saved" : "dashboard/driverManagement.jsp?error=db_error");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("dashboard/driverManagement.jsp?error=db_error&message=" + e.getMessage());
        }
    }

    private void editDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String driverIdStr = request.getParameter("driverId");
        String name = request.getParameter("driverName");
        String cab = request.getParameter("cabAssigned");
        String license = request.getParameter("licenseNumber");
        String status = request.getParameter("status");

        if (driverIdStr == null || name == null || cab == null || license == null || status == null) {
            response.sendRedirect("dashboard/driverManagement.jsp?error=missing_fields");
            return;
        }

        int driverId;
        try {
            driverId = Integer.parseInt(driverIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("dashboard/driverManagement.jsp?error=invalid_id");
            return;
        }

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(
                     "UPDATE drivers SET name = ?, cab_assigned = ?, license_number = ?, status = ? WHERE driver_id = ?")) {

            stmt.setString(1, name);
            stmt.setString(2, cab);
            stmt.setString(3, license);
            stmt.setString(4, status);
            stmt.setInt(5, driverId);

            int rowsAffected = stmt.executeUpdate();
            response.sendRedirect(rowsAffected > 0 ? "dashboard/driverManagement.jsp?success=updated" : "dashboard/driverManagement.jsp?error=db_error");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("dashboard/driverManagement.jsp?error=db_error&message=" + e.getMessage());
        }
    }

    private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String driverIdStr = request.getParameter("id");

        if (driverIdStr == null) {
            response.sendRedirect("dashboard/driverManagement.jsp?status=error&message=Missing driver ID");
            return;
        }

        int driverId;
        try {
            driverId = Integer.parseInt(driverIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("dashboard/driverManagement.jsp?status=error&message=Invalid driver ID");
            return;
        }

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM drivers WHERE driver_id = ?")) {
            stmt.setInt(1, driverId);
            int rowsAffected = stmt.executeUpdate();

            response.sendRedirect(rowsAffected > 0 ? "dashboard/driverManagement.jsp?status=success&message=Driver deleted successfully" : "dashboard/driverManagement.jsp?status=error&message=Failed to delete driver");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("dashboard/driverManagement.jsp?status=error&message=Database error: " + e.getMessage());
        }
    }

    private void getDrivers(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<String> drivers = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM drivers");
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                drivers.add(rs.getInt("driver_id") + "," + rs.getString("name") + "," + rs.getString("license_number") + "," + rs.getString("cab_assigned"));
            }
            response.setContentType("text/plain");
            response.getWriter().write(String.join("\n", drivers));
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
        }
    }
}
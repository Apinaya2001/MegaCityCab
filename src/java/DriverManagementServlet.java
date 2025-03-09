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

    // Ensure the action is not null or empty
    if (action == null || action.trim().isEmpty()) {
        response.sendRedirect("driverManagement.jsp?error=invalid_action");
        return;
    }

    switch (action) {
        case "save":
            saveDriver(request, response);
            break;
        case "edit":
            editDriver(request, response);
            break;
        case "delete":
            deleteDriver(request, response);  // Call the delete method here
            break;
        default:
            response.sendRedirect("driverManagement.jsp?error=invalid_action");
    }
}


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getDrivers(request, response);
    }

    private void saveDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("driverName");
        String license = request.getParameter("licenseNumber");
        String cab = request.getParameter("cabAssigned");
        String status = request.getParameter("status");

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO drivers (name, license_number, cab_assigned, status) VALUES (?, ?, ?, ?)")) {
            
            stmt.setString(1, name);
            stmt.setString(2, license);
            stmt.setString(3, cab);
            stmt.setString(4, status);

            int rowsAffected = stmt.executeUpdate();
            response.sendRedirect(rowsAffected > 0 ? "dashboard/driverManagement.jsp?success=saved" : "driverManagement.jsp?error=db_error");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("dashboard/driverManagement.jsp?error=db_exception");
        }
    }

  private void editDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
    int driverId = Integer.parseInt(request.getParameter("driverId"));
    String driverName = request.getParameter("driverName");
    String licenseNumber = request.getParameter("licenseNumber");
    String cabAssigned = request.getParameter("cabAssigned");
    String status = request.getParameter("status");

    try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
         PreparedStatement stmt = conn.prepareStatement(
                 "UPDATE drivers SET name = ?, license_number = ?, cab_assigned = ?, status = ? WHERE driver_id = ?")) {
        
        stmt.setString(1, driverName);
        stmt.setString(2, licenseNumber);
        stmt.setString(3, cabAssigned);
        stmt.setString(4, status);
        stmt.setInt(5, driverId); // Ensure driverId is correctly set

        int rowsAffected = stmt.executeUpdate();
        response.sendRedirect(rowsAffected > 0 ? "dashboard/driverManagement.jsp?success=updated" : "driverManagement.jsp?error=db_error");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("dashboard/driverManagement.jsp?error=db_exception");
    }
}
   private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
    // Retrieve the driverId from the request parameter
    int driverId = Integer.parseInt(request.getParameter("driverId"));

    try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
         PreparedStatement stmt = conn.prepareStatement("DELETE FROM drivers WHERE driver_id = ?")) {
        
        stmt.setInt(1, driverId);  // Set the driver ID for deletion

        int rowsAffected = stmt.executeUpdate();  // Execute the delete operation

        // Redirect based on whether the deletion was successful
        if (rowsAffected > 0) {
            response.sendRedirect("dashboard/driverManagement.jsp?success=deleted");
        } else {
            response.sendRedirect("dashboard/driverManagement.jsp?error=db_error");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("dashboard/driverManagement.jsp?error=db_exception");
    }
}



    private void getDrivers(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<String> drivers = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM drivers");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                drivers.add(rs.getInt("id") + "," + rs.getString("name") + "," +
                            rs.getString("license_number") + "," + rs.getString("cab_assigned") + "," +
                            rs.getString("status"));
            }
            response.setContentType("text/plain");
            response.getWriter().write(String.join("\n", drivers));
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
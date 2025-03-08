import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/CabManagementServlet")
public class CabManagementServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("save".equals(action)) {
            saveCab(request, response);
        } else if ("update".equals(action)) {
            updateCab(request, response);
        }
    }

    private void saveCab(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String model = request.getParameter("model");
        String driver = request.getParameter("driver");
        String licenseNumber = request.getParameter("licenseNumber");
        String status = request.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/city_cab", "root", "");
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO cabs (model, driver, license_number, status) VALUES (?, ?, ?, ?)");
            stmt.setString(1, model);
            stmt.setString(2, driver);
            stmt.setString(3, licenseNumber);
            stmt.setString(4, status);
            stmt.executeUpdate();
            conn.close();
            response.sendRedirect("dashboard/cabManagement.jsp");  // Redirect after saving the new cab
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateCab(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cabId = request.getParameter("cabId");
        String model = request.getParameter("model");
        String driver = request.getParameter("driver");
        String licenseNumber = request.getParameter("licenseNumber");
        String status = request.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/city_cab", "root", "");
            PreparedStatement stmt = conn.prepareStatement("UPDATE cabs SET model = ?, driver = ?, license_number = ?, status = ? WHERE cab_id = ?");
            stmt.setString(1, model);
            stmt.setString(2, driver);
            stmt.setString(3, licenseNumber);
            stmt.setString(4, status);
            stmt.setInt(5, Integer.parseInt(cabId));  // Ensure cabId is correctly parsed
            stmt.executeUpdate();
            conn.close();
            response.sendRedirect("dashboard/cabManagement.jsp");  // Redirect after updating the cab
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
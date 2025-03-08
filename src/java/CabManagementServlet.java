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

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/city_cab", "root", "");
            
            if ("save".equals(action)) {
                String model = request.getParameter("model");
                String driver = request.getParameter("driver");
                String licenseNumber = request.getParameter("licenseNumber");
                String status = request.getParameter("status");

                PreparedStatement stmt = conn.prepareStatement("INSERT INTO cabs (model, driver, license_number, status) VALUES (?, ?, ?, ?)");
                stmt.setString(1, model);
                stmt.setString(2, driver);
                stmt.setString(3, licenseNumber);
                stmt.setString(4, status);
                stmt.executeUpdate();
                
                response.sendRedirect("dashboard/cabManagement.jsp");

            } else if ("update".equals(action)) {
                int cabId = Integer.parseInt(request.getParameter("cabId"));
                String model = request.getParameter("model");
                String driver = request.getParameter("driver");
                String licenseNumber = request.getParameter("licenseNumber");
                String status = request.getParameter("status");

                PreparedStatement stmt = conn.prepareStatement("UPDATE cabs SET model = ?, driver = ?, license_number = ?, status = ? WHERE cab_id = ?");
                stmt.setString(1, model);
                stmt.setString(2, driver);
                stmt.setString(3, licenseNumber);
                stmt.setString(4, status);
                stmt.setInt(5, cabId);
                stmt.executeUpdate();
                
                response.sendRedirect("dashboard/cabManagement.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int cabId = Integer.parseInt(request.getParameter("id"));
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/city_cab", "root", "");

                PreparedStatement stmt = conn.prepareStatement("DELETE FROM cabs WHERE cab_id = ?");
                stmt.setInt(1, cabId);
                stmt.executeUpdate();

                response.sendRedirect("dashboard/cabManagement.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/city_cab";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String nic = request.getParameter("nic");
        String address = request.getParameter("address");

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("signup.jsp?error=password_mismatch");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Insert user data with a default role
            String query = "INSERT INTO users (full_name, email, password, nic, address, role) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            stmt.setString(1, fullName);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, nic);
            stmt.setString(5, address);
            stmt.setString(6, "user"); // Default role

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    int userId = rs.getInt(1);

                    HttpSession session = request.getSession();
                    session.setAttribute("userId", userId);
                    session.setAttribute("userFullName", fullName);
                    session.setAttribute("userEmail", email);
                    session.setAttribute("userNIC", nic);
                    session.setAttribute("userAddress", address);

                    response.sendRedirect("login.jsp?register=success");
                }
            } else {
                response.sendRedirect("signup.jsp?error=db_error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=db_error");
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

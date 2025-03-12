import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/city_cab";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    // Hardcoded admin credentials
    private static final String ADMIN_USERNAME = "admin@gmail.com";
    private static final String ADMIN_PASSWORD = "1234";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        if (username.equals(ADMIN_USERNAME) && password.equals(ADMIN_PASSWORD)) {
            session.setAttribute("user", username);
            session.setAttribute("role", "admin");
            session.setAttribute("success", "Login successful! Welcome, Admin.");
            response.sendRedirect("dashboard/dashboard.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                session.setAttribute("email", username);
                session.setAttribute("role", "user");
                session.setAttribute("success", "Login successful! Welcome back.");
                response.sendRedirect("index.jsp");
            } else {
                session.setAttribute("error", "Invalid username or password. Please try again.");
                response.sendRedirect("login.jsp");
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Database connection error. Please try again later.");
            response.sendRedirect("login.jsp");
        }
    }
}

//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.sql.*;
//import org.mindrot.jbcrypt.BCrypt;
//
//@WebServlet("/SignupServlet")
//public class SignupServlet extends HttpServlet {
//
//    private static final String DB_URL = "jdbc:mysql://localhost:3306/cab_booking"; 
//    private static final String DB_USER = "root"; 
//    private static final String DB_PASSWORD = ""; 
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        // Retrieve form data
//        String fullName = request.getParameter("fullName");
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//
//        // Ensure input validation
//        if (fullName == null || fullName.trim().isEmpty() || 
//            email == null || email.trim().isEmpty() || 
//            password == null || password.trim().isEmpty()) {
//            response.sendRedirect("signup.jsp?error=invalid_input");
//            return;
//        }
//
//        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
//            // Load MySQL JDBC Driver
//            Class.forName("com.mysql.cj.jdbc.Driver");
//
//            // Check if email already exists
//            String checkEmailQuery = "SELECT 1 FROM users WHERE email = ?";
//            try (PreparedStatement checkStmt = conn.prepareStatement(checkEmailQuery)) {
//                checkStmt.setString(1, email);
//                try (ResultSet rs = checkStmt.executeQuery()) {
//                    if (rs.next()) {
//                        // Email already exists
//                        response.sendRedirect("signup.jsp?error=email_exists");
//                        return;
//                    }
//                }
//            }
//
//            // Hash password using BCrypt
//            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
//
//            // Insert new user into the database
//            String insertQuery = "INSERT INTO users (full_name, email, password, role) VALUES (?, ?, ?, 'user')";
//            try (PreparedStatement stmt = conn.prepareStatement(insertQuery)) {
//                stmt.setString(1, fullName);
//                stmt.setString(2, email);
//                stmt.setString(3, hashedPassword);
//
//                int rowsInserted = stmt.executeUpdate();
//                if (rowsInserted > 0) {
//                    // Signup successful
//                    response.sendRedirect("login.jsp?success=1");
//                } else {
//                    response.sendRedirect("signup.jsp?error=insert_failed");
//                }
//            }
//
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//            response.sendRedirect("signup.jsp?error=driver_error");
//        } catch (SQLException e) {
//            e.printStackTrace();
//            response.sendRedirect("signup.jsp?error=db_error");
//        }
//    }
//}

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/city_cab";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Insert user data with a default role
            String query = "INSERT INTO users (full_name, email, password, role) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, fullName);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, "user"); // Default role

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                // Redirect to login page with a success message
                response.sendRedirect("login.jsp?register=success");
            } else {
                // Redirect to signup page with an error message
                response.sendRedirect("register.jsp?error=db_error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to signup page with an error message
            response.sendRedirect("register.jsp?error=db_error");
        } finally {
            // Close resources
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
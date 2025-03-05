
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve username and password from form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Dummy authentication (Replace this with database authentication)
        if ("admin".equals(username) && "1234".equals(password)) {
            response.sendRedirect("dashboard/dashboard.jsp");  // Redirect to dashboard on success
        } else {
            response.sendRedirect("index.jsp?error=Invalid credentials"); // Redirect back with error
        }
    }
}

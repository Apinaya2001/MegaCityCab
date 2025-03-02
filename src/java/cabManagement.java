import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddCabServlet")
public class cabManagement extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form values
        String model = request.getParameter("model");
        String driver = request.getParameter("driver");
        String status = request.getParameter("status");

        // Here, you can add database insertion logic if needed.

        // Redirect back to the JSP page
        response.sendRedirect("cabManagement.jsp");
    }
}

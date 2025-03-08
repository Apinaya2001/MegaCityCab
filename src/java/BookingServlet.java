import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String start_location = request.getParameter("start_location");
        String end_location = request.getParameter("end_location");
        String selected_cab = request.getParameter("selected_cab");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            // Database Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "");

            String sql = "INSERT INTO bookings (name, phone, start_location, end_location, selected_cab) VALUES (?, ?, ?, ?, ?)";
            pst = con.prepareStatement(sql);

            pst.setString(1, name);
            pst.setString(2, phone);
            pst.setString(3, start_location);
            pst.setString(4, end_location);
            pst.setString(5, selected_cab); // ENUM value

            int row = pst.executeUpdate();

            if (row > 0) {
                response.sendRedirect("booking-success.jsp");
            } else {
                response.sendRedirect("booking-failure.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("booking-failure.jsp");
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}

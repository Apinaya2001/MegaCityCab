<%@page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet"%>

<table class="border-collapse w-full">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Start Location</th>
            <th>End Location</th>
            <th>Cab Type</th>
            <th>Booking Time</th>
        </tr>
    </thead>
    <tbody>
        <%
            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;
            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Connect to Database
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "");

                // SQL Query to Fetch Bookings
                pst = con.prepareStatement("SELECT * FROM bookings ORDER BY id DESC");
                rs = pst.executeQuery();

                // Loop through the results and display the booking data
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("start_location") %></td>
            <td><%= rs.getString("end_location") %></td>
            <td><%= rs.getString("selected_cab") %></td>
            <td><%= rs.getTimestamp("booking_time") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close resources to prevent memory leaks
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            }
        %>
    </tbody>
</table>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
</head>
<body class="bg-gray-100 flex">

    <!-- Sidebar -->
    <aside class="bg-emerald-600 text-white w-[222px] min-h-screen p-6 fixed shadow-lg">
        <h1 class="text-3xl font-extrabold mb-8 text-center tracking-wide">Mega City Cab</h1>
        <nav class="space-y-4">
            <a href="dashboard.jsp" class="flex items-center text-lg p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">
                <i class="fa-solid fa-tachometer-alt mr-3"></i> Dashboard
            </a>
            <a href="userDetails.jsp" class="flex items-center text-lg p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">
                <i class="fa-solid fa-users mr-3"></i> Users
            </a>
            <a href="driverManagement.jsp" class="flex items-center text-lg p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">
                <i class="fa-solid fa-user-tie mr-3"></i> Drivers
            </a>
            <a href="cabManagement.jsp" class="flex items-center text-lg p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">
                <i class="fa-solid fa-car-side mr-3"></i> Cabs
            </a>
            <a href="bookingDetails.jsp" class="flex items-center text-lg p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">
                <i class="fa-solid fa-list-alt mr-3"></i> Bookings
            </a>
        </nav>
    </aside>

    <!-- Main Content -->
    <div class="flex-1 ml-56">
        <header class="bg-emerald-600 text-white p-4 flex items-center justify-between">
            <h1 class="text-2xl font-bold"></h1>
            <a href="logout.jsp" class="bg-emerald-600 text-white font-bold px-4 py-2 rounded-lg hover:bg-white hover:text-emerald-500 hover:shadow-lg transition duration-300">Logout</a>
        </header>

        <main class="p-10">
            <div class="bg-white p-6 shadow-md rounded-lg mb-6">
                <h2 class="text-2xl font-bold text-emerald-600 mb-6">User Details</h2>
                <div class="overflow-x-auto bg-white shadow-lg rounded-lg">
                    <table class="min-w-full table-auto">
                        <thead class="bg-emerald-600 text-white">
                            <tr>
                                <th class="py-3 px-6 text-left text-sm">ID</th>
                                <th class="py-3 px-6 text-left text-sm">Full Name</th>
                                <th class="py-3 px-6 text-left text-sm">Phone Number</th>
                                <th class="py-3 px-6 text-left text-sm">Start Location</th>
                                <th class="py-3 px-6 text-left text-sm">End Location</th>
                                <th class="py-3 px-6 text-left text-sm">Cabs</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/city_cab", "root", "");
                                 Statement stmt = conn.createStatement();
                                 ResultSet rs = stmt.executeQuery("SELECT users.id, users.full_name, users.phone_number, bookings.start_location, bookings.end_location, GROUP_CONCAT(cabs.model) AS cabs " +
                                                                "FROM users " +
                                                                "LEFT JOIN bookings ON users.id = bookings.user_id " +
                                                                "LEFT JOIN cabs ON bookings.cab_id = cabs.cab_id " +
                                                                "GROUP BY users.id")) {

                                while (rs.next()) {
                            %>
                            <tr>
                                <td class="py-3 px-6"><%= rs.getInt("id") %></td>
                                <td class="py-3 px-6"><%= rs.getString("full_name") %></td>
                                <td class="py-3 px-6"><%= rs.getString("phone_number") %></td>
                                <td class="py-3 px-6"><%= rs.getString("start_location") %></td>
                                <td class="py-3 px-6"><%= rs.getString("end_location") %></td>
                                <td class="py-3 px-6"><%= rs.getString("cabs") != null ? rs.getString("cabs") : "No cabs assigned" %></td>
                            </tr>
                            <%
                                }
                            } catch (Exception e) {
                                out.println("<tr><td colspan='6' class='text-danger text-center py-3'>Error: " + e.getMessage() + "</td></tr>");
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</body>
</html>

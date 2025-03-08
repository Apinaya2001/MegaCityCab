<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex">

    <!-- Sidebar -->
    <aside class="bg-emerald-600 text-white w-[222px] min-h-screen p-6 fixed shadow-lg">
        <h1 class="text-3xl font-extrabold mb-8 text-center">Mega City Cab</h1>
        <nav class="space-y-4">
            <a href="dashboard.jsp" class="block p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">Dashboard</a>
            <a href="userDetails.jsp" class="block p-2 rounded-lg bg-white text-emerald-500">Users</a>
            <a href="driverManagement.jsp" class="block p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">Drivers</a>
            <a href="cabManagement.jsp" class="block p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">Cabs</a>
            <a href="bookingDetails.jsp" class="block p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">Bookings</a>
        </nav>
    </aside>

    <!-- Main Content -->
    <div class="flex-1 ml-56">
        <header class="bg-emerald-600 text-white p-4 flex items-center justify-between">
            <h1 class="text-2xl font-bold">User Management</h1>
            <a href="logout.jsp" class="bg-white text-emerald-600 px-4 py-2 rounded-lg hover:bg-emerald-700 hover:text-white transition">Logout</a>
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
                                <th class="py-3 px-6 text-left text-sm">Email</th>
                                <th class="py-3 px-6 text-left text-sm">Role</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/city_cab", "root", "");
                                 Statement stmt = conn.createStatement();
                                 ResultSet rs = stmt.executeQuery("SELECT * FROM users")) {

                                while (rs.next()) {
                            %>
                            <tr>
                                <td class="py-3 px-6"><%= rs.getInt("id")%></td>
                                <td class="py-3 px-6"><%= rs.getString("full_name")%></td>
                                <td class="py-3 px-6"><%= rs.getString("email")%></td>
                                <td class="py-3 px-6"><%= rs.getString("role")%></td>
                            </tr>
                            <%
                                }
                            } catch (Exception e) {
                                out.println("<tr><td colspan='4' class='text-danger text-center py-3'>Error: " + e.getMessage() + "</td></tr>");
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
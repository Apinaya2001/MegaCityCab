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
            <a href="userDetails.jsp" class="block p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">Users</a>
            <a href="driverManagement.jsp" class="block p-2 rounded-lg bg-white text-emerald-500">Drivers</a>
            <a href="cabManagement.jsp" class="block p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">Cabs</a>
            <a href="bookingDetails.jsp" class="block p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">Bookings</a>
        </nav>
    </aside>

    <!-- Main Content -->
    <div class="flex-1 ml-56">
        <header class="bg-emerald-600 text-white p-4 flex items-center justify-between">
            <h1 class="text-2xl font-bold">Driver Management</h1>
            <a href="logout.jsp" class="bg-white text-emerald-600 px-4 py-2 rounded-lg hover:bg-emerald-700 hover:text-white transition">Logout</a>
        </header>

        <main class="p-10">
            <div class="bg-white p-6 shadow-md rounded-lg mb-6">

                <!-- Header + Add Button -->
                <div class="flex justify-between mb-6">
                    <h2 class="text-2xl font-bold text-emerald-600">Manage Your Drivers</h2>
                    <button id="openModalBtn" class="bg-emerald-600 text-white py-2 px-6 rounded-lg font-bold shadow-lg hover:bg-emerald-700 transition">
                        New Driver
                    </button>
                </div>

                <!-- Add Driver Modal -->
                <div id="modal" class="hidden fixed inset-0 flex items-center justify-center bg-black bg-opacity-50">
                    <div class="bg-white p-6 rounded-lg shadow-xl w-1/3">
                        <h2 class="text-2xl font-semibold text-center text-gray-800 mb-4">Add New Driver</h2>
                        <form action="../DriverManagementServlet" method="post">
                            <input type="hidden" name="action" value="save">
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-700">Driver Name</label>
                                <input type="text" name="driverName" class="mt-1 p-2 w-full border rounded-md" required>
                            </div>
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-700">License Number</label>
                                <input type="text" name="licenseNumber" class="mt-1 p-2 w-full border rounded-md" required>
                            </div>
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-700">Cab Assigned</label>
                                <input type="text" name="cabAssigned" class="mt-1 p-2 w-full border rounded-md" required>
                            </div>
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-700">Status</label>
                                <input type="text" name="status" class="mt-1 p-2 w-full border rounded-md" required>
                            </div>
                            <div class="flex justify-end space-x-4">
                                <button type="submit" class="bg-emerald-600 text-white py-2 px-4 rounded-lg hover:bg-emerald-700">Add Driver</button>
                                <button type="button" id="closeModalBtn" class="bg-gray-300 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-400">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Edit Driver Modal -->
                <div id="editModal" class="hidden fixed inset-0 flex items-center justify-center bg-black bg-opacity-50">
                    <div class="bg-white p-6 rounded-lg shadow-xl w-1/3">
                        <h2 class="text-2xl font-semibold text-center text-gray-800 mb-4">Edit Driver</h2>
                        <form action="../DriverManagementServlet" method="post">
                        <input type="hidden" name="action" value="edit">
                            <input type="hidden" id="editDriverId" name="driverId">
                            
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-700">Driver Name</label>
                                <input type="text" id="editDriverName" name="driverName" class="mt-1 p-2 w-full border rounded-md" required>
                            </div>
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-700">License Number</label>
                                <input type="text" id="editLicenseNumber" name="licenseNumber" class="mt-1 p-2 w-full border rounded-md" required>
                            </div>
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-700">Cab Assigned</label>
                                <input type="text" id="editCabAssigned" name="cabAssigned" class="mt-1 p-2 w-full border rounded-md" required>
                            </div>
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-700">Status</label>
                                <input type="text" id="editStatus" name="status" class="mt-1 p-2 w-full border rounded-md" required>
                            </div>
                            <div class="flex justify-end space-x-4">
                                <button type="submit" class="bg-emerald-600 text-white py-2 px-4 rounded-lg hover:bg-emerald-700">Save Changes</button>
                                <button type="button" id="closeEditModalBtn" class="bg-gray-300 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-400">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Driver Table -->
                <div class="overflow-x-auto bg-white shadow-lg rounded-lg mt-6">
                    <table class="min-w-full table-auto">
                        <thead class="bg-emerald-600 text-white">
                            <tr>
                                <th class="py-3 px-6 text-left text-sm">Driver Name</th>
                                <th class="py-3 px-6 text-left text-sm">License Number</th>
                                <th class="py-3 px-6 text-left text-sm">Cab Assigned</th>
                                <th class="py-3 px-6 text-left text-sm">Status</th>
                                <th class="py-3 px-6 text-left text-sm">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="text-gray-700">
                            <% 
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/city_cab", "root", "");
                                    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM drivers");
                                    ResultSet rs = stmt.executeQuery();

                                    while (rs.next()) {
                            %>
                            <tr class="border-b hover:bg-gray-50">
                                <td class="py-3 px-6 text-sm"><%= rs.getString("name") %></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getString("license_number") %></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getString("cab_assigned") %></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getString("status") %></td>
                                <td class="py-3 px-6 text-sm">
                                    <button class="editBtn text-blue-500 hover:text-blue-600 font-bold" 
                                        data-id="<%= rs.getInt("driver_id") %>" 
                                        data-name="<%= rs.getString("name") %>" 
                                        data-license="<%= rs.getString("license_number") %>" 
                                        data-cab="<%= rs.getString("cab_assigned") %>" 
                                        data-status="<%= rs.getString("status") %>">
                                        Edit
                                    </button> |
                                    <a href="deleteDriver.jsp?id=<%= rs.getInt("driver_id") %>" class="text-red-500 hover:text-red-600 font-bold ml-2" onclick="return confirm('Are you sure?');">Delete</a>
                                </td>
                            </tr>
                            <% } conn.close(); } catch (Exception e) { e.printStackTrace(); } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>

    <!-- JavaScript -->
   <script>
    document.querySelectorAll(".editBtn").forEach(button => {
        button.addEventListener("click", function () {
            document.getElementById("editDriverId").value = this.getAttribute("data-id");
            document.getElementById("editDriverName").value = this.getAttribute("data-name");
            document.getElementById("editLicenseNumber").value = this.getAttribute("data-license");
            document.getElementById("editCabAssigned").value = this.getAttribute("data-cab");
            document.getElementById("editStatus").value = this.getAttribute("data-status");

            document.getElementById("editModal").classList.remove("hidden");
        });
    });

    document.getElementById("closeEditModalBtn").addEventListener("click", function () {
        document.getElementById("editModal").classList.add("hidden");
    });

    document.getElementById("openModalBtn").addEventListener("click", function () {
        document.getElementById("modal").classList.remove("hidden");
    });

    document.getElementById("closeModalBtn").addEventListener("click", function () {
        document.getElementById("modal").classList.add("hidden");
    });
</script>
</body>
</html>
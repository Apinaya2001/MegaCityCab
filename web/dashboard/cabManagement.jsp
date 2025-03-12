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
                <a href="driverManagement.jsp" class="flex items-center text-lg p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">
                    <i class="fa-solid fa-user-tie mr-3"></i> Drivers
                </a>
                <a href="userDetails.jsp" class="flex items-center text-lg p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">
                    <i class="fa-solid fa-users mr-3"></i> Users
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
                <a href="../index.jsp" class="bg-emerald-600 text-white font-bold px-4 py-2 rounded-lg hover:bg-white hover:text-emerald-500 hover:shadow-lg transition duration-300">Logout</a>
            </header>

            <main class="p-10">
                <div class="bg-white p-6 shadow-md rounded-lg mb-6">

                    <!-- Header + Add Button -->
                    <div class="flex justify-between mb-6">
                        <h2 class="text-2xl font-bold text-emerald-600">Manage Your Cabs</h2>
                        <button id="openModalBtn" class="bg-emerald-600 text-white py-2 px-6 rounded-lg font-bold shadow-lg hover:bg-emerald-700 transition">
                            New Cab
                        </button>
                    </div>

                    <!-- Add Cab Modal -->
                    <div id="modal" class="hidden fixed inset-0 flex items-center justify-center bg-black bg-opacity-50">
                        <div class="bg-white p-6 rounded-lg shadow-xl w-1/3">
                            <h2 class="text-2xl font-semibold text-center text-gray-800 mb-4">Add New Cab</h2>
                            <form action="../CabManagementServlet" method="post">
                                <input type="hidden" name="action" value="save">
                                <div class="mb-4">
                                    <label class="block text-sm font-medium text-gray-700">Cab Model</label>
                                    <input type="text" name="model" class="mt-1 p-2 w-full border rounded-md" required>
                                </div>
                                <div class="mb-4">
                                    <label class="block text-sm font-medium text-gray-700">Assigned Driver</label>
                                    <input type="text" name="driver" class="mt-1 p-2 w-full border rounded-md" required>
                                </div>
                                <div class="mb-4">
                                    <label class="block text-sm font-medium text-gray-700">License Number</label>
                                    <input type="text" name="licenseNumber" class="mt-1 p-2 w-full border rounded-md" required>
                                </div>
                                <div class="mb-4">
                                    <label class="block text-sm font-medium text-gray-700">Status</label>
                                    <input type="text" name="status" class="mt-1 p-2 w-full border rounded-md" required>
                                </div>
                                <div class="flex justify-end space-x-4">
                                    <button type="submit" class="bg-emerald-600 text-white py-2 px-4 rounded-lg hover:bg-emerald-700">Add Cab</button>
                                    <button type="button" id="closeModalBtn" class="bg-gray-300 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-400">Cancel</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Edit Cab Modal -->
                    <div id="editModal" class="hidden fixed inset-0 flex items-center justify-center bg-black bg-opacity-50">
                        <div class="bg-white p-6 rounded-lg shadow-xl w-1/3">
                            <h2 class="text-2xl font-semibold text-center text-gray-800 mb-4">Edit Cab</h2>
                            <form action="../CabManagementServlet" method="post">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="cabId" id="editCabId">
                                <div class="mb-4">
                                    <label class="block text-sm font-medium text-gray-700">Cab Model</label>
                                    <input type="text" name="model" id="editModel" class="mt-1 p-2 w-full border rounded-md" required>
                                </div>
                                <div class="mb-4">
                                    <label class="block text-sm font-medium text-gray-700">Assigned Driver</label>
                                    <input type="text" name="driver" id="editDriver" class="mt-1 p-2 w-full border rounded-md" required>
                                </div>
                                <div class="mb-4">
                                    <label class="block text-sm font-medium text-gray-700">License Number</label>
                                    <input type="text" name="licenseNumber" id="editLicenseNumber" class="mt-1 p-2 w-full border rounded-md" required>
                                </div>
                                <div class="mb-4">
                                    <label class="block text-sm font-medium text-gray-700">Status</label>
                                    <input type="text" name="status" id="editStatus" class="mt-1 p-2 w-full border rounded-md" required>
                                </div>
                                <div class="flex justify-end space-x-4">
                                    <button type="submit" class="bg-emerald-600 text-white py-2 px-4 rounded-lg hover:bg-emerald-700">Save Changes</button>
                                    <button type="button" id="closeEditModalBtn" class="bg-gray-300 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-400">Cancel</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Cab Table -->
                    <div class="overflow-x-auto bg-white shadow-lg rounded-lg mt-6">
                        <table class="min-w-full table-auto">
                            <thead class="bg-emerald-600 text-white">
                                <tr>
                                    <th class="py-3 px-6 text-left text-sm">Cab ID</th>

                                    <th class="py-3 px-6 text-left text-sm">Cab Model</th>
                                    <th class="py-3 px-6 text-left text-sm">Assigned Driver</th>
                                    <th class="py-3 px-6 text-left text-sm">License Number</th>
                                    <th class="py-3 px-6 text-left text-sm">Status</th>
                                    <th class="py-3 px-6 text-left text-sm">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="text-gray-700">
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/city_cab", "root", "");
                                        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM cabs");
                                        ResultSet rs = stmt.executeQuery();

                                        while (rs.next()) {
                                %>
                                <tr class="border-b hover:bg-gray-50">
                                    <td class="py-3 px-6 text-sm"><%= rs.getInt("cab_id")%></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("model")%></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("driver")%></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("license_number")%></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("status")%></td>
                                    <td class="py-3 px-6 text-sm">
                                        <button class="editBtn hover:bg-emerald-500 text-emerald-500 font-bold px-6 py-2 rounded-lg bg-white hover:text-white hover:shadow-lg transition duration-300" 
                                                data-id="<%= rs.getInt("cab_id")%>" 
                                                data-model="<%= rs.getString("model")%>" 
                                                data-driver="<%= rs.getString("driver")%>" 
                                                data-license="<%= rs.getString("license_number")%>" 
                                                data-status="<%= rs.getString("status")%>">
                                            Edit
                                        </button> |
                                        <button class="deleteBtn hover:bg-red-500 text-red-500 font-bold px-6 py-2 rounded-lg bg-white hover:text-white hover:shadow-lg transition duration-300" 
                                                data-id="<%= rs.getInt("cab_id")%>">
                                            Delete
                                        </button>                                </td>
                                </tr>
                                <% }
                                        conn.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>

        <script>
            // Edit button functionality
            document.querySelectorAll(".editBtn").forEach(button => {
                button.addEventListener("click", function () {
                    // Populate the modal fields with cab data from the button attributes
                    document.getElementById("editCabId").value = this.getAttribute("data-id");
                    document.getElementById("editModel").value = this.getAttribute("data-model");
                    document.getElementById("editDriver").value = this.getAttribute("data-driver");
                    document.getElementById("editLicenseNumber").value = this.getAttribute("data-license");
                    document.getElementById("editStatus").value = this.getAttribute("data-status");

                    // Show the edit modal
                    document.getElementById("editModal").classList.remove("hidden");
                });
            });

            // Close the edit modal when the close button is clicked
            document.getElementById("closeEditModalBtn")?.addEventListener("click", function () {
                document.getElementById("editModal").classList.add("hidden");
            });

            // Open the general modal
            document.getElementById("openModalBtn")?.addEventListener("click", function () {
                document.getElementById("modal").classList.remove("hidden");
            });

            // Close the general modal
            document.getElementById("closeModalBtn")?.addEventListener("click", function () {
                document.getElementById("modal").classList.add("hidden");
            });

            // Delete button functionality
            document.querySelectorAll(".deleteBtn").forEach(button => {
                button.addEventListener("click", function () {
                    const cabId = this.getAttribute("data-id");
                    // Confirm if the user wants to delete the cab
                    if (confirm('Are you sure you want to delete this cab?')) {
                        const form = document.createElement('form');
                        form.method = 'POST';
                        form.action = '/MegaCityCab/CabManagementServlet'; // Your servlet URL

                        // Hidden input to specify the action as delete
                        const actionInput = document.createElement('input');
                        actionInput.type = 'hidden';
                        actionInput.name = 'action';
                        actionInput.value = 'delete';  // Specify delete action
                        form.appendChild(actionInput);

                        // Hidden input for the cab ID
                        const idInput = document.createElement('input');
                        idInput.type = 'hidden';
                        idInput.name = 'cabId';
                        idInput.value = cabId;  // Pass the cab ID
                        form.appendChild(idInput);

                        // Append the form to the document and submit it
                        document.body.appendChild(form);
                        form.submit();
                    }
                });
            });
        </script>


    </body>
</html>

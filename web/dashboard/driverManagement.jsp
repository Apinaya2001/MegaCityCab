<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <!-- Main Content Wrapper -->
    <div class="flex-1 ml-56">

        <header class="bg-emerald-600 text-white p-4 flex items-center justify-between">
            <h1 class="text-2xl font-bold"></h1>
            <a href="logout.jsp" class="bg-emerald-600 text-white font-bold px-4 py-2 rounded-lg hover:bg-white hover:text-emerald-500 hover:shadow-lg transition duration-300">
                Logout
            </a>
        </header>

        <!-- Main Content -->
        <main class="p-10 w-full">
            <div class="bg-white p-6 shadow-md rounded-lg mb-6">
                <!-- Add New Driver Button -->
                <div class="flex justify-between mb-6">
                    <h2 class="text-2xl font-bold text-emerald-600">Manage Your Drivers</h2>
                    <button id="openModalBtn" class="bg-emerald-600 text-white py-2 px-6 rounded-lg font-bold shadow-lg hover:bg-emerald-700 transition duration-300">
                        New Driver
                    </button>
                </div>
                
                <!-- Modal -->
                <div id="modal" class="hidden fixed inset-0 flex items-center justify-center bg-black bg-opacity-50">
                    <div class="bg-white p-6 rounded-lg shadow-xl w-1/3">
                        <h2 class="text-2xl font-semibold text-center text-gray-800 mb-4">Add New Driver</h2>
                        
                        <!-- Modal Form -->
                        <form action="driverManagement" method="post">
                            <div class="mb-4">
                                <label for="driverID" class="block text-sm font-medium text-gray-700">Driver ID</label>
                                <input type="text" id="driverID" name="driverID" class="mt-1 p-2 w-full border rounded-md" required>
                            </div>

                            <div class="mb-4">
                                <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                                <input type="text" id="name" name="name" class="mt-1 p-2 w-full border rounded-md" required>
                            </div>

                            <div class="mb-4">
                                <label for="license" class="block text-sm font-medium text-gray-700">License Number</label>
                                <input type="text" id="license" name="license" class="mt-1 p-2 w-full border rounded-md" required>
                            </div>

                            <div class="mb-4">
                                <label for="status" class="block text-sm font-medium text-gray-700">Status</label>
                                <select id="status" name="status" class="mt-1 p-2 w-full border rounded-md">
                                    <option value="Available">Available</option>
                                    <option value="On Trip">On Trip</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                            
                            <div class="flex justify-end space-x-4">
                                <button type="submit" class="bg-emerald-600 text-white py-2 px-4 rounded-lg hover:bg-emerald-700">Add Driver</button>
                                <button type="button" id="closeModalBtn" class="bg-gray-300 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-400">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Driver List Table -->
                <div class="overflow-x-auto bg-white shadow-lg rounded-lg mt-6">
                    <table class="min-w-full table-auto">
                        <thead class="bg-emerald-600 text-white">
                            <tr>
                                <th class="py-3 px-6 text-left text-sm">ID</th>
                                <th class="py-3 px-6 text-left text-sm">Name</th>
                                <th class="py-3 px-6 text-left text-sm">License</th>
                                <th class="py-3 px-6 text-left text-sm">Status</th>
                                <th class="py-3 px-6 text-left text-sm">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="text-gray-700">
                            <tr class="border-b hover:bg-gray-50">
                                <td class="py-3 px-6 text-sm">1</td>
                                <td class="py-3 px-6 text-sm">John Doe</td>
                                <td class="py-3 px-6 text-sm">ABC12345</td>
                                <td class="py-3 px-6 text-sm">Available</td>
                                <td class="py-3 px-6 text-sm">
                                    <a href="updateDriver.jsp?id=1" class="text-blue-500 hover:text-blue-600">Edit</a> |
                                    <a href="deleteDriver.jsp?id=1" class="text-red-500 hover:text-red-600 ml-2">Delete</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>

    <!-- JavaScript for Modal -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const modal = document.getElementById("modal");
            const openModalBtn = document.getElementById("openModalBtn");
            const closeModalBtn = document.getElementById("closeModalBtn");
            openModalBtn.addEventListener("click", function() { modal.classList.remove("hidden"); });
            closeModalBtn.addEventListener("click", function() { modal.classList.add("hidden"); });
        });
    </script>
</body>
</html>

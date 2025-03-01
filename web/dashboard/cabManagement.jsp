<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cab Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">

    <!-- Sidebar -->
    <aside class="bg-emerald-600 text-white w-[222px] min-h-screen p-6 fixed shadow-lg">
        <h1 class="text-3xl font-extrabold mb-8 text-center tracking-wide">Mega City Cab</h1>
        <nav class="space-y-4">
            <a href="dashboardview.jsp" class="flex items-center text-lg p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">
                <i class="fa-solid fa-tachometer-alt mr-3"></i> Dashboard
            </a>
            <a href="userDetails.jsp" class="flex items-center text-lg p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">
                <i class="fa-solid fa-users mr-3"></i> Users
            </a>
            <a href="driver.jsp" class="flex items-center text-lg p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">
                <i class="fa-solid fa-user-tie mr-3"></i> Drivers
            </a>
            <a href="cabManagement.jsp" class="flex items-center text-lg p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">
                <i class="fa-solid fa-car-side mr-3"></i> Cabs
            </a>
            <a href="booking.jsp" class="flex items-center text-lg p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">
                <i class="fa-solid fa-list-alt mr-3"></i> Bookings
            </a>
            <a href="logout.jsp" class="flex items-center text-lg p-2 rounded-lg hover:bg-white hover:text-emerald-500 transition">
                <i class="fa-solid fa-sign-out-alt mr-3"></i> Logout
            </a>
        </nav>
    </aside>

    <!-- Main Content Wrapper -->
    <div class="ml-[222px]">

        <!-- Header -->
        <header class="bg-emerald-600 text-white p-4 flex items-center justify-between">
            <h1 class="text-2xl font-bold">Cab Management</h1>
        </header>

        <!-- Main Content -->
        <main class="p-10 w-full">
            <div class="bg-white p-6 shadow-md rounded-lg mb-6">
                <h2 class="text-4xl font-bold text-emerald-600 mb-6">Manage Your Cabs</h2>
                <p class="text-gray-600 text-lg">Here you can add, update, or delete cabs.</p>
            </div>

            <!-- Add New Booking Button -->
            <div class="flex justify-end mb-6">
                <button id="openModalBtn" class="bg-emerald-600 text-white py-2 px-6 rounded-lg shadow-lg hover:bg-emerald-700 transition duration-300">
                    Add New Booking
                </button>
            </div>

            <!-- Modal -->
            <div id="modal" class="hidden fixed inset-0 flex items-center justify-center bg-black bg-opacity-50">
                <div class="bg-white p-6 rounded-lg shadow-xl w-1/3">
                    <h2 class="text-2xl font-semibold text-center text-gray-800 mb-4">Add New Booking</h2>

                    <!-- Modal Form -->
                    <form action="AddBookingServlet" method="post">
                        <div class="mb-4">
                            <label for="customerName" class="block text-gray-700">Customer Name</label>
                            <input type="text" id="customerName" name="customerName" class="w-full mt-2 px-4 py-2 border rounded-lg text-gray-700 focus:outline-none focus:ring-2 focus:ring-emerald-500" required>
                        </div>
                        <div class="mb-4">
                            <label for="cabId" class="block text-gray-700">Cab ID</label>
                            <input type="text" id="cabId" name="cabId" class="w-full mt-2 px-4 py-2 border rounded-lg text-gray-700 focus:outline-none focus:ring-2 focus:ring-emerald-500" required>
                        </div>
                        <div class="mb-4">
                            <label for="bookingDate" class="block text-gray-700">Booking Date</label>
                            <input type="date" id="bookingDate" name="bookingDate" class="w-full mt-2 px-4 py-2 border rounded-lg text-gray-700 focus:outline-none focus:ring-2 focus:ring-emerald-500" required>
                        </div>
                        <div class="flex justify-end space-x-4">
                            <button type="submit" class="bg-emerald-600 text-white py-2 px-4 rounded-lg hover:bg-emerald-700">Add Booking</button>
                            <button type="button" id="closeModalBtn" class="bg-gray-300 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-400">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Cab List Table -->
            <div class="overflow-x-auto bg-white shadow-lg rounded-lg mt-6">
                <table class="min-w-full table-auto">
                    <thead class="bg-emerald-600 text-white">
                        <tr>
                            <th class="py-3 px-6 text-left text-sm">ID</th>
                            <th class="py-3 px-6 text-left text-sm">Model</th>
                            <th class="py-3 px-6 text-left text-sm">Driver</th>
                            <th class="py-3 px-6 text-left text-sm">Status</th>
                            <th class="py-3 px-6 text-left text-sm">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="text-gray-700">
                        <tr class="border-b hover:bg-gray-50">
                            <td class="py-3 px-6 text-sm">1</td>
                            <td class="py-3 px-6 text-sm">Toyota Corolla</td>
                            <td class="py-3 px-6 text-sm">John Doe</td>
                            <td class="py-3 px-6 text-sm">Available</td>
                            <td class="py-3 px-6 text-sm">
                                <a href="updateCab.jsp?id=1" class="text-blue-500 hover:text-blue-600">Edit</a> |
                                <a href="deleteCab.jsp?id=1" class="text-red-500 hover:text-red-600 ml-2">Delete</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </main>

    </div>

    <!-- JavaScript for Modal -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const modal = document.getElementById("modal");
            const openModalBtn = document.getElementById("openModalBtn");
            const closeModalBtn = document.getElementById("closeModalBtn");

            // Open Modal
            openModalBtn.addEventListener("click", function() {
                modal.classList.remove("hidden");
            });

            // Close Modal
            closeModalBtn.addEventListener("click", function() {
                modal.classList.add("hidden");
            });

            // Close Modal when clicking outside
            window.addEventListener("click", function(event) {
                if (event.target === modal) {
                    modal.classList.add("hidden");
                }
            });
        });
    </script>

</body>
</html>
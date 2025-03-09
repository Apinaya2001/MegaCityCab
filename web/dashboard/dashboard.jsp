<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Mega City Cab</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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

        <!-- Header -->
        <header class="bg-emerald-600 text-white p-4 flex items-center justify-between">
            <h1 class="text-2xl font-bold"></h1>
            <a href="../index.jsp" class="bg-emerald-600 text-white font-bold px-4 py-2 rounded-lg hover:bg-white hover:text-emerald-500 hover:shadow-lg transition duration-300">Logout</a>
        </header>

        <!-- Main Content -->
        <main class="p-10 space-y-8">

            <!-- Welcome Card -->
            <div class="bg-white p-8 shadow-lg rounded-xl flex items-center space-x-8">
                <div class="w-1/2">
                    <h2 class="text-3xl font-bold text-emerald-600 mb-4">Welcome to Mega City Cab</h2>
                    <p class="text-lg text-gray-700">Select an option from the sidebar to view detailed information.</p>
                </div>
                 <!-- Quick Actions -->
           
            </div>

            <!-- User Statistics -->
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
                <div class="bg-emerald-100 p-6 shadow-xl rounded-xl hover:shadow-2xl transition">
                    <h3 class="text-xl font-semibold text-emerald-600 mb-3">Total Users</h3>
                    <p class="text-3xl font-bold text-gray-800">1,200</p>
                </div>
                <div class="bg-amber-100 p-6 shadow-xl rounded-xl hover:shadow-2xl transition">
                    <h3 class="text-xl font-semibold text-amber-600 mb-3">Total Drivers</h3>
                    <p class="text-3xl font-bold text-gray-800">150</p>
                </div>
                <div class="bg-lime-100 p-6 shadow-xl rounded-xl hover:shadow-2xl transition">
                    <h3 class="text-xl font-semibold text-lime-600 mb-3">Total Bookings</h3>
                    <p class="text-3xl font-bold text-gray-800">350</p>
                </div>
            </div>

            <!-- Recent Bookings -->
            <div class="bg-white p-6 shadow-xl rounded-xl">
                <h3 class="text-2xl font-semibold text-emerald-600 mb-4">Recent Bookings</h3>
                <table class="min-w-full table-auto text-gray-600">
                    <thead>
                        <tr>
                            <th class="p-3 text-left border-b">Booking ID</th>
                            <th class="p-3 text-left border-b">User</th>
                            <th class="p-3 text-left border-b">Driver</th>
                            <th class="p-3 text-left border-b">Cab</th>
                            <th class="p-3 text-left border-b">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="p-3 border-b">#1234</td>
                            <td class="p-3 border-b">John Doe</td>
                            <td class="p-3 border-b">Jane Smith</td>
                            <td class="p-3 border-b">Toyota Prius</td>
                            <td class="p-3 border-b text-green-600">Completed</td>
                        </tr>
                        <tr>
                            <td class="p-3 border-b">#1235</td>
                            <td class="p-3 border-b">Alice Green</td>
                            <td class="p-3 border-b">Bob Lee</td>
                            <td class="p-3 border-b">Honda Accord</td>
                            <td class="p-3 border-b text-yellow-500">Pending</td>
                        </tr>
                    </tbody>
                </table>
            </div>

         
        </main>

    </div>

</body>
</html>

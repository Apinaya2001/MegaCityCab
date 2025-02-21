<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Mega City Cab</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

    <!-- Header -->
    <header class="bg-emerald-600 text-white p-4">
        <div class="container mx-auto flex justify-between items-center">
            <h1 class="text-2xl font-bold">Mega City Cab</h1>
            <nav>
                <a href="index.jsp" class="text-white hover:underline">Home</a> |
                <a href="about.jsp" class="text-white hover:underline">About</a> |
                <a href="contact.jsp" class="text-white hover:underline">Contact</a> |
                <a href="logout.jsp" class="text-white hover:underline">Logout</a>
            </nav>
        </div>
    </header>

    <!-- Dashboard Content -->
    <div class="container mx-auto p-8">
        <h2 class="text-3xl font-bold text-emerald-600 mb-6">Welcome to Mega City Cab</h2>

        <!-- Dashboard Options -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <div class="bg-white p-6 rounded-lg shadow-lg text-center">
                <h3 class="text-xl font-semibold text-emerald-600">Book a Ride</h3>
                <a href="booking.jsp" class="mt-4 inline-block bg-emerald-500 text-white px-6 py-2 rounded-lg hover:bg-emerald-600 transition duration-300">Book Now</a>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg text-center">
                <h3 class="text-xl font-semibold text-emerald-600">View Your Bookings</h3>
                <a href="viewBookings.jsp" class="mt-4 inline-block bg-gray-800 text-white px-6 py-2 rounded-lg hover:bg-gray-900 transition duration-300">View Bookings</a>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg text-center">
                <h3 class="text-xl font-semibold text-emerald-600">Contact Us</h3>
                <a href="contact.jsp" class="mt-4 inline-block bg-yellow-500 text-white px-6 py-2 rounded-lg hover:bg-yellow-600 transition duration-300">Get Help</a>
            </div>
        </div>
    </div>

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Ride - Mega City Cab</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">

    <!-- Booking Form Container -->
    <div class="bg-white p-8 rounded-lg shadow-lg w-96">
        <h2 class="text-2xl font-bold text-center text-emerald-600 mb-6">Book a Ride</h2>

        <!-- Booking Form -->
        <form action="BookingServlet" method="POST">
            <div class="mb-4">
                <label for="pickup" class="block text-gray-700 font-medium mb-2">Pickup Location</label>
                <input type="text" id="pickup" name="pickup" class="w-full p-3 border border-gray-300 rounded-lg" required>
            </div>

            <div class="mb-4">
                <label for="destination" class="block text-gray-700 font-medium mb-2">Destination</label>
                <input type="text" id="destination" name="destination" class="w-full p-3 border border-gray-300 rounded-lg" required>
            </div>

            <div class="mb-4">
                <label for="customerName" class="block text-gray-700 font-medium mb-2">Customer Name</label>
                <input type="text" id="customerName" name="customerName" class="w-full p-3 border border-gray-300 rounded-lg" required>
            </div>

            <div class="mb-4">
                <label for="phoneNumber" class="block text-gray-700 font-medium mb-2">Phone Number</label>
                <input type="text" id="phoneNumber" name="phoneNumber" class="w-full p-3 border border-gray-300 rounded-lg" required>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="w-full bg-emerald-500 text-white p-3 rounded-lg hover:bg-emerald-600 transition duration-300">
                Book Ride
            </button>
        </form>
    </div>

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Mega City Cab</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <!-- Registration Form Container -->
    <div class="bg-white p-10 rounded-lg shadow-lg w-full sm:w-[600px]">
        <h2 class="text-3xl font-semibold text-center text-emerald-600 mb-6">Create an Account</h2>

        <!-- Registration Form -->
        <form action="RegisterServlet" method="POST" class="flex flex-col space-y-6">

            <!-- Personal Information Section -->
            <div>
                <h3 class="text-xl font-semibold text-gray-800 mb-4">Personal Information</h3>

                <div class="flex space-x-6">
                    <!-- Full Name -->
                    <div class="mb-4 w-1/2">
                        <label for="fullName" class="block text-gray-700 font-medium mb-2">Full Name</label>
                        <input type="text" id="fullName" name="fullName" class="w-full p-3 border border-gray-300 rounded-lg focus:ring-emerald-500 focus:outline-none" required>
                    </div>

                    <!-- NIC (National ID) -->
                    <div class="mb-4 w-1/2">
                        <label for="nic" class="block text-gray-700 font-medium mb-2">NIC (National ID)</label>
                        <input type="text" id="nic" name="nic" class="w-full p-3 border border-gray-300 rounded-lg focus:ring-emerald-500 focus:outline-none" required>
                    </div>
                </div>
            </div>

            <!-- Contact Information Section -->
            <div>
                <h3 class="text-xl font-semibold text-gray-800 mb-4">Contact Information</h3>

                <div class="flex space-x-6">
                    <!-- Email -->
                    <div class="mb-4 w-1/2">
                        <label for="email" class="block text-gray-700 font-medium mb-2">Email Address</label>
                        <input type="email" id="email" name="email" class="w-full p-3 border border-gray-300 rounded-lg focus:ring-emerald-500 focus:outline-none" required>
                    </div>

                    <!-- Phone Number -->
                    <div class="mb-4 w-1/2">
                        <label for="phoneNumber" class="block text-gray-700 font-medium mb-2">Phone Number</label>
                        <input type="text" id="phoneNumber" name="phoneNumber" class="w-full p-3 border border-gray-300 rounded-lg focus:ring-emerald-500 focus:outline-none" required>
                    </div>
                </div>

                <!-- Address -->
                <div class="mb-4">
                    <label for="address" class="block text-gray-700 font-medium mb-2">Address</label>
                    <textarea id="address" name="address" class="w-full p-3 border border-gray-300 rounded-lg focus:ring-emerald-500 focus:outline-none" rows="3" required></textarea>
                </div>
            </div>

            <!-- Password Section -->
            <div>
                <h3 class="text-xl font-semibold text-gray-800 mb-4">Create a Password</h3>

                <!-- Password -->
                <div  class="flex flex-raw space-x-2">
                <div class="mb-4">
                    <label for="password" class="block text-gray-700 font-medium mb-2">Password</label>
                    <input type="password" id="password" name="password" class="w-full p-3 border border-gray-300 rounded-lg focus:ring-emerald-500 focus:outline-none" required>
                </div>

                <!-- Confirm Password -->
                <div class="mb-6">
                    <label for="confirmPassword" class="block text-gray-700 font-medium mb-2">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="w-full p-3 border border-gray-300 rounded-lg focus:ring-emerald-500 focus:outline-none" required>
                </div>
                </div>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="w-full bg-emerald-600 text-white p-3 rounded-lg hover:bg-emerald-700 transition duration-300">
                Register
            </button>
        </form>

        <!-- Already have an account? Link -->
        <div class="mt-6 text-center">
            <p class="text-sm text-gray-500">
                Already have an account? <a href="index.jsp" class="text-emerald-600 hover:underline">Login here</a>
            </p>
        </div>
    </div>

</body>
</html>

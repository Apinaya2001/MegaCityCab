<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Mega City Cab</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">

    <!-- Login Form Container -->
    <div class="bg-white p-8 rounded-lg shadow-lg w-96">
        <h2 class="text-2xl font-bold text-center text-emerald-600 mb-6">Mega City Cab Login</h2>

        <!-- Login Form -->
        <form action="LoginServlet" method="POST">
            <div class="mb-4">
                <label for="username" class="block text-gray-700 font-medium mb-2">Username</label>
                <input type="text" id="username" name="username" class="w-full p-3 border border-gray-300 rounded-lg" required>
            </div>

            <div class="mb-6">
                <label for="password" class="block text-gray-700 font-medium mb-2">Password</label>
                <input type="password" id="password" name="password" class="w-full p-3 border border-gray-300 rounded-lg" required>
            </div>

            <!-- Login Button -->
            <button type="submit" class="w-full bg-emerald-500 text-white p-3 rounded-lg hover:bg-emerald-600 transition duration-300">
                Login
            </button>
        </form>

        <div class="mt-4 text-center">
            <p class="text-sm text-gray-500">
                Don't have an account? <a href="register.jsp" class="text-emerald-500 hover:underline">Register here</a>
            </p>
        </div>
    </div>

</body>
</html>

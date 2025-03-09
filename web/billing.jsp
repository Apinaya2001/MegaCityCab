<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing Details</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <div class="max-w-2xl mx-auto mt-10 bg-white p-6 rounded-lg shadow-md">
        <h2 class="text-2xl font-bold text-center text-gray-700 mb-4">Billing Details</h2>
        
        <table class="w-full border-collapse border border-gray-300">
       
                <th class="border border-gray-300 px-4 py-2">Customer Name</th>
                <td class="border border-gray-300 px-4 py-2">${fullName}</td>
            </tr>
            <tr>
                <th class="border border-gray-300 px-4 py-2">Phone</th>
                <td class="border border-gray-300 px-4 py-2">${phone}</td>
            </tr>
            <tr>
                <th class="border border-gray-300 px-4 py-2">Pickup Location</th>
                <td class="border border-gray-300 px-4 py-2">${startLoc}</td>
            </tr>
            <tr>
                <th class="border border-gray-300 px-4 py-2">Dropoff Location</th>
                <td class="border border-gray-300 px-4 py-2">${endLoc}</td>
            </tr>
            <tr>
                <th class="border border-gray-300 px-4 py-2">Cab Type</th>
                <td class="border border-gray-300 px-4 py-2">${cab}</td>
            </tr>
            <tr>
                <th class="border border-gray-300 px-4 py-2">Total Fare ($)</th>
                <td class="border border-gray-300 px-4 py-2 font-bold">${fare}</td>
            </tr>
        </table>

        <div class="text-center mt-6">
            <a href="index.jsp" class="px-4 py-2 bg-blue-500 text-white rounded-lg">Go to Home</a>
        </div>
    </div>
</body>
</html>

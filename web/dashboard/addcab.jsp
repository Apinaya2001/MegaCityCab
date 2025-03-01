<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Cab</title>
</head>
<body>

    <!-- Add New Cab Form -->
    <h2 class="text-2xl font-semibold text-center text-gray-800 mb-4">Add New Cab</h2>
    <form action="#" method="post">
        <div class="mb-4">
            <label for="model" class="block text-gray-700">Cab Model</label>
            <input type="text" id="model" name="model" class="w-full mt-2 px-4 py-2 border rounded-lg text-gray-700 focus:outline-none focus:ring-2 focus:ring-emerald-500" required>
        </div>
        
        <div class="mb-4">
            <label for="driver" class="block text-gray-700">Driver Name</label>
            <input type="text" id="driver" name="driver" class="w-full mt-2 px-4 py-2 border rounded-lg text-gray-700 focus:outline-none focus:ring-2 focus:ring-emerald-500" required>
        </div>
        
        <div class="mb-4">
            <label for="status" class="block text-gray-700">Status</label>
            <select id="status" name="status" class="w-full mt-2 px-4 py-2 border rounded-lg text-gray-700 focus:outline-none focus:ring-2 focus:ring-emerald-500" required>
                <option value="Available">Available</option>
                <option value="In Service">In Service</option>
            </select>
        </div>

        <div class="flex justify-end space-x-4">
            <button type="submit" class="bg-emerald-600 text-white py-2 px-4 rounded-lg hover:bg-emerald-700">Add Cab</button>
            <button type="button" id="closeModal" class="bg-gray-300 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-400">Cancel</button>
        </div>
    </form>

</body>
</html>

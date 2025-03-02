<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Cab</title>
</head>
<body>
<div class="max-w-lg mx-auto bg-white shadow-lg rounded-lg p-6 mt-6">
    <h2 class="text-lg font-semibold text-gray-700 mb-4">Add New Cab</h2>
    <form action="addCab.jsp" method="POST">
        <div class="mb-4">
            <label for="cabID" class="block text-sm font-medium text-gray-700">Cab ID</label>
            <input type="text" id="cabID" name="cabID" class="mt-1 p-2 w-full border rounded-md" required>
        </div>

        <div class="mb-4">
            <label for="model" class="block text-sm font-medium text-gray-700">Model</label>
            <input type="text" id="model" name="model" class="mt-1 p-2 w-full border rounded-md" required>
        </div>

        <div class="mb-4">
            <label for="driver" class="block text-sm font-medium text-gray-700">Driver</label>
            <input type="text" id="driver" name="driver" class="mt-1 p-2 w-full border rounded-md" required>
        </div>

        <div class="mb-4">
            <label for="status" class="block text-sm font-medium text-gray-700">Status</label>
            <select id="status" name="status" class="mt-1 p-2 w-full border rounded-md">
                <option value="Available">Available</option>
                <option value="Booked">Booked</option>
                <option value="Under Maintenance">Under Maintenance</option>
            </select>
        </div>

        <div class="flex justify-between">
            <button type="submit" class="bg-emerald-600 text-white px-4 py-2 rounded-md hover:bg-emerald-700">Save</button>
            <button type="reset" class="bg-gray-400 text-white px-4 py-2 rounded-md hover:bg-gray-500">Clear</button>
        </div>
    </form>
</div>


</body>
</html>

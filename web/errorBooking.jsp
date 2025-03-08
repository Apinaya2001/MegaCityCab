<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <div class="bg-white p-8 shadow-md rounded-lg w-[400px] text-center">
        <h1 class="text-2xl font-bold text-emerald-600 mb-4">Error</h1>
        <%
            String error = request.getParameter("error");
            if ("invalid_action".equals(error)) {
        %>
            <p class="text-red-500">Invalid action detected. Please try again.</p>
        <%
            } else if ("db_error".equals(error)) {
        %>
            <p class="text-red-500">There was an issue with the database. Please try again later.</p>
        <%
            } else {
        %>
            <p class="text-red-500">An unexpected error occurred. Please try again.</p>
        <%
            }
        %>

        <a href="index.jsp" class="mt-4 inline-block bg-emerald-600 text-white px-6 py-2 rounded-lg hover:bg-emerald-700">Back to Home</a>
    </div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Customer - Pahana Edu</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f8f9fa;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: auto;
        padding: 20px;
    }
    h2 {
        color: #333;
        text-align: center;
    }
    form {
        text-align: center;
        margin-bottom: 20px;
    }
    input[type="text"] {
        padding: 8px;
        width: 250px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    input[type="submit"] {
        padding: 8px 15px;
        background: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        background: white;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    th {
        background: #007bff;
        color: white;
    }
</style>
</head>
<body>
<div class="container">
    <h2>Search Customer</h2>
    <form action="SearchCustomerServlet" method="get">
        <input type="text" name="keyword" placeholder="Enter Customer ID or Name" required>
        <input type="submit" value="Search">
    </form>

    <%
        String result = (String) request.getAttribute("result");
        if (result != null) {
            out.println(result);
        }
    %>
</div>
</body>
</html>

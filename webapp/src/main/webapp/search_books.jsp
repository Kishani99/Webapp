<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Books - Pahana Edu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #d7e1ec, #f0f4f8);
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #2c3e50;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="text"] {
            padding: 8px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            padding: 8px 15px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background: #3498db;
            color: white;
        }
    </style>
</head>
<body>

<h1>Search Books</h1>
<form action="SearchBooksServlet" method="get">
    <input type="text" name="keyword" placeholder="Enter title, author, or category" required>
    <input type="submit" value="Search">
</form>

<% 
    java.util.List<String[]> books = (java.util.List<String[]>) request.getAttribute("books");
    if (books != null && !books.isEmpty()) {
%>
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Category</th>
            <th>Price</th>
            <th>Stock</th>
        </tr>
        <% for (String[] book : books) { %>
            <tr>
                <td><%= book[0] %></td>
                <td><%= book[1] %></td>
                <td><%= book[2] %></td>
                <td><%= book[3] %></td>
                <td><%= book[4] %></td>
                <td><%= book[5] %></td>
            </tr>
        <% } %>
    </table>
<% 
    } else if (books != null) { 
%>
    <p>No books found matching your search.</p>
<% } %>

</body>
</html>

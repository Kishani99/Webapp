<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"customer".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer DashboardPahanaEdu</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        background: #f9f9f9;
    }
    /* Navbar */
    nav {
        background: #2c3e50;
        padding: 10px 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    nav .logo {
        font-size: 20px;
        color: white;
        font-weight: bold;
    }
    nav ul {
        list-style: none;
        display: flex;
        gap: 15px;
        margin: 0;
        padding: 0;
    }
    nav ul li a {
        color: white;
        text-decoration: none;
        padding: 8px 12px;
        border-radius: 6px;
        transition: background 0.2s;
    }
    nav ul li a:hover {
        background: #34495e;
    }
    /* Book grid */
    .book-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 20px;
        padding: 20px;
    }
    .book-card {
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        overflow: hidden;
        text-align: center;
        transition: transform 0.2s ease;
    }
    .book-card:hover {
        transform: translateY(-5px);
    }
    .book-card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }
    .book-card h3 {
        margin: 10px 0;
        color: #2c3e50;
    }
    .book-card p {
        margin: 0;
        padding: 0 10px;
        color: #555;
    }
    .book-card button {
        margin: 10px;
        padding: 8px 15px;
        background: #27ae60;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .book-card button:hover {
        background: #1f8b4d;
    }
</style>
</head>
<body>

<!-- Navbar -->
<nav>
    <div class="logo">📚 Pahana Edu</div>
    <ul>
        <li><a href="customer_dashboard.jsp">Home</a></li>
        <li><a href="buy_books.jsp">Buy Books</a></li>
        <li><a href="cart.jsp">My Cart</a></li>
        <li><a href="payment.jsp">Payment</a></li>
        <li><a href="LogoutServlet">Logout</a></li>
    </ul>
</nav>

<!-- Welcome -->
<h2 style="text-align:center; margin-top: 20px;">Welcome, <%= username %>! Explore Our Books</h2>

<!-- Books Section -->
<div class="book-container">
    <!-- Example books (replace with DB data later) -->
    <div class="book-card">
        <img src="images/book1.jpg" alt="Book 1">
        <h3>The Great Adventure</h3>
        <p>Rs. 1200</p>
        <form method="post" action="AddToCartServlet">
            <input type="hidden" name="bookId" value="1">
            <input type="hidden" name="bookName" value="The Great Adventure">
            <input type="hidden" name="price" value="1200">
            <button type="submit">Add to Cart</button>
        </form>
    </div>

    <div class="book-card">
        <img src="images/book2.jpg" alt="Book 2">
        <h3>Learn Java in 21 Days</h3>
        <p>Rs. 1500</p>
        <form method="post" action="AddToCartServlet">
            <input type="hidden" name="bookId" value="2">
            <input type="hidden" name="bookName" value="Learn Java in 21 Days">
            <input type="hidden" name="price" value="1500">
            <button type="submit">Add to Cart</button>
        </form>
    </div>

    <div class="book-card">
        <img src="images/book3.jpg" alt="Book 3">
        <h3>Science for Everyone</h3>
        <p>Rs. 900</p>
        <form method="post" action="AddToCartServlet">
            <input type="hidden" name="bookId" value="3">
            <input type="hidden" name="bookName" value="Science for Everyone">
            <input type="hidden" name="price" value="900">
            <button type="submit">Add to Cart</button>
        </form>
    </div>
</div>

</body>
</html>

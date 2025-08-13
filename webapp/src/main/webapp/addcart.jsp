<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .book-container {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        .book {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            width: 200px;
            text-align: center;
        }
        .book img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        button {
            background: #28a745;
            border: none;
            padding: 10px;
            color: white;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover {
            background: #218838;
        }
    </style>
</head>
<body>

<h1>Available Books</h1>

<div class="book-container">
    <!-- Example Book 1 -->
    <div class="book">
        <img src="images/book1.jpg" alt="Book 1">
        <h3>Java Programming</h3>
        <p>Price: $25.00</p>
        <form action="AddToCartServlet" method="post">
            <input type="hidden" name="bookId" value="1">
            <input type="hidden" name="bookName" value="Java Programming">
            <input type="hidden" name="price" value="25.00">
            <button type="submit">Add to Cart</button>
        </form>
    </div>

    <!-- Example Book 2 -->
    <div class="book">
        <img src="images/book2.jpg" alt="Book 2">
        <h3>Python for Beginners</h3>
        <p>Price: $20.00</p>
        <form action="AddToCartServlet" method="post">
            <input type="hidden" name="bookId" value="2">
            <input type="hidden" name="bookName" value="Python for Beginners">
            <input type="hidden" name="price" value="20.00">
            <button type="submit">Add to Cart</button>
        </form>
    </div>

    <!-- Example Book 3 -->
    <div class="book">
        <img src="images/book3.jpg" alt="Book 3">
        <h3>Web Development Guide</h3>
        <p>Price: $30.00</p>
        <form action="AddToCartServlet" method="post">
            <input type="hidden" name="bookId" value="3">
            <input type="hidden" name="bookName" value="Web Development Guide">
            <input type="hidden" name="price" value="30.00">
            <button type="submit">Add to Cart</button>
        </form>
    </div>
</div>

<!-- Link to View Cart -->
<p><a href="cart.jsp">View My Cart</a></p>

</body>
</html>

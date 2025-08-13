<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart - Pahana Edu</title>
<style>
    body { font-family: Arial, sans-serif; margin: 0; padding: 0; background: #f8f8f8; }
    header { background: #4CAF50; padding: 15px; color: white; text-align: center; }
    .container { padding: 20px; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    table, th, td { border: 1px solid #ccc; }
    th, td { padding: 10px; text-align: center; }
    th { background: #f4f4f4; }
    button, a {
        background: #4CAF50;
        color: white;
        padding: 8px 12px;
        border: none;
        text-decoration: none;
        cursor: pointer;
        border-radius: 5px;
    }
    button:hover, a:hover { background: #45a049; }
</style>
</head>
<body>

<header>
    <h1>Your Shopping Cart</h1>
</header>

<div class="container">
    <%
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
    %>
        <h2>Your cart is empty.</h2>
        <a href="buy_books.jsp">Continue Shopping</a>
    <%
        } else {
            double total = 0;
    %>
        <table>
            <tr>
                <th>Book Title</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
                <th>Action</th>
            </tr>
            <%
                for (Map<String, Object> item : cart) {
                    double price = (double) item.get("price");
                    int quantity = (int) item.get("quantity");
                    double subtotal = price * quantity;
                    total += subtotal;
            %>
            <tr>
                <td><%= item.get("title") %></td>
                <td>Rs. <%= price %></td>
                <td><%= quantity %></td>
                <td>Rs. <%= subtotal %></td>
                <td>
                    <form action="RemoveFromCartServlet" method="post" style="display:inline;">
                        <input type="hidden" name="book_id" value="<%= item.get("book_id") %>">
                        <button type="submit">Remove</button>
                    </form>
                </td>
            </tr>
            <% } %>
            <tr>
                <th colspan="3">Total</th>
                <th colspan="2">Rs. <%= total %></th>
            </tr>
        </table>
        <br>
        <a href="checkout.jsp">Proceed to Checkout</a>
        <a href="buy_books.jsp">Continue Shopping</a>
    <%
        }
    %>
</div>

</body>
</html>

<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment - Pahana Edu Bookshop</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f3f3;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #4CAF50;
            color: white;
        }
        .total {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
        }
        .form-group {
            margin-bottom: 15px;
        }
        input[type=text], input[type=number], input[type=email] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 12px 20px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Payment</h2>

    <%
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
        double total = 0;

        if (cart != null && !cart.isEmpty()) {
    %>
        <table>
            <tr>
                <th>Book Name</th>
                <th>Price</th>
                <th>Qty</th>
                <th>Subtotal</th>
            </tr>
            <%
                for (Map<String, Object> item : cart) {
                    double price = (double) item.get("price");
                    int qty = (int) item.get("quantity");
                    double subtotal = price * qty;
                    total += subtotal;
            %>
                <tr>
                    <td><%= item.get("bookName") %></td>
                    <td>LKR <%= price %></td>
                    <td><%= qty %></td>
                    <td>LKR <%= subtotal %></td>
                </tr>
            <% } %>
        </table>

        <div class="total">
            Total: LKR <%= total %>
        </div>

        <h3>Enter Payment Details</h3>
        <form action="ProcessPaymentServlet" method="post">
            <div class="form-group">
                <label>Name on Card:</label>
                <input type="text" name="cardName" required>
            </div>
            <div class="form-group">
                <label>Card Number:</label>
                <input type="text" name="cardNumber" maxlength="16" required>
            </div>
            <div class="form-group">
                <label>Expiry Date:</label>
                <input type="text" name="expiryDate" placeholder="MM/YY" required>
            </div>
            <div class="form-group">
                <label>CVV:</label>
                <input type="number" name="cvv" maxlength="3" required>
            </div>
            <div class="form-group">
                <label>Email for Receipt:</label>
                <input type="email" name="email" required>
            </div>
            <input type="hidden" name="totalAmount" value="<%= total %>">
            <button type="submit">Pay Now</button>
        </form>

    <%
        } else {
    %>
        <p>Your cart is empty. <a href="books.jsp">Shop Now</a></p>
    <%
        }
    %>
</div>

</body>
</html>

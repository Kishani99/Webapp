<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Help - Pahana Edu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f3f3;
            margin: 0;
            padding: 0;
        }
        header {
            background: #4CAF50;
            color: white;
            text-align: center;
            padding: 15px;
        }
        .container {
            max-width: 700px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        h2 {
            color: #2c3e50;
        }
        ul {
            list-style-type: disc;
            margin-left: 20px;
        }
        a.button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a.button:hover {
            background: #45a049;
        }
    </style>
</head>
<body>

<header>
    <h1>PahanaEduBookshop - Login Help</h1>
</header>

<div class="container">
    <h2>How to Log In</h2>
    <ul>
        <li>Enter your **username** and **password** in the login form.</li>
        <li>Select your **role** (Admin, Cashier, or Customer) correctly.</li>
        <li>Click the **Login** button to access your dashboard.</li>
    </ul>

    <h2>Need to Register?</h2>
    <ul>
        <li>If you are a new customer, click the **Register** button on the login page to create an account.</li>
        <li>Fill in all required details and submit the form.</li>
        <li>After successful registration, you can log in using your new credentials.</li>
    </ul>

    <h2>Common Login Issues</h2>
    <ul>
        <li>Make sure the username and password are correct and match the account role.</li>
        <li>If you forget your password, contact support at <a href="mailto:support@pahanaedu.com">support@pahanaedu.com</a>.</li>
        <li>Ensure your browser allows cookies, as session tracking is required to log in.</li>
    </ul>

    <a href="Login.jsp" class="button">Back to Login Page</a>
</div>

</body>
</html>

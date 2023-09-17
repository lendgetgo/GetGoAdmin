<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #B8F2E3;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .login-logo {
            flex: 1;
            text-align: center;
            background-color: #1B5B6B; /* Red background color for the left side */
            padding: 20px; /* Add padding for spacing */
            height: 100vh; /* Take up full height of the viewport */
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-form {
            flex: 1;
            background-color: #B8F2E3; /* White background color for the right side */
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }
    </style>
    <title>Login</title>
</head>
<body>
    <div class="login-container">
        <div class="login-logo">
            <img src="resources/images/logo.png" style="width: 500px" alt="Logo">
        </div>
        <div class="login-form" method="POST">
            <h2>Hello
                <br />
                Welcome back!</h2>
            <%--<form action="pages/Home.aspx">--%>
            <form>
                <input type="email" id="_emailAddress" class="form-control" placeholder="Email" />
                <input type="password" id="_password" class="form-control" placeholder="Password" />
         
                    <button type="submit" id="btnLogin" class="btn btn-primary btn-block btn-flat">Log In</button>
            </form>
        </div>
    </div>
</body>
<script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../scripts/login.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
</html>

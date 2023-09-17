<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../bower_components/toastr/toastr.min.css" rel="stylesheet" />
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

        .Code {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

            .Code input {
                width: 50px;
            }
    </style>
    <title>Login</title>
</head>
<body>
    <div class="login-container">
        <div class="login-logo">
            <img src="resources/images/logo.png" style="width: 500px" alt="Logo">
        </div>
        <div class="login-form" id="loginContent">
            <h2>Hello
                <br />
                Welcome back!</h2>

            <input type="email" id="_emailAddress" class="form-control" placeholder="Email" />
            <input type="password" id="_password" class="form-control" placeholder="Password" />

            <button type="submit" id="btnLogin" class="btn btn-primary btn-block btn-flat">Log In</button>
            <label id="lblforgotPass" style="cursor: pointer;"><u>Forgot Password?</u></label>

        </div>

        <div class="login-form" id="ForgotPassContent" hidden="hidden">
            <h2>Forgot Password?</h2>
            <br />

            <h4>Don't worry! It happens.
                     Enter the email associated with your account.

            </h4>

            <input type="email" id="_emailForgotPass" class="form-control" placeholder="Email" />
            <label id="txtContactNo"></label>

            <button type="submit" id="btnSubmit" class="btn btn-primary btn-block btn-flat">Submit</button>
            <button id="btnNext" class="btn btn-primary btn-block btn-flat" hidden="hidden">Next</button>
            <a href="Login.aspx">
                <button id="btnBack" class="btn btn-primary btn-block btn-flat">Go Back</button></a>

        </div>

        <div class="login-form" id="AuthenticationContent" hidden="hidden">
            <h2>Enter Authentication
                <br />
                Code</h2>
            <h4>We have sent a authentication code via SMS.
            </h4>
            <div class="Code">
                <input type="text" id="txtCode1" class="form-control" />
                <input type="text" id="txtCode2" class="form-control" />
                <input type="text" id="txtCode3" class="form-control" />
                <input type="text" id="txtCode4" class="form-control" />
                <input type="text" id="txtCode5" class="form-control" />
                <input type="text" id="txtCode6" class="form-control" />
            </div>
            <br />
            <button type="submit" id="btnSubmitAuthentication" class="btn btn-primary btn-block btn-flat">Submit</button>

        </div>
    </div>
</body>
<script src="../bower_components/jquery/dist/jquery.min.js"></script>
<script src="../bower_components/toastr/toastr.min.js"></script>
<script src="../scripts/notification.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
<script src="../scripts/login.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
</html>

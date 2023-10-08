<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bower_components/toastr/toastr.min.css" rel="stylesheet" />
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
            flex-direction: column;
            gap: 20px;
        }

        .login-form {
            flex: 1;
            background-color: #B8F2E3; /* White background color for the right side */
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }

        .btn {
            width: 300px !important;
        }

        .Code {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

            .Code input {
                width: 50px;
            }

        .txt {
            width: 80% !important;
            margin: auto;
            box-shadow: 5px 5px 5px 0px rgba(0,0,0,0.26);
        }
    </style>
    <title>Login</title>
</head>
<body>
    <div class="login-container">
        <div class="login-logo">
            <img src="resources/images/logo.png" style="width: 450px" alt="Logo">
            <div style="width: 350px; background-color: #fff; display: flex; flex-direction: row; align-items: center; border-radius: 25px; padding-right: 20px;">
                <img src="resources/images/5.png" style="width: 100px">
                <div style="display: flex; flex-direction: column; text-align: end">
                    <h3><b style="color:green">Get</b><b style="color:red">Go</b></h3>
                    <p>
                        Make the time-consuming process of getting a loan easier and more enjoyable.
                    </p>
                </div>
            </div>
        </div>
        <div class="login-form" id="loginContent">
            <h1 style="color: #1B5B6B; font-size: 60px; padding-bottom: 50px; font-family: 'Arial Rounded MT'">Hello
                <br />
                Welcome back!</h1>

            <input type="email" id="_emailAddress" class="form-control input-lg txt" placeholder="Email" />
            <br />
            <input type="password" id="_password" class="form-control input-lg txt" placeholder="Password" />
            <br />
            <label id="lblforgotPass" style="cursor: pointer;"><u>Forgot Password?</u></label>
            <br />
            <center>
                <button type="submit" id="btnLogin" class="btn btn-primary btn-block btn-lg" style="width: 300px;">Login</button>
            </center>
            <br />

        </div>

        <div class="login-form" id="ForgotPassContent" hidden="hidden">
            <h1 style="color: #1B5B6B; font-size: 60px; padding-bottom: 50px; font-family: 'Arial Rounded MT'">Forgot Password?</h1>
            <br />

            <h4>Don't worry! It happens.
                     Enter the email associated with your account.

            </h4>

            <input type="email" id="_emailForgotPass" class="form-control input-lg txt" placeholder="Email" />
            <br />
            <label id="txtContactNo"></label>

            <div style="display: flex; flex-direction: row; gap: 10px; justify-content: space-evenly;">
                <button type="submit" id="btnSubmit" class="btn btn-primary btn-block btn-lg">Submit</button>
                <button id="btnNext" class="btn btn-primary btn-block btn-lg" style="display: none">Next</button>
                <a href="Login.aspx">
                    <button id="btnBack" class="btn btn-primary btn-block btn-lg">Go Back</button></a>
            </div>

        </div>

        <div class="login-form" id="AuthenticationContent" hidden="hidden">
            <h1 style="color: #1B5B6B; font-size: 60px; padding-bottom: 50px; font-family: 'Arial Rounded MT'">Enter Authentication
                <br />
                Code</h1>
            <h4>We have sent a authentication code via SMS.
            </h4>
            <div class="Code">
                <input type="text" id="txtCode1" class="form-control input-lg inputs" maxlength="1" />
                <input type="text" id="txtCode2" class="form-control input-lg inputs" maxlength="1" />
                <input type="text" id="txtCode3" class="form-control input-lg inputs" maxlength="1" />
                <input type="text" id="txtCode4" class="form-control input-lg inputs" maxlength="1" />
                <input type="text" id="txtCode5" class="form-control input-lg inputs" maxlength="1" />
                <input type="text" id="txtCode6" class="form-control input-lg inputs" maxlength="1" />
            </div>
            <br />
            <center>
                <button type="submit" id="btnSubmitAuthentication" class="btn btn-primary btn-block btn-lg">Submit</button>
            </center>
        </div>

        <div class="login-form" id="ChangePassContent" hidden="hidden">
            <h1 style="color: #1B5B6B; font-size: 60px; padding-bottom: 50px; font-family: 'Arial Rounded MT'">Enter New Login
                <br />
                Password</h1>

            <input type="password" id="_changePassword" class="form-control input-lg txt" placeholder="Enter New Password" />
            <label id="lblchangePassword" style="color:red;"></label>
            <br />
            <input type="password" id="_confirmPassword" class="form-control input-lg txt" placeholder="Confirm New Password" />
            <label id="lblconfirmPassword" style="color:red;"></label>
            <center>

                <button type="submit" id="btnConfirm" class="btn btn-primary btn-block btn-lg" style="width: 300px;">Submit</button>
            </center>
            <br />

        </div>
    </div>
</body>
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="bower_components/toastr/toastr.min.js"></script>
<script src="scripts/notification.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
<script src="scripts/login.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
</html>

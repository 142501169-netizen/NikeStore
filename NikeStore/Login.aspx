<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="NikeStore.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Nike Store | Login</title>

    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Poppins', sans-serif;
            overflow: hidden;
        }

        .bg-video {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            object-fit: cover;
            z-index: -1;
            filter: brightness(60%);
        }

        .login-container {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            height: 100vh;
            padding-right: 80px; 
            animation: fadeIn 1.2s ease;
        }

    
        .login-box {
            width: 480px;
            background: rgba(255, 255, 255, 0.12);
            backdrop-filter: blur(20px);
            border-radius: 25px;
            box-shadow: 0 10px 50px rgba(0,0,0,0.4);
            color: #fff;
            overflow: hidden;
            transition: height 0.6s ease;
        }
 
        .tabs {
            display: flex;
            justify-content: space-around;
            background: rgba(255,255,255,0.15);
            border-bottom: 1px solid rgba(255,255,255,0.3);
            padding: 12px 0;
        }
        .tabs span {
            flex: 1;
            text-align: center;
            cursor: pointer;
            font-weight: 600;
            transition: 0.3s;
        }
        .tabs span.active {
            color: #00d4ff;
            border-bottom: 2px solid #00d4ff;
        }

        /* Scrollable form container */
        .form-container {
            width: 200%;
            display: flex;
            transition: transform 0.6s ease;
        }

        .form-box {
            width: 50%;
            padding: 45px 50px;
        }

        .form-box h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 26px;
            font-weight: 600;
        }

        .input-box {
            margin-bottom: 18px;
        }

        .input-box input {
            width: 100%;
            padding: 13px;
            border-radius: 10px;
            border: none;
            outline: none;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            font-size: 15px;
        }

        .input-box input::placeholder { color: #ddd; }

        .btn {
            width: 100%;
            padding: 13px;
            border-radius: 10px;
            border: none;
            background: linear-gradient(135deg, #007bff, #00d4ff);
            color: #fff;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.25s ease;
        }
        .btn:hover { transform: scale(1.05); }

        .error-msg {
            color: #ff6b6b;
            text-align: center;
            margin-top: 12px;
            font-size: 14px;
        }

       
        @keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }

        
        @keyframes glow {
            0% { box-shadow: 0 0 20px rgba(0,212,255,0.25); }
            50% { box-shadow: 0 0 35px rgba(0,212,255,0.45); }
            100% { box-shadow: 0 0 20px rgba(0,212,255,0.25); }
        }

        .login-box {
            animation: glow 4s infinite ease-in-out;
        }
    </style>
</head>

<body>
   
    <video autoplay muted loop class="bg-video">
        <source src="images/NIKE LOGO ANIMATION VIDEO.mp4" type="video/mp4">
    </video>

   
    <form id="form1" runat="server">
        <div class="login-container">
            <div id="box" class="login-box">

              
                <div class="tabs">
                    <span id="tabLogin" class="active" onclick="showLogin()">Login</span>
                    <span id="tabRegister" onclick="showRegister()">Register</span>
                </div>

                
                <div id="formContainer" class="form-container">

                  
                    <div class="form-box">
                        <h2>Welcome Back 👟</h2>
                        <div class="input-box">
                            <asp:TextBox ID="txtUsername" runat="server" placeholder="Username"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />

                        <asp:Label ID="lblLoginError" runat="server" CssClass="error-msg" Visible="false"></asp:Label>
                    </div>

                   
                    <div class="form-box">
                        <h2>Create Account ✨</h2>
                        <div class="input-box">
                            <asp:TextBox ID="txtNewUsername" runat="server" placeholder="Username"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:TextBox ID="txtNewEmail" runat="server" placeholder="Email"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="" OnClick="btnRegister_Click" />
                        <asp:Label ID="lblRegisterMsg" runat="server" CssClass="error-msg" Visible="false"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        const formContainer = document.getElementById("formContainer");
        const tabLogin = document.getElementById("tabLogin");
        const tabRegister = document.getElementById("tabRegister");
        const box = document.getElementById("box");

        function showRegister() {
            formContainer.style.transform = "translateX(-50%)";
            tabLogin.classList.remove("active");
            tabRegister.classList.add("active");
            box.style.height = "540px";
        }

        function showLogin() {
            formContainer.style.transform = "translateX(0)";
            tabRegister.classList.remove("active");
            tabLogin.classList.add("active");
            box.style.height = "460px";
        }
    </script>
</body>
</html>

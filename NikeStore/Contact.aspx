<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="NikeStore.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Page styling */
        body {
            font-family: 'Segoe UI', sans-serif;
        }

        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('/images/contact-bg.jpg') center/cover no-repeat;
            color: white;
            text-align: center;
            padding: 80px 0;
            animation: fadeIn 2s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .contact-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            flex-wrap: wrap;
            margin: 50px auto;
            width: 90%;
            max-width: 1200px;
        }

        .contact-info, .contact-form {
            flex: 1;
            min-width: 350px;
            padding: 20px;
            animation: slideUp 1.5s ease;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .team {
            display: flex;
            flex-direction: column;
            gap: 30px;
            margin-top: 20px;
        }

        .team-member {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .team-member img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 2px solid #0078d7;
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .contact-form button {
            background-color: #0078d7;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            transition: all 0.3s;
        }

        .contact-form button:hover {
            background-color: #005fa3;
        }

        iframe {
            border-radius: 12px;
            width: 100%;
            height: 250px;
            border: none;
        }

        /* Success Popup Animation */
        #successPopup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0.8);
            background: linear-gradient(135deg, #0078d7, #00b4d8);
            color: white;
            padding: 30px 50px;
            border-radius: 20px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.4);
            font-size: 22px;
            font-weight: 600;
            text-align: center;
            z-index: 9999;
            opacity: 0;
            transition: all 0.5s ease-in-out;
        }

        #successPopup.show {
            display: block;
            opacity: 1;
            transform: translate(-50%, -50%) scale(1);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero">
        <h1>#let's_talk</h1>
        <p>LEAVE A MESSAGE — We love to hear from you!</p>
    </div>

    <div class="contact-container">
        <!-- Left Side -->
        <div class="contact-info">
            <h2>Get In Touch</h2>
            <p>Visit one of our agency locations or contact us today</p>
            <p><strong>Head Office:</strong> 56 Glassford Street, Glasgow G1 1UL, New York</p>
            <p><strong>Email:</strong> contact@example.com</p>
            <p><strong>Phone:</strong> +1 800 234 5678</p>
            <p><strong>Hours:</strong> Monday - Saturday: 9am to 6pm</p>
            <iframe src="https://www.google.com/maps?q=University%20of%20Oxford&output=embed"></iframe>
        </div>

        <!-- Right Side -->
        <div class="contact-form">
            <h2>Send Us a Message</h2>
            <asp:TextBox ID="txtName" runat="server" placeholder="Your Name"></asp:TextBox>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Your Email"></asp:TextBox>
            <asp:TextBox ID="txtSubject" runat="server" placeholder="Subject"></asp:TextBox>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" placeholder="Message"></asp:TextBox>
            <asp:Button ID="btnSend" runat="server" Text="Send Message" OnClick="btnSend_Click" />
            
            <div class="team">
                <div class="team-member">
                    <img src="/images/team1.jpg" alt="Member 1" />
                    <div><strong>Jane Doe</strong><br />Customer Support</div>
                </div>
                <div class="team-member">
                    <img src="/images/team2.jpg" alt="Member 2" />
                    <div><strong>John Smith</strong><br />Sales Manager</div>
                </div>
                <div class="team-member">
                    <img src="/images/team3.jpg" alt="Member 3" />
                    <div><strong>Sarah Lee</strong><br />Technical Specialist</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Cool Popup -->
    <div id="successPopup">✅ Message Sent Successfully!</div>

    <script>
        function showSuccessMessage() {
            const popup = document.getElementById('successPopup');
            popup.classList.add('show');
            setTimeout(() => {
                popup.classList.remove('show');
            }, 3000);
        }
    </script>
</asp:Content>

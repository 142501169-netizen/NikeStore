<%@ Page Title="Place Order" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="NikeStore.PlaceOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #000000, #1a1a1a, #222);
            color: white;
            overflow-x: hidden;
        }

        /* --- Fade-in animation for whole page --- */
        .order-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            max-width: 1100px;
            margin: 100px auto;
            padding: 50px;
            border-radius: 25px;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            box-shadow: 0 10px 40px rgba(255, 255, 255, 0.05);
            animation: fadeIn 1s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* --- Shoe Image --- */
        .shoe-preview {
            flex: 1;
            text-align: center;
            animation: float 4s ease-in-out infinite;
        }

        .shoe-img {
            max-width: 450px;
            width: 100%;
            border-radius: 20px;
            transition: transform 0.5s ease, filter 0.5s ease;
        }

        .shoe-img:hover {
            transform: scale(1.08);
            filter: brightness(1.2);
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        /* --- Details --- */
        .order-details {
            flex: 1;
            padding: 20px;
        }

        .order-details h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 10px;
        }

        .order-details h4 {
            color: #bbb;
            font-weight: 500;
            margin-bottom: 15px;
        }

        .order-details p {
            color: #ddd;
            font-size: 1rem;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .order-details h3 {
            color: #00ff88;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        /* --- Sizes --- */
        .size-container {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }

        .size-option input[type="radio"] {
            display: none;
        }

        .size-option label {
            background: rgba(255,255,255,0.08);
            color: #fff;
            border-radius: 12px;
            padding: 10px 20px;
            cursor: pointer;
            border: 1px solid rgba(255,255,255,0.2);
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .size-option input[type="radio"]:checked + label {
            background: #00ff88;
            color: #000;
            transform: scale(1.1);
            box-shadow: 0 0 20px #00ff88;
        }

        .size-option label:hover {
            background: rgba(255,255,255,0.2);
            transform: scale(1.05);
        }

        /* --- Add to Bag Button --- */
        .btn-placeorder {
            background: linear-gradient(90deg, #00ff88, #00ccff);
            border: none;
            color: #000;
            padding: 16px 50px;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            margin-top: 25px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-placeorder::after {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(255,255,255,0.4);
            transition: left 0.4s ease;
        }

        .btn-placeorder:hover::after {
            left: 100%;
        }

        .btn-placeorder:hover {
            transform: scale(1.05);
            box-shadow: 0 0 30px #00ff88;
        }

        /* --- Popup Background --- */
        .popup-bg {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(10px);
            z-index: 900;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        /* --- Centered Popup --- */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0.7);
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 20px;
            padding: 25px 30px;
            box-shadow: 0 8px 35px rgba(0, 0, 0, 0.5);
            width: 400px;
            text-align: center;
            z-index: 1000;
            opacity: 0;
            animation: fadeZoomIn 0.5s forwards;
        }

        @keyframes fadeZoomIn {
            from { opacity: 0; transform: translate(-50%, -50%) scale(0.7); }
            to { opacity: 1; transform: translate(-50%, -50%) scale(1); }
        }

        @keyframes fadeZoomOut {
            from { opacity: 1; transform: translate(-50%, -50%) scale(1); }
            to { opacity: 0; transform: translate(-50%, -50%) scale(0.7); }
        }

        .popup img {
            width: 100px;
            border-radius: 15px;
            margin-bottom: 15px;
        }

        .popup h4 {
            font-size: 1.3rem;
            margin-bottom: 5px;
        }

        .popup p {
            color: #00ff88;
            font-size: 1.1rem;
        }

        .popup button {
            background: #00ff88;
            color: #000;
            border: none;
            border-radius: 25px;
            padding: 10px 25px;
            font-weight: 700;
            cursor: pointer;
            margin-top: 15px;
            transition: 0.3s;
        }

        .popup button:hover {
            background: #00ccff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="order-container">
        <div class="shoe-preview">
            <img src="17.jpg" id="imgShoe" runat="server" class="shoe-img" />
        </div>

        <div class="order-details">
            <h2><asp:Label ID="lblName" runat="server" /></h2>
            <h4><asp:Label ID="lblBrand" runat="server" /></h4>
            <p><asp:Label ID="lblDescription" runat="server" /></p>
            <h3>R <asp:Label ID="lblPrice" runat="server" /></h3>

            <h4>Select Size</h4>
            <div class="size-container">
                <asp:Repeater ID="rptSizes" runat="server">
                    <ItemTemplate>
                        <div class="size-option">
                            <input type="radio" id="size_<%# Container.DataItem %>" name="shoeSize" value='<%# Container.DataItem %>' required />
                            <label for="size_<%# Container.DataItem %>"><%# Container.DataItem %></label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <asp:HiddenField ID="hiddenShoeId" runat="server" />
            <asp:Button ID="btnPlaceOrder" runat="server" Text="Add to Bag 🛍️" CssClass="btn-placeorder" OnClick="btnPlaceOrder_Click" />
        </div>
    </div>

    <!-- Background Blur -->
    <div id="popupBg" class="popup-bg"></div>

    <!-- Popup -->
    <div id="popupBag" class="popup">
        <img src="18.jpg" id="popupImg" runat="server" />
        <h4 id="popupName" runat="server"></h4>
        <p id="popupPrice" runat="server"></p>
        <button onclick="window.location='Cart.aspx'">View Cart</button>
    </div>

    <script type="text/javascript">
        function showPopup(name, size, price, image) {
            const popup = document.getElementById('popupBag');
            const popupBg = document.getElementById('popupBg');
            const popupImg = document.getElementById('<%= popupImg.ClientID %>');
            const popupName = document.getElementById('<%= popupName.ClientID %>');
            const popupPrice = document.getElementById('<%= popupPrice.ClientID %>');

            popupImg.src = image;
            popupName.textContent = name + " (Size: " + size + ")";
            popupPrice.textContent = "R " + price;

            popup.style.display = 'block';
            popupBg.style.display = 'block';
            setTimeout(() => {
                popupBg.style.opacity = '1';
                popup.style.opacity = '1';
            }, 10);

            setTimeout(() => {
                popup.style.animation = 'fadeZoomOut 0.5s forwards';
                popupBg.style.opacity = '0';
                setTimeout(() => {
                    popup.style.display = 'none';
                    popup.style.animation = '';
                    popupBg.style.display = 'none';
                }, 500);
            }, 3000);
        }
    </script>
</asp:Content>

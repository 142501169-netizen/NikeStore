<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NikeProducts.aspx.cs" Inherits="NikeStore.NikeProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* === Dark Neon Theme === */
        body {
            font-family: 'Poppins', sans-serif;
            background: radial-gradient(circle at top, #0f0f1f, #000);
            color: #fff;
            overflow-x: hidden;
            animation: bgGlow 6s ease-in-out infinite alternate;
        }

        @keyframes bgGlow {
            from { background: radial-gradient(circle at top, #0f0f1f, #000); }
            to { background: radial-gradient(circle at bottom, #141428, #000); }
        }

        h1 {
            text-align: center;
            color: #00eaff;
            text-shadow: 0 0 20px #00eaff;
            font-size: 2.5rem;
            margin: 50px 0 20px;
            letter-spacing: 2px;
            animation: fadeIn 1s ease;
        }

        /* === Search & Filter === */
        .filter-bar {
            text-align: center;
            margin-bottom: 40px;
        }

        .search-box, .filter-select {
            background: #111;
            border: 1px solid #00eaff;
            color: #00eaff;
            padding: 10px 15px;
            border-radius: 25px;
            margin: 5px;
            font-size: 16px;
            outline: none;
            transition: box-shadow 0.3s;
        }

        .search-box:focus, .filter-select:focus {
            box-shadow: 0 0 10px #00eaff;
        }

        /* === Product Grid === */
        .products-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 35px;
            max-width: 1400px;
            margin: 0 auto 80px;
            padding: 0 30px;
            animation: fadeIn 1.2s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .product-card {
            background: #111;
            border: 1px solid #00eaff33;
            border-radius: 20px;
            box-shadow: 0 0 15px #00eaff22;
            overflow: hidden;
            transition: all 0.3s ease;
            cursor: pointer;
            position: relative;
        }

        .product-card:hover {
            transform: scale(1.05);
            box-shadow: 0 0 30px #00eaff77;
        }

        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 1px solid #00eaff44;
            transition: transform 0.3s ease;
        }

        .product-card:hover img {
            transform: scale(1.08);
        }

        .product-info {
            padding: 15px;
            text-align: center;
        }

        .product-info h3 {
            color: #00eaff;
            font-size: 18px;
            margin-bottom: 5px;
        }

        .product-info p {
            color: #bbb;
            font-size: 14px;
            margin: 5px 0;
        }

        .product-price {
            font-weight: bold;
            color: #ff007a;
            font-size: 18px;
            text-shadow: 0 0 10px #ff007a;
        }

        /* === Popup === */
        .popup {
            display: none;
            position: fixed;
            top: 40px;
            right: 40px;
            background: #111;
            border: 2px solid #00eaff;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 0 30px #00eaff55;
            z-index: 1000;
            opacity: 0;
            transform: translateX(100%);
        }

        .popup.show {
            display: block;
            animation: slideIn 0.5s forwards;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(100%); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes slideOut {
            from { opacity: 1; transform: translateX(0); }
            to { opacity: 0; transform: translateX(100%); }
        }

        .popup-content {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .popup-content img {
            width: 60px;
            height: 60px;
            border-radius: 10px;
            object-fit: cover;
            border: 1px solid #00eaff;
        }

        .popup h4 {
            margin: 0;
            color: #00eaff;
        }

        .popup p {
            margin: 5px 0 0;
            color: #ff007a;
            font-weight: 600;
        }
    </style>

    <script>
        function goToOrder(id, name, price, image) {
            showPopup(name, price, image);
            setTimeout(() => {
                window.location.href = "PlaceOrder.aspx?id=" + id;
            }, 1500);
        }

        function showPopup(name, price, image) {
            const popup = document.getElementById('popupBag');
            const popupImg = document.getElementById('popupImg');
            const popupName = document.getElementById('popupName');
            const popupPrice = document.getElementById('popupPrice');

            popupImg.src = image;
            popupName.textContent = name;
            popupPrice.textContent = "R " + price;

            popup.classList.add('show');
            setTimeout(() => {
                popup.style.animation = 'slideOut 0.5s forwards';
                setTimeout(() => popup.classList.remove('show'), 500);
            }, 2500);
        }

        function filterProducts() {
            const searchValue = document.getElementById('searchBox').value.toLowerCase();
            const filterValue = document.getElementById('filterSelect').value;
            const cards = document.querySelectorAll('.product-card');

            cards.forEach(card => {
                const name = card.getAttribute('data-name').toLowerCase();
                const gender = card.getAttribute('data-gender').toLowerCase();
                const type = card.getAttribute('data-type').toLowerCase();

                if (
                    (name.includes(searchValue)) &&
                    (filterValue === "" || gender === filterValue || type === filterValue)
                ) {
                    card.style.display = "block";
                } else {
                    card.style.display = "none";
                }
            });
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>⚡ Nike Neon Collection</h1>

    <!-- Filter Bar -->
    <div class="filter-bar">
        <input type="text" id="searchBox" class="search-box" placeholder="Search sneakers..." onkeyup="filterProducts()" />
        <select id="filterSelect" class="filter-select" onchange="filterProducts()">
            <option value="">Filter by</option>
            <option value="men">Men</option>
            <option value="women">Women</option>
            <option value="lifestyle">Lifestyle</option>
            <option value="training">Training</option>
            <option value="football">Football</option>
        </select>
    </div>

    <!-- Product Grid -->
    <div class="products-container">
        <asp:Repeater ID="rptShoes" runat="server">
           <ItemTemplate>
    <div class="product-card"
         data-name='<%# Eval("Name") %>'
         data-gender='<%# Eval("Gender") %>'
         data-type='<%# Eval("Shoe_Type") %>'
         onclick='<%# "goToOrder(\"" + System.Web.HttpUtility.JavaScriptStringEncode(Eval("Id").ToString()) + "\", \"" 
                             + System.Web.HttpUtility.JavaScriptStringEncode(Eval("Name").ToString()) + "\", \"" 
                             + System.Web.HttpUtility.JavaScriptStringEncode(Eval("Price").ToString()) + "\", \"" 
                             + System.Web.HttpUtility.JavaScriptStringEncode(Eval("Image").ToString()) + "\")" %>'>
        
        <img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' />

        <div class="product-info">
            <h3><%# Eval("Name") %></h3>
            <p><%# Eval("Brand") %> | <%# Eval("Gender") %></p>
            <div class="product-price">R <%# Eval("Price", "{0:0.00}") %></div>
        </div>
    </div>
</ItemTemplate>

        </asp:Repeater>
    </div>

    <!-- Popup -->
    <div id="popupBag" class="popup">
        <div class="popup-content">
            <img id="popupImg" />
            <div>
                <h4 id="popupName"></h4>
                <p id="popupPrice"></p>
            </div>
        </div>
    </div>
</asp:Content>

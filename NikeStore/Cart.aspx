<%@ Page Title="My Bag" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="NikeStore.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
body { font-family: 'Poppins', sans-serif; background: #f8f9fb; margin:0; }
.cart-wrapper { max-width:1100px; margin:60px auto; background:#fff; border-radius:12px; padding:32px; box-shadow:0 10px 25px rgba(0,0,0,0.08); animation: fadeIn .5s ease; }
@keyframes fadeIn { from{opacity:0; transform:translateY(12px)} to{opacity:1; transform:none} }
.cart-table{ width:100%; border-collapse:collapse; margin-top:10px; }
.cart-table th,.cart-table td{ padding:14px; text-align:center; border-bottom:1px solid #eee; vertical-align:middle; }
.cart-table th{ font-weight:700; color:#333; }
.cart-table img{ width:80px; height:80px; border-radius:8px; object-fit:cover; }

.remove-btn{ background:none; border:none; color:#e63946; font-size:20px; cursor:pointer; transition:transform .18s; }
.remove-btn:hover{ transform:scale(1.15); }
.qty-box{ width:64px; padding:8px; text-align:center; border:1px solid #d0d7de; border-radius:8px; }

.summary { margin-top:22px; text-align:right; }
.summary .total { font-size:20px; font-weight:700; margin-bottom:8px; }

.payment-section { margin-top:28px; padding-top:18px; border-top:1px solid #f0f0f0; }
.payment-option{ margin:10px 0; font-size:15px; }
.checkout-btn{ background:#007bff; color:#fff; border:none; border-radius:28px; padding:12px 28px; cursor:pointer; font-size:15px; transition:all .18s; }
.checkout-btn:hover{ transform:translateY(-3px); background:#0056b3; }

#cardForm { display:none; margin-top:12px; max-width:450px; }
.card-input{ display:block; width:100%; padding:10px 12px; margin:8px 0; border-radius:8px; border:1px solid #d0d7de; }

#successPopup { display:none; position:fixed; left:50%; top:50%; transform:translate(-50%,-50%); background:#fff; padding:32px 40px; border-radius:12px; box-shadow:0 10px 40px rgba(0,0,0,0.18); text-align:center; z-index:9999; }
#successPopup h2{ margin:0 0 8px 0; color:#28a745; }
#successPopup p{ margin:0 0 16px 0; color:#333; }
#successPopup .close-btn{ background:#007bff; color:#fff; border:none; padding:8px 18px; border-radius:8px; cursor:pointer; }

@media (max-width:900px){ .cart-wrapper{ padding:18px } .cart-table th:nth-child(2), .cart-table td:nth-child(2){ display:none; } }
</style>

<script type="text/javascript">

    function updateTotal() {
        var rows = document.querySelectorAll('.cart-row');
        var total = 0;
        rows.forEach(function (row) {
            var priceText = row.querySelector('.price').innerText.replace('R ', '').replace(',', '');
            var price = parseFloat(priceText) || 0;
            var qty = parseInt(row.querySelector('.qty-box').value) || 1;
            var sub = price * qty;
            row.querySelector('.subtotal').innerText = 'R ' + sub.toFixed(2);
            total += sub;
        });
        document.getElementById('<%= lblTotal.ClientID %>').innerText = 'Total: R ' + total.toFixed(2);
    }

    function onPaymentChange() {
        var cardRadio = document.getElementById('cardRadio');
        var cardForm = document.getElementById('cardForm');
        cardForm.style.display = cardRadio.checked ? 'block' : 'none';
    }

    function proceedToPay() {
        var cardRadio = document.getElementById('cardRadio');
        var cashRadio = document.getElementById('cashRadio');

        if (!cardRadio.checked && !cashRadio.checked) {
            alert('Select a payment method.');
            return;
        }

        if (cardRadio.checked) {
            var number = document.getElementById('cardNumber').value.trim();
            var expiry = document.getElementById('cardExpiry').value.trim();
            var cvv = document.getElementById('cardCVV').value.trim();

            if (number.length < 12) { alert('Enter a valid card number.'); return; }
            if (!/^\d{2}\/\d{2}$/.test(expiry)) { alert('Expiry should be MM/YY.'); return; }
            if (!/^\d{3,4}$/.test(cvv)) { alert('Enter a valid CVV.'); return; }

            document.getElementById('<%= hfPaymentMethod.ClientID %>').value = 'Card';
        document.getElementById('<%= hfCardLast4.ClientID %>').value = number.slice(-4);
    }
    else if (cashRadio.checked) {
        document.getElementById('<%= hfPaymentMethod.ClientID %>').value = 'Cash';
        document.getElementById('<%= hfCardLast4.ClientID %>').value = '';
    }

    document.getElementById('<%= btnProcessPayment.ClientID %>').click();
    }

    function showSuccessPopup() {
        var p = document.getElementById('successPopup');
        if (p) p.style.display = 'block';
    }

    function closePopup() {
        document.getElementById('successPopup').style.display = 'none';
    }

    window.addEventListener('load', function () {
        updateTotal();
        onPaymentChange();
    });

</script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="cart-wrapper">

<h2>🛒 Shopping Cart</h2>

<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="rptCart_ItemCommand">
    <HeaderTemplate>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Remove</th>
                    <th>Image</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>

   <ItemTemplate>
<tr class="cart-row">
    <td>
        <asp:LinkButton ID="btnRemove" runat="server" CommandName="Remove"
            CommandArgument='<%# Eval("Id") %>' CssClass="remove-btn" Title="Remove">×</asp:LinkButton>
    </td>

    <td><img src='<%# Eval("Image") %>' alt="Product" /></td>

    <td style="text-align:left;">
        <%# Eval("Name") %> <br />
        <small>Brand: <%# Eval("Brand") %></small> <br />
        <small>Size: <%# Eval("Size") %></small>
    </td>

    <!-- Price -->
    <td class="price">
        R <%# (Convert.ToDecimal(Eval("Price")) / 100).ToString("F2") %>
    </td>

    <!-- Quantity -->
    <td>
        <input name="qty" type="number" class="qty-box" 
               value='<%# Eval("Quantity") %>' 
               min="1" onchange="updateTotal()" />
    </td>

    <!-- Subtotal -->
    <td class="subtotal">
        R <%# ((Convert.ToDecimal(Eval("Price")) / 100) 
            * Convert.ToInt32(Eval("Quantity"))).ToString("F2") %>
    </td>
</tr>
</ItemTemplate>



    <FooterTemplate>
        </tbody>
        </table>
    </FooterTemplate>
</asp:Repeater>


<div class="summary">
    <div class="total">
        <asp:Label ID="lblTotal" runat="server" Text="Total: R 0.00"></asp:Label>
    </div>
</div>

<div class="payment-section">

    <h3>💳 Choose Payment Method</h3>

    <div class="payment-option">
        <input type="radio" id="cardRadio" name="payment" value="Card" onclick="onPaymentChange()" checked />
        <label for="cardRadio">Pay with Card</label>
    </div>

    <div class="payment-option">
        <input type="radio" id="cashRadio" name="payment" value="Cash" onclick="onPaymentChange()" />
        <label for="cashRadio">Pay with Cash</label>
    </div>

    <div id="cardForm">
        <input id="cardNumber" class="card-input" placeholder="Card Number" maxlength="19" />
        <input id="cardExpiry" class="card-input" placeholder="Expiry (MM/YY)" maxlength="5" />
        <input id="cardCVV" class="card-input" placeholder="CVV" maxlength="4" />
    </div>

    <div style="margin-top:14px;">
        <button type="button" class="checkout-btn" onclick="proceedToPay()">Proceed to Pay</button>
    </div>

</div>

<asp:HiddenField ID="hfPaymentMethod" runat="server" />
<asp:HiddenField ID="hfCardLast4" runat="server" />

<asp:Button ID="btnProcessPayment" runat="server" Text="Process" 
    OnClick="btnProcessPayment_Click" Style="display:none" />

</div>

<!-- Success Popup -->
<div id="successPopup">
    <h2>✅ Transaction Complete!</h2>
    <p>Your payment was successful. Thank you for your order.</p>
    <button class="close-btn" onclick="closePopup()">Close</button>
</div>

</asp:Content>

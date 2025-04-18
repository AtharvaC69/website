<%@ Page Title="" Language="C#" MasterPageFile="~/Usermaster.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="MusicalInstrument.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            function DeleteProduct(sopingCartId) {
                var param = { sopingCartId: sopingCartId };
                $.ajax({
                    url: "ShoppingCart.aspx/DeleteItem",
                    data: JSON.stringify(param),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.MedicineName + '-' + item.CategoryName + ' (' + item.ManufacturerName + ')'
                                , val: item.MedicineId
                            }
                        }))
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        var err = eval("(" + XMLHttpRequest.responseText + ")");
                        alert(err.Message)
                        // console.log("Ajax Error!");  
                    }
                });
            }
            $('$btnRemoveItem').click(function () {
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th colspan="2">Product</th>
                    <th>Unit Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <asp:Literal ID="ltrlShoppongCart" runat="server"></asp:Literal>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="4">Grand Total</th>
                    <th>
                        <asp:Label runat="server" ID="lblGrandTotal"></asp:Label></th>
                    <td></td>
                </tr>
            </tfoot>
        </table>
        <div class="">
            <h2>Payment Details</h2>
            <table class="form">
                <tr>
                    <td>Payment Type</td>
                    <td>
                        <asp:DropDownList ID="ddlPaymentType" runat="server" CssClass="form-control">
                            <asp:ListItem Text="--Select Payment Type--" Value=""></asp:ListItem>
                            <asp:ListItem Text="Credit Card" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Debit Card" Value="2"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="rfvPaymentType" ForeColor="Red" Display="Dynamic"
                            ControlToValidate="ddlPaymentType" ErrorMessage="Please select payment type" /></td>
                </tr>
                <tr>
                    <td>Card Number</td>
                    <td>
                        <asp:TextBox ID="txtCardNumber" MaxLength="16" runat="server" CssClass="form-control" placeholder="16 Digits Card Number" /></td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="rfvCardNumber" ForeColor="Red" Display="Dynamic"
                            ControlToValidate="txtCardNumber" ErrorMessage="Please enter 16 digit card number" /></td>
                </tr>
                <tr>
                    <td>CVV</td>
                    <td>
                        <asp:TextBox ID="txtCVV" MaxLength="3" runat="server" CssClass="form-control" placeholder="Enter CVV Number (CVV)" /></td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="rfvCVV" ForeColor="Red" Display="Dynamic"
                            ControlToValidate="txtCVV" ErrorMessage="Please enter 3 digit CVV number printed on card" /></td>
                </tr>
                <tr>
                    <td>Expiry Month Year</td>
                    <td>
                        <asp:TextBox ID="txtExpiryMonth" MaxLength="7" runat="server" CssClass="form-control" placeholder="Enter Expiry Mont Year (DD-YYYY)" /></td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="rfvExpiryMonth" ForeColor="Red" Display="Dynamic"
                            ControlToValidate="txtExpiryMonth" ErrorMessage="Please enter expiry month and year printed card number" /></td>
                </tr>
                <tr>
                    <td>Name On Card</td>
                    <td>
                        <asp:TextBox ID="txtNameOnCard" runat="server" CssClass="form-control" placeholder="Name On Card" /></td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="rfvNameOnCard" ForeColor="Red" Display="Dynamic"
                            ControlToValidate="txtNameOnCard" ErrorMessage="Please enter your name printed card number" /></td>
                </tr>
                <tr>
                    <td>Transaction Amount</td>
                    <td>
                        <asp:TextBox ID="txtAmount" ReadOnly="true" runat="server" CssClass="form-control" placeholder="Amount Rs." /></td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="rfvAmount" ForeColor="Red" Display="Dynamic"
                            ControlToValidate="txtAmount" ErrorMessage="Please enter your transaction amount" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnPayment" runat="server" Text="Make Payment" CssClass="btn btn-primary btn-block" />
                    </td>
                    <td colspan="2"><a href="SearchMedicine.aspx" class="btn btn-primary btn-block">Back To Search Medicine</a></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

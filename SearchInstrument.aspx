<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="SearchInstrument.aspx.cs" Inherits="SearchMedicine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        a {
            color: #0254EB;
        }

            a:visited {
                color: #0254EB;
            }

            a.morelink {
                text-decoration: none;
                outline: none;
            }

        .morecontent span {
            display: none;
        }

        .comment {
            width: 100%;
            background-color: #f0f0f0;
            margin: 10px;
        }
    </style>
    <script type="text/javascript">
        $('#txtQuantity').change(function () {
            var quantity = $('#txtQuantity').val();
            var unitPrice = $('#lblUnitPrice').text();
            var totalPrice = parseFloat(quantity) * parseFloat(unitPrice);
            $('#lblTotalPrice').text(totalPrice);
        })

        function MakeOrder() {
            if ($('#txtQuantity').val() === undefined || $('#txtQuantity').val() === '' || $('#lblTotalPrice').text() === undefined || $('#lblTotalPrice').text() === '') {
                $('lblErrorMessage').text('Please enter quantity');
                return false;
            } else {
                //$('#btnSave').preventDefault();
                window.location.replace("PaymentDetails.aspx?Amount=" + $('#lblTotalPrice').text() + "&MedicineId=" + $('#hdnMedicineId').val() + "&Quantity=" + $('#txtQuantity').val() + "&UnitPrice=" + $('#lblUnitPrice').text());
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>&nbsp;</div>
    <div class="panel panel-info">
        <div class="panel-heading">
            <h2>Search Product Form</h2>

        </div>
        <div class="panel-body">
            <div class="example">
                <div class="col-lg-11">
                    <input type="text" placeholder="Search Medicine.." class="form-control pull-right" name="search" id="txtMedicineName" /></div>
                <div class="col-lg-1">
                    <button type="button" class="btn btn-success"><i class="fa fa-search">Search</i></button></div>
                <asp:HiddenField ID="hdnMedicineId" runat="server" ClientIDMode="Static" />
            </div>
            <br />
            <br />
            <div id="divMedicineGrid" runat="server" style="display: none;">
                <asp:Literal ID="ltrlMedical" runat="server"></asp:Literal>
            </div>
            <div class="container" id="divOrderDetails" style="display: none">
                <table class="table table-stripped">
                    <tr>
                        <td style="width: 20%;">Product</td>
                        <td style="width: 80%;">:<asp:Label ID="lblMedicine" runat="server" ClientIDMode="Static" /></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle">Product Image</td>
                        <td>:<img id="imgMedicine" src="images/ProductImages/300px-No_image_available.svg.png" style="width: 40%; max-height: 100px; min-height: 170px;" /></td>
                    </tr>

                    <tr>
                        <td>Category</td>
                        <td>:<asp:Label ID="lblCategory" runat="server" ClientIDMode="Static" /></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td>:<asp:Label ID="lblUnitPrice" runat="server" Text="" ClientIDMode="Static" /></td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td>
                            <asp:TextBox ID="txtQuantity" CssClass="form-control" runat="server" TextMode="Number" ClientIDMode="Static" />
                            <asp:Label runat="server" ID="lblErrorMessage" ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                        <td>Total Price</td>
                        <td>:<asp:Label ID="lblTotalPrice" Text="" runat="server" ClientIDMode="Static" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a id="btnSave" onclick="MakeOrder();" class="btn btn-warning">Add To Cart</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            $("#txtMedicineName").autocomplete({
                source: function (request, response) {
                    var param = { searchTerm: $('#txtMedicineName').val() };
                    $.ajax({
                        url: "SearchInstrument.aspx/GetProductList",
                        data: JSON.stringify(param),
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataFilter: function (data) { return data; },
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.ProductName + '-' + item.CategoryName
                                    , val: item.ProductId
                                }
                            }))
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            var err = eval("(" + XMLHttpRequest.responseText + ")");
                            alert(err.Message)
                            // console.log("Ajax Error!");  
                        }
                    });
                },
                select: function (e, i) {
                    $("[id$=hdnMedicineId]").val(i.item.val);
                    $('#divOrderDetails').attr('style', 'display:block');
                    var param = { productId: i.item.val };
                    $.ajax({
                        url: "SearchInstrument.aspx/GetProductDetails",
                        data: JSON.stringify(param),
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataFilter: function (data) { return data; },
                        success: function (data) {
                            $('#ContentPlaceHolder1_divMedicineGrid').attr('style', 'display:none');
                            $('#lblMedicine').text(data.d.ProductName);
                            $('#lblCategory').text(data.d.CategoryName);
                            $('#lblUnitPrice').text(data.d.Price);
                            $('#imgMedicine').attr('src', 'images/ProductImages/' + data.d.ProductImagePath);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            var err = eval("(" + XMLHttpRequest.responseText + ")");
                            alert(err.Message)
                            // console.log("Ajax Error!");  
                        }
                    });
                },
                minLength: 2 //This is the Char length of inputTextBox  
            });
        });

        $('#txtQuantity').change(function () {
            var quantity = $('#txtQuantity').val();
            var unitPrice = $('#lblUnitPrice').text();
            var totalPrice = parseFloat(quantity) * parseFloat(unitPrice);
            $('#lblTotalPrice').text(totalPrice);
        })

        function MakeOrder(event) {
            
            if ($('#txtQuantity').val() === undefined || $('#txtQuantity').val() === '' || $('#lblTotalPrice').text() === undefined || $('#lblTotalPrice').text() === '') {
                $('lblErrorMessage').text('Please enter quantity');
                return false;
            } else {
                var param = { productId: $('#hdnMedicineId').val(), quantity: $('#txtQuantity').val(), totalPrice: $('#lblTotalPrice').text(), unitPrice: $('#lblUnitPrice').text() };
                $.ajax({
                    url: "SearchInstrument.aspx/AddToCart",
                    data: JSON.stringify(param),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataFilter: function (data) { return data; },
                    success: function (data) {
                        if (data.d === "failed") {
                            window.location.replace("Login.aspx");
                        } else {
                            window.location.replace("ShoppingCart.aspx");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        var err = eval("(" + XMLHttpRequest.responseText + ")");
                        alert(err.Message)
                        // console.log("Ajax Error!");  
                    }
                });
            }
        }

        MakeOrderByGrid = function (productId) {
            $("[id$=hdnMedicineId]").val(productId);
            $('#divOrderDetails').attr('style', 'display:block');
            var param = { productId: productId };
            $.ajax({
                url: "SearchInstrument.aspx/GetProductDetails",
                data: JSON.stringify(param),
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataFilter: function (data) { return data; },
                success: function (data) {
                    $('#ContentPlaceHolder1_divMedicineGrid').attr('style', 'display:none');
                    $('#lblMedicine').text(data.d.ProductName);
                    $('#lblCategory').text(data.d.CategoryName);
                    $('#lblUnitPrice').text(data.d.Price);
                    $('#imgMedicine').attr('src', 'images/ProductImages/' + data.d.ProductImagePath);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    var err = eval("(" + XMLHttpRequest.responseText + ")");
                    alert(err.Message)
                    // console.log("Ajax Error!");  
                }
            });
        }

        $(document).ready(function () {
            var showChar = 100;
            var ellipsestext = "...";
            var moretext = "more";
            var lesstext = "less";
            $('.more').each(function () {
                var content = $(this).html();

                if (content.length > showChar) {

                    var c = content.substr(0, showChar);
                    var h = content.substr(showChar - 1, content.length - showChar);

                    var html = c + '<span class="moreellipses">' + ellipsestext + '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';

                    $(this).html(html);
                }

            });

            $(".morelink").click(function () {
                if ($(this).hasClass("less")) {
                    $(this).removeClass("less");
                    $(this).html(moretext);
                } else {
                    $(this).addClass("less");
                    $(this).html(lesstext);
                }
                $(this).parent().prev().toggle();
                $(this).prev().toggle();
                return false;
            });
        });
    </script>
</asp:Content>

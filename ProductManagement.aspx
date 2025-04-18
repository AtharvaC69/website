<%@ Page Title="" Language="C#" MasterPageFile="~/Usermaster.Master" AutoEventWireup="true" CodeBehind="ProductManagement.aspx.cs" Inherits="MusicalInstrument.ProductManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function() {
            $.validator.addMethod("match", function(value, element)   
            {  
                return this.optional(element) || /^[0-9]{5}$/i.test(value);  
            }, "Please enter 5 digit invoice number."); 

            $.validator.addMethod("CheckDropDownList", function (value, element) {  
                if (value == '0')  
                    return false;  
                else  
                    return true; 
        
            },
            "Please select from dropdown list .");
            $("#form1").validate({
                rules: {
                           
                    <%=txtProductName.UniqueID %>:
               {
                   required:true 
               },
                    <%= txtPrice.UniqueID %>:
                {
                                
                    required: true,
                    digits: true
                }
                },
                messages: 
                        {
                            <%= txtProductName.UniqueID %>: 
                      {
                          required:'Medicine Name is Required.'
                      },
                            <%= txtPrice.UniqueID %>: 
                      {
                          required:'Price is Required.'
                      }
                    
                            
                        }
            });
        });

        function CalculatePrice(){
            var quantity=document.getElementById('txtMinQty').value;
            var unitPrice=document.getElementById('txtUnitCost').value;
            var totalCost=parseInt(quantity)*parseFloat(unitPrice);
            document.getElementById('txtTotalCost').value=parseFloat(totalCost);
        }
</script>
    <style>
        label.error {
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <h2>Product Master Registration From</h2>
        <table class="table table-stripped">
            <tr>
                <td>Product Name</td>
                <td>
                    <asp:TextBox ID="txtProductName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:HiddenField ID="hdnProductId" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvProductName" runat="server" ControlToValidate="txtProductName"
                         Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter product name" />
                </td>
            </tr>
             <tr>
                <td>Product Description</td>
                <td>
                    <asp:TextBox ID="txtProductDescription" TextMode="MultiLine" Rows="5" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtProductDescription"
                         Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter description" />
                </td>
            </tr>
            <tr>
                <td>Product Category</td>
                <td>
                    <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCategory" Display="Dynamic" 
                        ForeColor="Red" ErrorMessage="Please select category" />
                </td>
            </tr>
            <tr>
                <td>Price</td>
                <td>
                    <asp:TextBox ID="txtPrice" ClientIDMode="Static" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMinQuantity" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter price" />
                </td>
            </tr>
            <tr>
                <td>Product Image</td>
                <td>
                    <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                    <asp:HiddenField ID="hdnFileUpload" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvProductImage" runat="server" ControlToValidate="fileUpload" Display="Dynamic" ForeColor="Red" ErrorMessage="Please select product image" />
                </td>
            </tr>
        </table>
        <div class="btns">
            <asp:Button ID="BtnSave" CssClass="btn btn-success" runat="server" Text="Save" OnClick="BtnSave_Click" />
            <asp:Button ID="BtnUpdate" CssClass="btn btn-warning" runat="server" CausesValidation="false" Text="Update" OnClick="BtnUpdate_Click" />
            <asp:Button ID="Button1" CssClass="btn btn-danger" runat="server" CausesValidation="false" Text="Remove" OnClick="Button1_Click" />
            <asp:HiddenField ID="hdnProduct" runat="server"/>
        </div>
         <div>&nbsp;</div>
        <div class="Grid">
            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False"
                AutoGenerateSelectButton="True"
                BorderStyle="None"
                CssClass="table table-stripped"
                EditRowStyle-ForeColor="#0066FF"
                Width="100%"
                BackColor="White"
                BorderColor="#CCCCCC"
                BorderWidth="1px"
                CellPadding="3"
                Height="20px"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                AllowPaging="True"
                PageSize="5"
                OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Name" HeaderStyle-Wrap="false" ItemStyle-Wrap="false" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Price" HeaderText="Price" HeaderStyle-Wrap="false" ItemStyle-Wrap="false" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                    <asp:TemplateField HeaderText="Image" >
                        <ItemTemplate>
                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# "../images/ProductImages/"+ Eval("ProductImagePath") %>' Height="70px" Width="100px" />
                            <asp:HiddenField ID="hdnProductImage" runat="server" Value='<%# Eval("ProductImagePath") %>' />
                            <asp:HiddenField ID="hdnProductId" runat="server" Value='<%# Eval("ProductId") %>' />
                            <asp:HiddenField ID="hdnCategoryId" runat="server" Value='<%# Eval("CategoryId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle ForeColor="#0066FF" />
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Usermaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MusicalInstrument.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 100px;">
            <table align="center" style="border: 1px ridge #999999; width: 350px;" cellspacing="10" padding="10">
                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Font-Names="Aharoni"
                            Style="font-weight: 400;">
                        </asp:Label>
                        <hr />
                    </td>
                </tr>

                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="lblAdminHead" runat="server" ForeColor="#0033CC" Font-Names="Aharoni" Text="Admin Login"
                            Style="font-weight: 700;">
                        </asp:Label>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%;">Login ID:
                    </td>

                    <td style="width: 50%;">
                        <asp:TextBox ID="txtLogiId" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:CheckBox ID="chkRememberMe" runat="server" Text="Remember Me" />
                    </td>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:LinkButton ID="lnkbtnForgotPass" runat="server" Text="Forgot Your Password?" PostBackUrl="~/ForgotPassword.aspx" ></asp:LinkButton><hr />
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>

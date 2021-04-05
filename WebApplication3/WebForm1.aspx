<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter a name" ForeColor="#CC3300"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Address:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress" ErrorMessage="Please enter an address" ForeColor="#CC3300"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Phone:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Please enter a phone" ForeColor="#CC3300"></asp:RequiredFieldValidator>
        <br />
        &nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter an email" ForeColor="#CC3300"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Member Type:"></asp:Label>
    &nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="dropDownMember" runat="server" Width="166px">
            <asp:ListItem>Normal</asp:ListItem>
            <asp:ListItem>Regular</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblMessage" runat="server" Text="Successfully Added" Visible="False"></asp:Label>
        <br />
    </form>
</body>
</html>

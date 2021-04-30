<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sathi_mart.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 150px;" class="container">
        <div class="row">
            <h2 class="h2">User Login</h2>
                <div class="col-md-6">
                <center>
              
                <asp:Label class="alert alert-danger" style="width:100%;margin:30px;" ID="lblError" runat="server" Visible="False"></asp:Label>
                      <br />
                <br />

                </center>
                
                <asp:TextBox class="form-control" ID="txtUsername" runat="server" required placeholder="Enter username"></asp:TextBox>
                <br />
                <br />
                
                <asp:TextBox textMode="Password" class="form-control" ID="txtPassword" required runat="server" placeholder="Enter password"></asp:TextBox>
                <br />
                <br />
                <br />
                <asp:Button ID="btnLogin" style="width:100%;" class="btn btn-success" runat="server" OnClick="Button1_Click" Text="Login" />
                <br />
            </div>
            <div style="margin-top:-50px;" class="col-md-6">
                <img src="https://rknetworkmarketing.com/images/login.jpg" alt="Alternate Text" />

            </div>
        </div>
    </div>
</asp:Content>

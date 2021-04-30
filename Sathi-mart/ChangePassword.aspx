<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Sathi_mart.ChangePassoword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container"  style="margin-top: 200px;">
        <h1 class="h1">Profile</h1>
        <br />
        <div class="row">
            <div class="col-sm-12">
                <center>
                    <asp:Label class="alert alert-danger" ID="lblError" runat="server" Visible="False"></asp:Label>
                    <br />
                    <asp:Label class="alert alert-success" ID="lblSuccess" runat="server" Visible="False"></asp:Label>
                </center>
            </div>
        </div>

        <div class="row">  
            <div class="col-md-6"">
                <form action="/" method="post">
                    <div class="form-group">
                        <asp:TextBox class="form-control"  ID="txtUsername" placeholder="Enter username" runat="server"></asp:TextBox>
                    </div>
                    <br />

                    <div class="form-group">
                        <asp:TextBox textMode="Password" class="form-control"  ID="txtPassword" placeholder="Enter password" runat="server"></asp:TextBox>
                    </div>
                    <br />

                    <div class="form-group">
                        <asp:TextBox class="form-control"  ID="txtEmail" placeholder="Enter Email Address" runat="server"></asp:TextBox>
                    </div>

                    <br />

                
                    <asp:Label ID="lblId" runat="server" Visible="False"></asp:Label>

                    <br />

                    <asp:Button CssClass="btn btn-success" style="width:100%;" ID="btnProfileUpdate" runat="server"  Text="Update Profile" OnClick="btnProfileUpdate_Click" />

                    <br />

                </form>
               
            </div>

            <div style="margin-top:-70px;" class="col-md-6">
                <img src="https://rknetworkmarketing.com/images/login.jpg" alt="Alternate Text" />
            </div>
                   

        </div>


    </div>
           


</asp:Content>

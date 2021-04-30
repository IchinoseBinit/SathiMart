<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Add User.aspx.cs" Inherits="Sathi_mart.Add_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="container"  style="margin-top: 150px;">
        <h1 class="h1">Add User</h1>
        <div class="row">
            <div class="col-sm-12">
                <center>
                    <asp:Label class="alert alert-danger" ID="lblError" runat="server" Visible="False"></asp:Label>
                </center>
            </div>
        </div>
        <br />


        <div class="row">  
            <div class="col-md-6"">
                <form action="/" method="post">
                    <div class="form-group">
                        <asp:TextBox class="form-control"  ID="txtUsername" required placeholder="Enter username" runat="server"></asp:TextBox>
                    </div>
                    <br />

                    <div class="form-group">
                        <asp:TextBox class="form-control" required ID="txtPassword" placeholder="Enter password" runat="server"></asp:TextBox>
                    </div>
                    <br />

                    <div class="form-group">
                        <asp:TextBox class="form-control"  ID="txtEmail" required placeholder="Enter Email Address" runat="server"></asp:TextBox>
                    </div>

                    <br />

                    <div class="form-check">
                        <asp:CheckBox class="form-check-input" ID="checkIsAdmin" runat="server" />
                        <asp:Label class="form-check-label" Text="Admin" runat="server" />
                    </div>
                    <asp:Label ID="lblId" runat="server" Visible="False"></asp:Label>

                    <br />

                    <asp:Button CssClass="btn btn-success" style="width:100%;" ID="btnAddUser" runat="server" Text="Add User" OnClick="btnAddUser_Click" />

                    <br />

                </form>
                <asp:Button CssClass="btn btn-success" style="width:100%;" ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update User" Visible="False" />
            </div>

            <div class="col-md-6">
                
                   <asp:GridView class="table" ID="userGridView" runat="server"  AutoGenerateColumns="False" style="margin-bottom: 88px" OnRowCommand="userGridView_RowCommand">
                <Columns>
                   <asp:TemplateField HeaderText="ID">
                      <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                       </ItemTemplate>
                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="USERNAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUsername" runat="server" Text='<%#Eval("userName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                         <asp:TemplateField HeaderText="EMAIL">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                                        </ItemTemplate>
                                      </asp:TemplateField>                               
                                       <asp:TemplateField HeaderText="Admin" >
                                       <ItemTemplate>
                                            <asp:Label ID="lblIsAdmin" runat="server" Text='<%#Eval("isAdmin") %>'></asp:Label>
                                        </ItemTemplate>

                                        </asp:TemplateField>  
               
                                    <asp:TemplateField>
                                     <ItemTemplate>
                        <asp:LinkButton ID="View" runat="server" class="btn btn-success" style="background:orange;border:none;" CommandName="view" CommandArgument='<%#Bind("id")%>' CausesValidation="False">Select</asp:LinkButton>
                                     </ItemTemplate>
                                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
                   

        </div>


    </div>
           

</asp:Content>

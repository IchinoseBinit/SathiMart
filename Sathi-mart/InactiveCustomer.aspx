<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="InactiveCustomer.aspx.cs" Inherits="Sathi_mart.InactiveCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                 <h2 style="margin-top:140px;margin-bottom:30px;">Inactive customers</h2>
       <asp:GridView class="table table-striped" ID="inactiveCustomerGridView" runat="server" AutoGenerateColumns="False" Style="margin-bottom: 88px">
                    <Columns>
                        <asp:TemplateField HeaderText="Item Id">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%#Eval("mid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("phone") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EMAIL">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                          <asp:TemplateField HeaderText="MEMBER TYPE">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("memberType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>

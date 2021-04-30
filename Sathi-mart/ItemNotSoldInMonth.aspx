<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="ItemNotSoldInMonth.aspx.cs" Inherits="Sathi_mart.ItemNotSoldInMonth" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                   <h2 style="font-size: 30px; font-weight: bold;margin-top:150px;margin-bottom:30px;">Items not sold in month</h2>

       <asp:GridView class="table table-striped" ID="itemNotSoldInMonth" runat="server" AutoGenerateColumns="False" Style="margin-bottom: 88px">
                    <Columns>
                        <asp:TemplateField HeaderText="Item Id">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%#Eval("itemId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("price") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("quantity") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="PURCHASE DATE">
                            <ItemTemplate>
                                <asp:Label ID="lblPurchaseDate" runat="server" Text='<%#Eval("purchaseDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                          <asp:TemplateField HeaderText="CATEGORY">
                            <ItemTemplate>
                                <asp:Label ID="lblCategory" runat="server" Text='<%#Eval("category") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="SUPPLIER">
                            <ItemTemplate>
                                <asp:Label ID="lblSupplier" runat="server" Text='<%#Eval("supplier") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    
    
</asp:Content>

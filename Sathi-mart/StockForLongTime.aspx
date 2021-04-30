<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="StockForLongTime.aspx.cs" Inherits="Sathi_mart.StockForLongTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 160px;" class="container">
        <div class="row">
            <div class="col-md-12">
                
                <asp:Label class="alert alert-success" ID="lblSuccess" runat="server" Visible="False"></asp:Label>
             
                <asp:Label class="alert alert-success" ID="lblError" runat="server" Visible="False"></asp:Label>
                <asp:Button ID="btnDeleteAll" Style="float: right;margin-top:20px;" CssClass="btn btn-secondary" runat="server" Text="Delete all items" OnClick="btnDeleteAll_Click" />
                <h2>Stock for long time</h2>

             

                <br />
                <br />

                <asp:GridView class="table table-striped" ID="noStockGridView" runat="server" AutoGenerateColumns="False" Style="margin-bottom: 88px" OnRowCommand="noStockGridView_RowCommand">
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
                                <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("quantity") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Purchase Date">
                            <ItemTemplate>
                                <asp:Label ID="lblPurchaseDate" runat="server" Text='<%#DateTime.Parse(Eval("purchaseDate").ToString()).ToString("D")%>'></asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                                <asp:Label ID="lblCategory" runat="server" Text='<%#Eval("category") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Supplier">
                            <ItemTemplate>
                                <asp:Label ID="lblSupplier" runat="server" Text='<%#Eval("supplier") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="View" runat="server" class="btn btn-success" CommandName="view" CommandArgument='<%#Bind("itemId")%>' CausesValidation="False" CssClass="btn btn-danger">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>


</asp:Content>

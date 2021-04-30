<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="ItemDetails.aspx.cs" Inherits="Sathi_mart.ItemDetails" %>

<%@ Import Namespace="Sathi_mart" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin-top: 100px;">

        <div class="container">
                <center><asp:Label ID="lblError" CssClass="alert alert-danger" runat="server" Visible="False"></asp:Label></center>
            <div class="row">
                <div class="col-md-6">
                    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                        <h2 style="font-size: 30px; font-weight: bold;">Item Details</h2>
                        <div style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;" class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                            <div class="p-6 bg-white border-b border-gray-200">

                                <br />
                                <asp:Label runat="server" Text="Search by: "></asp:Label>
                                <br />
                                <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" ID="radioSearchType" AutoPostBack="True" OnSelectedIndexChanged="radioSearchType_SelectedIndexChanged">
                                    <asp:ListItem Value="itemId" Selected="True">Id</asp:ListItem>
                                    <asp:ListItem style="margin-left: 80px; margin-top: 40px;" Value="name">Name</asp:ListItem>
                                </asp:RadioButtonList>
                                <br />

                                <div class="mb-4">
                                    <asp:Label runat="server" ID="lblInput"></asp:Label><br></br>
                                    <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtInput" runat="server"></asp:TextBox>
                                </div>

                                <asp:Button ID="btnAvailable" runat="server" Text="Get Availability Details" CssClass="btn btn-primary" OnClick="btnAvailable_Click" />
                                <asp:Button runat="server" CssClass="btn btn-success" Text="Search Item" ID="btnViewDetails" OnClick="btnViewDetails_Click" />
                                &nbsp;&nbsp;&nbsp;
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                        <br />
                        <br />
                        <asp:Label ID="lblHead" runat="server" Text="Label" style="font-size:28px; font-weight:bold;" Visible="false"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="lblItemId" runat="server" Text="Label" Visible="false"></asp:Label>
                        <br />
                        <asp:Label ID="lblItemName" runat="server" Text="Label" Visible="false"></asp:Label>
                        <br />
                        <asp:Label ID="lblItemDescription" runat="server" Text="Label" Visible="false"></asp:Label>
                        <br />
                        <asp:Label ID="lblItemQuantity" runat="server" Text="Label" Visible="false"></asp:Label>
                        <br />
                        <asp:Label ID="lblItemPrice" runat="server" Text="Label" Visible="false"></asp:Label>
                        <br />
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top: 50px; width: 90%;" class="container">
            <div class="row">
                <div class="col-md-12">


                    <asp:GridView class="table table-striped" ID="itemDetailsDataGridView" runat="server" AutoGenerateColumns="False" Style="margin-bottom: 88px">
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
                                    <asp:Label ID="lblPurchase" runat="server" Text='<%#Eval("purchaseDate") %>'></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%#new Item().GetCategoryById(Eval("category").ToString())%>'></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Supplier">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%#new Item().GetSupplierById(Eval("supplier").ToString())%>'></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>


    </div>
</asp:Content>

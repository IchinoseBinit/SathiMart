<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="PurchaseDetails.aspx.cs" Inherits="Sathi_mart.PurchaseDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 100px;" class="py-12 shadow-sm ...">
                <center><asp:Label ID="lblError" CssClass="alert alert-danger" runat="server" Visible="False"></asp:Label></center>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <h2 style="font-size: 30px; font-weight: bold;">Purchase Details</h2>
            <div style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;" class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <br />
                    <asp:Label runat="server" Text="Search by: "></asp:Label>
                    <br />
                    <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" ID="radioSearchType" AutoPostBack="True" OnSelectedIndexChanged="radioSearchType_SelectedIndexChanged">
                        <asp:ListItem Value="mid" Selected="True">Id</asp:ListItem>
                        <asp:ListItem style="margin-left: 80px; margin-top: 40px;" Value="name">Name</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />

                    <div class="mb-4">
                        <asp:Label runat="server" ID="lblInput"></asp:Label><br></br>
                        <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtInput" runat="server"></asp:TextBox>
                    </div>

                    <asp:Button runat="server" CssClass="btn btn-success" Text="Search Customer" ID="btnSearch" OnClick="btnSearch_Click" />
                    &nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </div>


        <asp:GridView class="table table-striped" ID="purchaseDetailsDataGridView" runat="server" AutoGenerateColumns="False" Style="margin-bottom: 88px">
            <Columns>
                <asp:TemplateField HeaderText="INVOICE NUMBER">
                    <ItemTemplate>
                        <asp:Label ID="lblInvoiceNumber" runat="server" Text='<%#Eval("invoiceNumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="QUANTITY">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("quantity") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="TOTAL AMOUNT">
                    <ItemTemplate>
                        <asp:Label ID="lblTotalAmount" runat="server" Text='<%#Eval("totalAmount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DATE TIME">
                    <ItemTemplate>
                        <asp:Label ID="lblDateTime" runat="server" Text='<%#Eval("dateTime") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="customer Id">
                    <ItemTemplate>
                        <asp:Label ID="lblCustomerId" runat="server" Text='<%#Eval("customerId") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Customer Name">
                    <ItemTemplate>
                        <asp:Label ID="lblCustomerName" runat="server" Text='<%#Eval("customerName") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Processed by">
                    <ItemTemplate>
                        <asp:Label ID="lblStaff" runat="server" Text='<%#Eval("staffName") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Item Name">
                    <ItemTemplate>
                        <asp:Label ID="lblitem" runat="server" Text='<%#Eval("itemName") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>


            </Columns>
        </asp:GridView>


    </div>
</asp:Content>

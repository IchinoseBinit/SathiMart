<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Bills.aspx.cs" Inherits="Sathi_mart.Bills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 100px;" class="py-12 shadow-sm ...">

        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <h2 style="font-size: 30px; font-weight: bold;">Invoice</h2>

            <asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label>
            <div style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;" class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <form method="POST" action="">
                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Item Name<span class="text-red-500">*</span></label><br></br>
                            <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtItemName" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>


                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Category<span class="text-red-500">*</span></label><br></br>
                            <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtCategory" runat="server" ReadOnly="True"></asp:TextBox>
                            <br />
                        </div>
                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Description<span class="text-red-500">*</span></label><br></br>
                            <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtDescription" runat="server" ReadOnly="True"></asp:TextBox>
                            <br />
                            <asp:Label ID="lblId" runat="server" Visible="False"></asp:Label>
                        </div>

                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Unit Price<span class="text-red-500">*</span></label><br></br>
                            <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtUnitPrice" runat="server" ReadOnly="True"></asp:TextBox>
                            <br />
                        </div>

                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Quantity<span class="text-red-500">*</span></label><br></br>
                            <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtQuantity" runat="server" ReadOnly="True"></asp:TextBox>
                            <br />
                        </div>

                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Total Price<span class="text-red-500">*</span></label><br></br>
                            <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtTotalPrice" runat="server" ReadOnly="True"></asp:TextBox>
                            <br />
                        </div>


                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Customer Id<span class="text-red-500">*</span></label><br></br>

                            <asp:DropDownList ID="cmboCustomer" runat="server">
                            </asp:DropDownList>

                            <asp:Button ID="Button1" runat="server" class="btn btn-success" CommandArgument='<%#Bind("itemId")%>' CssClass="btn btn-success" OnClick="btnSale_Click" Text="Generate Invoice" />

                            <br />
                        </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>

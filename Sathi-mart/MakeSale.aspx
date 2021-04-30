<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="MakeSale.aspx.cs" Inherits="Sathi_mart.MakeSale" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 100px;" class="py-12 shadow-sm ...">

        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <h2 style="font-size: 30px; font-weight: bold;">Sale</h2>
            <div style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;" class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <form method="POST" action="">
                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Item Id<span class="text-red-500">*</span></label><br></br>
                            <asp:TextBox required type="text" class="form-control"  ID="txtItemId" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Quantity<span class="text-red-500">*</span></label><br></br>
                            <asp:TextBox required type="text" class="form-control"  ID="txtQuantity" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="lblId" runat="server" Visible="False"></asp:Label>
                        </div>


                        <asp:Button ID="btnSale" runat="server" class="btn btn-success" Text="Sale" OnClick="btnSale_Click"/>
                        &nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </div>
    </div>
</asp:Content>

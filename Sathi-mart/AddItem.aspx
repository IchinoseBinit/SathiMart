<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="Sathi_mart.AddItem" %>
<%@ Import Namespace="Sathi_mart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 100px;" class="py-12 shadow-sm ...">

        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <h2 style="font-size: 30px; font-weight: bold;">Add products</h2>
            <div style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;" class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <form method="POST" action="">
                        =
                       
                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Item name <span class="text-red-500">*</span></label><br></br>
                            <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtItemName" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Description</label><br></br>
                            <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtDescription" runat="server"></asp:TextBox>
                        </div>

                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Item Qty</label><br></br>
                            <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtItemQty" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Item price</label><br></br>
                            <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtItemPrice" runat="server"></asp:TextBox>
                        </div>

                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Purchase Date</label><br></br>
                            <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtPurchaseDate" runat="server"></asp:TextBox>
                        </div>

                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Category</label><br></br>
                            <asp:DropDownList ID="cmboCategory" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Supplier</label><br>
                                <asp:DropDownList ID="cmboSupplier" runat="server">
                                </asp:DropDownList>
                            </br>

                            <asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label>
                            <br />
                            <asp:Label ID="lblId" runat="server" Visible="False"></asp:Label>
                        </div>





                        <div style="float: right;" class="flex p-1">
                            <asp:Button class="p-3 bg-blue-500 text-white hover:bg-blue-400" ID="btnAdd" runat="server" Text="Add item" OnClick="btnAdd_Click" />



                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div style="margin-top: 40px;" class="max-w-7xl mx-auto sm:px-6 lg:px-8">
        <asp:GridView class="table" ID="itemGridView" runat="server" AutoGenerateColumns="False" Style="margin-bottom: 88px" OnRowCommand="itemGridView_RowCommand">
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

                        <%--<asp:Label ID="lblSupplier" runat="server" Text='<%#Eval("supplier") %>'></asp:Label>--%>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="View" runat="server" class="btn btn-success" CommandName="view" CommandArgument='<%#Bind("itemId")%>' CausesValidation="False" CssClass="btn btn-primary">Select</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>



    <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>

    <script>
        CKEDITOR.replace('content');
    </script>
    <script>
        /*Toggle dropdown list*/
        /*https://gist.github.com/slavapas/593e8e50cf4cc16ac972afcbad4f70c8*/

        var userMenuDiv = document.getElementById("userMenu");
        var userMenu = document.getElementById("userButton");

        var navMenuDiv = document.getElementById("nav-content");
        var navMenu = document.getElementById("nav-toggle");

        document.onclick = check;

        function check(e) {
            var target = (e && e.target) || (event && event.srcElement);

            //User Menu
            if (!checkParent(target, userMenuDiv)) {
                // click NOT on the menu
                if (checkParent(target, userMenu)) {
                    // click on the link
                    if (userMenuDiv.classList.contains("invisible")) {
                        userMenuDiv.classList.remove("invisible");
                    } else {
                        userMenuDiv.classList.add("invisible");
                    }
                } else {
                    // click both outside link and outside menu, hide menu
                    userMenuDiv.classList.add("invisible");
                }
            }

            //Nav Menu
            if (!checkParent(target, navMenuDiv)) {
                // click NOT on the menu
                if (checkParent(target, navMenu)) {
                    // click on the link
                    if (navMenuDiv.classList.contains("hidden")) {
                        navMenuDiv.classList.remove("hidden");
                    } else {
                        navMenuDiv.classList.add("hidden");
                    }
                } else {
                    // click both outside link and outside menu, hide menu
                    navMenuDiv.classList.add("hidden");
                }
            }

        }

        function checkParent(t, elm) {
            while (t.parentNode) {
                if (t == elm) {
                    return true;
                }
                t = t.parentNode;
            }
            return false;
        }
    </script>

</asp:Content>

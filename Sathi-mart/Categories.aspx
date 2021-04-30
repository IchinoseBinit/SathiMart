<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="Sathi_mart.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 100px;" class="py-12 shadow-sm ...">

        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <h2 style="font-size: 30px; font-weight: bold;">Add category</h2>
            <div style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;" class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <form method="POST" action="">
                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Category Name <span class="text-red-500">*</span></label><br></br>
                            <asp:TextBox type="text" class="border-2 border-gray-300 p-2 w-full" required ID="txtCategoryName" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="lblId" runat="server" Visible="False"></asp:Label>
                        </div>



                        <asp:LinkButton ID="btnAdd" runat="server" class="btn btn-success" CommandName="view" CommandArgument='<%#Bind("mid")%>' CausesValidation="False" OnClick="btnAdd_Click">Add Category</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnUpdate" CssClass="btn btn-secondary" runat="server" OnClick="btnUpdate_Click" Text="Update" />
                </div>
            </div>
        </div>
    </div>
    <div style="margin-top: 40px;" class="max-w-7xl mx-auto sm:px-6 lg:px-8">
          <h3 style="font-size: 30px; font-weight: bold;margin-bottom:20px;">All categories</h3>
        <asp:GridView class="table table-striped" ID="categoryGridView" runat="server" AutoGenerateColumns="False" Style="margin-bottom: 88px" OnRowCommand="categoryGridView_RowCommand">
            <Columns>

                <asp:TemplateField HeaderText="Category Id">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("categoryId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category Name">
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("categoryName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="View" runat="server" class="btn btn-success" style="background:orange;border:none;" CommandName="view" CommandArgument='<%#Bind("categoryId")%>' CausesValidation="False">Select</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>



    <%-- <broggle dropdown list*/
        /*https://gist.github.com/slavapas/593e8e50cf4cc16ac972afcbad4f70c8*/--%>
    <script>
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

<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Sathi_mart.DashboardModel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container w-full mx-auto pt-20">

        <div style="margin-top: 100px;" class="w-full px-4 md:px-0 md:mt-8 mb-16 text-gray-800 leading-normal">

            <!--Console Content-->

            <div class="flex flex-wrap">


                <%--One--%>
                <div class="w-full md:w-1/2 xl:w-1/3 p-3">

                    <asp:Panel ID="pnlInactiveCustomer" runat="server">
                        <!--Metric Card-->

                        <a style="text-decoration: none;" href="InactiveCustomer.aspx">

                            <div class="bg-gray-900 border border-gray-800 rounded shadow p-2">
                                <div class="flex flex-row items-center">
                                    <div class="flex-shrink pr-4">
                                        <div class="rounded p-3 bg-yellow-600"><i class="fas fa-user fa-2x fa-fw fa-inverse"></i></div>
                                    </div>
                                    <div class="flex-1 text-right md:text-center">
                                        <h5 class="font-bold uppercase text-gray-400">Inactive Customers</h5>
                                        <h3 class="font-bold text-3xl text-gray-600">
                                            <asp:Label ID="lblInactiveUserCount" runat="server" Text=""></asp:Label>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </asp:Panel>
                </div>







                <%--Two--%>
                <div class="w-full md:w-1/2 xl:w-1/3 p-3">

                    <asp:Panel ID="pnlItemLongOnStock" runat="server">
                        <!--Metric Card-->

                        <a style="text-decoration: none;" href="StockForLongTime.aspx">

                            <div class="bg-gray-900 border border-gray-800 rounded shadow p-2">
                                <div class="flex flex-row items-center">
                                    <div class="flex-shrink pr-4">
                                        <div class="rounded p-3 bg-yellow-600"><i class="fas fa-box fa-2x fa-fw fa-inverse"></i></div>
                                    </div>
                                    <div class="flex-1 text-right md:text-center">
                                        <h5 class="font-bold uppercase text-gray-400">Unsold Goods</h5>
                                        <h3 class="font-bold text-3xl text-gray-600">
                                            <asp:Label ID="lblUnsoldGoodsCount" runat="server" Text=""></asp:Label>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </asp:Panel>
                </div>





                <%--Three--%>
                <div class="w-full md:w-1/2 xl:w-1/3 p-3">

                    <asp:Panel ID="pnlNotSoldInMonth" runat="server">
                        <!--Metric Card-->

                        <a style="text-decoration: none;" href="ItemNotSoldInMonth.aspx">

                            <div class="bg-gray-900 border border-gray-800 rounded shadow p-2">
                                <div class="flex flex-row items-center">
                                    <div class="flex-shrink pr-4">
                                        <div class="rounded p-3 bg-yellow-600"><i class="fas fa-boxes fa-2x fa-fw fa-inverse"></i></div>
                                    </div>
                                    <div class="flex-1 text-right md:text-center">
                                        <h5 class="font-bold uppercase text-gray-400">Inactive Item</h5>
                                        <h3 class="font-bold text-3xl text-gray-600">
                                            <asp:Label ID="lblInactiveItemCount" runat="server" Text=""></asp:Label>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </asp:Panel>
                </div>





                <%--Four--%>
                <div class="w-full md:w-1/2 xl:w-1/3 p-3">

                    <asp:Panel ID="pnlTotalUsers" runat="server">
                        <!--Metric Card-->

                        <a style="text-decoration: none;" href="Add_Customer.aspx">

                            <div class="bg-gray-900 border border-gray-800 rounded shadow p-2">
                                <div class="flex flex-row items-center">
                                    <div class="flex-shrink pr-4">
                                        <div class="rounded p-3 bg-yellow-600"><i class="fas fa-user-plus fa-2x fa-fw fa-inverse"></i></div>
                                    </div>
                                    <div class="flex-1 text-right md:text-center">
                                        <h5 class="font-bold uppercase text-gray-400">Total Users</h5>
                                        <h3 class="font-bold text-3xl text-gray-600">
                                            <asp:Label ID="lblTotalUserCount" runat="server" Text=""></asp:Label>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </asp:Panel>
                </div>



                <!--7 -->
                <div class="w-full md:w-1/2 xl:w-1/3 p-3">

                    <asp:Panel ID="pnlManageStaff" runat="server">
                        <!--Metric Card-->

                        <a style="text-decoration: none;" href="Add User.aspx">

                            <div class="bg-gray-900 border border-gray-800 rounded shadow p-2">
                                <div class="flex flex-row items-center">
                                    <div class="flex-shrink pr-4">
                                        <div class="rounded p-3 bg-yellow-600"><i class="fas fa-edit fa-2x fa-fw fa-inverse"></i></div>
                                    </div>
                                    <div class="flex-1 text-right md:text-center">
                                        <h5 class="font-bold uppercase text-gray-400">Manage Staff/Admin</h5>
                                        <h3 class="font-bold text-3xl text-gray-600">
                                            <asp:Label ID="lblStaffCount" runat="server" Text=""></asp:Label>

                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </asp:Panel>
                </div>

            </div>

        </div>

        <hr />
     
        <br />
        <div style="padding-bottom: 20px; padding-top: 10px;margin-left:540px;" class="container">
            <div class="row">
                <div class="col-md-2">
                    <asp:DropDownList CssClass="form-control" ID="cmboSortOptions" runat="server">
                        <asp:ListItem Value="name">Item Name</asp:ListItem>
                        <asp:ListItem Value="quantity">Item Quantity</asp:ListItem>
                        <asp:ListItem Value="purchaseDate">Purchased Date</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <div class="form-check">
                        <asp:RadioButtonList ID="radioSortBy" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected Value="asc">Ascending</asp:ListItem>
                            <asp:ListItem style="margin-left: 50px;" Value="desc">Descending</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>
                <div class="col-md-2">
                    <div>
                          
            <asp:Button Style="width: 100%;" ID="btnSort" runat="server" OnClick="btnSort_Click" Text="Sort" CssClass="btn btn-success" />
                    </div>
                </div>
            </div>
        </div>
        
        <br />
        
           <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 style="margin-bottom: 40px;position:absolute;top:540px;">Low stock in mart</h2>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView class="table table-striped" ID="itemLessThanTenGridView" runat="server" AutoGenerateColumns="False" Style="margin-bottom: 88px">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("itemId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="NAME">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PRICE">
                                <ItemTemplate>
                                    <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("price") %>'></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="QUANTITY">
                                <ItemTemplate>
                                    <asp:Label ID="lblQty" runat="server" Text='<%#Eval("quantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PURCHASED DATE">
                                <ItemTemplate>
                                    <asp:Label ID="lblPurchaseDate" runat="server" Text='<%#DateTime.Parse(Eval("purchaseDate").ToString()).ToString("D")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        </div>
    </div>

    <!--/container-->

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

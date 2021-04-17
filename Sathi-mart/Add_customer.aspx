<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Add_customer.aspx.cs" Inherits="Sathi_mart.Add_customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <div style="margin-top: 100px;" class="py-12 shadow-sm ...">

        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <h2 style="font-size: 30px;font-weight: bold;">Add customer</h2>
            <div style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;" class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <form method="POST" action="">
                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Customer name <span class="text-red-500">*</span></label></br>
                            <input type="text" class="border-2 border-gray-300 p-2 w-full" name="title" id="title" value="" required></input>
                        </div>

                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Customer Address</label></br>
                            <input type="text" class="border-2 border-gray-300 p-2 w-full" name="description" id="description" placeholder="Qty"></input>
                        </div>
                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Membership ID</label></br>
                            <input type="text" class="border-2 border-gray-300 p-2 w-full" name="description" id="description" placeholder="Qty"></input>
                        </div>

                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Email address</label></br>
                            <input type="email" class="border-2 border-gray-300 p-2 w-full" name="description" id="description" placeholder="Qty"></input>
                        </div>

                        <div class="mb-4">
                            <label class="text-xl text-gray-600">Email</label></br>
                            <input type="text" class="border-2 border-gray-300 p-2 w-full" name="description" id="description" placeholder="Qty"></input>
                        </div>



                        <div style="float: right;" class="flex p-1">

                            <button role="submit" class="p-3 bg-blue-500 text-white hover:bg-blue-400" required>Add Customer</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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

<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Forms.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form id="form1" runat="server">
        
    <h1 id="lblCustomer">Manage customer</h1>
        <h1>
            <asp:Label ID="lblCustomer" runat="server" Text="No errors"></asp:Label>
        </h1>

        <div class="form-group">
           
        
       
        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox class="form-control" ID="txtName" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
        <p>
            </div>
            <asp:Label ID="Label2" runat="server" Text="Address"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is requried." ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <asp:Label ID="Label3" runat="server" Text="Phone"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone number is required." ForeColor="Red"></asp:RequiredFieldValidator>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox type ID="txtEmail" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <asp:Label ID="Label5" runat="server" Text="Member Type"></asp:Label>
        <asp:DropDownList ID="txtType" runat="server">
            <asp:ListItem>Normal</asp:ListItem>
            <asp:ListItem>Regular</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="add" runat="server" Text="Add" OnClick="add_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="reset" runat="server" OnClick="Button2_Click" Text="Reset" />
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" Width="384px" AutoGenerateColumns="False" style="margin-bottom: 88px" OnRowCommand ="GridView1_RowCommand">
                <Columns>                   <asp:TemplateField HeaderText="MID">                      <ItemTemplate>                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("member_no") %>'></asp:Label>                       </ItemTemplate>                    </asp:TemplateField>                                    <asp:TemplateField HeaderText="NAME">                                        <ItemTemplate>                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("name") %>'></asp:Label>                                        </ItemTemplate>                                    </asp:TemplateField>                                       <asp:TemplateField HeaderText="ADDRESS">                                        <ItemTemplate>                                            <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("address") %>'></asp:Label>                                        </ItemTemplate>                                      </asp:TemplateField>                                                                      <asp:TemplateField HeaderText="PHONE" >                                       <ItemTemplate>                                            <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("phone") %>'></asp:Label>                                        </ItemTemplate>                                        </asp:TemplateField>                                          <asp:TemplateField HeaderText="EMAIL">                                        <ItemTemplate>                                            <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("email") %>'></asp:Label>                                        </ItemTemplate>                                      </asp:TemplateField>                                                                      <asp:TemplateField HeaderText="MemberType" >                                       <ItemTemplate>                                            <asp:Label ID="lblMemberType" runat="server" Text='<%#Eval("member_type") %>'></asp:Label>                                        </ItemTemplate>                                        </asp:TemplateField>                                                     <asp:TemplateField>                                     <ItemTemplate>                        <asp:LinkButton ID="View" runat="server" CommandName="view" CommandArgument='<%#Bind("member_no")%>'>Select</asp:LinkButton>                                     </ItemTemplate>                                    </asp:TemplateField>                </Columns>
            </asp:GridView>
        </p>
    </form>
</asp:Content>

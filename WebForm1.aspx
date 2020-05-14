<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SimpleWebPage.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rolling Thunder WebForm</title>
</head>

<body style="background-color:aquamarine;">
    <form id="form1" runat="server">
        <h1 align="center">Welcome to Rolling Thunder</h1>
        <asp:Menu ID="Menu1" runat="server">
            <Items>
                <asp:MenuItem NavigateUrl="~/WebForm1.aspx" Text="Home" Value="Home">
                    <asp:MenuItem NavigateUrl="~/WebForm2.aspx" Text="Query" Value="Query"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
            <StaticItemTemplate>
<%# Eval("Text") %>
            </StaticItemTemplate>
        </asp:Menu>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="StoreID" DataSourceID="Retail_Store" Height="50px" Width="500px">
            <Fields>
                <asp:BoundField DataField="StoreID" HeaderText="StoreID" InsertVisible="False" ReadOnly="True" SortExpression="StoreID" />
                <asp:BoundField DataField="StoreName" HeaderText="StoreName" SortExpression="StoreName" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="ContactFirstName" HeaderText="ContactFirstName" SortExpression="ContactFirstName" />
                <asp:BoundField DataField="ContactLastName" HeaderText="ContactLastName" SortExpression="ContactLastName" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                <asp:TemplateField HeaderText="CityID" SortExpression="CityID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Locations" DataTextField="Location" DataValueField="Location">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="Locations" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" SelectCommand="SELECT [City] + ', ' + [State] + ', ' + [Country] AS Location FROM City"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CityID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Locations" DataTextField="Location" DataValueField="Location">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="Locations" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" SelectCommand="SELECT [City] + ', ' + [State] + ', ' + [Country] AS Location FROM City"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="Retail_Store" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" DeleteCommand="DELETE FROM [RetailStore] WHERE [StoreID] = @StoreID" InsertCommand="INSERT INTO [RetailStore] ([StoreName], [Phone], [ContactFirstName], [ContactLastName], [Address], [ZipCode], [CityID]) VALUES (@StoreName, @Phone, @ContactFirstName, @ContactLastName, @Address, @ZipCode, @CityID)" SelectCommand="SELECT * FROM [RetailStore]" UpdateCommand="UPDATE [RetailStore] SET [StoreName] = @StoreName, [Phone] = @Phone, [ContactFirstName] = @ContactFirstName, [ContactLastName] = @ContactLastName, [Address] = @Address, [ZipCode] = @ZipCode, [CityID] = @CityID WHERE [StoreID] = @StoreID">
            <DeleteParameters>
                <asp:Parameter Name="StoreID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StoreName" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="ContactFirstName" Type="String" />
                <asp:Parameter Name="ContactLastName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="CityID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StoreName" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="ContactFirstName" Type="String" />
                <asp:Parameter Name="ContactLastName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="CityID" Type="Int32" />
                <asp:Parameter Name="StoreID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

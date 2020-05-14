<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="SimpleWebPage.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rolling Thunder WebForm</title>
</head>
<body style="background-color:aquamarine;">
    <form id="form1" runat="server">
        <h1 align="center">RT Queries</h1>
        <asp:Menu ID="Menu1" runat="server">
            <Items>
                <asp:MenuItem NavigateUrl="~/WebForm1.aspx" Text="Home" Value="Home"></asp:MenuItem>
            </Items>
            <StaticItemTemplate>
<%# Eval("Text") %>
            </StaticItemTemplate>
        </asp:Menu>
        <hr />
        <div>
            <h3>Highest Earning Employee ID</h3>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" Height="50px" Width="350px">
                <Fields>
                    <asp:BoundField DataField="EmployeeID" HeaderText="Most Paid Employee ID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                </Fields>
            </asp:DetailsView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" SelectCommand="SELECT  TOP 1 [EmployeeID] FROM [Employee] ORDER BY [Salary] DESC"></asp:SqlDataSource>
        <hr />
        <div>
            <h3>2010 Bicycle Sales Information</h3>
            <asp:DetailsView ID="DetailsView5" runat="server" AllowPaging="True" AutoGenerateRows="False" DataSourceID="SqlDataSource5" Height="50px" Width="350px">
                <Fields>
                    <asp:BoundField DataField="ModelType" HeaderText="ModelType" SortExpression="ModelType" />
                    <asp:BoundField DataField="Total Sale Price" HeaderText="Total Sale Price" ReadOnly="True" SortExpression="Total Sale Price" />
                    <asp:BoundField DataField="Total List Price" HeaderText="Total List Price" ReadOnly="True" SortExpression="Total List Price" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" 
                SelectCommand="SELECT
	                                ModelType, sum(SalePrice) as 'Total Sale Price', sum(ListPrice) 'Total List Price'
                                FROM
	                                Bicycle
                                WHERE
	                                year(OrderDate) = 2010
                                GROUP BY
	                                ModelType">
            </asp:SqlDataSource>
        </div>
        <hr />
        <div>
            <h3>March 2007 Most Popular Paint Name</h3>
            <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource3" Height="50px" Width="350px">
                <Fields>
                    <asp:BoundField DataField="ColorName" HeaderText="ColorName" SortExpression="ColorName" />
                    <asp:BoundField DataField="Total Orders" HeaderText="Total Orders" ReadOnly="True" SortExpression="Total Orders" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" SelectCommand="SELECT TOP 1
	Paint.ColorName, count(SerialNumber) as 'Total Orders'
FROM
	Bicycle left join Paint on Bicycle.PaintID = Paint.PaintID
WHERE
	year(Bicycle.OrderDate) = 2007 and month(Bicycle.OrderDate) = 3
GROUP BY
	Paint.ColorName
ORDER BY
	'Total Orders' DESC"></asp:SqlDataSource>
        </div>
        <hr />
        <div>
            <h3>Top Outstanding Manufacturer Bill</h3>
            <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource4" Height="50px" Width="350px">
                <Fields>
                    <asp:BoundField DataField="ManufacturerName" HeaderText="ManufacturerName" SortExpression="ManufacturerName" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RollingThunderConnectionString %>" SelectCommand="SELECT TOP 1
	Manufacturer.ManufacturerName
FROM
	PurchaseOrder left join Manufacturer on PurchaseOrder.ManufacturerID = Manufacturer.ManufacturerID
ORDER BY
	AmountDue DESC"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>

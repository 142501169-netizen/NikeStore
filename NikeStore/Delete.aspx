<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="NikeStore.Delete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblDelete" runat="server" Text="Delete"></asp:Label>
    <asp:TextBox ID="txtDelete" runat="server"></asp:TextBox>
    <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click1" Text="DELETE" />
    <br />
    <br />
    <asp:Label ID="lblAreyousure" runat="server" Text="ARE YOU SURE YOU WANT DELETE THIS PRODUCT?"></asp:Label>
    <br />
    <br />
    <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="CONFIIRM" />
    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="CANCEL" />
    <br />
    <br />
    <asp:Label ID="lblConfirmDelete" runat="server" Text="THIS RECORD HAS BEEN DELETED"></asp:Label>
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Product_code" HeaderText="Product_code" SortExpression="Product_code" />
        <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
        <asp:BoundField DataField="Shoe_Type" HeaderText="Shoe_Type" SortExpression="Shoe_Type" />
        <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
        <asp:BoundField DataField="Discriptoin" HeaderText="Discriptoin" SortExpression="Discriptoin" />
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        <asp:BoundField DataField="DateAdded" HeaderText="DateAdded" SortExpression="DateAdded" />
        <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
    </Columns>
</asp:GridView>
    <br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NikeDBConnectionString2 %>" DeleteCommand="DELETE FROM [Shoes] WHERE [Product_code] = @Product_code" InsertCommand="INSERT INTO [Shoes] ([Id], [Product_code], [Brand], [Name], [Price], [Gender], [Shoe_Type], [Image], [Discriptoin], [Quantity], [DateAdded], [Size]) VALUES (@Id, @Product_code, @Brand, @Name, @Price, @Gender, @Shoe_Type, @Image, @Discriptoin, @Quantity, @DateAdded, @Size)" SelectCommand="SELECT [Id], [Product_code], [Brand], [Name], [Price], [Gender], [Shoe_Type], [Image], [Discriptoin], [Quantity], [DateAdded], [Size] FROM [Shoes]" UpdateCommand="UPDATE [Shoes] SET [Product_code] = @Product_code, [Brand] = @Brand, [Name] = @Name, [Price] = @Price, [Gender] = @Gender, [Shoe_Type] = @Shoe_Type, [Image] = @Image, [Discriptoin] = @Discriptoin, [Quantity] = @Quantity, [DateAdded] = @DateAdded, [Size] = @Size WHERE [Id] = @Id">
    <DeleteParameters>
    <asp:ControlParameter ControlID="txtDelete" Name="Product_code" Type="String" />
</DeleteParameters>

    <InsertParameters>
        <asp:Parameter Name="Id" Type="Int32" />
        <asp:Parameter Name="Product_code" Type="String" />
        <asp:Parameter Name="Brand" Type="String" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Price" Type="Decimal" />
        <asp:Parameter Name="Gender" Type="String" />
        <asp:Parameter Name="Shoe_Type" Type="String" />
        <asp:Parameter Name="Image" Type="String" />
        <asp:Parameter Name="Discriptoin" Type="String" />
        <asp:Parameter Name="Quantity" Type="Int32" />
        <asp:Parameter Name="DateAdded" Type="DateTime" />
        <asp:Parameter Name="Size" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Product_code" Type="String" />
        <asp:Parameter Name="Brand" Type="String" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Price" Type="Decimal" />
        <asp:Parameter Name="Gender" Type="String" />
        <asp:Parameter Name="Shoe_Type" Type="String" />
        <asp:Parameter Name="Image" Type="String" />
        <asp:Parameter Name="Discriptoin" Type="String" />
        <asp:Parameter Name="Quantity" Type="Int32" />
        <asp:Parameter Name="DateAdded" Type="DateTime" />
        <asp:Parameter Name="Size" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

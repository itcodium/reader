<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestConection.aspx.cs" Inherits="TestConection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="IdNew" DataSourceID="SqlDataSource1" 
            EmptyDataText="No hay registros de datos para mostrar.">
            <Columns>
                <asp:BoundField DataField="IdNew" HeaderText="IdNew" ReadOnly="True" 
                    SortExpression="IdNew" />
                <asp:BoundField DataField="IdNewsPaper" HeaderText="IdNewsPaper" 
                    SortExpression="IdNewsPaper" />
                <asp:BoundField DataField="IdChannel" HeaderText="IdChannel" 
                    SortExpression="IdChannel" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" />
                <asp:BoundField DataField="PublishDate" HeaderText="PublishDate" 
                    SortExpression="PublishDate" />
                <asp:BoundField DataField="Link" HeaderText="Link" SortExpression="Link" />
                <asp:BoundField DataField="Author" HeaderText="Author" 
                    SortExpression="Author" />
                <asp:BoundField DataField="Created" HeaderText="Created" 
                    SortExpression="Created" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NEWSREADERConnectionString1 %>" 
            DeleteCommand="DELETE FROM [News] WHERE [IdNew] = @IdNew" 
            InsertCommand="INSERT INTO [News] ([IdNewsPaper], [IdChannel], [Title], [Description], [PublishDate], [Link], [Author], [Created]) VALUES (@IdNewsPaper, @IdChannel, @Title, @Description, @PublishDate, @Link, @Author, @Created)" 
            ProviderName="<%$ ConnectionStrings:NEWSREADERConnectionString1.ProviderName %>" 
            SelectCommand="SELECT [IdNew], [IdNewsPaper], [IdChannel], [Title], [Description], [PublishDate], [Link], [Author], [Created] FROM [News]" 
            UpdateCommand="UPDATE [News] SET [IdNewsPaper] = @IdNewsPaper, [IdChannel] = @IdChannel, [Title] = @Title, [Description] = @Description, [PublishDate] = @PublishDate, [Link] = @Link, [Author] = @Author, [Created] = @Created WHERE [IdNew] = @IdNew">
            <DeleteParameters>
                <asp:Parameter Name="IdNew" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="IdNewsPaper" Type="Int32" />
                <asp:Parameter Name="IdChannel" Type="Int32" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="PublishDate" Type="DateTime" />
                <asp:Parameter Name="Link" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="Created" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="IdNewsPaper" Type="Int32" />
                <asp:Parameter Name="IdChannel" Type="Int32" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="PublishDate" Type="DateTime" />
                <asp:Parameter Name="Link" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="Created" Type="DateTime" />
                <asp:Parameter Name="IdNew" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
     
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <a href="report.aspx">Report</a> / <a href="newsreader.asmx/newsGetAllMayorId?id=90000">GetAllMayorId</a>

    
    <form id="form1" runat="server">
    <div>
        <%=resultados %>
    </div>

        <%=process_infobae %>
    </form>
</body>
</html>

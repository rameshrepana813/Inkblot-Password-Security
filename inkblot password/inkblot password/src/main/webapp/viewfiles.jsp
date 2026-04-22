<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Files</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

<h2>Your Uploaded Files</h2>

<table border="1">
<tr>
    <th>File Name</th>
    <th>Action</th>
</tr>

<%
    List<String[]> files = (List<String[]>) request.getAttribute("files");

    if(files != null){
        for(String[] f : files){
%>

<tr>
    <td><%= f[0] %></td>
    <td>
        <a href="<%= f[1] %>" target="_blank">View</a>
    </td>
</tr>

<%
        }
    }
%>

</table>

<br>
<a href="profile.jsp">Back</a>

</body>
</html>

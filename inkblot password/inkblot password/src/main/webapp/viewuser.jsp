<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Users</title>
</head>

<body>

<h2>Registered Users</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Mobile</th>
</tr>

<%
    List<String[]> users = (List<String[]>) request.getAttribute("users");

    if(users != null){
        for(String[] u : users){
%>

<tr>
    <td><%= u[0] %></td>
    <td><%= u[1] %></td>
    <td><%= u[2] %></td>
    <td><%= u[3] %></td>
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
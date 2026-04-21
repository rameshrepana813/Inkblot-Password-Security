<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("login2.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
</head>

<body>

<h2>Welcome to Your Profile</h2>

<hr>

<h3>Welcome ${user}</h3>

<br>

<a href="changeAll.jsp">Change Password</a><br><br>
<a href="upload.jsp">Upload Secure File</a><br><br>
<a href="viewfiles.jsp">View Uploaded Files</a><br><br>
<a href="viewuser.jsp">View Users</a><br><br>
<a href="logout.jsp">Logout</a>

</body>
</html>
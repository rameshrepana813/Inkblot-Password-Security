<%@ page session="true" %>

<%
String email = (String) session.getAttribute("resetEmail");

if(email == null){
    response.sendRedirect("forgot.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

<h2>Set New Password</h2>

<form action="resetPassword" method="post">

    <!-- IMPORTANT -->
    <input type="hidden" name="email" value="<%= email %>">

    New Password:<br>
    <input type="password" name="newPassword" required><br><br>

    Confirm Password:<br>
    <input type="password" name="confirmPassword" required><br><br>

    <button type="submit">Update Password</button>

</form>

</body>
</html>

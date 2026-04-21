<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>

<body>

<h2>Login</h2>

<form action="LoginServlet1" method="post">

    Email:<br>
    <input type="email" name="email" required><br><br>

    Password:<br>
    <input type="password" name="password" required><br><br>

    <input type="submit" value="Login">

</form>

<br>
<a href="forgot1.jsp">forget password</a>
<a href="register1.jsp">New User? Register Here</a>

</body>
</html>
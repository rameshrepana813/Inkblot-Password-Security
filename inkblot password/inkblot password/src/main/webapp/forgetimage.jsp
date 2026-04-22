<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Forgot Image - Verify</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

<h2>Verify Your Account</h2>

<form action="ForgotImageServlet1" method="post">

Email:<br>
<input type="email" name="email" required><br><br>

Password:<br>
<input type="password" name="password" required><br><br>

<input type="submit" value="Verify">

</form>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inkblot password security</title>
</head>
<body>
<h2>Registration - Step 1 (User Details)</h2>

<form action="<%=request.getContextPath()%>/register1" method="post">

    Name:<br>
    <input type="text" name="name" required><br><br>

    Email:<br>
    <input type="email" name="email" required><br><br>

    Mobile:<br>
    <input type="text" name="mobile" required><br><br>

    DOB:<br>
    <input type="date" name="dob" required><br><br>

    Address:<br>
    <textarea name="address" required></textarea><br><br>

    Password:<br>
    <input type="password" name="password" required><br><br>

    <input type="submit" value="Next">

</form>

</body>
</html>
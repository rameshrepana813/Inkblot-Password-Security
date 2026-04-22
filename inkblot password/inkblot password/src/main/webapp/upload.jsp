<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Upload File</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h2>Upload File</h2>

<form action="UploadFile" method="post" enctype="multipart/form-data">
    Select File:
    <input type="file" name="file" required>
    <br><br>
    <input type="submit" value="Upload">
</form>

</body>
</html>

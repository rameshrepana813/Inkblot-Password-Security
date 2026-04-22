<!DOCTYPE html>
<html>
<head>
<title>Reset Inkblot</title>
<link rel="stylesheet" type="text/css" href="style.css">

<style>
img {
    width: 120px;
    margin: 10px;
    cursor: pointer;
}
.selected {
    border: 3px solid green;
}
</style>

<script>
function selectImage(img, name) {
    document.getElementById("image").value = name;

    let imgs = document.querySelectorAll("img");
    imgs.forEach(i => i.classList.remove("selected"));
    img.classList.add("selected");
}
</script>

</head>

<body>

<h2>Select New Inkblot</h2>

<form action="ForgotImageServlet2" method="post">

<input type="hidden" name="image" id="image" required>

<img src="images/ink1.jpg" onclick="selectImage(this,'ink1.jpg')">
<img src="images/ink2.jpg" onclick="selectImage(this,'ink2.jpg')">
<img src="images/ink3.jpg" onclick="selectImage(this,'ink3.jpg')">

<br><br>

Description:<br>
<textarea name="desc" required></textarea><br><br>

<input type="submit" value="Reset">

</form>

</body>
</html>

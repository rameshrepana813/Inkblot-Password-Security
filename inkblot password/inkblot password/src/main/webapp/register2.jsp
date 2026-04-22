<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Register - Step 2</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style>
img {
    width: 120px;
    height: 120px;
    margin: 10px;
    border: 3px solid transparent;
    cursor: pointer;
}

/* Hover effect */
img:hover {
    border: 3px solid blue;
}

/* Selected image (permanent) */
.selected {
    border: 5px solid red;
}
</style>

<script>
function selectImage(imgElement, imgName) {

    // store selected image name
    document.getElementById("selectedImage").value = imgName;

    // remove selection from all images
    let imgs = document.getElementsByTagName("img");
    for (let i = 0; i < imgs.length; i++) {
        imgs[i].classList.remove("selected");
    }

    // add selection to clicked image
    imgElement.classList.add("selected");
}
</script>

</head>

<body>

<h2>Select Inkblot Image</h2>

<form action="RegisterServlet2" method="post">

    <!-- Hidden field -->
    <input type="hidden" name="image" id="selectedImage">

    <!-- Images -->
    <img src="images/ink1.jpeg" onclick="selectImage(this,'ink1.jpeg')">
    <img src="images/ink2.jpeg" onclick="selectImage(this,'ink2.jpeg')">
    <img src="images/ink3.jpeg" onclick="selectImage(this,'ink3.jpeg')">

    <br><br>

    Description:<br>
    <textarea name="desc" rows="4" cols="40" 
    placeholder="Enter your description" required></textarea>
    <br><br>

    <br><br>

    <input type="submit" value="Register">

</form>

</body>
</html>

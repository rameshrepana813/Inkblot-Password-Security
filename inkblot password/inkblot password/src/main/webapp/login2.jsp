<!DOCTYPE html>
<html>
<head>
    <title>Image Login</title>

    <style>
        img {
            width: 120px;
            height: 120px;
            margin: 10px;
            border: 3px solid transparent;
            cursor: pointer;
        }

        img.selected {
            border: 3px solid green;
        }
    </style>

    <script>
        function selectImage(imgElement, imgName) {

            // store selected image
            document.getElementById("selectedImage").value = imgName;

            // remove selection from all images
            let imgs = document.getElementsByTagName("img");
            for (let i = 0; i < imgs.length; i++) {
                imgs[i].classList.remove("selected");
            }

            // highlight selected image
            imgElement.classList.add("selected");
        }
    </script>
</head>

<body>

<h2>Select Image Login</h2>

<form action="login2" method="post">

    <!-- Hidden field -->
    <input type="hidden" name="image" id="selectedImage">

    <!-- Images -->
    <img src="images/ink1.jpeg" onclick="selectImage(this, 'ink1.jpeg')">
    <img src="images/ink2.jpeg" onclick="selectImage(this, 'ink2.jpeg')">
    <img src="images/ink3.jpeg" onclick="selectImage(this, 'ink3.jpeg')">

    <br><br>

    <!-- Description -->
    Description:<br>
    <textarea name="description" rows="4" cols="40" required></textarea>

    <br><br>
    <a href="forget2.jsp">forget image description</a>
    <button type="submit">Login</button>

</form>

</body>
</html>
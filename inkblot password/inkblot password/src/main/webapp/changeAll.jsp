<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Details</title>

    <style>
        img {
            width: 120px;
            height: 120px;
            margin: 10px;
            border: 3px solid transparent;
            cursor: pointer;
        }

        .selected {
            border: 3px solid green;
        }
    </style>

    <script>
        function selectImage(img, name) {
            document.getElementById("image").value = name;

            let images = document.getElementsByTagName("img");
            for (let i = 0; i < images.length; i++) {
                images[i].classList.remove("selected");
            }

            img.classList.add("selected");
        }
    </script>
</head>

<body>

<h2>Update Password + Image Login</h2>

<form action="changeAll" method="post">

    New Password:<br>
    <input type="password" name="password" required><br><br>

    <!-- Hidden image -->
    <input type="hidden" name="image" id="image">

    <!-- Image selection -->
    <img src="images/ink1.jpeg" onclick="selectImage(this, 'ink1.jpeg')">
    <img src="images/ink2.jpeg" onclick="selectImage(this, 'ink2.jpeg')">
    <img src="images/ink3.jpeg" onclick="selectImage(this, 'ink3.jpeg')">

    <br><br>

    Description:<br>
    <textarea name="description" required></textarea>

    <br><br>
    <a href="login1.jsp"> login</a>
    <button type="submit">Update</button>

</form>

</body>
</html>
<%@ page session="true" %>

<%
String email = (String) session.getAttribute("resetEmail");

if(email == null){
    response.sendRedirect("forgot1.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Reset Image</title>

    <style>
        img {
            width: 120px;
            height: 120px;
            margin: 10px;
            border: 3px solid transparent;
            cursor: pointer;
        }

        .selected {
            border: 3px solid red;
        }
    </style>

    <script>
        function selectImage(img, name) {
            document.getElementById("image").value = name;

            document.querySelectorAll("img").forEach(i => {
                i.classList.remove("selected");
            });

            img.classList.add("selected");
        }
    </script>
</head>

<body>

<h2>Set Image & Description</h2>

<form action="resetImage" method="post">

    <input type="hidden" name="image" id="image">
    <input type="hidden" name="email" value="<%= email %>">

    <img src="images/ink1.jpeg" onclick="selectImage(this,'ink1.jpeg')">
    <img src="images/ink2.jpeg" onclick="selectImage(this,'ink2.jpeg')">
    <img src="images/ink3.jpeg" onclick="selectImage(this,'ink3.jpeg')">

    <br><br>

    Description:<br>
    <textarea name="description" required></textarea>

    <br><br>

    <button type="submit">Update</button>

</form>

</body>
</html>
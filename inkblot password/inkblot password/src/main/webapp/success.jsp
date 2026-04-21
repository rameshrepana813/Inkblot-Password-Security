<%@ page session="true" %>

<html>
<head>
    <title>Success</title>
</head>

<body style="text-align:center;margin-top:60px;">

<%
String msg = (String) session.getAttribute("msg");

if(msg != null){
%>

    <h2 style="color:green;"><%= msg %></h2>

    <p>Redirecting to login page in 3 seconds...</p>

    <script>
        setTimeout(function(){
            window.location = "login1.jsp";
        }, 3000);
    </script>

<%
    session.removeAttribute("msg");
}
%>

</body>
</html>
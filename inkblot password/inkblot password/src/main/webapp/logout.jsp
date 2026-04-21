<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
    // destroy session
    session.invalidate();

    // redirect to login page
    response.sendRedirect("login1.jsp");
%>
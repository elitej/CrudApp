<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Menu</title>
    <style type="text/css">
        h1 {
            margin-top: 10px;
            margin-bottom: 0;
        }
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
            background-color: #f9f9f9
        }
        .tg td {
            font-family: Arial, sans-serif;
            font-size: 20px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }
    </style>
</head>
<body>
<h1>Simple CRUD Application</h1>
<br/>
<table class="tg">
    <tr><td><a href="<c:url value='/useradding'/>">Add a new User</a></td></tr>
    <tr><td><a href="<c:url value='/users'/>">View all users</a></td></tr>
    <tr><td><a href="<c:url value='/usersearching'/>">Find a user by name</a></td></tr>
</table>
</body>
</html>

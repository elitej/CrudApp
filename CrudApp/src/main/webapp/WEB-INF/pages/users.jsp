<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Users page</title>
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
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }
        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }
        ul.pagination {
            display: inline-block;
            margin-bottom: 10px;
            padding: 0;
        }
        ul.pagination li {
            display: inline;
            border: 1px solid #ddd;
            color: black;
            float: left;
            font-size: 18px;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color 0.3s ease 0s;
        }
    </style>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>
<br/>
<br/>
<c:if test="${!empty listUsers}">
    <h1>Users List</h1>
    <br/>
    <table class="tg">
        <tr>
            <th width="60">ID</th>
            <th width="200">Name</th>
            <th width="50">Age</th>
            <th width="50">Admin</th>
            <th width="220">Creation date</th>
            <th width="50">Edit</th>
            <th width="50">Delete</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td>${user.id}</td>
                <td><a href="/userdata/${user.id}" target="_blank">${user.name}</a></td>
                <td>${user.age}</td>
                <td>${user.isAdmin}</td>
                <td>${user.createDate}</td>
                <td><a href="<c:url value='/userediting/${user.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a> </td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<div>
    <ul class="pagination">
        <c:if test="${empty listUsers}">
            <c:if test="${empty listUsers}">
                <h1>Users is not found</h1>
                <a href="<c:url value="/useradding"/>">add user</a>
            </c:if>
        </c:if>
        <c:if test="${!empty listUsers}">
        <c:if test="${page > 1}">
            <li><a href="<c:url value="/users"/>">&#60;&#60;</a></li>
            <li><a href="<c:url value="/users"><c:param name="page" value="${page - 1}"/>${page - 1}</c:url>">&#60;</a></li>
        </c:if>
        <li><spring:message text="${page}"/></li>
            <c:if test="${flag != 0}">
            <li><a href="<c:url value="/users"><c:param name="page" value="${page + 1}"/>${page + 1}</c:url>">&#62;</a></li>
            </c:if>
        </c:if>
    </ul>
</div>
<br/>
<br/>


</body>
</html>
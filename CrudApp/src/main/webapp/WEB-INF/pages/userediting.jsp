<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
        .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
        /*.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}*/
    </style>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>
<br/>
<br/>
<h1>
    Edit a User
</h1>

<c:url var="addAction" value="/useradding/add" />
<form:form action="${addAction}" commandName="user">
    <table class="tg">
        <tr>
            <td><form:label path="id"><spring:message text="ID"/></form:label></td>
            <td><form:input path="id" readonly="true" size="8" disabled="true"/><form:hidden path="id"/></td>
        </tr>
        <tr>
            <td><form:label path="name"><spring:message text="Name"/></form:label></td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td><form:label path="age"><spring:message text="Age"/></form:label></td>
            <td><form:input path="age"/></td>
        </tr>
        <tr>
            <td><form:label path="isAdmin"><spring:message text="Admin"/></form:label></td>
            <td>
                <form:radiobutton path="isAdmin" value="true"/>Yes
                <form:radiobutton path="isAdmin" value="false"/>No
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty user.name}"><input type="submit" value="<spring:message text="Edit User"/>"/></c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>

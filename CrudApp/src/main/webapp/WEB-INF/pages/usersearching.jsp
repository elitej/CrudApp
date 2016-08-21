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
    </style>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>
<br/>
<br/>
<h1>
    Search a user in DB
</h1>
<br/>
<table class="tg">
    <tr>
        <c:url var="searchuser" value="/searchresults"/>
        <form:form action="${searchuser}" commandName="searcheduser">
            <table>
                <tr>
                    <td><form:label path="name"><spring:message text="Name"/></form:label></td>
                    <td><form:input path="name"/></td>
                    <td><input type="submit" value="<spring:message text="Search a user by name"/>"/></td>
                </tr>
            </table>
        </form:form>
    </tr>
</table>
</body>
</html>
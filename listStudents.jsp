<%--
  Created by IntelliJ IDEA.
  User: Abhishek
  Date: 12-02-2025
  Time: 09:40 pm
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
</head>
<body>
<h2>Employee List</h2>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Department</th>
        <th>Salary</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="student" items="${students}">
        <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.department}</td>
            <td>${student.salary}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>


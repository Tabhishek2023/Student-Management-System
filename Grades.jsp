<%--
  Created by IntelliJ IDEA.
  User: Abhishek Kumar
  Date: 16-03-2025
  Time: 07:43 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.abhishek.kumar.model.Grade" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession();
    @SuppressWarnings("unchecked")
    List<Grade> grades = (List<Grade>) sessionObj.getAttribute("grades");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Grades</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #ff758c, #ff7eb3);
            font-family: 'Arial', sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        thead {
            background-color: #007bff;
            color: white;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center text-white">Student Grades</h2>

    <table class="table table-bordered table-striped mt-4">
        <thead>
        <tr>
            <th>ID</th>
            <th>Course Title</th>
            <th>Grade</th>
        </tr>
        </thead>
        <tbody>
        <% if (grades == null || grades.isEmpty()) { %>
        <tr>
            <td colspan="3">No grades available.</td>
        </tr>
        <% } else {
            for (Grade grade : grades) { %>
        <tr>
            <td><%= grade.getId() %>
            </td>
            <td><%= grade.getCourseTitle() %>
            </td>
            <td><%= grade.getGrade() %>
            </td>
        </tr>
        <% }
        } %>
        </tbody>
    </table>
</div>

</body>
</html>




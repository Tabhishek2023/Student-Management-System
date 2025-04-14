<%--
  Created by IntelliJ IDEA.
  User: Abhishek Kumar
  Date: 16-03-2025
  Time: 07:43 pm
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.abhishek.kumar.model.Course" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession();
    @SuppressWarnings("unchecked")
    List<Course> courses = (sessionObj != null) ? (List<Course>) sessionObj.getAttribute("courses") : null;

    if (courses == null) {
        response.sendRedirect("dashboard.jsp?error=No Courses found");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Courses</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #4facfe, #00f2fe);
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

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center text-white">Student Enrolled Courses</h2>

    <table class="table table-bordered table-striped mt-4">
        <thead>
        <tr>
            <th>ID</th>
            <th>Course Title</th>
            <th>Instructor</th>
            <th>Credits</th>
        </tr>
        </thead>
        <tbody>
        <% if (courses.isEmpty()) { %>
        <tr>
            <td colspan="4">No courses found.</td>
        </tr>
        <% } else {
            for (Course course : courses) { %>
        <tr>
            <td><%= course.getId() %></td>
            <td><%= course.getTitle() %></td>
            <td><%= course.getInstructor() %></td>
            <td><%= course.getCredits() %></td>
        </tr>
        <% }
        } %>
        </tbody>
    </table>
</div>

</body>
</html>

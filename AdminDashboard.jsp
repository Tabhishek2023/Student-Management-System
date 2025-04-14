<%--
  Created by IntelliJ IDEA.
  User: Abhishek Kumnar
  Date: 21-03-2025
  Time: 10:28 pm
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession, java.util.List, com.abhishek.kumar.model.Student" %>
<%@ page import="com.abhishek.kumar.model.Admin" %>
<%
    HttpSession sessionObj = request.getSession(false);
    Admin LoggedInAdmin = (sessionObj != null) ? (Admin) sessionObj.getAttribute("LoggedInAdmin") : null;

    if (LoggedInAdmin == null) {
        response.sendRedirect("index.jsp?error=Please login first");
        return;
    }

    @SuppressWarnings("unchecked")
    List<Student> studentList = (List<Student>) sessionObj.getAttribute("studentList");

%>
<html>
<head>
    <title>Welcome to Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .dashboard {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        .dashboard h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 15px;
        }

        .admin-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }

        .admin-info {
            margin-bottom: 20px;
            font-size: 18px;
            font-weight: bold;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
        }

        .btn {
            background: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 48%;
        }

        .btn.logout {
            background: #dc3545;
        }

        .btn:hover {
            opacity: 0.8;
        }

        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            width: 50%;
            max-height: 400px;
            overflow-y: auto;
            text-align: left;
        }

        .popup .close {
            background: red;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            float: right;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
    <script>
        function showStudents() {
            document.getElementById("studentPopup").style.display = "block";
        }

        function closePopup() {
            document.getElementById("studentPopup").style.display = "none";
        }

        function logout(event) {
            event.preventDefault();
            const data = new FormData(document.getElementById("logoutForm"));
            fetch("hello-servlet", {
                method: "POST",
                body: new URLSearchParams(data),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            }).then((res) => {
                if (res.redirected) {
                    window.location.href = res.url;
                    return Promise.reject(res)
                }
            })
        }
    </script>
</head>
<body>
<div class="dashboard">
    <h1>Welcome to Admin Dashboard</h1>
    <img src="./Assets/Admin.jpg" alt="Admin Image" class="admin-image">
    <div class="admin-info">
        <p>Welcome, <%= LoggedInAdmin.getAdmin_name() %>
        </p>
        <p>Email: <%= LoggedInAdmin.getAdmin_email() %>
        </p>
    </div>

    <button class="btn" onclick="showStudents()">Get All Students</button>
    <br>
    <br>
    <form id="logoutForm" onsubmit="logout(event)">
        <input type="text" name="action" value="adminLogout" hidden>
        <button type="submit" class="btn btn-danger mx-2">Logout
        </button>
    </form>
</div>

<div id="studentPopup" class="popup">
    <button class="close" onclick="closePopup()">X</button>
    <h2>Student List</h2>
    <table border="1" width="100%">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
        </tr>
        <% if (studentList != null) { %>
        <% for (Student student : studentList) { %>
        <tr>
            <td><%= student.getId() %>
            </td>
            <td><%= student.getName() %>
            </td>
            <td><%= student.getEmail() %>
            </td>
        </tr>
        <% } %>
        <% } else { %>
        <tr>
            <td colspan="3">No students found.</td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>

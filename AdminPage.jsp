<%--
  Created by IntelliJ IDEA.
  User: Abhishek Kumar
  Date: 21-03-2025
  Time: 10:19 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .container h2 {
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            display: block;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .submit-btn {
            background: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        .submit-btn:hover {
            background: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Admin Login</h2>
    <form id="loginForm" onsubmit="login(event)">
        <div class="form-group">
            <input type="text" name="action" value="adminLogin" hidden/>
            <label for="username">Admin Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Admin Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="submit-btn">Login</button>
    </form>
</div>

<script>
    function login(event) {
        event.preventDefault();
        const data = new FormData(document.getElementById("loginForm"));
        fetch("hello-servlet", {
            method: "POST",
            body: new URLSearchParams(data),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            }
        }).then((res) => {
            if (res.redirected) {
                window.location.href = res.url;
                return Promise.reject(res);
            }
            return res.text()
        }).then((data) => {
            alert(data);
        })
    }
</script>
</body>
</html>


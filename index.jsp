<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 350px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        #loginForm {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
            margin-top: 10px;
        }

        button {
            background: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 10px;
        }

        button:hover {
            background: #0056b3;
        }

        p {
            margin-top: 10px;
        }

        a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>


</head>
<body>

<div class="container">
    <h2>Welcome to Student Management System</h2>
    <div id="loginForm">
        <h2><u>Login</u></h2>
        <form id="login_Form" onsubmit="login(event)">
            <input type="text" name="action" value="login" hidden>
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="registerPage.jsp">Register here</a></p>
        <p>Admin Login - <a href="AdminPage.jsp">Click here</a></p>
    </div>
</div>

<script>
    function login(event) {
        event.preventDefault();
        const form = new FormData(document.getElementById('login_Form'));
        fetch("hello-servlet", {
            method: 'POST',
            body: new URLSearchParams(form),
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            }
        }).then((res) => {
            if (res.redirected) {
                window.location.href = res.url;
                return Promise.reject("Redirected")
            }
            return res.text()
        }).then(data => {
            alert(data)
        })
    }
</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.abhishek.kumar.model.Student" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    Student loggedInStudent = (sessionObj != null) ? (Student) sessionObj.getAttribute("LoggedInStudent") : null;

    if (loggedInStudent == null) {
        response.sendRedirect("index.jsp?error=Please login first");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #acb6e5);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .dashboard-container {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 900px;
            width: 100%;
        }

        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 4px solid #007bff;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .btn-group {
            margin-top: 20px;
        }

        .btn:hover {
            transform: scale(1.05);
        }

        .dashboard-links {
            margin-top: 30px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .dashboard-links .card {
            transition: 0.3s;
            cursor: pointer;
            border-radius: 10px;
            text-align: center;
            padding: 20px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            background: #f8f9fa;
        }

        .dashboard-links .card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
        }

        .dashboard-links .btn {
            width: 100%;
        }

        @media (max-width: 768px) {
            .dashboard-links {
                grid-template-columns: repeat(1, 1fr);
            }
        }
    </style>
</head>
<body>

<div class="dashboard-container">
    <img src="./Assets/student.jpg" alt="Student Profile" class="profile-pic">

    <u><h2>Welcome, <%= loggedInStudent.getName() %>
    </h2></u>
    <p><strong>Student_ID:</strong> <%= loggedInStudent.getId() %>
    </p>
    <p><strong>Email:</strong> <%= loggedInStudent.getEmail() %>
    </p>

    <div class="btn-group">
        <button class="btn btn-info mx-2" data-bs-toggle="modal" data-bs-target="#updateStudentModal">Update
            Account
        </button>
        <button class="btn btn-secondary mx-2" data-bs-toggle="modal" data-bs-target="#deleteStudentModal">Delete
            Account
        </button>
        <form id="logoutForm" onsubmit="logout(event)">
            <input type="text" name="action" value="logout" hidden>
            <button type="submit" class="btn btn-danger mx-2">Logout
            </button>
        </form>
    </div>


    <div class="modal fade" id="updateStudentModal" tabindex="-1" aria-labelledby="updateStudentModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateStudentModalLabel">Update Student Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="updateForm" onsubmit="updateStudent(event)">
                        <input type="text" name="id" value="<%= loggedInStudent.getId() %> " hidden>
                        <input type="text" name="action" value="updateStudent" hidden/>
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="name" value="<%= loggedInStudent.getName() %>"
                                   required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email Address</label>
                            <input type="email" class="form-control" name="email"
                                   value="<%= loggedInStudent.getEmail() %>"
                                   required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Update Student</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteStudentModal" tabindex="-1" aria-labelledby="deleteStudentModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteStudentModalLabel">Confirm Delete</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete your account?</p>
                    <form id="deleteForm" onsubmit="deleteStudent(event)">
                        <input type="hidden" name="id" value="<%= loggedInStudent.getId() %>">
                        <input type="hidden" name="action" value="deleteStudent">
                        <button type="submit" class="btn btn-danger w-100">Delete Student</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="dashboard-links">
        <div class="card">
            <h5>📚 My Courses</h5>
            <p>Manage your enrolled courses.</p>
            <form id="courseForm" onsubmit="openAddCourse(event)">
                <input type="text" name="action" value="getAllCourses" hidden>
                <button type="submit" class="btn btn-primary">Go to Courses</button>
            </form>

        </div>
        <div class="card">
            <h5>📊 Grades & Performance</h5>
            <p>Check your grades and progress.</p>
            <form id="gradeForm" onsubmit="openGrade(event)">
                <input type="text" name="action" value="getGrades" hidden>
                <button type=submit class="btn btn-primary">View Grades</button>
            </form>

        </div>
        <div class="card">
            <h5>🎉 Upcoming Events</h5>
            <p>Check your schedule and events.</p>
            <form id="eventForm" onsubmit="openEvent(event)">
                <input type="text" name="action" value="getEvents" hidden>
                <button type="submit" class="btn btn-primary">View Events</button>
            </form>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function updateStudent(event) {
        event.preventDefault();
        const form = new FormData(document.getElementById('updateForm'));
        fetch("hello-servlet", {
            method: 'POST',
            body: new URLSearchParams(form),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        }).then((res) => {
            if (res.redirected) {
                window.location.href = res.url;
                return Promise.reject("Redirected")
            }
            return res.text()
        }).then((data) => {
            alert(data);
        })
    }

    function deleteStudent(event) {
        event.preventDefault();
        const form = new FormData(document.getElementById('deleteForm'));
        fetch("hello-servlet", {
            method: 'POST',
            body: new URLSearchParams(form),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        }).then((res) => {
            if (res.redirected) {
                window.location.href = res.url;
                return Promise.reject("Redirected")
            }
            return res.text()
        }).then((data) => {
            alert(data);
        })
    }

    function logout(event) {
        event.preventDefault();
        const form = new FormData(document.getElementById('logoutForm'));
        fetch("hello-servlet", {
            method: 'POST',
            body: new URLSearchParams(form),
            headers: {
                "content-type": "application/x-www-form-urlencoded"
            }
        }).then((res) => {
            if (res.redirected) {
                window.location.href = res.url;
                return Promise.reject("Redirected")
            }
            return res.text()
        }).then((data) => {
            alert(data);
        })
    }

    function openAddCourse(event) {
        event.preventDefault();
        const form = new FormData(document.getElementById('courseForm'));
        fetch("hello-servlet", {
            method: 'POST',
            body: new URLSearchParams(form),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        }).then((res) => {
            if (res.redirected) {
                window.location.href = res.url;
                return Promise.reject("Redirected")
            }
        }).then((data) => {
            alert(data);
        })
    }

    function openGrade(event) {
        event.preventDefault();
        const form = new FormData(document.getElementById('gradeForm'));
        fetch("hello-servlet", {
            method: 'POST',
            body: new URLSearchParams(form),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        }).then((res) => {
            if (res.redirected) {
                window.location.href = res.url;
                return Promise.reject("Redirected")
            }
        }).then((data) => {
            alert(data);
        })
    }

    function openEvent(event) {
        event.preventDefault();
        const form = new FormData(document.getElementById('eventForm'));
        fetch("hello-servlet", {
            method: 'POST',
            body: new URLSearchParams(form),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        }).then((res) => {
            if (res.redirected) {
                window.location.href = res.url;
                return Promise.reject("Redirected")
            }
        }).then((data) => {
            alert(data);
        })
    }

</script>
</body>
</html>

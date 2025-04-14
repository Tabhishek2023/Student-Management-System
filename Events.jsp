<%--
  Created by IntelliJ IDEA.
  User: Abhishek Kumar
  Date: 16-03-2025
  Time: 07:43 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.abhishek.kumar.model.Event" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%

    HttpSession sessionObj = request.getSession();
    @SuppressWarnings("unchecked")
    List<Event> events = (List<Event>) sessionObj.getAttribute("events");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Upcoming Events</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #36d1dc, #5b86e5);
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
    <h2 class="text-center text-white">Upcoming Events</h2>

    <table class="table table-bordered table-striped mt-4">
        <thead>
        <tr>
            <th>ID</th>
            <th>Event Name</th>
            <th>Location</th>
            <th>Date</th>
        </tr>
        </thead>
        <tbody>
        <% if (events == null || events.isEmpty()) { %>
        <tr>
            <td colspan="4">No upcoming events.</td>
        </tr>
        <% } else {
            for (Event event : events) { %>
        <tr>
            <td><%= event.getId() %>
            </td>
            <td><%= event.getEventName() %>
            </td>
            <td><%= event.getLocation() %>
            </td>
            <td><%= event.getDate() %>
            </td>
        </tr>
        <% }
        } %>
        </tbody>
    </table>
</div>

</body>
</html>




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String user = (String) session.getAttribute("user");
  String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>PlanYourOuting</title>
  <style>
    * {
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
    }

    body {
      background: #222;
      scroll-behavior: smooth;
    }

    /* Navbar */
    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 50px;
      background: rgba(51, 51, 51, 0.8);
      color: white;
      position: fixed;
      width: 100%;
      top: 0;
      z-index: 1000;
      box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Optional shadow for better visibility */
    }

    .logo {
      font-size: 1.8rem;
      font-weight: bold;
      letter-spacing: 2px;
      flex-shrink: 0; /* Prevents the logo from shrinking */
    }

    .nav-links {
      list-style: none;
      display: flex;
      flex-wrap: wrap; /* Allows items to wrap if necessary */
      justify-content: flex-end; /* Aligns items to the right */
      margin: 0;
      padding: 0;
      flex-grow: 1; /* Fills the remaining space */
    }

    .nav-links li {
      margin: 0 10px; /* Adjust margin for better spacing */
      white-space: nowrap; /* Prevents text from wrapping */
    }

    .nav-links a {
      color: white;
      text-decoration: none;
      font-size: 1rem; /* Adjust font size for better fit */
      transition: color 0.3s ease;
    }

    .nav-links a:hover {
      color: #ff9800;
    }

  </style>
</head>
<body>
<nav class="navbar">
  <div class="logo">Itenera</div>
  <ul class="nav-links">
    <li><a href="home.jsp">Home</a></li>
    <li><a href="reservation.jsp">Start Planning</a></li>
    <li><a href="recommended.jsp">Recommended Trips</a></li>
    <% if ("admin".equals(role)) { %>
    <li><a href="recommended_admin.jsp">Add Recommended Trips</a></li>
    <li><a href="create_admin.jsp">Create Admin</a></li>
    <li><a href="add_trip.jsp">Add Trip</a></li>
    <li><a href="add_tourist_places.jsp">Add Tourist Places</a></li>
    <% } %>
    <li><a href="about.jsp">About us</a></li>
    <li><a href="contactUS.jsp">Contact us</a></li>
    <li><a href="LogoutServlet">Logout</a></li>
  </ul>
</nav>
</body>
</html>

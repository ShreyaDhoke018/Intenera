<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Trips</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>

<h2 class="admin_head">Add New Trips</h2>
<% if (request.getAttribute("errorMessage") != null) { %>
<div class="error-message" style="color: red;">
    <%= request.getAttribute("errorMessage") %>
</div>
<% } %>
<div class="form-wrapper">
    <form action="addTrip" method="post">
        <label>Trip From (Start destination) :</label><br>
        <input type="text" name="tripFrom" value="<%= request.getAttribute("tripFrom") != null ? request.getAttribute("tripFrom") : "" %>" required><br>

        <label>Trip To (End destination) :</label><br>
        <input type="text" name="tripTo" value="<%= request.getAttribute("tripTo") != null ? request.getAttribute("tripTo") : "" %>"><br>

        <label>Trip Start Date :</label><br>
        <input type="date" name="tripStartDate" placeholder="Keep duration max of 11days" value="<%= request.getAttribute("tripStartDate") != null ? request.getAttribute("tripStartDate") : "" %>"><br>

        <label>Trip End Date :</label><br>
        <input type="date" name="tripEndDate" placeholder="Keep duration max of 11days" value="<%= request.getAttribute("tripEndDate") != null ? request.getAttribute("tripEndDate") : "" %>"><br>

        <input type="submit" value="Add Trip">
    </form>
</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Recommendation</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>

<h2 class="admin_head">Add New Recommendation</h2>
<div class="form-wrapper">
    <form action="insertRecommendation" method="post">
        <label>Title (Head):</label><br>
        <input type="text" name="head" value="<%= request.getAttribute("head") != null ? request.getAttribute("head") : "" %>" required><br><br>

        <label>Info:</label><br>
        <textarea name="info" rows="5" cols="50" required><%= request.getAttribute("info") != null ? request.getAttribute("info") : "" %></textarea><br><br>

        <label>Image 1 URL:</label><br>
        <input type="text" name="image1" placeholder="Enter image address from web" value="<%= request.getAttribute("image1") != null ? request.getAttribute("image1") : "" %>"><br><br>

        <label>Image 2 URL:</label><br>
        <input type="text" name="image2" placeholder="Enter image address from web" value="<%= request.getAttribute("image2") != null ? request.getAttribute("image2") : "" %>"><br><br>

        <label>Image 3 URL:</label><br>
        <input type="text" name="image3" placeholder="Enter image address from web" value="<%= request.getAttribute("image3") != null ? request.getAttribute("image3") : "" %>"><br><br>

        <label>Image 4 URL:</label><br>
        <input type="text" name="image4" placeholder="Enter image address from web" value="<%= request.getAttribute("image4") != null ? request.getAttribute("image4") : "" %>"><br><br>

        <input type="submit" value="Add Recommendation">
    </form>
</div>
</body>
</html>

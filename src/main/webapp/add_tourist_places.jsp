<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Tourist Places</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>

<h2 class="admin_head">Add New Tourist Places</h2>
<% if (request.getAttribute("errorMessage") != null) { %>
<div class="error-message" style="color: red;">
    <%= request.getAttribute("errorMessage") %>
</div>
<% } %>
<div class="form-wrapper">
    <form action="addTouristPlaces" method="post">
        <label>Place (End destination) :</label><br>
        <input type="text" name="place" value="<%= request.getAttribute("place") != null ? request.getAttribute("place") : "" %>"><br>

        <label>Tourist Place 1 :</label><br>
        <input type="text" name="tourist_place1" value="<%= request.getAttribute("tourist_place1") != null ? request.getAttribute("tourist_place1") : "" %>"><br>

        <label>Tourist Place 2 :</label><br>
        <input type="text" name="tourist_place2" value="<%= request.getAttribute("tourist_place2") != null ? request.getAttribute("tourist_place2") : "" %>"><br>

        <label>Tourist Place 3 :</label><br>
        <input type="text" name="tourist_place3" value="<%= request.getAttribute("tourist_place3") != null ? request.getAttribute("tourist_place3") : "" %>"><br>

        <label>Tourist Place 4 :</label><br>
        <input type="text" name="tourist_place4" value="<%= request.getAttribute("tourist_place4") != null ? request.getAttribute("tourist_place4") : "" %>"><br>

        <label>Tourist Place 5 :</label><br>
        <input type="text" name="tourist_place5" value="<%= request.getAttribute("tourist_place5") != null ? request.getAttribute("tourist_place5") : "" %>"><br>

        <label>Tourist Place 6 :</label><br>
        <input type="text" name="tourist_place6" value="<%= request.getAttribute("tourist_place6") != null ? request.getAttribute("tourist_place6") : "" %>"><br>

        <label>Tourist Place 7 :</label><br>
        <input type="text" name="tourist_place7" value="<%= request.getAttribute("tourist_place7") != null ? request.getAttribute("tourist_place7") : "" %>"><br>

        <label>Tourist Place 8 :</label><br>
        <input type="text" name="tourist_place8" value="<%= request.getAttribute("tourist_place8") != null ? request.getAttribute("tourist_place8") : "" %>"><br>

        <label>Tourist Place 9 :</label><br>
        <input type="text" name="tourist_place9" value="<%= request.getAttribute("tourist_place9") != null ? request.getAttribute("tourist_place9") : "" %>"><br>

        <label>Tourist Place 10 :</label><br>
        <input type="text" name="tourist_place10" value="<%= request.getAttribute("tourist_place10") != null ? request.getAttribute("tourist_place10") : "" %>"><br>

        <input type="submit" value="Add Trip">
    </form>
</div>
</body>
</html>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>

<%
  // Retrieve attributes from the previous page
  String tripFrom = request.getParameter("tripFrom");
  String tripTo = request.getParameter("tripTo");
  String startDateStr = request.getParameter("startDate");
  String endDateStr = request.getParameter("endDate");
  String travelersStr = request.getParameter("travelers");
  String totalPriceStr = request.getParameter("totalPrice");

  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  SimpleDateFormat displayFormat = new SimpleDateFormat("MMMM dd, yyyy");

  java.util.Date startDate = null;
  java.util.Date endDate = null;
  try {
    startDate = sdf.parse(startDateStr);
    endDate = sdf.parse(endDateStr);
  } catch (Exception e) {
    e.printStackTrace();
  }

  int travelers = travelersStr != null ? Integer.parseInt(travelersStr) : 1;
  double totalPrice = totalPriceStr != null ? Double.parseDouble(totalPriceStr) : 0.0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Receipt</title>
  <style>
    body {
      background: #1A1A1A;
      color: #FFD800;
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
    }

    .container {
      background: #000;
      width: 80%;
      margin: 50px auto;
      padding: 20px;
      border-radius: 12px;
    }

    .title {
      text-align: center;
      margin-bottom: 20px;
    }

    .receipt-info {
      margin-top: 20px;
    }

    .info-item {
      display: flex;
      justify-content: space-between;
      margin-bottom: 10px;
    }

    .info-item span {
      font-size: 16px;
    }

    .total {
      font-size: 20px;
      font-weight: bold;
      border-top: 2px solid #FFD800;
      padding-top: 10px;
    }

    .button-container {
      text-align: center;
      margin-top: 20px;
    }

    .button {
      padding: 10px 20px;
      background: #FFD800;
      color: #1A1A1A;
      border: none;
      border-radius: 8px;
      font-weight: bold;
      font-size: 16px;
      cursor: pointer;
      text-decoration: none;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="title">
    <h1>Trip Receipt</h1>
  </div>
  <div class="receipt-info">
    <div class="info-item">
      <span>From:</span>
      <span><%= tripFrom %></span>
    </div>
    <div class="info-item">
      <span>To:</span>
      <span><%= tripTo %></span>
    </div>
    <div class="info-item">
      <span>Start Date:</span>
      <span><%= startDate != null ? displayFormat.format(startDate) : "N/A" %></span>
    </div>
    <div class="info-item">
      <span>End Date:</span>
      <span><%= endDate != null ? displayFormat.format(endDate) : "N/A" %></span>
    </div>
    <div class="info-item">
      <span>Travelers:</span>
      <span><%= travelers %></span>
    </div>
    <div class="info-item total">
      <span>Total Price:</span>
      <span>₹<%= String.format("%.2f", totalPrice) %></span>
    </div>
  </div>
  <div class="button-container">
    <a href="home.jsp" class="button">Go to Home</a>
  </div>
</div>
</body>
</html>

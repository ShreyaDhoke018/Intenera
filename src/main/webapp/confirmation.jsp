
<%@ page import="java.util.*, org.example.TripDAO, org.example.Trip" %>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.cfg.Configuration" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    SessionFactory sessionFactory = (SessionFactory)application.getAttribute("sessionFactory");
    if(sessionFactory == null) {
        sessionFactory = new Configuration().configure().buildSessionFactory();
        application.setAttribute("sessionFactory", sessionFactory);
    }

    // Get params
    String tripIdStr = request.getParameter("tripId");
    String tripFrom = request.getParameter("tripFrom");
    String tripTo = request.getParameter("tripTo");
    String tripType = request.getParameter("tripType");
    String startDateStr = request.getParameter("startDate");
    String endDateStr = request.getParameter("endDate");
    String travelers = request.getParameter("travelers");
    String accommodationType = request.getParameter("accommodationType");
    String transportType = request.getParameter("transportType");
    String activities = request.getParameter("activities");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat displayFormat = new SimpleDateFormat("MMMM dd, yyyy");

    Date startDate = null;
    Date endDate = null;
    int tripDuration = 0;
    try {
        if(startDateStr != null) {
            startDate = sdf.parse(startDateStr);
        }
        if(endDateStr != null) {
            endDate = sdf.parse(endDateStr);
        }
        if(startDate != null && endDate != null) {
            long diffInMillies = Math.abs(endDate.getTime() - startDate.getTime());
            tripDuration = (int)(diffInMillies / (1000 * 60 * 60 * 24)) + 1;
        }
    } catch(Exception e) {
        tripDuration = 5; // Default duration
    }

    int numTravelers = 1;
    if(travelers != null && travelers.contains("-")) {
        String[] parts = travelers.split("-");
        if(parts.length > 1) {
            String lastPart = parts[parts.length - 1].trim();
            if(lastPart.equals("4+")) {
                numTravelers = 4;
            } else {
                try {
                    numTravelers = Integer.parseInt(lastPart);
                } catch(Exception e) {
                    numTravelers = 1;
                }
            }
        }
    }

    // Calculate final price
    double basePrice = 0;
    if(tripType == null) {
        tripType = "Regular Trip";
    }
    switch(tripType) {
        case "Business Trip": basePrice = 2500 * tripDuration; break;
        case "Summer Vacation": basePrice = 1800 * tripDuration; break;
        case "Spring Vacation": basePrice = 1600 * tripDuration; break;
        case "Winter Vacation": basePrice = 2200 * tripDuration; break;
        default: basePrice = 1500 * tripDuration;
    }

    // Accommodation multipliers
    double accommodationMultiplier = 1.0;
    if(accommodationType != null) {
        switch(accommodationType) {
            case "Luxury Hotel": accommodationMultiplier = 1.5; break;
            case "Standard Hotel": accommodationMultiplier = 1.0; break;
            case "Budget Hotel": accommodationMultiplier = 0.7; break;
            case "Vacation Rental": accommodationMultiplier = 1.2; break;
        }
    }

    // Transport multipliers
    double transportMultiplier = 1.0;
    if(transportType != null) {
        switch(transportType) {
            case "Flight": transportMultiplier = 1.8; break;
            case "Train": transportMultiplier = 1.0; break;
            case "Rental Car": transportMultiplier = 1.2; break;
            case "Bus": transportMultiplier = 0.6; break;
        }
    }

    double accommodationPrice = basePrice * 0.4 * accommodationMultiplier;
    double transportPrice = basePrice * 0.3 * transportMultiplier;
    double activitiesPrice = basePrice * 0.2;
    double servicesFees = basePrice * 0.1;
    double totalPrice = (accommodationPrice + transportPrice + activitiesPrice + servicesFees) * numTravelers;
%>
<!DOCTYPE html>
<jsp:include page="navbar.jsp"/>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Booking Confirmation</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: #1A1A1A;
            color: #FFD800;
            font-family: 'Poppins', sans-serif;
        }
        .title {
            background: #000;
            color: #FFCC00;
            height: 100px;
            width: 90%;
            margin: 40px auto;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            transition: 0.3s ease-in-out;
        }
        .title:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.25);
        }
        .title h1 {
            font-size: 48px;
            text-transform: uppercase;
            margin: 0;
        }
        .container {
            background: #000;
            width: 90%;
            margin: 20px auto;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }
        .confirmation-box {
            background: rgba(255, 216, 0, 0.1);
            border-radius: 8px;
            padding: 30px;
            margin-bottom: 30px;
            text-align: center;
        }
        .confirmation-icon {
            font-size: 80px;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        .confirmation-message {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .confirmation-details {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .trip-info {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
            margin-bottom: 30px;
        }
        .info-box {
            background: rgba(255, 216, 0, 0.1);
            padding: 15px;
            border-radius: 8px;
        }
        .info-box h3 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 18px;
        }
        .info-box p {
            margin: 5px 0;
        }
        .section-title {
            font-size: 24px;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #FFD800;
        }
        .price-breakdown {
            background: rgba(255, 216, 0, 0.1);
            padding: 15px;
            border-radius: 8px;
            margin-top: 30px;
        }
        .price-item {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px dashed rgba(255, 216, 0, 0.2);
        }
        .price-total {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-top: 2px solid #FFD800;
            font-size: 20px;
            font-weight: bold;
            margin-top: 10px;
        }
        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }
        .button {
            padding: 12px 24px;
            background: #FFD800;
            color: #1A1A1A;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        .button:hover {
            background: #FFCC00;
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
<br><br><br>
<div class="title">
    <h1>Booking Confirmation</h1>
</div>

<div class="container">
    <div class="confirmation-box">
        <div class="confirmation-icon">✓</div>
        <div class="confirmation-message">Your trip has been successfully booked!</div>
        <div class="confirmation-details">Confirmation Number: TRP<%= new java.util.Random().nextInt(900000) + 100000 %></div>
        <div class="confirmation-details">We've sent the details to your email address.</div>
    </div>

    <h3 class="section-title">Your Trip Details</h3>
    <div class="trip-info">
        <div class="info-box">
            <h3>Trip Information</h3>
            <p><strong>From:</strong> <%= tripFrom != null ? tripFrom : "Not specified" %></p>
            <p><strong>To:</strong> <%= tripTo != null ? tripTo : "Not specified" %></p>
            <p><strong>Trip Type:</strong> <%= tripType %></p>
            <p><strong>Duration:</strong> <%= tripDuration %> day<%= tripDuration == 1 ? "" : "s" %></p>
        </div>
        <div class="info-box">
            <h3>Dates</h3>
            <p><strong>Departure:</strong> <%= startDate != null ? displayFormat.format(startDate) : "Not specified" %></p>
            <p><strong>Return:</strong> <%= endDate != null ? displayFormat.format(endDate) : "Not specified" %></p>
        </div>
        <div class="info-box">
            <h3>Booking Details</h3>
            <p><strong>Travelers:</strong> <%= numTravelers %> <%= travelers != null ? travelers : "Adult" %></p>
            <p><strong>Accommodation:</strong> <%= accommodationType != null ? accommodationType : "Standard Hotel" %></p>
            <p><strong>Transportation:</strong> <%= transportType != null ? transportType : "Flight" %></p>
        </div>
    </div>

    <h3 class="section-title">Price Summary</h3>
    <div class="price-breakdown">
        <div class="price-item">
            <span>Accommodation (<%= accommodationType != null ? accommodationType : "Standard Hotel" %>)</span>
            <span>$<%= String.format("%.2f", accommodationPrice) %></span>
        </div>
        <div class="price-item">
            <span>Transportation (<%= transportType != null ? transportType : "Flight" %>)</span>
            <span>$<%= String.format("%.2f", transportPrice) %></span>
        </div>
        <div class="price-item">
            <span>Activities & Excursions</span>
            <span>$<%= String.format("%.2f", activitiesPrice) %></span>
        </div>
        <div class="price-item">
            <span>Service Fees</span>
            <span>$<%= String.format("%.2f", servicesFees) %></span>
        </div>
        <div class="price-total">
            <span>Total Price (for <%= numTravelers %> <%= numTravelers > 1 ? "travelers" : "traveler" %>)</span>
            <span>$<%= String.format("%.2f", totalPrice) %></span>
        </div>
    </div>

    <div class="button-container">
        <a href="home.jsp" class="button">Return to Home</a>
    </div>
</div>

</body>
</html>

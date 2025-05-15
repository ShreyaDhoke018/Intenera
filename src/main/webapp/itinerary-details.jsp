<%@ page import="java.util.*, org.example.TripDAO, org.example.Trip" %>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.cfg.Configuration" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>


<%
    SessionFactory sessionFactory = (SessionFactory)application.getAttribute("sessionFactory");
    if(sessionFactory == null) {
        sessionFactory = new Configuration().configure().buildSessionFactory();
        application.setAttribute("sessionFactory", sessionFactory);
    }

    String tripIdStr = request.getParameter("tripId");
    String tripFrom = request.getParameter("tripFrom");
    String tripTo = request.getParameter("tripTo");
    String startDateStr = request.getParameter("startDate");
    String endDateStr = request.getParameter("endDate");
    String travelers = request.getParameter("travelers");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat displayFormat = new SimpleDateFormat("MMMM dd, yyyy");

    java.util.Date startDate = null;
    java.util.Date endDate = null;
    int tripDuration = 0;
    try {
        if(startDateStr != null) startDate = sdf.parse(startDateStr);
        if(endDateStr != null) endDate = sdf.parse(endDateStr);
        if(startDate != null && endDate != null) {
            long diffInMillies = Math.abs(endDate.getTime() - startDate.getTime());
            tripDuration = (int)(diffInMillies / (1000 * 60 * 60 * 24)) + 1;
        }
    } catch(Exception e) {
        tripDuration = 5;
    }

//    Consider 1500 as base price
    double basePrice = 1500 * tripDuration;

    int numTravelers = 1;

    double totalPrice = basePrice;
    double accommodationPrice = basePrice * 0.4;
    double transportPrice = basePrice * 0.3;
    double activitiesPrice = basePrice * 0.2;
    double servicesFees = basePrice * 0.1;

    String[] accommodationTypes = {"Luxury Hotel", "Standard Hotel", "Budget Hotel", "Vacation Rental"};
    double[] accommodationMultipliers = {1.5, 1.0, 0.7, 1.2};

    String[] transportTypes = {"Flight", "Train", "Rental Car", "Bus"};
    double[] transportMultipliers = {1.8, 1.0, 1.2, 0.6};

    Calendar calendar = Calendar.getInstance();
    if(startDate != null) {
        calendar.setTime(startDate);
    }


    // Database connection setup
    String dbURL = "jdbc:mysql://localhost:3306/userdb";
    String dbUser = "root";
    String dbPassword = "";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    List<String> itinerary = new ArrayList<>();
    try {
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Query to fetch tourist places for the selected destination
        String sql = "SELECT tourist_place1, tourist_place2, tourist_place3, tourist_place4, tourist_place5, tourist_place6, tourist_place7, tourist_place8, tourist_place9, tourist_place10 " +
                "FROM tourist_places WHERE place = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, tripTo); // Use tripTo from earlier in your code
        rs = stmt.executeQuery();

        if (rs.next()) {
            for (int i = 1; i <= 10; i++) {
                String place = rs.getString("tourist_place" + i);
                if (place != null && !place.trim().isEmpty()) {
                    itinerary.add(place);
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { }
        if (conn != null) try { conn.close(); } catch (SQLException e) { }
    }

    // Adjust the itinerary based on duration
    List<String> finalItinerary = itinerary.size() > 0
            ? itinerary.subList(0, Math.min(tripDuration - 1, itinerary.size()))
            : new ArrayList<>();
%>

<!DOCTYPE html>
<jsp:include page="navbar.jsp"/>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Itinerary Details</title>
    <style>
        body {
            background: #1A1A1A;
            color: #FFD800;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .title {
            background: #000;
            color: #FFCC00;
            margin: 40px auto;
            padding: 30px;
            width: 90%;
            border-radius: 12px;
            text-align: center;
        }

        .container {
            background: #000;
            width: 90%;
            margin: 20px auto;
            padding: 20px;
            border-radius: 12px;
        }

        .trip-info {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .itinerary-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .price-breakdown {
            margin-top: 30px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .info-box {
            background: rgba(255, 216, 0, 0.1);
            padding: 15px;
            border-radius: 8px;
        }

        .price-breakdown {
            margin-top: 30px;
        }

        .price-item, .price-total {
            display: flex;
            justify-content: space-between;
            border-bottom: 1px dashed #FFD800;
            padding: 10px 0;
        }

        .price-total {
            font-size: 20px;
            font-weight: bold;
            border-top: 2px solid #FFD800;
        }

        .button-container {
            margin-top: 30px;
            display: flex;
            justify-content: space-between;
        }

        .button {
            padding: 12px 24px;
            background: #FFD800;
            color: #1A1A1A;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
        }

        .button.secondary {
            background: transparent;
            border: 2px solid #FFD800;
            color: #FFD800;
        }

        .customization-options {
            margin-top: 30px;
        }

        .option-selector {
            width: 100%;
            padding: 10px;
            background: #1A1A1A;
            color: #FFD800;
            border: 1px solid #FFD800;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<br><br><br>

<div class="title">
    <h1>Your Travel Itinerary</h1>
</div>

<div class="container">
    <div class="trip-info">
        <div class="info-box">
            <h3>Trip Overview</h3>
            <p><strong>From:</strong> <%= tripFrom %></p>
            <p><strong>To:</strong> <%= tripTo %></p>
            <p><strong>Duration:</strong> <%= tripDuration %> day<%= tripDuration == 1 ? "" : "s" %></p>
        </div>
        <div class="info-box">
            <h3>Dates</h3>
            <p><strong>Start:</strong> <%= startDate != null ? displayFormat.format(startDate) : "N/A" %></p>
            <p><strong>End:</strong> <%= endDate != null ? displayFormat.format(endDate) : "N/A" %></p>
            <p><strong>Travelers:</strong> <%= numTravelers %></p>
        </div>
    </div>

    <div class="trip-info">
        <div class="info-box">
            <h3>Daily Itinerary</h3><br><br>
            <ul class="itinerary-list">
                <%
                    Calendar dayCalendar = Calendar.getInstance();
                    if (startDate != null) dayCalendar.setTime(startDate);

                    for (int i = 0; i < finalItinerary.size(); i++) {
                        String dayPlace = finalItinerary.get(i);
                %>
                <li>
                    <strong>Day <%= i + 1 %>:</strong>
                    <%= dayPlace %>
                    (<%= new SimpleDateFormat("MMMM dd, yyyy").format(dayCalendar.getTime()) %>)
                </li>
                <%
                        dayCalendar.add(Calendar.DATE, 1);
                    }
                %>
            </ul>
            <br>
            <p><strong>Last Day:</strong> Departure</p>
        </div>
    </div>


    <div class="customization-options">
        <label for="accommodationType">Select Accommodation:</label>
        <select class="option-selector" id="accommodationType" onchange="updatePricing()">
            <option value="">-- Select Accommodation --</option>
            <option value="0">Luxury Hotel</option>
            <option value="1">Standard Hotel</option>
            <option value="2">Budget Hotel</option>
            <option value="3">Vacation Rental</option>
        </select>

        <label for="transportType">Select Transport:</label>
        <select class="option-selector" id="transportType" onchange="updatePricing()">
            <option value="">-- Select Transport --</option>
            <option value="0">Flight</option>
            <option value="1">Train</option>
            <option value="2">Rental Car</option>
            <option value="3">Bus</option>
        </select>
    </div>

    <div class="price-breakdown">
        <div class="price-item">
            <span>Accommodation (<span id="accommodationTypeText">Luxury Hotel</span>)</span>
            <span>₹<span id="accommodationPriceBreakdown"><%= String.format("%.2f", accommodationPrice * accommodationMultipliers[0]) %></span></span>
        </div>
        <div class="price-item">
            <span>Transportation (<span id="transportTypeText">Flight</span>)</span>
            <span>₹<span id="transportPriceBreakdown"><%= String.format("%.2f", transportPrice * transportMultipliers[0]) %></span></span>
        </div>
        <div class="price-item">
            <span>Activities</span>
            <span>₹<%= String.format("%.2f", activitiesPrice) %></span>
        </div>
        <div class="price-item">
            <span>Service Fees</span>
            <span>₹<%= String.format("%.2f", servicesFees) %></span>
        </div>
        <div class="price-total">
            <span>Total Base Price (x<%= numTravelers %> traveler<%= numTravelers > 1 ? "s" : "" %>)</span>
            <span>₹<span id="totalPriceDynamic"><%= String.format("%.2f", totalPrice) %></span></span>
        </div>
    </div>

    <div class="button-container">
        <button class="button" onclick="submitBooking()">Book Now</button>
        <button class="button secondary" onclick="window.history.back()">Go Back</button>
    </div>
</div>

<script>
    const accommodationMultipliers = [1.5, 1.0, 0.7, 1.2];
    const transportMultipliers = [1.8, 1.0, 1.2, 0.6];
    const accommodationTypes = ["Luxury Hotel", "Standard Hotel", "Budget Hotel", "Vacation Rental"];
    const transportTypes = ["Flight", "Train", "Rental Car", "Bus"];
    const accommodationBase = <%= accommodationPrice %>;
    const transportBase = <%= transportPrice %>;
    const activities = <%= activitiesPrice %>;
    const serviceFees = <%= servicesFees %>;
    const travelers = <%= numTravelers %>;

    function updatePricing() {
        const accIndex = document.getElementById("accommodationType").value;
        const transIndex = document.getElementById("transportType").value;

        const accMultiplier = accIndex !== "" ? accommodationMultipliers[accIndex] : 0;
        const transMultiplier = transIndex !== "" ? transportMultipliers[transIndex] : 0;

        const accPrice = (accommodationBase * accMultiplier).toFixed(2);
        const transPrice = (transportBase * transMultiplier).toFixed(2);

        document.getElementById("accommodationPriceBreakdown").innerText = accIndex !== "" ? accPrice : "0.00";
        document.getElementById("transportPriceBreakdown").innerText = transIndex !== "" ? transPrice : "0.00";

        document.getElementById("accommodationTypeText").innerText =
            accIndex !== "" ? accommodationTypes[accIndex] : "Select Accommodation";
        document.getElementById("transportTypeText").innerText =
            transIndex !== "" ? transportTypes[transIndex] : "Select Transport";

        const total = (
            (parseFloat(accPrice || 0) + parseFloat(transPrice || 0) + activities + serviceFees)
        ).toFixed(2);
        document.getElementById("totalPriceDynamic").innerText = total;
    }

    document.addEventListener("DOMContentLoaded", updatePricing);

    function submitBooking() {
        const form = document.createElement("form");
        form.method = "POST";
        form.action = "receipt.jsp";

        const inputs = [
            { name: "tripFrom", value: "<%= tripFrom %>" },
            { name: "tripTo", value: "<%= tripTo %>" },
            { name: "startDate", value: "<%= startDateStr %>" },
            { name: "endDate", value: "<%= endDateStr %>" },
            { name: "travelers", value: "<%= numTravelers %>" },
            { name: "totalPrice", value: document.getElementById("totalPriceDynamic").innerText }
        ];

        inputs.forEach(inputData => {
            const input = document.createElement("input");
            input.type = "hidden";
            input.name = inputData.name;
            input.value = inputData.value;
            form.appendChild(input);
        });

        document.body.appendChild(form);
        form.submit();
    }

</script>

</body>
</html>

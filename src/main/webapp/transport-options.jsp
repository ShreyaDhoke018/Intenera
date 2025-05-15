

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

    // Fix for null tripType to prevent NullPointerException
    if (tripType == null) {
        tripType = "Regular Trip"; // default value
    }

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
        tripDuration = 5;
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
%>
<!DOCTYPE html>
<jsp:include page="navbar.jsp"/>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Transportation Options</title>
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
        .trip-header {
            border-bottom: 2px solid #FFD800;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }
        .trip-header h2 {
            margin-top: 0;
            font-size: 32px;
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
        .transport-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .transport-card {
            background: rgba(255, 216, 0, 0.05);
            border-radius: 8px;
            padding: 20px;
            transition: 0.3s;
            border: 1px solid transparent;
            cursor: pointer;
        }
        .transport-card:hover {
            background: rgba(255, 216, 0, 0.1);
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            border-color: #FFD800;
        }
        .transport-card.selected {
            background: rgba(255, 216, 0, 0.15);
            border-color: #FFD800;
            box-shadow: 0 8px 20px rgba(255, 216, 0, 0.1);
        }
        .transport-card h3 {
            margin-top: 0;
            color: #FFD800;
        }
        .transport-card p {
            margin: 10px 0;
        }
        .transport-features {
            margin: 15px 0;
        }
        .transport-feature {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
        }
        .transport-feature i {
            margin-right: 10px;
            color: #FFD800;
        }
        .transport-price {
            font-size: 22px;
            font-weight: bold;
            color: #FFD800;
            margin-top: 15px;
            text-align: right;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
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
            text-decoration: none; /* Make sure buttons with links look like buttons */
            display: inline-block;
            text-align: center;
        }
        .button:hover {
            background: #FFCC00;
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        .button.secondary {
            background: transparent;
            border: 2px solid #FFD800;
            color: #FFD800;
        }
        .button.secondary:hover {
            background: rgba(255, 216, 0, 0.1);
        }
    </style>
</head>
<body>
<br><br><br>
<div class="title">
    <h1>Transportation Options</h1>
</div>

<div class="container">
    <div class="trip-header">
        <h2><%= tripFrom != null ? tripFrom : "Undefined" %> to <%= tripTo != null ? tripTo : "Undefined" %></h2>
    </div>

    <div class="trip-info">
        <div class="info-box">
            <h3>Trip Details</h3>
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
            <h3>Travelers</h3>
            <p><strong>Number of Travelers:</strong> <%= numTravelers %></p>
            <p><strong>Traveler Type:</strong> <%= travelers != null ? travelers : "Adult" %></p>
        </div>
    </div>

    <h3 class="section-title">Select Your Transportation</h3>
    <p>Choose the transportation option that best fits your travel needs and budget.</p>

    <div class="transport-options">
        <div class="transport-card" onclick="selectTransport(this, 'flight')">
            <h3>Flight</h3>
            <p>Quick and convenient air travel to your destination.</p>
            <div class="transport-features">
                <div class="transport-feature">
                    <i>✓</i> <span>Fastest travel time</span>
                </div>
                <div class="transport-feature">
                    <i>✓</i> <span>23kg baggage allowance</span>
                </div>
                <div class="transport-feature">
                    <i>✓</i> <span>In-flight entertainment</span>
                </div>
                <div class="transport-feature">
                    <i>✓</i> <span>Meal service included</span>
                </div>
            </div>
            <div class="transport-price">$<%= String.format("%.2f", 1800 * ("Business Trip".equals(tripType) ? 1.2 : 1.0)) %></div>
        </div>

        <div class="transport-card" onclick="selectTransport(this, 'train')">
            <h3>Train</h3>
            <p>Comfortable journey with scenic views along the way.</p>
            <div class="transport-features">
                <div class="transport-feature">
                    <i>✓</i> <span>Spacious seating</span>
                </div>
                <div class="transport-feature">
                    <i>✓</i> <span>Dining car available</span>
                </div>
                <div class="transport-feature">
                    <i>✓</i> <span>Free WiFi</span>
                </div>
                <div class="transport-feature">
                    <i>✓</i> <span>Power outlets at seats</span>
                </div>
            </div>
            <div class="transport-price">$<%= String.format("%.2f", 1000 * ("Business Trip".equals(tripType) ? 1.1 : 1.0)) %></div>
        </div>

        <div class="transport-card" onclick="selectTransport(this, 'rental')">
            <h3>Rental Car</h3>
            <p>Flexibility to travel at your own pace and schedule.</p>
            <div class="transport-features">
                <div class="transport-feature">
                    <i>✓</i> <span>Unlimited mileage</span>
                </div>
                <div class="transport-feature">
                    <i>✓</i> <span>24/7 roadside assistance</span>
                </div>
                <div class="transport-feature">
                    <i>✓</i> <span>Full insurance coverage</span>
                </div>
                <div class="transport-feature">
                    <i>✓</i> <span>Free cancellation</span>
                </div>
            </div>
            <div class="transport-price">$<%= String.format("%.2f", 1200 * ("Business Trip".equals(tripType) ? 1.15 : 1.0)) %></div>
        </div>

        <div class="transport-card" onclick="selectTransport(this, 'bus')">
            <h3>Bus</h3>
            <p>Affordable transportation with scheduled routes.</p>
            <div class="transport-features">
                <div class="transport-feature">
                    <i>✓</i> <span>Economical option</span>
                </div>
                <div class="transport-feature">
                    <i>✓</i> <span>Air conditioning</span>
                </div>
                <div class="transport-feature">
                    <i>✓</i> <span>Comfortable seating</span>
                </div>
                <div class="transport-feature">
                    <i>✓</i> <span>Onboard restroom</span>
                </div>
            </div>
            <div class="transport-price">$<%= String.format("%.2f", 600 * ("Business Trip".equals(tripType) ? 1.05 : 1.0)) %></div>
        </div>
    </div>

    <div class="button-container">
        <a href="itinerary-details.jsp" class="button secondary">Back to Itinerary</a>
        <a href="confirmation.jsp" class="button">Continue to Accommodation</a>
    </div>
</div>

<script>
    let selectedTransport = null;

    function selectTransport(card, type) {
        // Remove selected class from all cards
        document.querySelectorAll('.transport-card').forEach(c => {
            c.classList.remove('selected');
        });

        // Add selected class to clicked card
        card.classList.add('selected');
        selectedTransport = type;

        // You could add additional logic here to update pricing or other details
    }
</script>

</body>
</html>

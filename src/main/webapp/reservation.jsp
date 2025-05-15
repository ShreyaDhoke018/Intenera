<%@ page import="java.util.*, org.example.TripDAO, org.example.Trip" %>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.cfg.Configuration" %>

<%
    SessionFactory sessionFactory = (SessionFactory)application.getAttribute("sessionFactory");
    if(sessionFactory == null) {
        sessionFactory = new Configuration().configure().buildSessionFactory();
        application.setAttribute("sessionFactory", sessionFactory);
    }

    TripDAO tripDAO = new TripDAO(sessionFactory);

    // Get form parameters
    String tripFrom = request.getParameter("tripFrom");

    boolean formSubmitted = tripFrom != null && !tripFrom.trim().isEmpty();

    List<Trip> trips = null;
    if(formSubmitted) {
        trips = tripDAO.findTripsByCriteria(tripFrom);
    }
%>

<!DOCTYPE html>
<jsp:include page="navbar.jsp"/>

<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Reservation</title>
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
        }
        .title h1 { font-size: 48px; margin: 0; }
        .trip-overview, .search-results {
            background: #000;
            color: #FFD800;
            padding: 20px;
            width: 90%;
            margin: 0 auto;
            border-radius: 12px;
        }
        .trip-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
        }
        .form-group { display: flex; flex-direction: column; }
        label { margin-bottom: 8px; font-weight: 600; }
        select {
            padding: 10px;
            border-radius: 6px;
            border: none;
            outline: none;
            font-size: 16px;
        }
        .button-container {
            grid-column: 1 / -1;
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        #submit {
            padding: 14px 28px;
            background: #FFD800;
            color: #1A1A1A;
            border: none;
            border-radius: 10px;
            font-size: 18px;
            cursor: pointer;
        }
        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background: #000;
            color: #FFD800;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #FFD800;
        }
        th { background: #FFD800; color: #1A1A1A; }
        tr:hover { background: rgba(255, 255, 255, 0.1); }
    </style>
</head>

<body>
<div class="title"><h1>Reservation</h1></div>

<form method="post" id="tripForm" action="reservation.jsp">
    <div class="trip-overview">
        <div class="trip-details">
            <div class="form-group">
                <label for="trip-from">From</label>
                <select name="tripFrom" id="trip-from">
                    <option value="">Select From</option>
                    <option>Mumbai</option>
                    <option>Bengaluru</option>
                    <option>Delhi</option>
                    <option>Hyderabad</option>
                    <option>Chennai</option>
                    <option>Kolkata</option>
                    <option>Pune</option>
                    <option>Ahmedabad</option>
                </select>
            </div>
        </div>

        <div class="button-container">
            <button type="submit" id="submit">Find Trips</button>
        </div>
    </div>
</form>

<% if(formSubmitted && trips != null) { %>
<div class="search-results">
    <h2>Available Trip Options</h2>

    <div class="search-summary">
        <h3>Your Search Criteria:</h3>
        <ul>
            <% if(tripFrom != null && !tripFrom.trim().isEmpty()) { %><li>From: <%= tripFrom %></li><% } %>
        </ul>
    </div>

    <table>
        <thead>
        <tr>
            <th>Trip ID</th>
            <th>From</th>
            <th>To</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Duration (Days)</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
            if(trips.size() > 0) {
                for(Trip trip : trips) {
                    long diff = (trip.getTripEndDate().getTime() - trip.getTripStartDate().getTime()) / (1000 * 60 * 60 * 24) + 1;
        %>
        <tr>
            <td><%= trip.getTripId() %></td>
            <td><%= trip.getTripFrom() %></td>
            <td><%= trip.getTripTo() %></td>
            <td><%= sdf.format(trip.getTripStartDate()) %></td>
            <td><%= sdf.format(trip.getTripEndDate()) %></td>
            <td><%= diff %></td>
            <td>
                <form action="itinerary-details.jsp" method="post">
                    <input type="hidden" name="tripId" value="<%= trip.getTripId() %>" />
                    <input type="hidden" name="tripFrom" value="<%= trip.getTripFrom() %>" />
                    <input type="hidden" name="tripTo" value="<%= trip.getTripTo() %>" />
                    <input type="hidden" name="startDate" value="<%= sdf.format(trip.getTripStartDate()) %>" />
                    <input type="hidden" name="endDate" value="<%= sdf.format(trip.getTripEndDate()) %>" />
                    <button type="submit" class="action-button">Create Itinerary</button>
                </form>
            </td>
        </tr>
        <%   }
        } else { %>
        <tr>
            <td colspan="7">No matching trips found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<% } %>

<script>
    function resetForm() {
        document.getElementById('tripForm').reset();
        window.location.href = window.location.pathname;
    }
</script>

</body>
</html>

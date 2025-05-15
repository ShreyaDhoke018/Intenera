<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    String user = (session != null) ? (String) session.getAttribute("user") : null;

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="navbar.jsp"/>
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

        /* Hero Section */
        .hero {
            position: relative;
            width: 100%;
            height: 100vh;
            text-align: center;
            color: white;
            overflow: hidden;
        }

        .hero video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        .hero-content {
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }

        .hero-content h1 {
            font-size: 3rem;
            font-weight: bold;
        }

        .hero-content p {
            font-size: 1.5rem;
            margin: 10px 0;
        }

        .hero-content .cta {
            padding: 10px 20px;
            background: #ff9800;
            color: white;
            border: none;
            font-size: 1.2rem;
            cursor: pointer;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s ease;
        }

        .hero-content .cta:hover {
            background: #e68900;
        }

        /* Scroll Function */
        .cta:focus {
            outline: none;
        }

        /* Background Slideshow */
        .container {
            position: relative;
            width: 100%;
            padding: 50px 0;
            overflow: hidden;
            height: 100vh;
            align-content: center;
        }

        .slideshow {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background-size: cover;
            background-position: center;
            animation: backgroundSlideshow 15s infinite linear;
        }

        @keyframes backgroundSlideshow {
            0% { background-image: url('assets/images/bg1.jpg'); }
            33% { background-image: url('assets/images/bg2.jpg'); }
            66% { background-image: url('assets/images/bg3.jpg'); }
            100% { background-image: url('assets/images/bg1.jpg'); }
        }

        /* Cards Section */
        .cards-container {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin: auto;
            max-width: 1100px;
            position: relative;
            z-index: 1;
        }

        .card {
            background: rgba(255, 255, 255, 0.7);
            padding: 20px;
            width: 40%;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 1rem;
            margin-bottom: 15px;
        }

        .card a {
            display: inline-block;
            padding: 10px 15px;
            background: #ff9800;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        /* Testimonials */
        .testimonial-section {
            text-align: center;
            margin-top: 50px;
            color: white;
            position: relative;
            z-index: 1;
        }

        .testimonial-container {
            max-width: 800px;
            margin: auto;
            position: relative;
            padding: 20px;
        }

        .testimonial {
            display: none;
            font-size: 1.2rem;
            padding: 20px;
            background: rgba(255, 255, 255, 0.6);
            color: #222;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .testimonial.active {
            display: block;
        }

        .author {
            font-weight: bold;
            margin-top: 10px;
            font-size: 1rem;
        }

        /* Smooth Scrolling */
        html {
            scroll-behavior: smooth;
        }
    </style>

    <script>
        function scrollToCards() {
            document.getElementById("cards").scrollIntoView({ behavior: "smooth" });
        }

        function showTestimonials() {
            let index = 0;
            const testimonials = document.querySelectorAll(".testimonial");

            function cycleTestimonials() {
                testimonials.forEach(testimonial => testimonial.classList.remove("active"));
                testimonials[index].classList.add("active");
                index = (index + 1) % testimonials.length;
            }

            cycleTestimonials();
            setInterval(cycleTestimonials, 5000);
        }

        document.addEventListener("DOMContentLoaded", showTestimonials);
    </script>
</head>
<body>

<!-- Hero Section -->
<section class="hero">
    <video autoplay loop muted>
        <source src="assets/videos/travel.mp4" type="video/mp4">
    </video>
    <div class="hero-content">
        <h1>Plan Your Perfect Trip</h1>
        <p>Custom Itineraries, Destination Guides & More</p>
        <br><br>
        <button class="cta" onclick="scrollToCards()">Get Started</button>
    </div>
</section>

<!-- Cards and Testimonials Section -->
<div class="container">
    <div class="slideshow"></div>
    <div id="cards" class="cards-container">
        <div class="card">
            <h3>Start Planning</h3>
            <p>Build your itinerary with ease.</p>
            <a href="reservation.jsp">Start Now</a>
        </div>
        <div class="card">
            <h3>Explore Destinations</h3>
            <p>Discover top places to visit.</p>
            <a href="recommended.jsp">Explore Now</a>
        </div>
    </div>

    <div class="testimonial-section">
        <div class="testimonial-container">
            <div class="testimonial active">"This website made my trip amazing!" <br> <span class="author">- Sarah</span></div>
            <div class="testimonial">"A great experience from start to finish!" <br> <span class="author">- Mark</span></div>
        </div>
    </div>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="navbar.jsp"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Itenera</title>
    <link rel="stylesheet" href="styles.css"> <!-- External CSS -->
    <style>
        /* Background with Gradient */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-image: url("assets/images/bg2.jpg");
            color: white;
            overflow-x: hidden;
        }

        /* Contact Form Container - Glassmorphism */
        .container {
            max-width: 700px;
            margin: 120px auto;
            background: rgba(255, 255, 255, 0.8);
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            backdrop-filter: blur(10px);
            text-align: center;
            padding-right: 40px;
        }

        h2 {
            color: white;
            font-size: 2rem;
        }

        .contact-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            width: 100%;
            margin: 0 auto;
        }

        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
        }

        /* Submit Button */
        .contact-form button {
            background: #ff9800;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            cursor: pointer;
            transition: 0.3s;
        }

        .contact-form button:hover {
            background: #ff5722;
            transform: scale(1.05);
        }

        /* Google Map Styling */
        .map-container {
            margin-top: 30px;
            text-align: center;
        }

        iframe {
            width: 100%;
            height: 350px;
            border-radius: 10px;
        }
    </style>
</head>
<body>

<!-- Contact Form -->
<div class="container">
    <h2>Contact Us</h2>
    <p>We'd love to hear from you! Fill out the form below to get in touch.</p>

    <form action="contactServlet" method="post" class="contact-form">
        <input type="text" name="name" placeholder="Your Name" required>
        <input type="email" name="email" placeholder="Your Email" required>
        <input type="text" name="subject" placeholder="Subject" required>
        <textarea name="message" rows="5" placeholder="Your Message" required></textarea>
        <button type="submit">Send Message</button>
    </form>

    <!-- Google Map -->
    <div class="map-container">
        <h3>Find Us Here</h3>
        <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3770.8041439277245!2d72.89498407336848!3d19.072346952090786!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c89d872d6e89%3A0x2d6190e60dcda447!2sK%20J%20Somaiya%20Institute%20of%20Management!5e0!3m2!1sen!2sin!4v1742905903517!5m2!1sen!2sin"
                allowfullscreen="" loading="lazy">
        </iframe>
    </div>
</div>

</body>
</html>

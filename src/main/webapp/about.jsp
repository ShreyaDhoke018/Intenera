<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:include page="navbar.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Smooth fade-in animation */
        .fade-in {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.8s ease-out, transform 0.8s ease-out;
        }
        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }
        .team-card img {
            width: 200px;
            height: 250px;
            object-fit: cover;
            clip-path: ellipse(50% 60% at center);
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-900">

<!-- Hero Section -->
<section class="relative bg-cover bg-center h-[400px] flex items-center justify-center text-white"
         style="background-image: url('https://source.unsplash.com/1600x900/?team,office');">
    <div class="absolute inset-0 bg-black opacity-50"></div>
    <div class="relative z-10 text-center">
        <h1 class="text-4xl font-bold">About Us</h1>
        <p class="text-lg mt-2">Building a better future, together.</p>
    </div>
</section>

<!-- Mission & Vision Section -->
<section class="container mx-auto px-6 py-16 text-center fade-in">
    <h2 class="text-3xl font-semibold mb-4">Our Mission</h2>
    <p class="text-lg text-gray-600">To empower businesses with innovative technology solutions that drive success.</p>

    <h2 class="text-3xl font-semibold mt-10 mb-4">Our Vision</h2>
    <p class="text-lg text-gray-600">To be a global leader in digital transformation, making a meaningful impact.</p>
</section>

<!-- Team Section -->
<section class="container mx-auto px-6 py-16">
    <h2 class="text-3xl font-semibold text-center mb-10">Meet Our Team</h2>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <%
            class TeamMember {
                String name, role, img;
                TeamMember(String name, String role, String img) {
                    this.name = name;
                    this.role = role;
                    this.img = img;
                }
            }

            List<TeamMember> team = Arrays.asList(
                    new TeamMember("Shreya Dhoke", "Team Member", request.getContextPath() + "/assets/images/shreya.jpg"),
                    new TeamMember("Ajil Renji George", "Team Member", request.getContextPath() + "/assets/images/ajil.jpg"),
                    new TeamMember("Ryan DSouza", "Team Member", request.getContextPath() + "/assets/images/ryan.jpg")
            );

            for (TeamMember member : team) {
        %>
        <div class="text-center bg-white p-6 rounded-lg shadow-md fade-in">
            <img src="<%= member.img %>" alt="Team Member" class="mx-auto rounded-full mb-4">
            <h3 class="text-xl font-semibold"><%= member.name %></h3>
            <p class="text-gray-500"><%= member.role %></p>
        </div>
        <% } %>
    </div>
</section>

<!-- Smooth Scroll Animation -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const elements = document.querySelectorAll(".fade-in");
        const observer = new IntersectionObserver(entries => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add("visible");
                }
            });
        }, { threshold: 0.2 });

        elements.forEach(element => observer.observe(element));
    });
</script>

</body>
</html>

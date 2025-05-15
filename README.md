# ✈️ Itenera 🗺️
## 🌟 Overview
**Itenera** is a web application that helps users plan their trips effortlessly. Users select their **start destination**, then receive a variety of available trips to choose from. Each trip shows **dates** and **duration**, and once a trip is selected, a **detailed itinerary** is displayed.

Users can customize their experience by changing **accommodation and transport** options, with the **total bill dynamically updated** to reflect these choices. When ready, clicking Book Now confirms the booking and displays the booking details.

This project is built using **JSP, Servlets, and Hibernate,** demonstrating a Java EE web application with smooth database integration.

## 🚀 Features
📍 Select start destination to view multiple available trips

📅 Trip details include dates and duration for easy planning

📝 View detailed itineraries for selected trips

🏨 Customize accommodation and 🚗 transport options

💰 Dynamic billing updates reflecting chosen options

✅ Book trips and see confirmed booking information immediately

## 🛠️ Technologies Used
🖥️ Java Server Pages (JSP)

🔄 Java Servlets

🐘 Hibernate ORM (for database interactions)

🐬 MySQL

🌟 Apache Tomcat 

 📦 Maven 


## 🚦 Getting Started
🧾 Prerequisites

☕ JDK 20 or higher (used is 23)

🔥 Apache Tomcat server (version 10)

🐬 MySQL (Php MySQL)

📦 Maven 


## 🔧 Installation & Setup
1) Clone the repository

bash
Copy
Edit
git clone this repository
cd travel-itinerary-generator


2) Configure Database

🛠️ Create a database (user_db) in MySQL and import the sql file.

✍️ Update your Hibernate configuration file (hibernate.cfg.xml) with your database credentials and settings.

3) Build and Deploy

If using Maven:

bash
Copy
Edit
mvn clean package
Deploy the generated WAR file (target/Travel-1.0-SNAPSHOT.war) to your Tomcat webapps folder.

If manual, compile your source code and place the compiled classes and JSPs into Tomcat's webapps directory as per your project structure.

4) Run the application

▶️ Start Tomcat server, click on restart server it will automatically open the website on browser.


## 🛠️ Important Note:
- There are only **few itinerary available in database**, choose a trip which has **one of the listed destination** place:
[pune, pondicherry, jaipur, udaipur, goa, shimla, leh, agra]
- By default registering through the first page will have **role** as **user**

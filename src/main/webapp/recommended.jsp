<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, org.example.Recommendation" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<jsp:include page="navbar.jsp"/>
<html>
<head>
    <title>Recommendations</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
<br><br><br>
<div class="main_title">
    <h1>Recommended Trips</h1>
</div>

<div class="container">
    <!-- Left Part -->
    <div class="left_part">
        <div class="head"></div>
        <div class="info"></div>
        <div class="next_btn">
            <button id="next" class="btn">Next</button>
        </div>
    </div>

    <!-- Right Part -->
    <div class="right_part">
        <div class="rec_img fade"><img src="" id="image1" alt="image1"/></div>
        <div class="rec_img fade"><img src="" id="image2" alt="image2"/></div>
        <div class="rec_img fade"><img src="" id="image3" alt="image3"/></div>
        <div class="rec_img fade"><img src="" id="image4" alt="image4"/></div>
    </div>
</div>

<!-- JavaScript population using Hibernate data -->
<script>
    let head_list = [];
    let info_list = [];
    let image1_list = [];
    let image2_list = [];
    let image3_list = [];
    let image4_list = [];
</script>

<%
    Configuration config2 = new Configuration().configure();
    SessionFactory sf = config2.buildSessionFactory();
    Session session2 = sf.openSession();
    String query = "from Recommendation where id > 0";
    List<Recommendation> recommendations = session2.createQuery(query, Recommendation.class).getResultList();

    if (recommendations != null) {
        for (Recommendation rec : recommendations) {
%>
<script>
    head_list.push(`<%= rec.getHead().replaceAll("\"", "\\\\\"") %>`);
    info_list.push(`<%= rec.getInfo().replaceAll("\"", "\\\\\"") %>`);
    image1_list.push("<%= rec.getImage1() %>");
    image2_list.push("<%= rec.getImage2() %>");
    image3_list.push("<%= rec.getImage3() %>");
    image4_list.push("<%= rec.getImage4() %>");
</script>
<%
        }
    }
    session2.close();
    sf.close();
%>


<script>
    let currentIndex = 0;

    function showNext() {
        document.getElementsByClassName("head")[0].innerHTML = head_list[currentIndex];
        document.getElementsByClassName("info")[0].innerHTML = info_list[currentIndex];
        document.getElementById("image1").src = image1_list[currentIndex];
        document.getElementById("image2").src = image2_list[currentIndex];
        document.getElementById("image3").src = image3_list[currentIndex];
        document.getElementById("image4").src = image4_list[currentIndex];

        currentIndex = (currentIndex + 1) % head_list.length;
    }

    document.getElementById("next").addEventListener("click", showNext);
    showNext(); // Initial load
</script>

<!-- Slideshow script -->
<script>
    let slideIndex = 0;
    function showSlides() {
        let slides = document.getElementsByClassName("rec_img");
        for (let i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex = (slideIndex + 1 > slides.length) ? 1 : slideIndex + 1;
        slides[slideIndex - 1].style.display = "block";
        setTimeout(showSlides, 2500);
    }
    showSlides();
</script>

</body>
</html>

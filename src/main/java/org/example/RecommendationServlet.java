package org.example;

import jakarta.servlet.annotation.WebServlet;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;  // Import the Query class from Hibernate
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.util.List; // Import the List class from Java

@WebServlet("/insertRecommendation")
public class RecommendationServlet extends HttpServlet {

    private static SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String head = req.getParameter("head");
        String info = req.getParameter("info");
        String image1 = req.getParameter("image1");
        String image2 = req.getParameter("image2");
        String image3 = req.getParameter("image3");
        String image4 = req.getParameter("image4");

        try {
            boolean inserted = insertRecord(head, info, image1, image2, image3, image4);

            // If inserted successfully, redirect to prevent multiple form submissions
            if (inserted) {
                resp.sendRedirect("recommended_admin.jsp");
            } else {
                // You can add a failure message here if needed
                req.setAttribute("errorMessage", "Recommendation with the same title already exists.");
                req.getRequestDispatcher("/addRecommendation.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error while inserting recommendation.");
        }
    }

    private boolean insertRecord(String head, String info, String image1, String image2, String image3, String image4) {
        Session session = null;
        Transaction tx = null;
        boolean isInserted = false;

        try {
            session = sessionFactory.openSession();
            tx = session.beginTransaction();

            // Check if the recommendation already exists based on the 'head'
            String hql = "FROM Recommendation WHERE head = :head";
            Query<Recommendation> query = session.createQuery(hql, Recommendation.class);
            query.setParameter("head", head);
            List<Recommendation> existingRecommendations = query.list();

            if (existingRecommendations.isEmpty()) {
                // No existing recommendation found, so insert a new one
                Recommendation r = new Recommendation();
                r.setHead(head);
                r.setInfo(info);
                r.setImage1(image1);
                r.setImage2(image2);
                r.setImage3(image3);
                r.setImage4(image4);

                session.persist(r);
                tx.commit();
                isInserted = true;
            } else {
                System.out.println("Recommendation with this title already exists.");
            }

        } catch (Exception e) {
            if (tx != null) {
                tx.rollback(); // Rollback in case of an error
            }
            e.printStackTrace();
            throw new RuntimeException("Error while inserting recommendation", e);
        } finally {
            if (session != null) {
                session.close(); // Close session to release resources
            }
        }

        return isInserted;
    }

    @Override
    public void destroy() {
        if (sessionFactory != null) {
            sessionFactory.close(); // Close SessionFactory when servlet is destroyed
        }
    }
}


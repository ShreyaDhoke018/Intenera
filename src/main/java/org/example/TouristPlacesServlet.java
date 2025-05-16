package org.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.io.IOException;

@WebServlet("/addTouristPlaces")
public class TouristPlacesServlet extends HttpServlet {
    private static final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String place = req.getParameter("place");

        // Collect tourist places from the form
        String touristPlace1 = req.getParameter("tourist_place1");
        String touristPlace2 = req.getParameter("tourist_place2");
        String touristPlace3 = req.getParameter("tourist_place3");
        String touristPlace4 = req.getParameter("tourist_place4");
        String touristPlace5 = req.getParameter("tourist_place5");
        String touristPlace6 = req.getParameter("tourist_place6");
        String touristPlace7 = req.getParameter("tourist_place7");
        String touristPlace8 = req.getParameter("tourist_place8");
        String touristPlace9 = req.getParameter("tourist_place9");
        String touristPlace10 = req.getParameter("tourist_place10");

        // Create a Tourist_Places object
        Tourist_Places touristPlaces = new Tourist_Places();
        touristPlaces.setPlace(place);
        touristPlaces.setTourist_place1(touristPlace1);
        touristPlaces.setTourist_place2(touristPlace2);
        touristPlaces.setTourist_place3(touristPlace3);
        touristPlaces.setTourist_place4(touristPlace4);
        touristPlaces.setTourist_place5(touristPlace5);
        touristPlaces.setTourist_place6(touristPlace6);
        touristPlaces.setTourist_place7(touristPlace7);
        touristPlaces.setTourist_place8(touristPlace8);
        touristPlaces.setTourist_place9(touristPlace9);
        touristPlaces.setTourist_place10(touristPlace10);

        // Insert the record into the database
        boolean isInserted = insertTouristPlaces(touristPlaces);

        // Redirect or forward based on the insertion result
        if (isInserted) {
            resp.sendRedirect("add_tourist_places.jsp");
        } else {
            req.setAttribute("errorMessage", "Failed to add tourist places.");
            req.getRequestDispatcher("add_tourist_places.jsp").forward(req, resp);
        }
    }

    private boolean insertTouristPlaces(Tourist_Places touristPlaces) {
        Session session = null;
        Transaction tx = null;
        boolean isInserted = false;

        try {
            session = sessionFactory.openSession();
            tx = session.beginTransaction();

            // Persist the Tourist_Places object
            session.persist(touristPlaces);
            tx.commit();
            isInserted = true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return isInserted;
    }

    @Override
    public void destroy() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
}

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
import org.hibernate.query.Query;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/addTrip")
public class TripServlet extends HttpServlet {
    private static SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tripFrom = req.getParameter("tripFrom");
        String tripTo = req.getParameter("tripTo");
        String tripStartDateStr = req.getParameter("tripStartDate");
        String tripEndDateStr = req.getParameter("tripEndDate");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try{
            Date tripStartDate = dateFormat.parse(tripStartDateStr);
            Date tripEndDate = dateFormat.parse(tripEndDateStr);

            boolean inserted = insertRecord(tripFrom, tripTo, tripStartDate, tripEndDate);

            // If inserted successfully, redirect to prevent multiple form submissions
            if (inserted) {
                resp.sendRedirect("add_trip.jsp");
            } else {
                // You can add a failure message here if needed
                req.setAttribute("errorMessage", "Trip with the same details already exists.");
                req.getRequestDispatcher("/add_trip.jsp").forward(req, resp);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public boolean insertRecord(String tripFrom, String tripTo, Date tripStartDate, Date tripEndDate){
        Session session = null;
        Transaction tx = null;
        boolean isInserted = false;

        try {
            session = sessionFactory.openSession();
            tx = session.beginTransaction();

            String hql = "FROM Trip WHERE tripFrom = :tripFrom AND tripTo = :tripTo AND tripStartDate = :tripStartDate AND tripEndDate = :tripEndDate";
            Query<Trip> query = session.createQuery(hql, Trip.class);
            query.setParameter("tripFrom", tripFrom);
            query.setParameter("tripTo", tripTo);
            query.setParameter("tripStartDate", tripStartDate);
            query.setParameter("tripEndDate", tripEndDate);

            List<Trip> existingTrips = query.list();

            if (existingTrips.isEmpty()) {
                // No existing trip found, so insert a new one
                Trip trip = new Trip(tripFrom, tripTo, tripStartDate, tripEndDate);
                session.persist(trip);
                tx.commit();
                isInserted = true;
            } else {
                System.out.println("Trip with these details already exists.");
            }

        } catch (Exception e) {
            if (tx != null) {
                tx.rollback(); // Rollback in case of an error
            }
            e.printStackTrace();
            throw new RuntimeException("Error while inserting trip", e);
        } finally {
            if (session != null) {
                session.close(); // Close session to release resources
            }
        }
        return isInserted;
    }
}

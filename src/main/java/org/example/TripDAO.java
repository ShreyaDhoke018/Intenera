package org.example;


import org.example.Trip;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.*;

public class TripDAO {

    private final SessionFactory sessionFactory;

    public TripDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Trip> findTripsByCriteria(String tripFrom) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Trip WHERE tripFrom = :tripFrom";
            Query<Trip> query = session.createQuery(hql, Trip.class);
            query.setParameter("tripFrom", tripFrom);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

}

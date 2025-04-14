package com.abhishek.kumar.service;

import com.abhishek.kumar.model.Event;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class EventsServices {
    public static final SessionFactory factory;

    static {
        factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Event.class).buildSessionFactory();
    }

    public static List<Event> getEvents() {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        List<Event> events = session.createQuery("from Event", Event.class).getResultList();
        transaction.commit();
        return events;
    }
}

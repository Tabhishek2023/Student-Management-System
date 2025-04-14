package com.abhishek.kumar.service;

import com.abhishek.kumar.model.Grade;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.util.List;


public class GradesService {
    public static final SessionFactory factory;

    static {
        factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Grade.class).buildSessionFactory();
    }

    public static List<Grade> getAllGrades() {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        List<Grade> grades = session.createQuery("from Grade" , Grade.class).getResultList();
        transaction.commit();
        return grades;
    }
}

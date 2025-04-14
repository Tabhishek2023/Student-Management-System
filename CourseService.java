package com.abhishek.kumar.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.abhishek.kumar.model.Course;
import java.util.List;


import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class CourseService {

    public static final SessionFactory factory;

    static {
        factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Course.class).buildSessionFactory();

    }

    public static List<Course> getAllCourse() {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        List<Course> courselist = session.createQuery("from Course", Course.class).getResultList();
        transaction.commit();
        return courselist;
    }
}

package com.abhishek.kumar.service;

import com.abhishek.kumar.model.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;


public class StudentService {
    private static final SessionFactory factory;

    static {
        factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Student.class).buildSessionFactory();
    }

    public static void saveStudents(Student student) {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.persist(student);
        transaction.commit();
    }

    public static String loginStudent(String username, String password) {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("from Student where username = :username");
        query.setParameter("username", username);
        Student student = (Student) query.uniqueResult();
        if (student == null) {
            return "kindly register yourself";
        }

        if (!password.equals(student.getPassword())) {
            return "incorrect password";
        }
        transaction.commit();
        return "success";
    }

    public static Student getStudent(String username) {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("from Student where username = :username");
        query.setParameter("username", username);
        Student student = (Student) query.uniqueResult();
        transaction.commit();
        return student;
    }

    public static List<Student> getAllStudents() {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        List<Student> students = session.createQuery("from Student" , Student.class).getResultList();
        transaction.commit();
        return students;
    }

    public static Student getStudentById(int StudentId) {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        Student student = session.get(Student.class, StudentId);
        transaction.commit();
        return student;
    }

    public static void updateStudent(int id, String name, String email) {
        Transaction transaction = null;
        try (Session session = factory.getCurrentSession()) {
            transaction = session.beginTransaction();
            Student student = session.get(Student.class, id);
            if (student != null) {
                student.setName(name);
                student.setEmail(email);
                session.merge(student);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }

    public static void deleteStudent(int studentId) {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        Student student = session.get(Student.class, studentId);
        session.remove(student);
        transaction.commit();
    }

}

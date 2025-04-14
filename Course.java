package com.abhishek.kumar.model;

import javax.persistence.*;

@Entity
@Table(name = "courses")
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String title;
    private String instructor;
    private int credits;

    // Constructor
    public Course(int id, String title, String instructor, int credits) {
        this.id = id;
        this.title = title;
        this.instructor = instructor;
        this.credits = credits;
    }

    public Course() {

    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getInstructor() {
        return instructor;
    }

    public int getCredits() {
        return credits;
    }
}


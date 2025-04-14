package com.abhishek.kumar.model;


import javax.persistence.*;

@Entity
@Table(name = "adminTable")
public class Admin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int admin_id;
    String admin_name;
    String admin_password;
    String admin_email;

   public Admin() {
    }

    public Admin(int admin_id, String admin_name, String admin_password, String admin_email) {
        this.admin_id = admin_id;
        this.admin_name = admin_name;
        this.admin_password = admin_password;
        this.admin_email = admin_email;
    }


    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    public String getAdmin_email() {
        return admin_email;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }
}

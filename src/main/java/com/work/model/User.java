package com.work.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import java.util.Date;

@Table(name = "work_user")
public class User {
    @Id
    private int u_id;

    @Length(max = 20)
    @Column(length = 20)
    private String username;

    @Length(max = 20)
    @Column(length = 20)
    private String name;
    private String password;
    private String sex;

    @Pattern(regexp = "^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\\d{8})$")
    @Length(max = 11)
    private String phone;

    @Email
    @Length(max = 200)
    @Column(length = 200)
    private String email;
    private Date date;
    private String introduction;
    private String address;

    @Override
    public String toString() {
        return "User{" +
                "u_id=" + u_id +
                ", username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", date=" + date +
                ", introduction='" + introduction + '\'' +
                '}';
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {

        return address;
    }
    public void setName(String name) {
        this.name = name;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public int getU_id() {
        return u_id;
    }

    public Date getDate() {
        return date;
    }

    public String getEmail() {
        return email;
    }

    public String getIntroduction() {
        return introduction;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getPhone() {
        return phone;
    }

    public String getSex() {
        return sex;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}

package com.minsiyao.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class User {
    private String id;
    private String name;
    private String password;
    private Integer age;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss",timezone = "GMT+8")
    private Date birthday;
    private String mobile;
    private String status;

//    @Override
//    public String toString() {
//        return "UserDao{" +
//                "id='" + id + '\'' +
//                ", name='" + name + '\'' +
//                ", password='" + password + '\'' +
//                ", age=" + age +
//                ", birthday=" + birthday +
//                ", mobile='" + mobile + '\'' +
//                ", status='" + status + '\'' +
//                '}';
//    }
//
//    public String getId() {
//        return id;
//    }
//
//    public void setId(String id) {
//        this.id = id;
//    }
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }
//
//    public Integer getAge() {
//        return age;
//    }
//
//    public void setAge(Integer age) {
//        this.age = age;
//    }
//
//    public Date getBirthday() {
//        return birthday;
//    }
//
//    public void setBirthday(Date birthday) {
//        this.birthday = birthday;
//    }
//
//    public String getMobile() {
//        return mobile;
//    }
//
//    public void setMobile(String mobile) {
//        this.mobile = mobile;
//    }
//
//    public String getStatus() {
//        return status;
//    }
//
//    public void setStatus(String status) {
//        this.status = status;
//    }
//
//    public User(String id, String name, String password, Integer age, Date birthday, String mobile, String status) {
//        this.id = id;
//        this.name = name;
//        this.password = password;
//        this.age = age;
//        this.birthday = birthday;
//        this.mobile = mobile;
//        this.status = status;
//    }
//
//    public User() {
//    }
}

package com.minsiyao.service;

import com.minsiyao.entity.Paging;
import com.minsiyao.entity.User;

import java.util.List;

public interface UserService {
    public void addUser(User user);
    public List<User> queryAll();
    public List<User> fuzzyQuery(User user);
    public void deleteUser(String id);
    public void updateUser(User user);
    public User selectById(String id);
    public Paging pagingQuery(Integer page);
    public Integer queryRecords();
}

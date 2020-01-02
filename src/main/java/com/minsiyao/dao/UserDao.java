package com.minsiyao.dao;

import com.minsiyao.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    public void insert(User user);
    public List<User> selectAll();
    public List<User> fuzzyQuery(User user);
    public void deleteById(String id);
    public void update(User user);
    public User selectById(String id);
    public List<User> pagingSelect(@Param("start") Integer start, @Param("lineNum") Integer lineNum);
    public Integer selectRecords();
}

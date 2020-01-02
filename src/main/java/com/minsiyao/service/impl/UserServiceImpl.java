package com.minsiyao.service.impl;

import com.minsiyao.dao.UserDao;
import com.minsiyao.entity.Paging;
import com.minsiyao.entity.User;
import com.minsiyao.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao ud;
//查询所有
    @Override
    @Transactional(propagation = Propagation.SUPPORTS )
    public List<User> queryAll() {
        return ud.selectAll();
    }
//查询总条数
    @Override
    public Integer queryRecords() {
        return ud.selectRecords();
    }

    //分页查询
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Paging pagingQuery(Integer page) {
        Paging paging = new Paging();
        paging.setPage(page);
        Integer start = (page-1)*5;
        List<User> users = ud.pagingSelect(start,5);
        paging.setRows(users);
        return paging;
    }

    //修改用户信息
    @Override
    public void updateUser(User user) {
        ud.update(user);
    }
//通过id查询用户
    @Override
    @Transactional(propagation = Propagation.SUPPORTS )
    public User selectById(String id) {
        return ud.selectById(id);
    }

    //根据id删除
    @Override
    public void deleteUser(String id) {
        ud.deleteById(id);
    }
//模糊查询
    @Override
    @Transactional(propagation = Propagation.SUPPORTS )
    public List<User> fuzzyQuery(User user) {
        return ud.fuzzyQuery(user);
    }

    @Override
    public void addUser(User user) {
        ud.insert(user);
    }
/*-------------get、set方法------------------*/
    public UserDao getUd() {
        return ud;
    }

    public void setUd(UserDao ud) {
        this.ud = ud;
    }
}

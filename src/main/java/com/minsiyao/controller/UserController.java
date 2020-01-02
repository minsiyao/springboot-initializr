package com.minsiyao.controller;

import com.minsiyao.entity.Paging;
import com.minsiyao.entity.User;
import com.minsiyao.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("User")
public class UserController {
    @Resource
    private UserService us;
//    分页查询
    @ResponseBody
    @RequestMapping("pagingQuery")
    public Paging pagingQuery(Integer page){
        Paging paging = us.pagingQuery(page);
        Integer records = us.queryRecords();
        paging.setRecords(records);
        return paging;
    }
//    添加用户
    @ResponseBody
    @RequestMapping("addUser")
    public void addUser(User user){
        String id = UUID.randomUUID().toString();
        user.setId(id);
        us.addUser(user);
    }
//    查询所有
    @ResponseBody
    @RequestMapping("queryAll")
    public List<User> queryAll(){
        return us.queryAll();
    }
//    模糊查询
    @ResponseBody
    @RequestMapping("fuzzyQuery")
    public List<User> fuzzyQuery(User user){
        return us.fuzzyQuery(user);
    }
//    通过id删除用户
    @ResponseBody
    @RequestMapping("deleteUser")
    public void deleteUser(String id){
        us.deleteUser(id);
    }
//    修改用户信息
    @ResponseBody
    @RequestMapping("updateUser")
    public void updateUser(User user){
        System.out.println(user);
        us.updateUser(user);
    }
//    通过id查询用户
    @ResponseBody
    @RequestMapping("selectById")
    public User selectById(String id){
        return us.selectById(id);
    }
//    增、删、改3连击
    @ResponseBody
    @RequestMapping("edit")
    public void edit(User user,String oper){
        System.out.println("user========"+user);
        if("add".equals(oper)){
            String id = UUID.randomUUID().toString();
            user.setId(id);
            us.addUser(user);
        }else if("edit".equals(oper)){
            us.updateUser(user);
        }else if("del".equals(oper)){
            us.deleteUser(user.getId());
        }

    }
}

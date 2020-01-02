package com.minsiyao;

import com.minsiyao.dao.TestDao;
import com.minsiyao.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest(classes = App.class)
@RunWith(SpringRunner.class)
public class Test1 {
    @Autowired
    private TestDao adminDao;
    @Autowired
    private UserService us;
    @Test
    public void name() {
        System.out.println(us.queryAll());
    }
}

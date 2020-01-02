package com.minsiyao.service.impl;

import com.minsiyao.dao.TestDao;
import com.minsiyao.entity.User;
import com.minsiyao.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TestServiceImpl implements TestService {
    @Autowired
    private TestDao td;
    @Override
    public List<User> selectAll() {
        return td.selectAll();
    }
}

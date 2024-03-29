package com.awesome.web;

import com.awesome.web.base.dao.UserMapper;
import com.awesome.web.base.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AwesomeApplicationTests {

	@Autowired
	public UserMapper userMapper;

	@Test
	public void contextLoads() {
		List<User> userList =userMapper.getAll();
		System.out.println(userList.size());
	}

}

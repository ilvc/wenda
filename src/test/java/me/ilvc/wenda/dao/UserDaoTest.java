package me.ilvc.wenda.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import me.ilvc.wenda.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		{"classpath:spring-context.xml",
		"classpath:spring-mvc.xml"})
public class UserDaoTest {

	@Autowired
	private UserDao userDao;
	
	@Test
	public void testGetById(){
		System.out.println(userDao.getById(10001) + "");
		
	}

	@Test 
	public void testFindUser(){
		User user = new  User();
		user.setUsername("lvc");
		System.out.println("rsult:"+ userDao.findUser(user));
	}
	
}

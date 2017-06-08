package me.ilvc.wenda.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.ilvc.wenda.dao.UserDao;
import me.ilvc.wenda.model.User;
import me.ilvc.wenda.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public <T> T getById(int id) {
		// TODO Auto-generated method stub
		return userDao.getById(id);
	}

	@Override
	public <T> List<T> listAll(T t) {
		// TODO Auto-generated method stub
		return userDao.listAll(t);
	}

	@Override
	public int countAll() {
		// TODO Auto-generated method stub
		return userDao.countAll();
	}

	@Override
	public <T> int insert(T t) {
		// TODO Auto-generated method stub
		return userDao.insert(t);
	}

	@Override
	public <T> int update(T t) {
		// TODO Auto-generated method stub
		return userDao.update(t);
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return userDao.delete(id);
	}

	@Override
	public List<User> countAnswer2user() {
		// TODO Auto-generated method stub
		return userDao.countAnswer2user();
	}

	@Override
	public User findUser(User user) {
		// TODO Auto-generated method stub
		return userDao.findUser(user);
	}

	
}

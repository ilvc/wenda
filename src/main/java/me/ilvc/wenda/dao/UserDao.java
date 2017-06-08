package me.ilvc.wenda.dao;

import java.util.List;

import me.ilvc.wenda.model.User;

public interface UserDao extends BaseDao {
	
    List<User>  countAnswer2user();
    User findUser(User user);
}
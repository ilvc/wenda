package me.ilvc.wenda.service;

import java.util.List;

import me.ilvc.wenda.model.User;

public interface UserService extends BaseService{

	 List<User>  countAnswer2user();
	 User findUser(User user);
}

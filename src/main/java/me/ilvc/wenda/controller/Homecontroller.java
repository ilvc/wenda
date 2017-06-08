package me.ilvc.wenda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import me.ilvc.wenda.model.User;
import me.ilvc.wenda.service.UserService;

@Controller
public class Homecontroller {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/u/{username}")
	public ModelAndView uHome(@PathVariable("username") String username){
		ModelAndView mad = new ModelAndView();
		mad.addObject("homeUser", userService.findUser(new User(null,username,null)));
		System.out.println("homeUser"+userService.findUser(new User(null,username,null)));
		mad.setViewName("/user/home");		
		return mad;
	}
}

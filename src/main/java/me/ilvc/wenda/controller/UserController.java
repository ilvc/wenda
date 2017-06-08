package me.ilvc.wenda.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import me.ilvc.wenda.model.User;
import me.ilvc.wenda.service.UserService;
import me.ilvc.wenda.util.DESUtil;



@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	

	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String userLogin(){
		ModelAndView mad = new ModelAndView();
		
		mad.setViewName("/user/login");		
		return "/user/login";
	}
	
	@RequestMapping(value="/index",method=RequestMethod.POST)
	public ModelAndView userLoginPost(User user,HttpServletRequest request){
		ModelAndView mad = new ModelAndView();
		HttpSession session = request.getSession();
		mad.addObject("pageType", "index");
		User currentUser =userService.findUser(user);
		if(currentUser!=null){
			mad.setViewName("/user/index");	
			session.setAttribute("currentUser", currentUser);
		}else{
			mad.setViewName("redirect:/user/login");
		}
			
		return mad;
	}
	
	@RequestMapping(value="/reg",method=RequestMethod.GET)
	public ModelAndView regViewUser(){
		ModelAndView mad = new ModelAndView();
		
		mad.setViewName("/user/reg");		
		return mad;
	} 
	
	@RequestMapping(value="/registered",method=RequestMethod.POST)
	public ModelAndView regUser(User user,HttpServletRequest request){
		ModelAndView mad = new ModelAndView();
		String username = request.getParameter("username");
		userService.insert(user);
		request.getSession().setAttribute("currentUser",userService.findUser(user) );
		mad.setViewName("redirect:/user/index");		
		return mad;
	} 
	
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public ModelAndView logoutUser(HttpSession session){
		ModelAndView mad = new ModelAndView();
		session.removeAttribute("currentUser");
		mad.setViewName("redirect:/index");		
		return mad;
	} 
	
	@RequestMapping(value="/set",method=RequestMethod.GET)
	public ModelAndView baseSettingUser(HttpSession session){
		ModelAndView mad = new ModelAndView();
		User currentUser = (User) session.getAttribute("currentUser");
		mad.setViewName("/user/set");		
		mad.addObject("pageType", "set");
		return mad;
	} 
	
	@RequestMapping(value="/set/base",method=RequestMethod.GET)
	public ModelAndView baseSet(User user,HttpServletRequest request){
		ModelAndView mad = new ModelAndView();
		userService.update(user);
		request.getSession().setAttribute("currentUser",userService.findUser(user));
		//mad.setViewName("/user/set");		
		return null;
	} 
	
	@RequestMapping(value={"/index"},method=RequestMethod.GET)
	public ModelAndView index2User(){
		ModelAndView mad = new ModelAndView();
		mad.addObject("pageType", "index");
		mad.setViewName("/user/index");		
		return mad;
	} 
	
	
	@RequestMapping(value={"/message"},method=RequestMethod.GET)
	public ModelAndView message2User(){
		ModelAndView mad = new ModelAndView();
		mad.addObject("pageType", "message");
		mad.setViewName("/user/message");		
		return mad;
	} 
	
	@RequestMapping(value={"/activate"},method=RequestMethod.GET)
	public ModelAndView activate2User(HttpSession session){
		ModelAndView mad = new ModelAndView();
		//mad.addObject("pageType", "message");
		
		User currentUser = (User) session.getAttribute("currentUser");
		mad.addObject("md5",DESUtil.getMD5(currentUser.getUid().toString()));
		mad.setViewName("/user/activate");		
		return mad;
	} 
	
	@SuppressWarnings("unused")
	@RequestMapping(value={"/activate/{md5Id}"},method=RequestMethod.GET)
	public ModelAndView activatemd5Id2User(@PathVariable("md5Id") String md5Id,HttpSession session){
		ModelAndView mad = new ModelAndView();
		//mad.addObject("pageType", "message");
		
		User currentUser = (User) session.getAttribute("currentUser");
		int id =currentUser.getUid();
		
		if(currentUser==null){
			mad.setViewName("redirect:user/login");		
		}else{
			if(md5Id.equals(DESUtil.getMD5(currentUser.getUid().toString()))){
				currentUser.setIsActivate(1);
				userService.update(currentUser);
				session.setAttribute("currentUser", userService.getById(id));
				mad.setViewName("/user/activate");		
			}else{
				mad.setViewName("redirect:user/login");	
			}
		}
		
		
		return mad;
	} 
	
	
}

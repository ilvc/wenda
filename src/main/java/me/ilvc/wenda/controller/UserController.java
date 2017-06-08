package me.ilvc.wenda.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import me.ilvc.wenda.dao.VerificationDao;
import me.ilvc.wenda.dto.EmailResult;
import me.ilvc.wenda.model.User;
import me.ilvc.wenda.service.UserService;
import me.ilvc.wenda.util.DESUtil;
import me.ilvc.wenda.util.EmailUtils;
import me.ilvc.wenda.util.ResponseUtil;



@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private VerificationDao verificationDao;

	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String userLogin(){
		ModelAndView mad = new ModelAndView();
		mad.addObject("verification", verificationDao.getById((int)(Math.random()*verificationDao.countAll()+1)));
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
		mad.addObject("verification", verificationDao.getById((int)(Math.random()*verificationDao.countAll()+1)));
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
	public ModelAndView activate2User(HttpSession session,HttpServletResponse response){
		ModelAndView mad = new ModelAndView();
		//mad.addObject("pageType", "message");
		
		User currentUser = (User) session.getAttribute("currentUser");
		mad.addObject("md5",DESUtil.getMD5(currentUser.getUid().toString()));
		mad.setViewName("/user/activate");
		
		EmailResult result = new EmailResult();
		result.setToEmail("328097822@qq.com");
		result.setSubject("请激活您的邮箱");
		result.setContext("尊敬的"+currentUser.getUsername()+"：\n"
				+ "   您好，我们收到了您的申请，现在请确认您的帐号。\n"
				+ "===========================================================\n"
				+ currentUser.getEmail()+"\n"
				+ "===========================================================\n"
				+ "如果该帐号是您申请的, 请点击以下链接进行确认，否则请不要点击:\n"
				+ "http://localhost:8080/wenda/user/activate/"+DESUtil.getMD5(currentUser.getUid().toString())
				+ "\n本邮件由系统自动发出，请勿回复。\n"
				+ "感谢您的使用。"+
				"iLvc社区");
		
		String code;
		try {
			EmailUtils.sendEmail(result);
			code="1";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			code="0";
		}
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

package me.ilvc.wenda.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import me.ilvc.wenda.dto.EmailResult;
import me.ilvc.wenda.model.User;
import me.ilvc.wenda.service.UserService;
import me.ilvc.wenda.util.DESUtil;
import me.ilvc.wenda.util.EmailUtils;
import me.ilvc.wenda.util.ResponseUtil;

@Controller
@RequestMapping("/ajax")
public class AjaxController {

	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping(value={"/username"},method=RequestMethod.GET)
	public ModelAndView ajaxusername(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		String  username1 = request.getParameter("username");
		System.out.println("username:"+username1);
		User user = new User();
		user.setUsername(username1);
		String msg;
		if(userService.findUser(user)!=null || username1=="" || username1==null){
			mav.addObject("msg", "用户名不可用");
			 msg ="用户名不可用";
		}else{
			mav.addObject("msg", "用户名可用");
			 msg ="用户名可用";
		}
		System.out.println("数据！");
		try {
			ResponseUtil.write(msg, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@ResponseBody
	@RequestMapping(value={"/activate"},method=RequestMethod.GET)
	public ModelAndView ajaxEmail(HttpServletRequest request,HttpServletResponse response){
		
		User currentUser = (User) request.getSession().getAttribute("currentUser");
		
		EmailResult result = new EmailResult();
		result.setToEmail("328097822@qq.com");
		result.setSubject("请激活您的邮箱");
		result.setContext("尊敬的用户："+currentUser.getUsername()+"\n"
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
		try {
			ResponseUtil.write(code, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
	}
	
}

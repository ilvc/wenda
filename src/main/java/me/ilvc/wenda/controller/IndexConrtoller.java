package me.ilvc.wenda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import me.ilvc.wenda.model.PageBean;
import me.ilvc.wenda.model.Question;
import me.ilvc.wenda.service.QuestionService;
import me.ilvc.wenda.service.UserService;

@Controller
@RequestMapping("/")
public class IndexConrtoller {

	@Autowired
	private QuestionService questionService;
	@Autowired
	private UserService userService;
	
	/**
	 * 
	 * @return 首页数据 展示
	 * 	置顶帖
	 * 	最近更新帖 20
	 * 	回答 榜
	 * 	查看最最多
	 * 	评论最多
	 */
	@RequestMapping("/index")
	public ModelAndView index(){
		ModelAndView mav=new ModelAndView();
			
		mav.addObject("qStick", questionService.listAllCommon(new Question(1,null,null),new PageBean(1,10)));
		mav.addObject("q2recent", questionService.listAllCommon(new Question(), new PageBean(1,10)));
		mav.addObject("q2view", questionService.listAllCommon(new Question(null,1),new PageBean(1, 8)));
		mav.addObject("q2count", questionService.listAllCommon(new Question(1,null),new PageBean(1, 8)));
		mav.addObject("ans2top", userService.countAnswer2user());
		mav.addObject("pageType", "jie");
		mav.setViewName("/index");
		return mav;
	} 
	
}

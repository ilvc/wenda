package me.ilvc.wenda.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import me.ilvc.wenda.model.PageBean;
import me.ilvc.wenda.model.Question;
import me.ilvc.wenda.model.User;
import me.ilvc.wenda.service.QuestionService;
import me.ilvc.wenda.service.UserService;
import me.ilvc.wenda.util.PageUtil;
import me.ilvc.wenda.util.PropertiesUtil;

@Controller
public class JieController {

	@Autowired
	private QuestionService questionService;
	@Autowired
	private UserService userService;
	
	private Integer pageSize =Integer.parseInt(PropertiesUtil.getValue("pageSize"));
	
	@RequestMapping("/jie")
	public ModelAndView index2jie(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String basePath = request.getContextPath();
		mav.addObject("pageType", "jie");
		mav.addObject("questions", questionService.listAllCommon(new Question(), new PageBean(1,pageSize)));
		mav.addObject("navPage", PageUtil.getUpAndDwonPageCode2(questionService.countAll(), 1, pageSize, basePath+"/jie/"));
		mav.setViewName("/jie/index");
//		System.out.println(PageUtil.getUpAndDwonPageCode2(questionService.countAll(), 1, 2, basePath+"/jie/"));
		return mav;
	}
	
	@RequestMapping("/jie/page/{page}")
	public ModelAndView index2jiePage(@PathVariable("page") Integer page,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String basePath = request.getContextPath();
		
		mav.addObject("questions", questionService.listAllCommon(new Question(), new PageBean(page,pageSize)));
		
		mav.addObject("navPage", PageUtil.getUpAndDwonPageCode2(questionService.countAll(), page, pageSize, basePath+"/jie/"));
		mav.setViewName("/jie/index");
		mav.addObject("pageType", "jie");
	//	System.out.println(PageUtil.getUpAndDwonPageCode2(questionService.countAll(), page, 2, basePath+"/jie/"));
		return mav;
	}
	
	
	@RequestMapping("/jie/unsolved")
	public ModelAndView unsolved(HttpServletRequest request){
		ModelAndView mad = new ModelAndView();
		String basePath = request.getContextPath();
		mad.addObject("questions", questionService.listAllCommon(new Question(null,null,0), new PageBean(1,pageSize)));
		
		mad.addObject("navPage", PageUtil.getUpAndDwonPageCode2(questionService.getBystate(new Question(null,null,0)).size(), 1, pageSize, basePath+"/jie/"));
		mad.setViewName("/jie/index");
		mad.addObject("pageType", "unsolved");
		return mad;
		
	}
	@RequestMapping("/jie/unsolved/{page}")
	public ModelAndView index2unsolvedPage(@PathVariable("page") Integer page,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String basePath = request.getContextPath();
		
		mav.addObject("questions", questionService.listAllCommon(new Question(), new PageBean(page,pageSize)));
		mav.addObject("navPage", PageUtil.getUpAndDwonPageCode2(questionService.getBystate(new Question(null,null,0)).size(), page, pageSize, basePath+"/jie/unsolved/"));
		mav.setViewName("/jie/index");
		mav.addObject("pageType", "unsolved");
	//	System.out.println(PageUtil.getUpAndDwonPageCode2(questionService.countAll(), page, 2, basePath+"/jie/"));
		return mav;
	}
	
	
	
	@RequestMapping("/jie/solved")
	public ModelAndView solved(HttpServletRequest request){
		
		ModelAndView mad = new ModelAndView();
		String basePath = request.getContextPath();
		mad.addObject("questions", questionService.listAllCommon(new Question(null,null,1), new PageBean(1,pageSize)));
		mad.addObject("navPage", PageUtil.getUpAndDwonPageCode2(questionService.getBystate(new Question(null,null,1)).size(), 1, pageSize, basePath+"/jie/solved/"));
		mad.setViewName("/jie/index");
		mad.addObject("pageType", "solved");
		return mad;
	}
	
	@RequestMapping("/jie/solved/{page}")
	public ModelAndView index2solvedPage(@PathVariable("page") Integer page,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String basePath = request.getContextPath();
		
		mav.addObject("questions", questionService.listAllCommon(new Question(null,null,1), new PageBean(page,pageSize)));
		mav.addObject("navPage", PageUtil.getUpAndDwonPageCode2(questionService.getBystate(new Question(null,null,1)).size(), page, pageSize, basePath+"/jie/solved/"));
		mav.setViewName("/jie/index");
		mav.addObject("pageType", "solved");
	//	System.out.println(PageUtil.getUpAndDwonPageCode2(questionService.countAll(), page, 2, basePath+"/jie/"));
		return mav;
	}
		
	@RequestMapping("/jie/wonderful")
	public ModelAndView wonderful(HttpServletRequest request){
		
		ModelAndView mad = new ModelAndView();
		String basePath = request.getContextPath();
		mad.addObject("questions", questionService.listAllCommon(new Question(null,1,null), new PageBean(1,pageSize)));
		mad.addObject("navPage", PageUtil.getUpAndDwonPageCode2(questionService.getBystate(new Question(null,1,null)).size(), 1, pageSize, basePath+"/jie/wonderful/"));
		mad.addObject("pageType", "wonderful");
		mad.setViewName("/jie/index");
		return mad;
	}
	
	@RequestMapping("/jie/wonderful/{page}")
	public ModelAndView index2wonderfulPage(@PathVariable("page") Integer page,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String basePath = request.getContextPath();
		mav.addObject("pageType", "wonderful");
		mav.addObject("questions", questionService.listAllCommon(new Question(null,1,null), new PageBean(page,pageSize)));
		mav.addObject("navPage", PageUtil.getUpAndDwonPageCode2(questionService.getBystate(new Question(null,1,null)).size(), page, pageSize, basePath+"/jie/wonderful/"));
		mav.setViewName("/jie/index");
		return mav;
	}
	
	/**
	 * quesion 具体内容
	 * @param id
	 * @return
	 */
	@RequestMapping("/jie/detail/{id}")
	public ModelAndView jie2question(@PathVariable("id") Integer id){
		
		ModelAndView mad = new ModelAndView();
		mad.addObject("q2view", questionService.listAllCommon(new Question(null,1),new PageBean(1, 8)));
		mad.addObject("q2count", questionService.listAllCommon(new Question(1,null),new PageBean(1, 8)));
		mad.addObject("question", questionService.getById(id));
		mad.setViewName("/jie/detail");
		return mad;
	}
	
	
	
	/*
	@RequestMapping("/jie/detail")
	public ModelAndView jie2detail(){
		
		ModelAndView mad = new ModelAndView();
		mad.setViewName("/jie/detail");
		return mad;
	}*/
	
	@RequestMapping("/jie/add")
	public ModelAndView jie2add(HttpServletRequest request){
		
		ModelAndView mad = new ModelAndView();
		User user = (User) request.getSession().getAttribute("currentUser");
		if(user==null){
			mad.setViewName("redirect:/user/login");
		}else{
			mad.setViewName("/jie/add");
		}
		return mad;
	}
}

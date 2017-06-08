package me.ilvc.wenda.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import me.ilvc.wenda.model.PageBean;
import me.ilvc.wenda.model.Question;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		{"classpath:spring-context.xml",
		"classpath:spring-mvc.xml"})
public class QuestionServiceTest {


	@Autowired
	private QuestionService questionService;
	
	@Test
	public void testGetById(){
		System.out.println(""+questionService.getById(10001));
	}
	
	@Test
	public void testListAllCommon(){
		System.out.println(""+questionService.listAllCommon(new Question(), new PageBean(1,3)));
	}
	
	@Test
	public void testListAll(){
		System.out.println("result:"+questionService.listAll(new Question()));
	}
	
	@Test
	public void testGetByState(){
		//System.out.println("result:"+questionService.getBystate(new Question(null,null,1)));
		
		// questionService.listAllCommon(new Question(null,1,null), new PageBean(1,20))
		
	/*	System.out.println("查询最近20条数据："+questionService.listAllCommon(new Question(), new PageBean(1,20)));
		System.out.println("未结贴："+questionService.listAllCommon(new Question(null,null,0), new PageBean(1,20)));
		System.out.println("已采纳："+questionService.listAllCommon(new Question(null,null,1), new PageBean(1,20)));
		System.out.println("精帖："+questionService.getBystate(new Question(null,1,null)));*/
		
		
		System.out.println("置顶："+questionService.listAllCommon(new Question(1,null,null),new PageBean(1, 8)));
		
	}
	
	
}

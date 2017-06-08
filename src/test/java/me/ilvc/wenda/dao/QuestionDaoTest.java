package me.ilvc.wenda.dao;

import java.util.List;

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
public class QuestionDaoTest {

	@Autowired
	private QuestionDao questionDao;
	
	@Test
	public void testGetById(){
		System.out.println(questionDao.getById(10002)+"");
	}

	@Test
	public void testInsert(){
		
		for(int i=1;i<20;i++){
			Question q = new Question(); 
			q.setQuestionTiltle("这是批量插入，获取测试数据。"+i);
			q.setQuestionContent("分页测试223。奋斗的旅程有太多的苦衷");
			q.setPublishedUid(10001);
			q.setCategoryId(1);
			questionDao.insert(q);
		}
		
		//System.out.println("返回结果："+questionDao.insert(q) );
	}
	
	@Test
	public void testCountAll(){
		System.out.println("总数："+questionDao.countAll()+"");
	}
	
	@Test
	public void testlistAllCommon(){
		
		List<Question> qs= questionDao.listAllCommon(new Question(1,null), new PageBean(1, 3));
		//System.out.println("结果："+qs);
		for (Question question : qs) {
			System.out.println(question);
		}
	}
	
	@Test
	public void testDelete(){
		System.out.println("result:"+questionDao.delete(10003));
	}
	
	@Test
	public void testListAll(){
		System.out.println("result:"+(List<Question>)questionDao.listAll(new Question()));
	}
}

package me.ilvc.wenda.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.ilvc.wenda.dao.QuestionDao;
import me.ilvc.wenda.model.PageBean;
import me.ilvc.wenda.model.Question;
import me.ilvc.wenda.service.QuestionService;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {

	@Resource
	private QuestionDao questionDao;
	
	@Override
	public <T> T getById(int id) {
		// TODO Auto-generated method stub
		return questionDao.getById(id);
	}

	@Override
	public <T> List<T> listAll(T t) {
		// TODO Auto-generated method stub
		return questionDao.listAll(t);
	}

	@Override
	public int countAll() {
		// TODO Auto-generated method stub
		return questionDao.countAll();
	}

	@Override
	public <T> int insert(T t) {
		// TODO Auto-generated method stub
		return questionDao.insert(t);
	}

	@Override
	public <T> int update(T t) {
		// TODO Auto-generated method stub
		return questionDao.insert(t);
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return questionDao.delete(id);
	}

	@Override
	public List<Question> listAllCommon(Question question, PageBean pageBean) {
		// TODO Auto-generated method stub
		return questionDao.listAllCommon(question, pageBean);
	}

	@Override
	public List<Question> getBystate(Question question) {
		// TODO Auto-generated method stub
		return questionDao.getBystate(question);
	}

		
	
}

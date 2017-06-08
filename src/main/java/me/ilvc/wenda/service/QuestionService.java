package me.ilvc.wenda.service;

import java.util.List;



import me.ilvc.wenda.model.PageBean;
import me.ilvc.wenda.model.Question;

public interface QuestionService extends BaseService {
	
	 List<Question> getBystate(Question question );

	List<Question> listAllCommon( Question question, PageBean pageBean);
}

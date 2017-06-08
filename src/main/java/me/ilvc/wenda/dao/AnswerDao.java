package me.ilvc.wenda.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import me.ilvc.wenda.model.Answer;
import me.ilvc.wenda.model.PageBean;
import me.ilvc.wenda.model.Question;


public interface AnswerDao extends BaseDao{
    int deleteByPrimaryKey(Integer answerId);

    int insert(Answer record);

    int insertSelective(Answer record);

    Answer selectByPrimaryKey(Integer answerId);

    int updateByPrimaryKeySelective(Answer record);

    int updateByPrimaryKey(Answer record);
    
    /**
     * 
     * @param quesion
     * @param pageBean
     * @return 查询通用方法 分页，
     */
    List<Question> listAllCommon(@Param("answer")  Answer answer,@Param("pageBean") PageBean pageBean);
}
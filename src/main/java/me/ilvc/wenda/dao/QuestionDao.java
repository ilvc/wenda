package me.ilvc.wenda.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import me.ilvc.wenda.model.PageBean;
import me.ilvc.wenda.model.Question;

public interface QuestionDao extends BaseDao{
    int deleteByPrimaryKey(Integer questionId);
    int insertSelective(Question record);
    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKeyWithBLOBs(Question record);

    int updateByPrimaryKey(Question record);
    /**
     * 
     * @param quesion
     * @param pageBean
     * @return 查询通用方法 分页，
     */
    List<Question> listAllCommon(@Param("question") Question question,@Param("pageBean") PageBean pageBean);

    List<Question> getBystate(Question question );
}
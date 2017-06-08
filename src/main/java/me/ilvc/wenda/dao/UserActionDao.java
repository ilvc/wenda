package me.ilvc.wenda.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import me.ilvc.wenda.model.PageBean;
import me.ilvc.wenda.model.Question;
import me.ilvc.wenda.model.UserAction;

public interface UserActionDao extends BaseDao{
    int deleteByPrimaryKey(Integer id);

    int insert(UserAction record);

    int insertSelective(UserAction record);

    UserAction selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserAction record);

    int updateByPrimaryKey(UserAction record);
    /**
     * 
     * @param quesion
     * @param pageBean
     * @return 查询通用方法 分页，
     */
    List<Question> listAllCommon(@Param("userAction") UserAction userAction,@Param("pageBean") PageBean pageBean);
}
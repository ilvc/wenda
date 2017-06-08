package me.ilvc.wenda.dao;

import me.ilvc.wenda.model.Tags;

public interface TagsDao extends BaseDao{
    int deleteByPrimaryKey(Integer tagId);

    int insert(Tags record);

    int insertSelective(Tags record);

    Tags selectByPrimaryKey(Integer tagId);

    int updateByPrimaryKeySelective(Tags record);

    int updateByPrimaryKey(Tags record);
}
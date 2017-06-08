package me.ilvc.wenda.dao;

import me.ilvc.wenda.model.Notice;

public interface NoticeDao extends BaseDao{
    int deleteByPrimaryKey(Integer noticeId);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(Integer noticeId);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKey(Notice record);
}
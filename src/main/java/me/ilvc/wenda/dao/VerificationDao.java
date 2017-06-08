package me.ilvc.wenda.dao;

import me.ilvc.wenda.model.Verification;

public interface VerificationDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Verification record);

    int insertSelective(Verification record);

    Verification selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Verification record);

    int updateByPrimaryKey(Verification record);
}
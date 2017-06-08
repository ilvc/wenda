package me.ilvc.wenda.service;

import java.util.List;

public interface BaseService {


	/**
	 * 
	 * @param id
	 * @return
	 */
	<T> T getById(int id);
	
	/**
	 * 
	 * @param t 泛型，传入某个具体的对象
	 * @return list<T>
	 */	
	<T> List<T> listAll( T t);
	
	/**
	 * 
	 * @return 总数
	 */
	int countAll();
	
	/**
	 * 
	 * @param t 插入具体一条数据
	 * @return 
	 */
	<T> int insert(T t);
	
	/**
	 * 更新一条数据
	 * @param t 
	 * @return int 结果，
	 */
	<T> int update(T t);
	
	/**
	 * 删除一条数据
	 * @param t
	 * @return
	 */
	 int delete(int id);
	 }

package com.kdn.study.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.study.domain.Category;
import com.kdn.study.domain.PageBean;

@Repository("categoryDao")
public class CategoryDaoImpl implements CategoryDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public Category search(int cno) {
		return session.selectOne("category.search", cno);
	}

	public List<Category> searchAll(PageBean bean) {
		return session.selectList("category.searchAll", bean);
	}
	
	public void createCategory(String cname){
		session.insert("category.createCategory", cname);
	}
	
	public void deleteCategory(int cno){
		session.delete("category.deleteCategory", cno);
	}
	
	public void updateCategory(Category cat){
		session.update("category.updateCategory", cat);
	}

}

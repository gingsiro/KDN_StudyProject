package com.kdn.study.dao;

import java.util.List;

import com.kdn.study.domain.Category;
import com.kdn.study.domain.PageBean;

public interface CategoryDao {
	public Category search(int cno);
	public List<Category> searchAll(PageBean bean);
}

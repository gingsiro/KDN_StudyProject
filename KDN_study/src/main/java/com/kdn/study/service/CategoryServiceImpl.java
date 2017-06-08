package com.kdn.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdn.study.dao.CategoryDao;
import com.kdn.study.domain.Category;
import com.kdn.study.domain.PageBean;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao dao; 

	public Category search(int cno) {
		return dao.search(cno);
	}

	public List<Category> searchAll(PageBean bean) {
		return dao.searchAll(bean);
	}

}

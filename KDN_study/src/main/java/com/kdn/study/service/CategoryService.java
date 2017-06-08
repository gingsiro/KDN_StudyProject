package com.kdn.study.service;

import java.util.List;

import com.kdn.study.domain.Category;
import com.kdn.study.domain.PageBean;

public interface CategoryService {
	public Category search(int cno);
	public List<Category> searchAll(PageBean bean);
}

package com.kdn.study.dao;

import java.util.List;

import com.kdn.study.domain.JoinStudy;

public interface JoinDao {

	public  List<JoinStudy> searchJoinMembers(int sno);
	public void deleteMember(int jno);
}

package com.kdn.study.service;

import java.util.List;

import com.kdn.study.domain.JoinStudy;

public interface JoinService {
	public List<JoinStudy> searchJoinMembers(int sno);
}

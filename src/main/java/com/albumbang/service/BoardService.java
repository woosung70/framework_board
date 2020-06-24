package com.albumbang.service;

import java.util.List;

import com.albumbang.domain.Board;
import com.albumbang.domain.PageCriteria;

public interface BoardService {

	// 게시물 목록
	public List<Board> list(PageCriteria cri) throws Exception;
	
	public int totalCount(PageCriteria cri) throws Exception;
	
	// 게시물 작성
	public void write(Board vo) throws Exception;

	// 게시물 조회
	public Board view(int bno) throws Exception;

	// 게시물 수정
	public void modify(Board vo) throws Exception;
	
	// 게시물 삭제
	public void delete(String idx) throws Exception;
}

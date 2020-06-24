package com.albumbang.mapper;

import java.util.List;

import com.albumbang.domain.Board;
import com.albumbang.domain.PageCriteria;

public interface BoardMapper {
	
	// 게시물 목록
	public List<Board> list(PageCriteria cri) throws Exception;

	public int totalCount(PageCriteria cri) throws Exception;
	
	// 게시물 작성
	public void write(Board vo) throws Exception;

	// 게시물 조회
	public Board view(int idx) throws Exception;
	
	//조회수 증가
	public void increaseCnt(int idx) throws Exception;

	// 게시물 수정
	public void modify(Board vo) throws Exception;
	
	// 게시물 수정
	public void delete(String idx) throws Exception;
	
}

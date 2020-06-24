package com.albumbang.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.albumbang.domain.Board;
import com.albumbang.domain.PageCriteria;
import com.albumbang.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardMapper dao;
	
	// 게시물 목록
	@Override
	public List<Board> list(PageCriteria cri) throws Exception {

		return dao.list(cri);
	}

	@Override
	public int totalCount(PageCriteria cri) throws Exception {

		return dao.totalCount(cri);
	}

	// 게시물 작성
	@Override
	public void write(Board vo) throws Exception {
		
		dao.write(vo);
	}

	// 게시물 조회
	@Override
	public Board view(int idx) throws Exception {
		dao.increaseCnt(idx);
		return dao.view(idx);
	}

	// 게시물 수정
	@Override
	public void modify(Board vo) throws Exception {
		
		dao.modify(vo);
	}

	// 게시물 삭제
	@Override
	public void delete(String idx) throws Exception {
		dao.delete(idx);

	}
}

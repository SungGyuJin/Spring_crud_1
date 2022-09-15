package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.mapper.BoardMapper;
import com.board.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper bMapper;
	
	// 전체목록
	@Override
	public List<BoardVO> listBoard() {
		return bMapper.listBoard();
	}

	// 상세목록 이동
	@Override
	public BoardVO detailBoard(int bno) {
		return bMapper.detailBoard(bno);
	}

	// 등록
	@Override
	public void regBoard(BoardVO bvo) {
		bMapper.regBoard(bvo);
	}

	// 수정
	@Override
	public void modifyBoard(BoardVO bvo) {
		bMapper.modifyBoard(bvo);
	}
	
	// 삭제
	@Override
	public void deleteBoard(int bno) {
		bMapper.deleteBoard(bno);
	}



	
	
}

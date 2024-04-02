package egovframework.example.board.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.board.service.BoardService;
import egovframework.example.sample.service.SampleDefaultVO;

@Service
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<?> selectBoardList(SampleDefaultVO searchVO) throws Exception {
		return boardMapper.selectBoardList(searchVO);
	}

	@Override
	public int selectBoardListTotCnt(SampleDefaultVO searchVO) {
		return boardMapper.selectBoardListTotCnt(searchVO);
	}

}

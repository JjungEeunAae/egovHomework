package egovframework.example.board.service;

import java.util.List;

import egovframework.example.sample.service.SampleDefaultVO;

public interface BoardService {
	List<?> selectBoardList(SampleDefaultVO searchVO) throws Exception;
	int selectBoardListTotCnt(SampleDefaultVO searchVO);
}

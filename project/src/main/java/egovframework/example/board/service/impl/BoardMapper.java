package egovframework.example.board.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.service.SampleDefaultVO;

@Mapper("boardMapper")
public interface BoardMapper {
	List<?> selectBoardList(SampleDefaultVO searchVO) throws Exception;
	int selectBoardListTotCnt(SampleDefaultVO searchVO);
}

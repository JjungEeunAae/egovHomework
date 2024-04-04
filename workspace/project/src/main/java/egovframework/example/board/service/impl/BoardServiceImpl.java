package egovframework.example.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.impl.EgovSampleServiceImpl;

@Service
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleServiceImpl.class);
	
	/** boardMapper */
	@Autowired
	private BoardMapper boardMapper;
	
	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public List<?> selectBoardList(SampleDefaultVO searchVO) throws Exception {
		return boardMapper.selectBoardList(searchVO);
	}

	@Override
	public int selectBoardListTotCnt(SampleDefaultVO searchVO) {
		return boardMapper.selectBoardListTotCnt(searchVO);
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) throws Exception {
		return boardMapper.selectBoard(vo);
	}

	@Override
	public String insert(BoardVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = egovIdGnrService.getNextStringId();
		vo.setBoard_idx(Integer.parseInt(id));
		LOGGER.debug(vo.toString());

		boardMapper.insert(vo);
		return id;
	}

}

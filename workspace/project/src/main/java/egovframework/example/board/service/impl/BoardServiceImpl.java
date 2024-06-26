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
import egovframework.example.board.service.ReplyVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.impl.EgovSampleServiceImpl;

@Service
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleServiceImpl.class);
	
	/** boardMapper */
	@Autowired
	private BoardMapper boardMapper;

	// 전체 게시글 조회 로직
	@Override
	public List<?> selectBoardList(SampleDefaultVO searchVO) throws Exception {
		return boardMapper.selectBoardList(searchVO);
	}

	// 전체 게시글 개수 조회 로직
	@Override
	public int selectBoardListTotCnt(SampleDefaultVO searchVO) {
		return boardMapper.selectBoardListTotCnt(searchVO);
	}

	// 게시글 단건조회 로직
	@Override
	public BoardVO selectBoard(BoardVO vo) throws Exception {
		return boardMapper.selectBoard(vo);
	}

	// 게시글 등록 로직
	@Override
	public String insert(BoardVO vo) throws Exception {
		LOGGER.debug(vo.toString());
		String response = "";
		LOGGER.debug(vo.toString());

		int result = boardMapper.insert(vo);
		
		if(result > 0) {
			response = "SUCCESS";
		} else {
			response = "FAIL";
		}
		
		return response;
	}

	// 게시글 최신 번호
	@Override
	public int maxBoardIndex() throws Exception {
		return boardMapper.maxBoardIndex();
	}

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 BoardVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public int update(BoardVO vo) throws Exception {
		return boardMapper.update(vo);
	}

	/**
	 * 글을 삭제한다.
	 * @param idx - 삭제할 게시글 번호
	 * @return 삭제 결과
	 * @exception Exception
	 */
	@Override
	public int delete(int idx) throws Exception {
		return boardMapper.delete(idx);
	}

	/**
	 * 게시글 번호 기준 부모 댓글과 자식 댓글을 조회한다.
	 * @param boardIdx - 게시글 번호
	 * @return 게시글 번호에 해당되는 부모 및 자식 댓글 목록
	 * @exception Exception
	 */
	@Override
	public List<ReplyVO> getParentReply(int boardIdx) throws Exception {
		List<ReplyVO> parentReply = boardMapper.getParentReply(boardIdx);
		// 각 댓글에 대한 대댓글 리스트 설정
		for(ReplyVO parent : parentReply) {
			List<ReplyVO> childReply = getChildReply(parent.getReply_idx(), boardIdx);
			System.out.println(childReply);
			parent.setChildReply(childReply);
		}
		return parentReply;
	}

	/**
	 * 부모 댓글 기준 자식 댓글을 조회한다.
	 * @param parentReplyIdx - 부모 댓글 번호
	 * @param boardIdx - 게시글 번호
	 * @return 부모 댓글 번호에 해당되는 자식 댓글 목록
	 * @exception Exception
	 */
	@Override
	public List<ReplyVO> getChildReply(int replyIdx, int boardIdx) throws Exception {
		return boardMapper.getChildReplyList(replyIdx, boardIdx);
	}

	
	/**
	 * 부모 댓글을 등록한다.
	 * @param vo - 등록할 댓글 정보
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public int prentReplySave(ReplyVO vo) throws Exception {
		LOGGER.debug(vo.toString());
		int result = boardMapper.prentReplySave(vo);
		LOGGER.debug(vo.toString());
		return result;
	}
	
	

}

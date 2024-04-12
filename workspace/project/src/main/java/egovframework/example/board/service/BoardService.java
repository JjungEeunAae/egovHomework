package egovframework.example.board.service;

import java.util.List;

import egovframework.example.sample.service.SampleDefaultVO;

public interface BoardService {
	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectBoardList(SampleDefaultVO searchVO) throws Exception;
	
	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	int selectBoardListTotCnt(SampleDefaultVO searchVO);
	
	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 BoardVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	BoardVO selectBoard(BoardVO vo)  throws Exception;
	
	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 BoardVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	String insert(BoardVO vo) throws Exception;
	
	/**
	 * 게시글의 최고 최신 게시글 번호를 가져온다.
	 * @return 최신 게시글 번호
	 * @exception Exception
	 */
	int maxBoardIndex() throws Exception;
	
	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 BoardVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	int update(BoardVO vo) throws Exception;

	/**
	 * 글을 삭제한다.
	 * @param idx - 삭제할 게시글 번호
	 * @return 삭제 결과
	 * @exception Exception
	 */
	int delete(int idx) throws Exception;
	
	/**
	 * 게시글 번호 기준 부모 댓글을 조회한다.
	 * @param boardIdx - 게시글 번호
	 * @return 게시글 번호에 해당되는 댓글 목록
	 * @exception Exception
	 */
	List<ReplyVO> getParentReply(int boardIdx) throws Exception;
	
	/**
	 * 부모 댓글 기준 자식 댓글을 조회한다.
	 * @param parentReplyIdx - 부모 댓글 번호
	 * @param boardIdx - 게시글 번호
	 * @return 부모 댓글 번호에 해당되는 자식 댓글 목록
	 * @exception Exception
	 */
	List<ReplyVO> getChildReply(int replyIdx, int boardIdx) throws Exception;
	
	/**
	 * 부모 댓글을 등록한다.
	 * @param vo - 등록할 댓글 정보
	 * @return 등록 결과
	 * @exception Exception
	 */
	int prentReplySave(ReplyVO vo) throws Exception;
}

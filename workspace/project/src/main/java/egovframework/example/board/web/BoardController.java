package egovframework.example.board.web;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO;
import egovframework.example.board.service.ReplyVO;
import egovframework.example.sample.service.SampleDefaultVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;
	
	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardAllList(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(20);                 // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(searchVO.getPageSize());       // 페이징 리스트의 사이즈
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		/** boardAllList */
		List<?> boardList = boardService.selectBoardList(searchVO);
		model.addAttribute("resultList", boardList);
		
		/** paging */
		int totCnt = boardService.selectBoardListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "board/boardAllList";
	}
	
	/**
	 * 글 상세를 화면으로 조회한다.
	 * @param idx - 조회할 글 번호
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "boardDetail"
	 * @exception Exception
	 */
	@RequestMapping(value = "/detail.do")
	public String boardDetail(@RequestParam("idx") int idx
							, @ModelAttribute("searchVO") SampleDefaultVO searchVO
							, Model model) throws Exception {
		
		/** boardDetail */
		BoardVO vo = new BoardVO();
		vo.setBoard_idx(idx);
		model.addAttribute("boardInfo", selectBoard(vo));
		
		/** boardReplyList */
		model.addAttribute("reply", boardService.getParentReply(idx));
		
		/** boardReplySave */
		model.addAttribute("replyVO", new ReplyVO());
		
		return "board/boardDetail";
	}
	
	/**
	 * 글을 조회한다.
	 * @param boardVO - 조회할 정보가 담긴 VO
	 * @param status
	 * @return @ModelAttribute("boardVO") - 조회한 정보
	 * @exception Exception
	 */
	public BoardVO selectBoard(BoardVO boardVO) throws Exception {
		return boardService.selectBoard(boardVO);
	}
	
	/**
	 * 글 등록 화면을 조회한다.
	 * @return "boardAdd"
	 * @exception Exception
	 */
	@RequestMapping(value = "/add.do")
	public String addView(@ModelAttribute("vo") BoardVO vo
						, @ModelAttribute("searchVO") SampleDefaultVO searchVO
						, Model model) throws Exception {
		// HTML form 태그 내에 있는 input 또는 textarea 태그의 path에 맞춰 BoardVO에 셋팅
		model.addAttribute("vo", new BoardVO());
		return "board/boardAdd";
	}
	
	/**
	 * 글을 등록한다.
	 * @param sampleVO - 등록할 정보가 담긴 VO
	 * @param status
	 * @return "forward:/list.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/boardAdd.do", method = RequestMethod.POST)
	public String addSample( @ModelAttribute("vo") BoardVO vo
						   , SessionStatus status) throws Exception {
		// 게시글 등록 쿼리문 실행
		String result = boardService.insert(vo);
		int idx = boardService.maxBoardIndex();
		if(result.equals("SUCCESS")) {
			// 결과
			status.setComplete();
			return "redirect:/list.do?idx=" + idx + "&result=true";
		} else {
			return "forward:/add.do";
		}
	}
	
	/**
	 * 글 수정 화면을 조회한다.
	 * @param idx - 수정할 게시글 번호
	 * @param BoardVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "boardUp"
	 */
	@RequestMapping(value = "/up.do")
	public String upView( @ModelAttribute("vo") BoardVO vo
						, @ModelAttribute("searchVO") SampleDefaultVO searchVO
						, @RequestParam("idx") int idx
						, Model model) throws Exception {
		BoardVO bvo = new BoardVO();
		bvo.setBoard_idx(idx);
		
		model.addAttribute("upBoardInfo", selectBoard(bvo));
		return "board/boardUp";
	}
	
	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 BoardVO
	 * @param status
	 * @return "redirect:/detail.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/boardUp.do", method = RequestMethod.POST)
	public String update(@ModelAttribute("vo") BoardVO vo
						, RedirectAttributes redirectAttributes
			  			, SessionStatus status) throws Exception {
		int result = boardService.update(vo);
		if(result > 0) {
			status.setComplete();
			// 수정 후 게시글 상세 조회로 바로 이동
			redirectAttributes.addAttribute("idx", vo.getBoard_idx());
			return "redirect:/detail.do";
		} else {
			return "forward:/up.do?idx=" + vo.getBoard_idx();
		}
	}
	
	/**
	 * 글을 삭제한다.
	 * @param boardIdx - 삭제할 글번호
	 * @param status
	 * @return "list.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "boardDel.do", method = RequestMethod.POST)
	public String deleteSample(@RequestParam("boardIdx") int boardIdx
			                  , SessionStatus status) throws Exception {
		int res = boardService.delete(boardIdx);
		if(res > 0) {
			status.setComplete();
			return "redirect:/list.do";
		} else {
			return "forward:/detail.do?idx=" + boardIdx;
		}
	}
	
	/**
	 * 부모 댓글을 등록한다.
	 * @param vo - 등록할 댓글 정보
	 * @param status
	 * @return "redirect:/detail.do" + 댓글 등록 결과 + 게시글 번호
	 * @exception Exception
	 */
	@RequestMapping(value = "replyAdd.do", method = RequestMethod.POST)
	public String replyAdd(@ModelAttribute("replyVO") ReplyVO vo
						  , SessionStatus status) throws Exception {
		int result = boardService.prentReplySave(vo);
		boolean replySaveResult = false;
		if(result > 0) {
			status.setComplete();
			replySaveResult = true;
		}
		return "redirect:/detail.do?save=" + replySaveResult + "&idx=" + vo.getBoard_idx();
	}
}

package egovframework.example.board.web;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO;
import egovframework.example.board.service.impl.BoardServiceImpl;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;
import lombok.RequiredArgsConstructor;

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
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<?> boardList = boardService.selectBoardList(searchVO);
		model.addAttribute("resultList", boardList);
		
		/** paging */
		int totCnt = boardService.selectBoardListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "board/boardAllList";
	}
	
	/**
	 * 글 수정화면을 조회한다.
	 * @param id - 수정할 글 id
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "boardDetail"
	 * @exception Exception
	 */
	@RequestMapping(value = "/detail.do")
	public String boardDetail(@RequestParam("selectedId") int idx
							, Model model) throws Exception {
		BoardVO vo = new BoardVO();
		vo.setBoard_idx(idx);
		model.addAttribute("boardInfo", selectBoard(vo));		
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
	public String addSample(@ModelAttribute("vo") BoardVO vo
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
	 * @return "egovSampleRegister"
	 */
	@RequestMapping(value = "/up.do")
	public String upView(@ModelAttribute("vo") BoardVO vo
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
	 * @return "forward:/detail.do"
	 * @exception Exception
	 */
	@RequestMapping("/boardUp.do")
	public String update(@ModelAttribute("vo") BoardVO vo
			  			, SessionStatus status) throws Exception {
		return null;
	}
}

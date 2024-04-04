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

	@RequestMapping(value = "/list.do")
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
	public String addView() throws Exception {
		return "board/boardAdd";
	}
	
	/**
	 * 글을 등록한다.
	 * @param sampleVO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/boardAdd.do", method = RequestMethod.POST)
	public String addSample(BoardVO vo
						  , BindingResult bindingResult
						  , Model model
						  , SessionStatus status) throws Exception {
		// Server-Side Validation - 폼검증
		beanValidator.validate(vo, bindingResult);

		if (bindingResult.hasErrors()) {
//			model.addAttribute("sampleVO", sampleVO);
			return "sample/egovSampleRegister";
		}

		// 게시글 등록 쿼리문 실행
		boardService.insert(vo);
		// 결과
		status.setComplete();
		
		return "forward:/list.do";
	}
}

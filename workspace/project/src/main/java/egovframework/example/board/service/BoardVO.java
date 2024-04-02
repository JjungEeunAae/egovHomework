package egovframework.example.board.service;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import egovframework.example.sample.service.SampleDefaultVO;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BoardVO extends SampleDefaultVO {
	private int board_idx;
	private String writer;
	private String title;
	private String content;
	private UesYn ues_yn;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime date_created;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime date_modify;
	private int view_count;
	private int like_count;
}

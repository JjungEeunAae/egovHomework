package egovframework.example.board.service;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {
	private int     reply_idx;
	private int     board_idx;
	private String  writer;
	private String  content;
	private int     group_ord;
	private Integer group_layer; // Integer로 선언하여 null을 허용하도록 함
	private UesYn   ues_yn;
	
	private List<ReplyVO> childReply; // 대댓글 리스트
}

package egovframework.example.board.service;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ReplyVO {
	private int reply_idx;
	private int group_ord;
	private int group_layer;
	private UesYn ues_yn;
	private int board_idx;
}

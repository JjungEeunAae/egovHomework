package egovframework.example.board.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {
	private int reply_idx;
	private String writer;
	private String content;
	private int group_ord;
	private String group_layer_2;
	private String group_layer;
	private UesYn ues_yn;
	private int board_idx;
}

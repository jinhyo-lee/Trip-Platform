package com.model;

import java.sql.Date;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("roomAnswer")
public class RoomAnswerBean {
	private int room_answer_id;
	private String answer_content;
	private Date answer_reg;
	private int room_qna_id;
	private String id;
	private String userphoto;
}

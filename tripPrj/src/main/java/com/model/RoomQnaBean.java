package com.model;

import java.sql.Date;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("roomQna")
public class RoomQnaBean {
	private int room_qna_id;
	private String qna_title;
	private String qna_content;
	private int qna_readcnt;
	private Date qna_reg;
	private int room_id;
	private String id;
	private String userphoto;
}

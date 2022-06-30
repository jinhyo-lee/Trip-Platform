package com.model;

import java.sql.Date;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("placeAnswer")
public class PlaceAnswerBean {
	private int place_answer_id;
	private String answer_content;
	private Date answer_reg;
	private int place_qna_id;
	private String id;
	private String userphoto;
}

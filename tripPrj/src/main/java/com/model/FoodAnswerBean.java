package com.model;

import java.sql.Date;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("foodAnswer")
public class FoodAnswerBean {
	private int food_answer_id;
	private String answer_content;
	private Date answer_reg;
	private int food_qna_id;
	private String id;
	private String userphoto;
}

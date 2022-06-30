package com.model;

import java.sql.Date;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("foodQna")
public class FoodQnaBean {
	private int food_qna_id;
	private String qna_title;
	private String qna_content;
	private int qna_readcnt;
	private Date qna_reg;
	private int food_id;
	private String id;
	private String userphoto;
}

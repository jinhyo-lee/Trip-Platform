package com.model;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("placeLike")
public class PlaceLikeBean {
	private int place_like_id;
	private int place_rev_id;
	private String id;
}

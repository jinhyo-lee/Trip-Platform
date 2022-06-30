package com.model;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("roomLike")
public class RoomLikeBean {
	private int room_like_id;
	private int room_rev_id;
	private String id;
}

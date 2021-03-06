package com.model;

import java.util.List;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("roomFilter")
public class RoomFilterBean {
	private String city;
	private String district;
	private List<String> type;
	private List<String> option;
	private int minCost;
	private int maxCost;
	private double rate;
	private List<String> star;
	private int page;
}

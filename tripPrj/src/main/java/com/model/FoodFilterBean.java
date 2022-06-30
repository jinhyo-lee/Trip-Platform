package com.model;

import java.util.List;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("foodFilter")
public class FoodFilterBean {
	private String city;
	private String district;
	private List<String> type;
	private List<String> feat;
	private int minCost;
	private int maxCost;
	private double rate;
	private int page;
}

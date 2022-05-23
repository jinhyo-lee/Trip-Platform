package com.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.model.FoodBean;
import com.model.PlaceBean;
import com.model.RoomBean;
import com.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService service;

	@RequestMapping("main")
	public String mainList(Model model) throws Exception {
		
		List<PlaceBean> placeList = new ArrayList<PlaceBean>();
		List<FoodBean> foodList = new ArrayList<FoodBean>();
		List<RoomBean> roomList = new ArrayList<RoomBean>();
		
		placeList = service.getPlaceList();
		foodList = service.getFoodList();
		roomList = service.getRoomList();
		
		model.addAttribute("placeList", placeList);
		model.addAttribute("foodList", foodList);
		model.addAttribute("roomList", roomList);

		return "main";
	}

}

package com.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.model.RoomBean;
import com.service.RoomService;

@Controller
public class RoomController {

	@Autowired
	private RoomService service;

	@RequestMapping("roomList")
	public String roomList(Model model, HttpServletRequest request) throws Exception {

		List<RoomBean> roomList = new ArrayList<RoomBean>();

		int page = 1;
		int limit = 9;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int listCount = service.getCount();
		roomList = service.getList(page);

		int pageCount = listCount / limit + ((listCount % limit == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10) * limit + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listCount", listCount);
		model.addAttribute("roomList", roomList);

		return "room/room_list";
	}

}

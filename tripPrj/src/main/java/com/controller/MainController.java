package com.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.model.FoodBean;
import com.model.MemberBean;
import com.model.PlaceBean;
import com.model.RoomBean;
import com.model.SearchBean;
import com.service.MainService;
import com.service.MemberService;

@Controller
public class MainController {

	@Autowired
	private MainService service;

	@Autowired
	private MemberService memberService;

	// 메인 페이지
	@RequestMapping("main")
	public String main(HttpSession session, Model model) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);

		List<PlaceBean> placeList = new ArrayList<PlaceBean>();
		List<FoodBean> foodList = new ArrayList<FoodBean>();
		List<RoomBean> roomList = new ArrayList<RoomBean>();

		placeList = service.getPlaceList();
		foodList = service.getFoodList();
		roomList = service.getRoomList();

		boolean isMain = true;

		session.setAttribute("member", member);
		model.addAttribute("isMain", isMain);
		model.addAttribute("placeList", placeList);
		model.addAttribute("foodList", foodList);
		model.addAttribute("roomList", roomList);

		return "main";
	}

	// 통합 검색
	@RequestMapping("search")
	public String search(@RequestParam("input") String pageInput, SearchBean search, Model model,
			HttpServletRequest request) throws Exception {

		List<PlaceBean> searchList = new ArrayList<PlaceBean>();

		String input = request.getParameter("input");
		if (pageInput != null)
			input = pageInput;

		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));

		search.setInput(input);
		search.setPage(page);

		int searchCount = service.getSearchCount(search);
		searchList = service.getSearchList(search);

		int pageCount = searchCount / limit + ((searchCount % limit == 0) ? 0 : 1);
		int startPage = ((page - 1) / 10) * limit + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("searchCount", searchCount);
		model.addAttribute("searchList", searchList);
		model.addAttribute("input", input);

		return "search";
	}

}

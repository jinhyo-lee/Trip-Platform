package com.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.support.RequestContextUtils;
import com.model.PlaceBean;
import com.model.RoomBean;
import com.model.RoomBookmarkBean;
import com.model.RoomFilterBean;
import com.model.RoomLikeBean;
import com.model.RoomQnaBean;
import com.model.RoomReviewBean;
import com.service.RoomQnaService;
import com.service.RoomReviewService;
import com.service.RoomService;

@Controller
public class RoomController {

	@Autowired
	private RoomService service;

	@Autowired
	private RoomReviewService reviewService;

	@Autowired
	private RoomQnaService qnaService;

	// 목록
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

	// 필터
	@SuppressWarnings("unchecked")
	@RequestMapping("roomFilter")
	public String roomFilter(@RequestParam HashMap<String, String> map, RoomFilterBean roomFilter, Model model,
			HttpServletRequest request) throws Exception {

		Map<String, ?> fmIn = RequestContextUtils.getInputFlashMap(request);
		if (fmIn != null) {
			map = (HashMap<String, String>) fmIn.get("map");
		}
		System.out.println(map);

		List<String> type = new ArrayList<>();
		List<String> option = new ArrayList<>();
		List<String> star = new ArrayList<>();
		for (String key : map.keySet()) {
			if (key.equals("city"))
				roomFilter.setCity(map.get("city"));
			if (key.equals("district"))
				roomFilter.setDistrict(map.get("district"));
			if (key.equals("minCost"))
				roomFilter.setMinCost(Integer.parseInt(map.get("minCost")));
			if (key.equals("maxCost"))
				roomFilter.setMaxCost(Integer.parseInt(map.get("maxCost")));
			if (key.equals("rate"))
				roomFilter.setRate(Double.parseDouble(map.get("rate")));

			if (key.contains("type"))
				type.add(map.get(key));
			if (key.contains("option"))
				option.add(map.get(key));
			if (key.contains("star"))
				star.add(map.get(key));
		}
		roomFilter.setType(type);
		roomFilter.setOption(option);
		roomFilter.setStar(star);

		int page = 1;
		int limit = 9;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (fmIn != null) {
			page = (Integer) fmIn.get("page");
		}
		roomFilter.setPage(page);

		List<RoomBean> roomList = new ArrayList<RoomBean>();
		int listCount = service.getFilterCount(roomFilter);
		roomList = service.getFilterList(roomFilter);

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

		return "room/room_async";
	}

	// 필터 페이징
	@RequestMapping("roomFilterPage")
	public String roomFilterPage(@RequestParam HashMap<String, String> map, HttpServletRequest request)
			throws Exception {

		FlashMap fmOut = RequestContextUtils.getOutputFlashMap(request);

		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		fmOut.put("map", map);
		fmOut.put("page", page);

		return "redirect:roomFilter";
	}

	// 작성 폼
	@RequestMapping("roomWriteForm")
	public String roomWriteForm() {

		return "room/room_writeform";
	}

	// 작성
	@RequestMapping("roomWrite")
	public String roomWrite(MultipartHttpServletRequest mtf, Model model, HttpServletRequest request, RoomBean room)
			throws Exception {

		List<MultipartFile> fileList = mtf.getFiles("roomPhotos");
		String path = request.getSession().getServletContext().getRealPath("upload");

		StringBuilder files = new StringBuilder();
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename();
			StringTokenizer st = new StringTokenizer(originFileName, ".");

			String file[] = new String[2];
			file[0] = st.nextToken();
			file[1] = st.nextToken();

			int result = 0;
			int size = (int) mf.getSize();
			if (size > 10000000) {
				result = 1;
				model.addAttribute("result", result);

				return "alert/upload_alert";

			} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("jpeg")
					&& !file[1].equals("png")) {

				result = 2;
				model.addAttribute("result", result);

				return "alert/upload_alert";
			}
			String safeFile = System.currentTimeMillis() + originFileName;
			files.append(safeFile + ",");

			mf.transferTo(new File(path + "/" + safeFile));
		}
		room.setRoom_photo(files.toString());

		service.insert(room);

		return "redirect:/roomList";
	}

	// 상세, 수정 폼
	@RequestMapping("roomDetail")
	public String roomDetail(@RequestParam("room_id") int room_id, @RequestParam("page") String page,
			@RequestParam("state") String state, RoomBookmarkBean roommark, RoomLikeBean roomlike, HttpSession session,
			Model model) throws Exception {

		String id = (String) session.getAttribute("id");
		roommark.setId(id);
		roommark.setRoom_id(room_id);

		int markCount = service.getMarkCount(roommark);
		boolean isMark = false;
		if (markCount == 1) {
			isMark = true;
		} else if (markCount == 0) {
			isMark = false;
		}

		RoomBean room = service.getDetail(room_id);

		double avgRate = 0;
		int listCount = reviewService.getReviewCount(room_id);
		if (listCount > 0) {
			avgRate = reviewService.getAvgRate(room_id);
		} else {
			listCount = 0;
		}
		room.setRoom_rate(avgRate);
		service.updateRate(room);

		List<PlaceBean> queryList = new ArrayList<PlaceBean>();
		String[] addr = room.getRoom_addr().split(" ");
		String city = addr[1];
		queryList = service.getQueryList(city);

		model.addAttribute("room", room);
		model.addAttribute("page", page);

		List<RoomReviewBean> reviewlist = new ArrayList<RoomReviewBean>();
		List<RoomQnaBean> qnalist = new ArrayList<RoomQnaBean>();

		if (state.equals("cont")) {
			String content = room.getRoom_content().replace("\n", "<br/>");
			model.addAttribute("content", content);
			model.addAttribute("queryList", queryList);
			model.addAttribute("city", city);
			model.addAttribute("isMark", isMark);
			model.addAttribute("room_id", room_id);

			reviewlist = reviewService.getReviewList(room_id);

			List<Integer> likeTotalList = new ArrayList<>();
			List<Boolean> isLikeList = new ArrayList<>();
			for (RoomReviewBean review : reviewlist) {
				String reviewContent = review.getRev_content().replace("\n", "<br/>");
				review.setRev_content(reviewContent);
				
				int likeTotal = reviewService.getLikeTotal(review.getRoom_rev_id());
				likeTotalList.add(likeTotal);

				roomlike.setId(id);
				roomlike.setRoom_rev_id(review.getRoom_rev_id());

				int likeCount = reviewService.getLikeCount(roomlike);
				boolean isLike = false;
				if (likeCount == 1) {
					isLike = true;
				} else if (likeCount == 0) {
					isLike = false;
				}
				isLikeList.add(isLike);
			}

			qnalist = qnaService.getQnaList(room_id);

			model.addAttribute("avgRate", avgRate);
			model.addAttribute("likeTotalList", likeTotalList);
			model.addAttribute("isLikeList", isLikeList);
			model.addAttribute("reviewlist", reviewlist);
			model.addAttribute("listCount", listCount);
			model.addAttribute("qnalist", qnalist);

			return "room/room_detail";

		} else if (state.equals("modify")) {

			return "room/room_modifyform";
		}

		return null;
	}

	// 수정
	@RequestMapping(value = "roomModify", method = RequestMethod.POST)
	public String roomModify(MultipartHttpServletRequest mtf, HttpServletRequest request,
			@ModelAttribute RoomBean roomBean, @RequestParam("page") String page, Model model) throws Exception {

		List<MultipartFile> fileList = mtf.getFiles("room_photos");
		String path = request.getSession().getServletContext().getRealPath("upload");

		StringBuilder files = new StringBuilder();
		int size = 0;
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename();

			int result = 0;
			size = (int) mf.getSize();
			if (size > 0) {
				StringTokenizer st = new StringTokenizer(originFileName, ".");
				String file[] = new String[2];
				file[0] = st.nextToken();
				file[1] = st.nextToken();

				if (size > 10000000) {
					result = 1;
					model.addAttribute("result", result);

					return "alert/upload_alert";

				} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("jpeg")
						&& !file[1].equals("png")) {
					result = 2;
					model.addAttribute("result", result);

					return "alert/upload_alert";
				}
				String safeFile = System.currentTimeMillis() + originFileName;
				files.append(safeFile + ",");

				mf.transferTo(new File(path + "/" + safeFile));
			}
		}

		RoomBean old = service.getDetail(roomBean.getRoom_id());
		if (size > 0) {
			roomBean.setRoom_photo(files.toString());

			String[] photos = old.getRoom_photo().split(",");
			for (String photoName : photos) {
				File photoFile = new File(path + "/" + photoName);
				if (photoFile.exists()) {
					photoFile.delete();
				}
			}
		} else {
			roomBean.setRoom_photo(old.getRoom_photo());
		}

		service.modify(roomBean);

		return "redirect:/roomDetail?room_id=" + roomBean.getRoom_id() + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping(value = "roomDelete", method = RequestMethod.POST)
	public String roomDelete(@RequestParam("room_id") int room_id, @RequestParam("page") int page,
			HttpServletRequest request) throws Exception {

		String path = request.getSession().getServletContext().getRealPath("upload");
		RoomBean room = service.getDetail(room_id);

		String[] photos = room.getRoom_photo().split(",");
		for (String photoName : photos) {
			File photoFile = new File(path + "/" + photoName);
			if (photoFile.exists()) {
				photoFile.delete();
			}
		}

		service.delete(room_id);

		return "redirect:/roomList?page=" + page;
	}

	// 북마크
	@RequestMapping("addRoomMark")
	public String addRoomMark(@RequestParam("room_id") int room_id, @RequestParam("page") String page,
			@RequestParam("state") String state, RoomBookmarkBean roommark, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		roommark.setId(id);
		roommark.setRoom_id(room_id);

		int markCount = service.getMarkCount(roommark);
		if (markCount == 0) {
			service.addMark(roommark);
		} else {
			service.delMark(roommark);
		}

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

}

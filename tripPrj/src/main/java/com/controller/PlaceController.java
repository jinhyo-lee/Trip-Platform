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
import com.model.PlaceBookmarkBean;
import com.model.PlaceFilterBean;
import com.model.PlaceLikeBean;
import com.model.PlaceQnaBean;
import com.model.PlaceReviewBean;
import com.service.PlaceQnaService;
import com.service.PlaceReviewService;
import com.service.PlaceService;

@Controller
public class PlaceController {

	@Autowired
	private PlaceService service;

	@Autowired
	private PlaceReviewService reviewService;

	@Autowired
	private PlaceQnaService qnaService;

	// 목록
	@RequestMapping("placeList")
	public String placeList(Model model, HttpServletRequest request) throws Exception {
		List<PlaceBean> placeList = new ArrayList<PlaceBean>();

		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int listCount = service.getCount();
		placeList = service.getList(page);

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
		model.addAttribute("placeList", placeList);

		return "place/place_list";
	}

	// 필터
	@SuppressWarnings("unchecked")
	@RequestMapping("placeFilter")
	public String roomFilter(@RequestParam HashMap<String, String> map, PlaceFilterBean placeFilter, Model model,
			HttpServletRequest request) throws Exception {

		Map<String, ?> fmIn = RequestContextUtils.getInputFlashMap(request);
		if (fmIn != null) {
			map = (HashMap<String, String>) fmIn.get("map");
		}
		System.out.println(map);

		List<String> act = new ArrayList<>();
		List<String> type = new ArrayList<>();
		for (String key : map.keySet()) {
			if (key.equals("city"))
				placeFilter.setCity(map.get("city"));
			if (key.equals("district"))
				placeFilter.setDistrict(map.get("district"));
			if (key.equals("rate"))
				placeFilter.setRate(Double.parseDouble(map.get("rate")));

			if (key.contains("act"))
				act.add(map.get(key));
			if (key.contains("type"))
				type.add(map.get(key));
		}
		placeFilter.setAct(act);
		placeFilter.setType(type);

		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (fmIn != null) {
			page = (Integer) fmIn.get("page");
		}
		placeFilter.setPage(page);

		List<PlaceBean> placeList = new ArrayList<PlaceBean>();
		int listCount = service.getFilterCount(placeFilter);
		placeList = service.getFilterList(placeFilter);

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
		model.addAttribute("placeList", placeList);

		return "place/place_async";
	}

	// 필터 페이징
	@RequestMapping("placeFilterPage")
	public String placeFilterPage(@RequestParam HashMap<String, String> map, HttpServletRequest request)
			throws Exception {

		FlashMap fmOut = RequestContextUtils.getOutputFlashMap(request);

		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		fmOut.put("map", map);
		fmOut.put("page", page);

		return "redirect:placeFilter";
	}

	// 작성 폼
	@RequestMapping("placeWriteForm")
	public String placeWriteForm() {

		return "place/place_writeform";
	}

	/// 작성
	@RequestMapping("placeWrite")
	public String placeWrite(MultipartHttpServletRequest mtf, Model model, HttpServletRequest request, PlaceBean place)
			throws Exception {

		String hour = "오전 " + request.getParameter("open") + " ~ 오후 " + request.getParameter("close");
		place.setPlace_hour(hour);

		List<MultipartFile> fileList = mtf.getFiles("placePhotos");
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

			} else if (!file[1].equals("jpg") && !file[1].equals("jpeg") && !file[1].equals("gif")
					&& !file[1].equals("png")) {

				result = 2;
				model.addAttribute("result", result);

				return "alert/upload_alert";
			}
			String safeFile = System.currentTimeMillis() + originFileName;
			files.append(safeFile + ",");

			mf.transferTo(new File(path + "/" + safeFile));
		}
		place.setPlace_photo(files.toString());

		service.insert(place);

		return "redirect:/placeList";
	}

	// 상세, 수정 폼
	@RequestMapping("placeDetail")
	public String placeDetail(@RequestParam("place_id") int place_id, @RequestParam("page") String page,
			@RequestParam("state") String state, PlaceBookmarkBean placemark, PlaceLikeBean placelike,
			HttpSession session, Model model) throws Exception {

		String id = (String) session.getAttribute("id");
		placemark.setId(id);
		placemark.setPlace_id(place_id);

		int markCount = service.getMarkCount(placemark);
		boolean isMark = false;
		if (markCount == 1) {
			isMark = true;
		} else if (markCount == 0) {
			isMark = false;
		}

		PlaceBean place = service.getDetail(place_id);

		double avgRate = 0;
		int listCount = reviewService.getReviewCount(place_id);
		if (listCount > 0) {
			avgRate = reviewService.getAvgRate(place_id);
		} else {
			listCount = 0;
		}
		place.setPlace_rate(avgRate);
		service.updateRate(place);

		String[] hour = place.getPlace_hour().split(" ");
		String open = hour[1];
		String close = hour[4];

		List<PlaceBean> queryList = new ArrayList<PlaceBean>();
		String[] addr = place.getPlace_addr().split(" ");
		String city = addr[1];
		queryList = service.getQueryList(city);

		model.addAttribute("place", place);
		model.addAttribute("page", page);

		List<PlaceReviewBean> reviewlist = new ArrayList<PlaceReviewBean>();
		List<PlaceQnaBean> qnalist = new ArrayList<PlaceQnaBean>();

		if (state.equals("cont")) {
			String content = place.getPlace_content().replace("\n", "<br/>");
			model.addAttribute("content", content);
			model.addAttribute("queryList", queryList);
			model.addAttribute("city", city);
			model.addAttribute("isMark", isMark);
			model.addAttribute("place_id", place_id);

			reviewlist = reviewService.getReviewList(place_id);

			List<Integer> likeTotalList = new ArrayList<>();
			List<Boolean> isLikeList = new ArrayList<>();
			for (PlaceReviewBean review : reviewlist) {
				String reviewContent = review.getRev_content().replace("\n", "<br/>");
				review.setRev_content(reviewContent);

				int likeTotal = reviewService.getLikeTotal(review.getPlace_rev_id());
				likeTotalList.add(likeTotal);

				placelike.setId(id);
				placelike.setPlace_rev_id(review.getPlace_rev_id());

				int likeCount = reviewService.getLikeCount(placelike);
				boolean isLike = false;
				if (likeCount == 1) {
					isLike = true;
				} else if (likeCount == 0) {
					isLike = false;
				}
				isLikeList.add(isLike);
			}

			qnalist = qnaService.getQnaList(place_id);
			
			model.addAttribute("avgRate", avgRate);
			model.addAttribute("likeTotalList", likeTotalList);
			model.addAttribute("isLikeList", isLikeList);
			model.addAttribute("reviewlist", reviewlist);
			model.addAttribute("listCount", listCount);
			model.addAttribute("qnalist", qnalist);

			return "place/place_detail";

		} else if (state.equals("modify")) {
			model.addAttribute("open", open);
			model.addAttribute("close", close);

			return "place/place_modifyform";
		}

		return null;
	}

	// 수정
	@RequestMapping(value = "placeModify", method = RequestMethod.POST)
	public String placeModify(MultipartHttpServletRequest mtf, HttpServletRequest request,
			@ModelAttribute PlaceBean placeBean, @RequestParam("page") String page, Model model) throws Exception {

		String hour = "오전 " + request.getParameter("open") + " ~ 오후 " + request.getParameter("close");
		placeBean.setPlace_hour(hour);

		List<MultipartFile> fileList = mtf.getFiles("place_photos");
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

		PlaceBean old = service.getDetail(placeBean.getPlace_id());
		if (size > 0) {
			placeBean.setPlace_photo(files.toString());

			String[] photos = old.getPlace_photo().split(",");
			for (String photoName : photos) {
				File photoFile = new File(path + "/" + photoName);
				if (photoFile.exists()) {
					photoFile.delete();
				}
			}
		} else {
			placeBean.setPlace_photo(old.getPlace_photo());
		}

		service.modify(placeBean);

		return "redirect:/placeDetail?place_id=" + placeBean.getPlace_id() + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping(value = "placeDelete", method = RequestMethod.POST)
	public String placeDelete(@RequestParam("place_id") int place_id, @RequestParam("page") int page,
			HttpServletRequest request) throws Exception {

		String path = request.getSession().getServletContext().getRealPath("upload");
		PlaceBean place = service.getDetail(place_id);

		String[] photos = place.getPlace_photo().split(",");
		for (String photoName : photos) {
			File photoFile = new File(path + "/" + photoName);
			if (photoFile.exists()) {
				photoFile.delete();
			}
		}

		service.delete(place_id);

		return "redirect:/placeList?page=" + page;
	}

	// 북마크
	@RequestMapping("addPlaceMark")
	public String addPlaceMark(@RequestParam("place_id") int place_id, @RequestParam("page") String page,
			@RequestParam("state") String state, PlaceBookmarkBean placemark, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		placemark.setId(id);
		placemark.setPlace_id(place_id);

		int markCount = service.getMarkCount(placemark);
		if (markCount == 0) {
			service.addMark(placemark);
		} else {
			service.delMark(placemark);
		}

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

}

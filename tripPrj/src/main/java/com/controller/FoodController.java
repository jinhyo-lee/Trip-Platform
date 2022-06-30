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
import com.model.FoodBean;
import com.model.FoodBookmarkBean;
import com.model.FoodFilterBean;
import com.model.FoodLikeBean;
import com.model.FoodQnaBean;
import com.model.FoodReviewBean;
import com.model.PlaceBean;
import com.service.FoodQnaService;
import com.service.FoodReviewService;
import com.service.FoodService;

@Controller
public class FoodController {

	@Autowired
	private FoodService service;

	@Autowired
	private FoodReviewService reviewService;

	@Autowired
	private FoodQnaService qnaService;

	// 목록
	@RequestMapping("foodList")
	public String foodList(Model model, HttpServletRequest request) throws Exception {
		List<FoodBean> foodList = new ArrayList<FoodBean>();

		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int listCount = service.getCount();
		foodList = service.getList(page);

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
		model.addAttribute("foodList", foodList);

		return "food/food_list";
	}

	// 필터
	@SuppressWarnings("unchecked")
	@RequestMapping("foodFilter")
	public String foodFilter(@RequestParam HashMap<String, String> map, FoodFilterBean foodFilter, Model model,
			HttpServletRequest request) throws Exception {

		Map<String, ?> fmIn = RequestContextUtils.getInputFlashMap(request);
		if (fmIn != null) {
			map = (HashMap<String, String>) fmIn.get("map");
		}
		System.out.println(map);

		List<String> type = new ArrayList<>();
		List<String> feat = new ArrayList<>();
		for (String key : map.keySet()) {
			if (key.equals("city"))
				foodFilter.setCity(map.get("city"));
			if (key.equals("district"))
				foodFilter.setDistrict(map.get("district"));
			if (key.equals("minCost"))
				foodFilter.setMinCost(Integer.parseInt(map.get("minCost")));
			if (key.equals("maxCost"))
				foodFilter.setMaxCost(Integer.parseInt(map.get("maxCost")));
			if (key.equals("rate"))
				foodFilter.setRate(Double.parseDouble(map.get("rate")));

			if (key.contains("type"))
				type.add(map.get(key));
			if (key.contains("feat"))
				feat.add(map.get(key));
		}
		foodFilter.setType(type);
		foodFilter.setFeat(feat);

		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (fmIn != null) {
			page = (Integer) fmIn.get("page");
		}
		foodFilter.setPage(page);

		List<FoodBean> foodList = new ArrayList<FoodBean>();
		int listCount = service.getFilterCount(foodFilter);
		foodList = service.getFilterList(foodFilter);

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
		model.addAttribute("foodList", foodList);

		return "food/food_async";
	}

	// 필터 페이징
	@RequestMapping("foodFilterPage")
	public String foodFilterPage(@RequestParam HashMap<String, String> map, HttpServletRequest request)
			throws Exception {

		FlashMap fmOut = RequestContextUtils.getOutputFlashMap(request);

		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		fmOut.put("map", map);
		fmOut.put("page", page);

		return "redirect:foodFilter";
	}

	// 작성 폼
	@RequestMapping("foodWriteForm")
	public String foodWriteForm() {

		return "food/food_writeform";
	}

	// 작성
	@RequestMapping("foodWrite")
	public String foodWrite(MultipartHttpServletRequest mtf, Model model, HttpServletRequest request,
			HttpSession session, FoodBean food) throws Exception {

		String hour = "오전 " + request.getParameter("open") + " ~ 오후 " + request.getParameter("close");
		food.setFood_hour(hour);

		List<MultipartFile> fileList = mtf.getFiles("foodPhotos");
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
		food.setFood_photo(files.toString());

		service.insert(food);

		return "redirect:/foodList";
	}

	// 상세, 수정 폼
	@RequestMapping("foodDetail")
	public String foodDetail(@RequestParam("food_id") int food_id, @RequestParam("page") String page,
			@RequestParam("state") String state, FoodBookmarkBean foodmark, FoodLikeBean foodlike, HttpSession session,
			Model model) throws Exception {

		String id = (String) session.getAttribute("id");
		foodmark.setId(id);
		foodmark.setFood_id(food_id);

		int markCount = service.getMarkCount(foodmark);
		boolean isMark = false;
		if (markCount == 1) {
			isMark = true;
		} else if (markCount == 0) {
			isMark = false;
		}

		FoodBean food = service.getDetail(food_id);

		// 평점
		double avgRate = 0;
		int listCount = reviewService.getReviewCount(food_id);
		if (listCount > 0) {
			avgRate = reviewService.getAvgRate(food_id);
		} else {
			listCount = 0;
		}
		food.setFood_rate(avgRate);
		service.updateRate(food);

		String[] hour = food.getFood_hour().split(" ");
		String open = hour[1];
		String close = hour[4];

		// 인근 장소
		List<PlaceBean> queryList = new ArrayList<PlaceBean>();
		String[] addr = food.getFood_addr().split(" ");
		String city = addr[1];
		queryList = service.getQueryList(city);

		model.addAttribute("food", food);
		model.addAttribute("page", page);

		List<FoodReviewBean> reviewlist = new ArrayList<FoodReviewBean>();
		List<FoodQnaBean> qnalist = new ArrayList<FoodQnaBean>();

		if (state.equals("cont")) {
			String content = food.getFood_content().replace("\n", "<br/>");
			model.addAttribute("content", content);
			model.addAttribute("queryList", queryList);
			model.addAttribute("city", city);
			model.addAttribute("isMark", isMark);
			model.addAttribute("food_id", food_id);

			reviewlist = reviewService.getReviewList(food_id);

			List<Integer> likeTotalList = new ArrayList<>();
			List<Boolean> isLikeList = new ArrayList<>();
			for (FoodReviewBean review : reviewlist) {
				String reviewContent = review.getRev_content().replace("\n", "<br/>");
				review.setRev_content(reviewContent);

				int likeTotal = reviewService.getLikeTotal(review.getFood_rev_id());
				likeTotalList.add(likeTotal);

				foodlike.setId(id);
				foodlike.setFood_rev_id(review.getFood_rev_id());

				int likeCount = reviewService.getLikeCount(foodlike);
				boolean isLike = false;
				if (likeCount == 1) {
					isLike = true;
				} else if (likeCount == 0) {
					isLike = false;
				}
				isLikeList.add(isLike);
			}

			qnalist = qnaService.getQnaList(food_id);
			
			model.addAttribute("avgRate", avgRate);
			model.addAttribute("likeTotalList", likeTotalList);
			model.addAttribute("isLikeList", isLikeList);
			model.addAttribute("reviewlist", reviewlist);
			model.addAttribute("listCount", listCount);
			model.addAttribute("qnalist", qnalist);

			return "food/food_detail";

		} else if (state.equals("modify")) {
			model.addAttribute("open", open);
			model.addAttribute("close", close);

			return "food/food_modifyform";
		}

		return null;
	}

	// 수정
	@RequestMapping(value = "foodModify", method = RequestMethod.POST)
	public String foodModify(MultipartHttpServletRequest mtf, HttpServletRequest request,
			@ModelAttribute FoodBean foodBean, @RequestParam("page") String page, Model model, HttpSession session)
			throws Exception {

		String hour = "오전 " + request.getParameter("open") + " ~ 오후 " + request.getParameter("close");
		foodBean.setFood_hour(hour);

		List<MultipartFile> fileList = mtf.getFiles("food_photos");
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

		FoodBean old = service.getDetail(foodBean.getFood_id());

		if (size > 0) {
			foodBean.setFood_photo(files.toString());

			String[] photos = old.getFood_photo().split(",");
			for (String photoName : photos) {
				File photoFile = new File(path + "/" + photoName);
				if (photoFile.exists()) {
					photoFile.delete();
				}
			}
		} else {
			foodBean.setFood_photo(old.getFood_photo());
		}

		service.modify(foodBean);

		return "redirect:/foodDetail?food_id=" + foodBean.getFood_id() + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping(value = "foodDelete", method = RequestMethod.POST)
	public String foodDelete(@RequestParam("food_id") int food_id, @RequestParam("page") int page,
			HttpServletRequest request) throws Exception {

		String path = request.getSession().getServletContext().getRealPath("upload");
		FoodBean food = service.getDetail(food_id);

		String[] photos = food.getFood_photo().split(",");
		for (String photoName : photos) {
			File photoFile = new File(path + "/" + photoName);
			if (photoFile.exists()) {
				photoFile.delete();
			}
		}

		service.delete(food_id);

		return "redirect:/foodList?page=" + page;
	}

	// 북마크
	@RequestMapping("addFoodMark")
	public String addFoodMark(@RequestParam("food_id") int food_id, @RequestParam("page") String page,
			@RequestParam("state") String state, FoodBookmarkBean foodmark, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		foodmark.setId(id);
		foodmark.setFood_id(food_id);

		int markCount = service.getMarkCount(foodmark);
		if (markCount == 0) {
			service.addMark(foodmark);
		} else {
			service.delMark(foodmark);
		}

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

}

package com.controller;

import java.io.File;
import java.util.StringTokenizer;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.model.MemberBean;
import com.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	private MypageService service;

	// 마이페이지
	@RequestMapping("myPage")
	public String myPage(HttpSession session, Model model) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean editm = service.userDetail(id);

		int len = editm.getPw().length();
		String encrypt = "";
		for (int i = 0; i < len; i++) {
			encrypt += "*";
		}

		model.addAttribute("editm", editm);
		model.addAttribute("id", id);
		model.addAttribute("encrypt", encrypt);

		return "mypage/mypage";
	}

	// 회원정보 수정
	@RequestMapping(value = "memberModify", method = RequestMethod.POST)
	public String memberModify(@RequestParam("profiles") MultipartFile mf, MemberBean member,
			HttpServletRequest request, HttpSession session, Model model) throws Exception {

		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();

		String path = request.getRealPath("upload");
		System.out.println("path:" + path);

		int result = 0;
		String file[] = new String[2];
		String newfilename = "";

		if (size > 0) {
			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();
			file[1] = st.nextToken();
			UUID uuid = UUID.randomUUID();

			newfilename = uuid.toString() + "." + file[1];
			System.out.println("newfilename: " + newfilename);
			if (size > 10000000) {
				result = 1;
				model.addAttribute("result", result);

				return "mypage/mypage_profile";
			} else if (!file[1].equals("jpg") && !file[1].equals("jpeg") && !file[1].equals("gif")
					&& !file[1].equals("png")) {
				result = 2;
				model.addAttribute("result", result);

				return "mypage/mypage_profile";
			}
		}

		if (size > 0) {
			mf.transferTo(new File(path + "/" + newfilename));
		}

		String id = (String) session.getAttribute("id");
		MemberBean modifym = service.userDetail(id);

		if (size > 0) {
			member.setProfile(newfilename);
		} else {
			member.setProfile(modifym.getProfile());
		}

		member.setId(id);
		service.updateMember(member);

		model.addAttribute("name", member.getName());
		model.addAttribute("profiles", member.getProfile());

		return "redirect:myPage";
	}

	// 회원 탈퇴 폼
	@RequestMapping(value = "/memberDeleteForm")
	public String member_del(HttpSession session, Model model) throws Exception {
		String id = (String) session.getAttribute("id");
		MemberBean deleteM = service.userDetail(id);

		model.addAttribute("d_id", id);
		model.addAttribute("d_name", deleteM.getName());

		return "mypage/mypage_quit";
	}

	// 회원 탈퇴
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(@RequestParam("pw") String pw, MemberBean member, HttpServletRequest request,
			HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		MemberBean mypage = this.service.userDetail(id);

		if (!mypage.getPw().equals(pw)) {
			return "mypage/mypage_pwresult";
		} else {
			String up = session.getServletContext().getRealPath("upload");
			String fname = mypage.getProfile();
			System.out.println("up:" + up);

			if (fname != null) {
				File delFile = new File(up + "/" + fname);
				delFile.delete();
			}
			
			MemberBean delm = new MemberBean();
			delm.setId(id);
			service.deleteMember(delm);

			session.invalidate();

			return "redirect:main";
		}
	}

	// 로그아웃
	@RequestMapping("mypageLogout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "mypage/mypage_logout";
	}

}

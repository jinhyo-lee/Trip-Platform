package com.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.MemberDao;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.model.MemberBean;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;

	// 회원 정보
	public MemberBean getMember(String id) throws Exception {
		return memberDao.getMember(id);
	}

	// 비밀번호 검색
	public MemberBean pwFind(MemberBean m) throws Exception {
		return memberDao.pwFind(m);
	}

	// 회원 가입
	public void joinMember(MemberBean member) throws Exception {
		memberDao.joinMember(member);
	}

	// 아이디 중복 검사
	public int checkMemberId(String id) throws Exception {
		return memberDao.checkMemberId(id);
	}

	// 카카오 로그인
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		memberDao.kakaoinsert(userInfo);
	}

	// 카카오 정보 확인
	public MemberBean findkakao(HashMap<String, Object> userInfo) {
		return memberDao.findkakao(userInfo);
	}

	// 엑세스 토큰 생성
	public String getAccessToken(String code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true); // 기본값 false 에서 true 로 변경

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream())); // 파라미터 값 전달
			StringBuilder sb = new StringBuilder();

			sb.append("grant_type=authorization_code");
			sb.append("&client_id=7e436f026896af8927b747e85c5fd911"); // 발급받은 key
			sb.append("&redirect_uri=http://localhost/kakaoLogin"); // 설정한 주소
			sb.append("&code=" + code);

			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode); // 200일 시 성공

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream())); // json 타입 값 받기

			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("responseBody : " + result);

			@SuppressWarnings("deprecation")
			JsonParser parser = new JsonParser(); // json 파싱 객체 생성
			@SuppressWarnings("deprecation")
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	// 카카오 정보 반환
	public MemberBean getUserInfo(String access_Token) {

		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token); // header에 포함될 내용

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("responseBody : " + result);

			@SuppressWarnings("deprecation")
			JsonParser parser = new JsonParser();
			@SuppressWarnings("deprecation")
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("nickname", nickname);
			userInfo.put("email", email);

		} catch (IOException e) {
			e.printStackTrace();
		}

		MemberBean result = memberDao.findkakao(userInfo); // 이미 정보가 저장되어 있는 지 확인
		if (result == null) {
			memberDao.kakaoinsert(userInfo); // 카카오 정보 DB에 저장

			return memberDao.findkakao(userInfo); // 저장된 카카오 정보 컨트롤러에 반환
		} else {
			return result;
		}
	}

}

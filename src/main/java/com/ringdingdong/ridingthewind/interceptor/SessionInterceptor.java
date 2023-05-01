package com.ringdingdong.ridingthewind.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class SessionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")!=null) {		// 세션에 로그인 정보가 있다면 그대로 진행한다.
			return true;
		} else {		// 세션에 로그인 정보가 없다면 redirect 시킨다.
			response.sendRedirect("/user/signin");
			return false;
		}
	}
	
}

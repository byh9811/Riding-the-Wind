package com.ringdingdong.ridingthewind.user.controller;

import com.ringdingdong.ridingthewind.user.dto.UserDto;
import com.ringdingdong.ridingthewind.user.entity.User;
import com.ringdingdong.ridingthewind.user.service.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    public final UserServiceImpl userService;

    @GetMapping(value="signin")
    public String signin(){
        System.out.println("페이지 접속");
        return "user/signin";
    }

    @PostMapping(value="signin")
    public String signin(@RequestParam Map<String, String> map, HttpSession session, Model model){
        UserDto temp = new UserDto();
        temp.setUserId(map.get("userid"));
        temp.setUserPassword(map.get("userpwd"));
        System.out.println(model.toString());
        System.out.println(map.get("saveid"));

        try {
            User userDto = userService.signinUser(temp);
            if(userDto != null){
                session.setAttribute("loginUser", userDto);

                Cookie cookie = new Cookie("userId", userDto.getUserId());
                cookie.setPath("/");
                System.out.println();
                if("ok".equals(map.get("saveid"))){
                    cookie.setMaxAge(60*60);
                }else{
                    cookie.setMaxAge(0);
                }
                return "redirect:/";
            } else{
                model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 다시하쇼");
                return "user/login";

            }
        } catch (Exception e){
            e.printStackTrace();
            model.addAttribute("msg", "로그인 중 문제 발생");
        }
        return "error/error";
    }


    @GetMapping(value="signout")
    public String signout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
}

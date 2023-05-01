package com.ringdingdong.ridingthewind.user.controller;

import com.ringdingdong.ridingthewind.user.dto.UserDto;
import com.ringdingdong.ridingthewind.user.dto.UserSessionDto;
import com.ringdingdong.ridingthewind.user.entity.User;
import com.ringdingdong.ridingthewind.user.service.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/user")
public class UserController {
    public final UserServiceImpl userService;

    @GetMapping(value="/signin")
    public String signin(){
        System.out.println("페이지 접속");
        return "user/signin";
    }

    @PostMapping(value="/signin")
    public String signin(@RequestParam Map<String, String> map, HttpSession session, Model model){
        UserDto temp = new UserDto();
        temp.setUserId(map.get("userid"));
        temp.setUserPassword(map.get("userpwd"));

        try {
            User user = userService.signinUser(temp);
            if(user != null){
                UserSessionDto userSessionDto = new UserSessionDto(user);
                session.setAttribute("loginUser", userSessionDto);

                Cookie cookie = new Cookie("userId", userSessionDto.getUserId());
                cookie.setPath("/");
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


    @GetMapping(value="/signout")
    public String signout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping(value="/signup")
    public String signup(){

        return "user/signup";
    }

    @PostMapping(value="/signup")
    public String signup(@ModelAttribute UserDto userDto, HttpSession session){
        int result = 1;
        try {
            result = userService.signupUser(userDto);
        } catch (Exception e){
            return "redirect:/user/signup";
        }
        if(result==1) {
            UserSessionDto userSessionDto = new UserSessionDto();
            userSessionDto.setUserId(userDto.getUserId());
            userSessionDto.setUserName(userDto.getUserName());
            session.setAttribute("loginUser", userSessionDto);
            return "redirect:/";
        } else{
            return "redirect:/user/signup";
        }
    }

    @GetMapping(value = "/mypage")
    public String mypage(){
        return "/user/mypage";
    }

    @GetMapping(value="/viewinfo")
    public String viewinfo(Model model, HttpSession session){

        UserSessionDto userSessionDto = (UserSessionDto) session.getAttribute("loginUser");

        User user = userService.searchUser(userSessionDto.getUserId());
        model.addAttribute("userinfo", user);
        return "user/viewinfo";
    }

    @GetMapping(value = "/info")
    public String info(){
        System.out.println("userinfo 들어왔어요");
        return "redirect:/user/viewinfo";
    }

    @GetMapping(value = "/updateinfo")
    public String updateinfo(Model model, HttpSession session){
        UserSessionDto userSessionDto = (UserSessionDto) session.getAttribute("loginUser");

        User user = userService.searchUser(userSessionDto.getUserId());
        model.addAttribute("userinfo", user);
        return "user/updateuserinfo";
    }
    @GetMapping(value="/update")
    public String update(){
        return "redirect:/user/updateinfo";
    }

    @PostMapping(value="/update")
    public String update(@RequestParam Map<String, String> map,@ModelAttribute UserDto userDto){
        System.out.println(userDto.toString());
        int result = userService.updateUser(userDto);
        System.out.println("업데이트 들어온건가");
        System.out.println(map.get("userid"));
        return "redirect:/user/info";
    }

    @GetMapping(value = "/delete")
    public String delete(HttpSession session){
        UserSessionDto userSessionDto = (UserSessionDto) session.getAttribute("loginUser");
        System.out.println(userSessionDto.toString());
        int result = userService.deleteUser(userSessionDto.getUserId());
        if(result == 1){
            session.invalidate();

        }
        return "redirect:/";
    }
}

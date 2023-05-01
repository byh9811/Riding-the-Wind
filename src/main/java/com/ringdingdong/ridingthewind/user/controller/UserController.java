package com.ringdingdong.ridingthewind.user.controller;

import com.ringdingdong.ridingthewind.user.dto.UserDto;
import com.ringdingdong.ridingthewind.user.entity.User;
import com.ringdingdong.ridingthewind.user.service.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    public final UserServiceImpl userService;

    @GetMapping(value="signin")
    public String signin(){
        return "user/signin";
    }

    @PostMapping(value="signin")
    public String signin(@RequestParam("userid") String userId, @RequestParam("userpwd") String userPwd, HttpSession session){
        UserDto temp = new UserDto();
        temp.setUserId(userId);
        temp.setUserPassword(userPwd);
        User userDto = userService.signinUser(temp);
        System.out.println(userDto.getUserName());
        System.out.println(userDto.getUserPassword());
        return "index";
    }

}

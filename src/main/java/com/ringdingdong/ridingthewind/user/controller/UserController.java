package com.ringdingdong.ridingthewind.user.controller;

import com.ringdingdong.ridingthewind.user.service.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class UserController {
    public final UserServiceImpl userService;
}

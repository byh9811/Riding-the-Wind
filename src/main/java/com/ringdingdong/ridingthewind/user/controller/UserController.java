package com.ringdingdong.ridingthewind.user.controller;

import com.ringdingdong.ridingthewind.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class UserController {
    public final UserService userService;
}

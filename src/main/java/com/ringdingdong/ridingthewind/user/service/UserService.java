package com.ringdingdong.ridingthewind.user.service;

import com.ringdingdong.ridingthewind.user.controller.UserController;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    public final UserController userController;
}

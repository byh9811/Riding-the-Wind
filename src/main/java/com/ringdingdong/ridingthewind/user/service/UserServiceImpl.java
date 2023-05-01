package com.ringdingdong.ridingthewind.user.service;

import com.ringdingdong.ridingthewind.user.controller.UserController;
import com.ringdingdong.ridingthewind.user.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
    public final UserMapper userMapper;
}

package com.ringdingdong.ridingthewind.user.service;

import com.ringdingdong.ridingthewind.user.controller.UserController;
import com.ringdingdong.ridingthewind.user.dto.UserDto;
import com.ringdingdong.ridingthewind.user.entity.User;
import com.ringdingdong.ridingthewind.user.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
    public final UserMapper userMapper;

    public User signinUser(UserDto userDto) {
        System.out.println("아니 아까까진 됐는데");
        return userMapper.signinUser(userDto);
    }

    public int signupUser(UserDto userDto) {
        return userMapper.signupUser(userDto);
    }
}

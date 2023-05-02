package com.ringdingdong.ridingthewind.user.service;

import com.ringdingdong.ridingthewind.user.dto.UserDto;
import com.ringdingdong.ridingthewind.user.entity.User;
import com.ringdingdong.ridingthewind.user.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
    public final UserMapper userMapper;

    public User signinUser(UserDto userDto) {
        return userMapper.signinUser(userDto);
    }

    public int signupUser(UserDto userDto) {
        return userMapper.signupUser(userDto);
    }

    public User searchUser(String userId) {
        return userMapper.searchUser(userId);

    }

    public int updateUser(UserDto userDto) {
        return userMapper.updateUser(userDto);
    }

    public int deleteUser(String userId) {
        return userMapper.deleteUser(userId);
    }

    public int idcheck(String userId) {
        return userMapper.idcheck(userId);
    }

    public String findPassword(String userId) {
        return userMapper.findPassword(userId);
    }

    public int updatePassword(UserDto userDto) {
        return userMapper.updatePassword(userDto);
    }
}

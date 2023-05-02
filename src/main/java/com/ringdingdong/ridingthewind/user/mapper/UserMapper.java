package com.ringdingdong.ridingthewind.user.mapper;

import com.ringdingdong.ridingthewind.user.dto.UserDto;
import com.ringdingdong.ridingthewind.user.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    User signinUser(UserDto userDto);
    int signupUser(UserDto userDto);
    User searchUser(String userId);

    int updateUser(UserDto userDto);

    int deleteUser(String userId);

    int idcheck(String userId);

    String findPassword(String userId);

    int updatePassword(UserDto userDto);
}

package com.ringdingdong.ridingthewind.user.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class UserDto {

    private String userId;
    private String userName;
    private String userPassword;
    private String emailId;
    private String emailDomain;
    private String birth;
    private String nickname;
    private String joindate;
    private String phone;
    private int deleted;

}

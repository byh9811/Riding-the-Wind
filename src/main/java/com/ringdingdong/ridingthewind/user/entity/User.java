package com.ringdingdong.ridingthewind.user.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class User {

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

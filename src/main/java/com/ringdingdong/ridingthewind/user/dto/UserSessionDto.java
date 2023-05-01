package com.ringdingdong.ridingthewind.user.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class UserSessionDto {

    private String userId;
    private String userName;

}

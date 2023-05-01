package com.ringdingdong.ridingthewind.user.dto;

import com.ringdingdong.ridingthewind.user.entity.User;
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

    public UserSessionDto(User user) {
        this.userId = user.getUserId();
        this.userName = user.getUserName();
    }
}

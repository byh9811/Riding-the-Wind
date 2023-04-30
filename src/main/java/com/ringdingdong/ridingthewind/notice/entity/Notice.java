package com.ringdingdong.ridingthewind.notice.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class Notice {

    private int articleNo;
    private String userId;
    private String title;
    private String content;
    private String registerTime;
    private String modifyTIme;
}

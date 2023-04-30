package com.ringdingdong.ridingthewind.placearticle.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class Placearticle {

    private int articleNo;
    private String userId;
    private String title;
    private String content;
    private String registerTime;
    private int view;
    private int like;
    private String modifyTime;
}

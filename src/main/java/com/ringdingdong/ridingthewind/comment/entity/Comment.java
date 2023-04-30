package com.ringdingdong.ridingthewind.comment.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class Comment {
    private int commentNo;
    private int articleNo;
    private String userId;
    private String content;
    private String registerTime;
    private String modifyTime;


}

package com.ringdingdong.ridingthewind.comment.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class CommentDto {
    private int commentNo;
    private int articleNo;
    private String userId;
    private String content;
    private String registerTime;
    private String modifyTime;

}

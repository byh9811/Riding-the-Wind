package com.ringdingdong.ridingthewind.notice.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class NoticeDto {
    private int articleNo;
    private String userId;
    private String title;
    private String content;
    private String registerTime;
    private String modifyTIme;

}

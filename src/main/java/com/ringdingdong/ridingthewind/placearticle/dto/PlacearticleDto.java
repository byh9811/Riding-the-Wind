package com.ringdingdong.ridingthewind.placearticle.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class PlacearticleDto {

    private int articleNo;
    private String userId;
    private String title;
    private String content;
    private String registerTime;
    private int view;
    private int like;
    private String modifyTime;

}

package com.ringdingdong.ridingthewind.attraction.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@ToString
public class AttractionInfo {

    private int contentId;
    private int contentTypeId;
    private String title;
    private String addr1;
    private String addr2;
    private String zipcode;
    private String tel;
    private String firstImage;
    private int sidoCode;
    private int gugunCode;
    private double latitude;
    private double longitude;

}

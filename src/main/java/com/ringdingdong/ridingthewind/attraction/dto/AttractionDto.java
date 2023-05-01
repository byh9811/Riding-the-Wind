package com.ringdingdong.ridingthewind.attraction.dto;

import com.ringdingdong.ridingthewind.attraction.entity.AttractionInfo;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class AttractionDto {

    private int contentId;
    private String title;
    private String addr1;
    private String addr2;
    private String firstImage;
    private double latitude;
    private double longitude;

    public AttractionDto(AttractionInfo attractionInfo) {
        this.contentId = attractionInfo.getContentId();
        this.title = attractionInfo.getTitle();
        this.addr1 = attractionInfo.getAddr1();
        this.addr2 = attractionInfo.getAddr2();
        this.firstImage = attractionInfo.getFirstImage();
        this.latitude = attractionInfo.getLatitude();
        this.longitude = attractionInfo.getLongitude();
    }

}

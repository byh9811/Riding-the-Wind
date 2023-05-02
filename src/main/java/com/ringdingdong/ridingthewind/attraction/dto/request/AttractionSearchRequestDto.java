package com.ringdingdong.ridingthewind.attraction.dto.request;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class AttractionSearchRequestDto {

    private int sido;
    private int gugun;
    private List<Integer> contentTypeList;
    private String title;

}

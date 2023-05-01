package com.ringdingdong.ridingthewind.attraction.service;

import com.ringdingdong.ridingthewind.attraction.entity.AttractionInfo;

import java.util.List;
import java.util.Map;

public interface AttractionInfoService {
    List<AttractionInfo> getAttractionInfoList(Map<String, String> map);

    List<AttractionInfo> getMyAttractionInfoList(String userId);

    int saveMyAttraction(Map<String, String> map);
}

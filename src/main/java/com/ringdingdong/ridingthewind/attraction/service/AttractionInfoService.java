package com.ringdingdong.ridingthewind.attraction.service;

import com.ringdingdong.ridingthewind.attraction.entity.AttractionInfo;
import com.ringdingdong.ridingthewind.attraction.entity.Gugun;
import com.ringdingdong.ridingthewind.attraction.entity.Sido;

import java.util.List;
import java.util.Map;

public interface AttractionInfoService {
    List<AttractionInfo> getAttractionInfoList(Map<String, Object> map);

    List<AttractionInfo> getMyAttractionInfoList(String userId);

    int saveMyAttraction(Map<String, String> map);

    List<Sido> getSidoList();

    List<Gugun> getGugunList(int gugun);
}

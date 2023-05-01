package com.ringdingdong.ridingthewind.attraction.service;

import com.ringdingdong.ridingthewind.attraction.entity.AttractionInfo;
import com.ringdingdong.ridingthewind.attraction.mapper.AttractionInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AttractionInfoServiceImpl implements AttractionInfoService {

    private final AttractionInfoMapper attractionInfoMapper;

    @Override
    public List<AttractionInfo> getAttractionInfoList(Map<String, String> map) {
        return attractionInfoMapper.selectAttractionListBySidoAndGugun(map);
    }

    @Override
    public List<AttractionInfo> getMyAttractionInfoList(String userId) {
        return attractionInfoMapper.selectAttractionListByUserId(userId);
    }

    @Override
    public int saveMyAttraction(Map<String, String> map) {
        return attractionInfoMapper.insertMyAttraction(map);
    }

}

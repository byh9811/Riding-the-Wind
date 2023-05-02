package com.ringdingdong.ridingthewind.attraction.service;

import com.ringdingdong.ridingthewind.attraction.entity.AttractionInfo;
import com.ringdingdong.ridingthewind.attraction.entity.Gugun;
import com.ringdingdong.ridingthewind.attraction.entity.Sido;
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
    public List<AttractionInfo> getAttractionInfoList(Map<String, Object> map) {
        return attractionInfoMapper.selectAttractionList(map);
    }

    @Override
    public List<AttractionInfo> getMyAttractionInfoList(String userId) {
        return attractionInfoMapper.selectAttractionListByUserId(userId);
    }

    @Override
    public int saveMyAttraction(Map<String, String> map) {
        return attractionInfoMapper.insertMyAttraction(map);
    }

    @Override
    public List<Sido> getSidoList() {
        return attractionInfoMapper.selectSidoList();
    }

    @Override
    public List<Gugun> getGugunList(int sido) {
        return attractionInfoMapper.selectGugunList(sido);
    }

}

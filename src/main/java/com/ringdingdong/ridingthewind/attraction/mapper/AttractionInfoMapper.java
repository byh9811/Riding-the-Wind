package com.ringdingdong.ridingthewind.attraction.mapper;

import com.ringdingdong.ridingthewind.attraction.entity.AttractionInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AttractionInfoMapper {

    List<AttractionInfo> selectAttractionListBySidoAndGugun(Map<String, String> map);

    List<AttractionInfo> selectAttractionListByUserId(String userId);

    int insertMyAttraction(Map<String, String> map);

}

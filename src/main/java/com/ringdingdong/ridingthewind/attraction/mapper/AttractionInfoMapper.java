package com.ringdingdong.ridingthewind.attraction.mapper;

import com.ringdingdong.ridingthewind.attraction.entity.AttractionInfo;
import com.ringdingdong.ridingthewind.attraction.entity.Gugun;
import com.ringdingdong.ridingthewind.attraction.entity.Sido;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AttractionInfoMapper {

    List<AttractionInfo> selectAttractionList(Map<String, Object> map);

    List<AttractionInfo> selectAttractionListByUserId(String userId);

    int insertMyAttraction(Map<String, String> map);

    List<Sido> selectSidoList();

    List<Gugun> selectGugunList(int sido);

}

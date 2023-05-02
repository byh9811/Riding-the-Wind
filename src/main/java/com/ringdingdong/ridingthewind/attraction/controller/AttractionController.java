package com.ringdingdong.ridingthewind.attraction.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.ringdingdong.ridingthewind.attraction.dto.AttractionDto;
import com.ringdingdong.ridingthewind.attraction.dto.request.AttractionSearchRequestDto;
import com.ringdingdong.ridingthewind.attraction.entity.AttractionInfo;
import com.ringdingdong.ridingthewind.attraction.entity.Gugun;
import com.ringdingdong.ridingthewind.attraction.entity.Sido;
import com.ringdingdong.ridingthewind.attraction.service.AttractionInfoService;
import com.ringdingdong.ridingthewind.user.dto.UserSessionDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
@RequestMapping("/attraction")
@Slf4j
@CrossOrigin("*")
public class AttractionController {

    private final AttractionInfoService attractionInfoService;

    @GetMapping("/search-page")
    public String moveSearchPage() {
        return "/attraction/attraction_search";
    }

    @GetMapping
    public String getAttractionList(AttractionSearchRequestDto attractionSearchRequestDto, Model model) {
        log.debug("attractionSearchRequestDto: {}", attractionSearchRequestDto);

        Map<String, Object> map = new HashMap<>();
        map.put("sido", attractionSearchRequestDto.getSido());
        map.put("gugun", attractionSearchRequestDto.getGugun());
        map.put("title", attractionSearchRequestDto.getTitle());
        map.put("contentTypeList", attractionSearchRequestDto.getContentTypeList());

        List<AttractionInfo> list = attractionInfoService.getAttractionInfoList(map);
        model.addAttribute("trips", list.stream().map(AttractionDto::new).collect(Collectors.toList()));

        return "/attraction/attraction_search";
    }

    @PostMapping("/myPick")
    public String addMyAttraction(@RequestBody String contentId, HttpSession session) {
        UserSessionDto userSessionDto = (UserSessionDto) session.getAttribute("loginUser");

        Map<String, String> map = new HashMap<>();
        map.put("userId", userSessionDto.getUserId());
        map.put("contentId", contentId);
        attractionInfoService.saveMyAttraction(map);

        return "redirect:/search-page";
    }

    @ResponseBody
    @GetMapping("/sido")
    public String getSido() {
        JsonArray ja = new JsonArray();
        log.debug("attractionInfoService : {}", attractionInfoService);
        List<Sido> sidoList = attractionInfoService.getSidoList();

        for(Sido sido : sidoList) {
            JsonObject obj = new JsonObject();
            obj.addProperty("code", sido.getCode());
            obj.addProperty("name", sido.getName());
            ja.add(obj);
        }

        JsonObject jo = new JsonObject();
        jo.add("sido", ja);

        return jo.toString();
    }

    @ResponseBody
    @GetMapping("/gugun")
    private String getGugun(@RequestParam("sido") String sido) {
        JsonArray ja = new JsonArray();
        log.debug("sido : {}", Integer.parseInt(sido));
        log.debug("attractionInfoService : {}", attractionInfoService);
        List<Gugun> gugunList = attractionInfoService.getGugunList(Integer.parseInt(sido));

        for(Gugun gugun : gugunList) {
            JsonObject obj = new JsonObject();
            obj.addProperty("code", gugun.getCode());
            obj.addProperty("name", gugun.getName());
            ja.add(obj);
        }

        JsonObject jo = new JsonObject();
        jo.add("gugun", ja);

        return jo.toString();
    }

}

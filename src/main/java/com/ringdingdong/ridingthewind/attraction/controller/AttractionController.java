package com.ringdingdong.ridingthewind.attraction.controller;

import com.ringdingdong.ridingthewind.attraction.dto.AttractionDto;
import com.ringdingdong.ridingthewind.attraction.entity.AttractionInfo;
import com.ringdingdong.ridingthewind.attraction.service.AttractionInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
@RequestMapping("/attraction")
public class AttractionController {

    private final AttractionInfoService attractionInfoService;

    @GetMapping("/search-page")
    public String moveSearchPage() {
        return "tours/tour";
    }

    @GetMapping
    public String getAttractionList(Map<String, String> map, Model model) {

        List<AttractionInfo> list = attractionInfoService.getAttractionInfoList(map);
        model.addAttribute("trips", list.stream().map(AttractionDto::new).collect(Collectors.toList()));

        return "tours/tour";
    }

    @PostMapping("/myPick")
    public String addMyAttraction(String contentId, HttpSession session) {
        Map<String, String> map = new HashMap<>();
        map.put("userId", (String) session.getAttribute("loginUser"));
        map.put("contentId", contentId);
        attractionInfoService.saveMyAttraction(map);

        return "redirect:/search-page";
    }

}

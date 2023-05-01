package com.ringdingdong.ridingthewind.attraction.controller;

import com.ringdingdong.ridingthewind.attraction.dto.AttractionDto;
import com.ringdingdong.ridingthewind.attraction.entity.AttractionInfo;
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
public class AttractionController {

    private final AttractionInfoService attractionInfoService;
    @GetMapping("/search-page")
    public String moveSearchPage() {
        return "/attraction/attraction_search";
    }

    @GetMapping
    public String getAttractionList(@RequestParam Map<String, String> map, Model model) {
        log.debug("map: {}", map);

        List<AttractionInfo> list = attractionInfoService.getAttractionInfoList(map);
        model.addAttribute("trips", list.stream().map(AttractionDto::new).collect(Collectors.toList()));

        return "/attraction/attraction_search";
    }

    @PostMapping("/myPick")
    public String addMyAttraction(@RequestBody String contentId, HttpSession session) {
        Map<String, String> map = new HashMap<>();
        UserSessionDto userSessionDto = (UserSessionDto) session.getAttribute("loginUser");
        map.put("userId", userSessionDto.getUserId());
        map.put("contentId", contentId);
        attractionInfoService.saveMyAttraction(map);

        return "redirect:/search-page";
    }

}

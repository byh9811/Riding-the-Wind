package com.ringdingdong.ridingthewind.notice.controller;

import com.ringdingdong.ridingthewind.notice.service.NoticeServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class NoticeController {
    public final NoticeServiceImpl noticeService;
}

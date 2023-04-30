package com.ringdingdong.ridingthewind.notice.controller;

import com.ringdingdong.ridingthewind.notice.service.NoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class NoticeController {
    public final NoticeService noticeService;
}

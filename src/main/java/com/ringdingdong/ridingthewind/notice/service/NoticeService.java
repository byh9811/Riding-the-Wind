package com.ringdingdong.ridingthewind.notice.service;

import com.ringdingdong.ridingthewind.notice.mapper.NoticeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class NoticeService {
    public final NoticeMapper noticeMapper;

}

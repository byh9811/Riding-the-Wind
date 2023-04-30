package com.ringdingdong.ridingthewind.comment.service;

import com.ringdingdong.ridingthewind.comment.mapper.CommentMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class CommentService {

    private final CommentMapper commentMapper;


}

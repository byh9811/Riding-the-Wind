package com.ringdingdong.ridingthewind.comment.service;

import com.ringdingdong.ridingthewind.comment.mapper.CommentMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class CommentServiceImpl implements  CommentService{

    private final CommentMapper commentMapper;


}

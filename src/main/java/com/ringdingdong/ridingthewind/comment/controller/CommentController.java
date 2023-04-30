package com.ringdingdong.ridingthewind.comment.controller;

import com.ringdingdong.ridingthewind.comment.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class CommentController {

    public final CommentService commentService;

}

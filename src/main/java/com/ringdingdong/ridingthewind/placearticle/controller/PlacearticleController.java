package com.ringdingdong.ridingthewind.placearticle.controller;

import com.ringdingdong.ridingthewind.placearticle.service.PlacearticleServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class PlacearticleController {
    public final PlacearticleServiceImpl placearticleService;

}

package com.ringdingdong.ridingthewind.placearticle.service;

import com.ringdingdong.ridingthewind.placearticle.mapper.PlacearticleMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PlacearticleServiceImpl implements PlacearticleService{
    public final PlacearticleMapper placearticleMapper;
}

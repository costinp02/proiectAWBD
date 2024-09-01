package com.example.proiectAWBD.services;

import com.example.proiectAWBD.dtos.ArtistDTO;

import java.util.List;

public interface ArtistService {
    List<ArtistDTO> findAll();
    ArtistDTO findById(int id);
    ArtistDTO save(ArtistDTO product);
    void deleteById(int id);
}

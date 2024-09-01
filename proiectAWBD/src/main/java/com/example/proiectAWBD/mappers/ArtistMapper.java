package com.example.proiectAWBD.mappers;

import com.example.proiectAWBD.domain.Artist;
import com.example.proiectAWBD.dtos.ArtistDTO;
import org.mapstruct.Mapper;

@Mapper
public interface ArtistMapper {
    ArtistDTO toDTO (Artist artist);
    Artist toArtist (ArtistDTO artistDTO);
}

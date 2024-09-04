package com.example.proiectAWBD.services;

import com.example.proiectAWBD.domain.Artist;
import com.example.proiectAWBD.dtos.ArtistDTO;
import com.example.proiectAWBD.repositories.ArtistRepository;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ArtistServiceImpl implements ArtistService {
    ArtistRepository artistRepository;
    ModelMapper modelMapper;

    public ArtistServiceImpl(ArtistRepository artistRepository, ModelMapper modelMapper) {
        this.artistRepository = artistRepository;
        this.modelMapper = modelMapper;
    }


    @Override
    public List<ArtistDTO> findAll() {
        List<Artist> artists = new LinkedList<>();
        artistRepository.findAll(Sort.by("name")).iterator().forEachRemaining(artists::add);

        return artists.stream()
                .map(artist -> modelMapper.map(artist, ArtistDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public ArtistDTO findById(int id) {
        return null;
    }

    @Override
    public ArtistDTO save(ArtistDTO product) {
        return null;
    }

    @Override
    public void deleteById(int id) {

    }
}

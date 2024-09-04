package com.example.proiectAWBD.repositories;

import com.example.proiectAWBD.domain.Artist;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface ArtistRepository extends PagingAndSortingRepository<Artist, Long> {
    List<Artist> findByName(String name);
    List<Artist> findByNationality(String nationality);
}

package com.example.proiectAWBD.repositories;

import com.example.proiectAWBD.domain.Artist;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ArtistRepository extends CrudRepository<Artist, Long> {
    List<Artist> findByName(String name);
    List<Artist> findByNationality(String nationality);
}

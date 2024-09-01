package com.example.proiectAWBD.repositories;

import com.example.proiectAWBD.domain.Artist;
import org.springframework.data.repository.CrudRepository;

public interface ArtistRepository extends CrudRepository<Artist, Integer> {
}

package com.example.proiectAWBD.repositories;

import com.example.proiectAWBD.domain.Product;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends PagingAndSortingRepository<Product, Long> {
    Optional<Product> findById(Long id);
    Optional<Product> findByName(String name);

    Product save(Product product);

    @Query("select p from Product p where p.artist.id = ?1")
    List<Product> findByArtistId(Long id);
}

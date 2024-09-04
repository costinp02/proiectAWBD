package com.example.proiectAWBD.services;

import com.example.proiectAWBD.dtos.ProductDTO;

import java.util.List;

public interface ProductService {
    List<ProductDTO> findAll();
    ProductDTO findById(Long id);
    List<ProductDTO> findByArtistId(Long id);
    ProductDTO save(ProductDTO product);
}

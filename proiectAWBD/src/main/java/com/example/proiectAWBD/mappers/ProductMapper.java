package com.example.proiectAWBD.mappers;

import com.example.proiectAWBD.domain.Product;
import com.example.proiectAWBD.dtos.ProductDTO;
import org.mapstruct.Mapper;

@Mapper
public interface ProductMapper {
    ProductDTO toDTO (Product product);
    Product toProduct (ProductDTO productDTO);
}

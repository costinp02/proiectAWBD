package com.example.proiectAWBD.services;

import com.example.proiectAWBD.domain.Product;
import com.example.proiectAWBD.dtos.ProductDTO;
import com.example.proiectAWBD.repositories.ProductRepository;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl implements ProductService {
    ProductRepository productRepository;
    ModelMapper mapper;

    public ProductServiceImpl(ProductRepository productRepository, ModelMapper mapper) {
        this.productRepository = productRepository;
        this.mapper = mapper;
    }

    @Override
    public List<ProductDTO> findAll() {
        List<Product> products = new LinkedList<>();
        productRepository.findAll(Sort.by("name")).iterator().forEachRemaining(products::add);

        return products.stream()
                .map(product -> mapper.map(product, ProductDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public ProductDTO findById(Long id) {
        Optional<Product> productOptional = productRepository.findById(id);
        if (!productOptional.isPresent()) {
            throw new RuntimeException("Product not found!");
        }
        return mapper.map(productOptional.get(), ProductDTO.class);
    }
}

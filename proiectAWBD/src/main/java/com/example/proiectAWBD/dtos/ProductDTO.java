package com.example.proiectAWBD.dtos;

import com.example.proiectAWBD.domain.Genre;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
    private Long id;
    private String name;
    private double price;
    private String releaseDate;
    private String description;
    private String format;
    private int discography;
    private Genre genre;
}

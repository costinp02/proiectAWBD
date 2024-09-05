package com.example.proiectAWBD.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Data
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @DecimalMin(value = "0.0", inclusive = false, message = "Price must be greater than zero")
    @DecimalMax(value = "100.0", message = "Price must be less than 100")
    private double price;
    private String releaseDate;
    private String description;
    private String format;
    private int quantity;
    @Enumerated(value = EnumType.STRING)
    private Genre genre;
    @ManyToOne
    private Artist artist;
}

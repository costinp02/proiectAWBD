package com.example.proiectAWBD.domain;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
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

package com.example.proiectAWBD.domain;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String street;
    private String city;
    private String state;
    private String zip;
    private String country;
    @OneToOne(mappedBy = "address")
    private Customer customer;

}

package com.example.proiectAWBD.dtos;

import com.example.proiectAWBD.domain.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ArtistDTO {
    private int id;
    private String name;
    private String nationality;
    private String recordLabel;
    private String website;
    private List<Product> productList;

}

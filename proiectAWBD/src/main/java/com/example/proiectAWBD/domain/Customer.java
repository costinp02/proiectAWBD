package com.example.proiectAWBD.domain;

import com.example.proiectAWBD.domain.security.User;
import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
public class Customer {

    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    @OneToOne
    private Address address;
    @OneToOne
    private Wishlist wishlist;
    @OneToOne
    @JoinColumn(columnDefinition = "long", name = "user_id")
    private User user;
}

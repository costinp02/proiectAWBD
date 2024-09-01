package com.example.proiectAWBD.domain;

import jakarta.persistence.*;
import lombok.Data;

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
//    @OneToMany(mappedBy = "user")
//    private List<Address> addressList;
}

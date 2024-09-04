package com.example.proiectAWBD.repositories.security;

import com.example.proiectAWBD.domain.security.Authority;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorityRepository extends JpaRepository<Authority, Integer> {
}
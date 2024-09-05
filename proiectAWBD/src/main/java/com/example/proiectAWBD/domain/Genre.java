package com.example.proiectAWBD.domain;

public enum Genre {
    HIPHOP("Hip-Hop"),
    POP("Pop"),
    ROCK("Rock"),
    METAL("Metal"),
    ALTROCK("Alt-Rock"),
    EDM("EDM");

    private final String description;

    public String getDescription() {
        return description;
    }
    Genre(String description) {
        this.description = description;
    }
}

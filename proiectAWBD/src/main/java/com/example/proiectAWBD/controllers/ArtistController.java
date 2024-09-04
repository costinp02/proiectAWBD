package com.example.proiectAWBD.controllers;

import com.example.proiectAWBD.dtos.ArtistDTO;
import com.example.proiectAWBD.services.ArtistService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/artist")
public class ArtistController {

    ArtistService artistService;

    public ArtistController(ArtistService artistService) {
        this.artistService = artistService;
    }

    @RequestMapping("")
    public String artistList(Model model) {
        List<ArtistDTO> artists = artistService.findAll();
        model.addAttribute("artists", artists);
        return "artistList";
    }
}

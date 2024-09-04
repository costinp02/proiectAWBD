package com.example.proiectAWBD.controllers;

import com.example.proiectAWBD.dtos.ProductDTO;
import com.example.proiectAWBD.services.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping("")
    public String productList(Model model) {
        List<ProductDTO> products = productService.findAll();
        model.addAttribute("products", products);
        return "productList";
    }

    @RequestMapping("/id={id}")
    public String productDetail(@PathVariable Long id, Model model) {
        model.addAttribute("product", productService.findById(id));
        return "productDetail";
    }

    @RequestMapping("/artistId={id}")
    public String productsByArtistId(@PathVariable Long id, Model model) {
        List<ProductDTO> products = productService.findByArtistId(id);
        model.addAttribute("products", products);
        return "productList";
    }
}

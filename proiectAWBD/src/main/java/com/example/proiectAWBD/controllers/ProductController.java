package com.example.proiectAWBD.controllers;

import com.example.proiectAWBD.domain.Product;
import com.example.proiectAWBD.dtos.ArtistDTO;
import com.example.proiectAWBD.dtos.ProductDTO;
import com.example.proiectAWBD.services.ArtistService;
import com.example.proiectAWBD.services.ProductService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    ProductService productService;
    ArtistService artistService;

    public ProductController(ProductService productService, ArtistService artistService) {
        this.productService = productService;
        this.artistService = artistService;
    }

    @RequestMapping("")
    public String productList(Model model) {
        List<ProductDTO> products = productService.findAll();
        model.addAttribute("products", products);
        return "productList";
    }

    @RequestMapping({"/admin"})
    public ModelAndView adminProductList(Model model){
        List<ProductDTO> products = productService.findAll();
        model.addAttribute("products", products);
        return new ModelAndView("productListAdmin");
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

    @RequestMapping("/edit/{id}")
    public String productEdit(@PathVariable Long id, Model model) {
        model.addAttribute("product", productService.findById(id));

        List<ArtistDTO> artists = artistService.findAll();
        model.addAttribute("artists", artists);
        return "productForm";
    }

    @RequestMapping("/form")
    public String productForm(Model model) {
        Product product = new Product();
        product.setArtist(null);
        model.addAttribute("product", product);
        List<ArtistDTO> artists = artistService.findAll();
        model.addAttribute("artists", artists);
        return "productForm";
    }

    @PostMapping("")
    public String saveOrUpdate(@ModelAttribute ProductDTO productDTO) {
        productService.save(productDTO);
        return "redirect:/product/admin";
    }

    @RequestMapping("/delete/{id}")
    public String deleteById(@PathVariable String id){
        productService.deleteById(Long.valueOf(id));
        return "redirect:/product/admin";
    }
}

package vn.hiplatui.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Controller;

import vn.hiplatui.laptopshop.domain.Product;
import vn.hiplatui.laptopshop.repository.ProductRepository;

@Controller
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product createProduct(Product pr) {
        return this.productRepository.save(pr);
    }

    public List<Product> fetchProducts() {
        return this.productRepository.findAll();
    }

}

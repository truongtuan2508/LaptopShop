package vn.hiplatui.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.hiplatui.laptopshop.domain.Cart;
import vn.hiplatui.laptopshop.domain.CartDetail;
import vn.hiplatui.laptopshop.domain.Product;
import vn.hiplatui.laptopshop.domain.User;
import vn.hiplatui.laptopshop.repository.CartDetailRepository;
import vn.hiplatui.laptopshop.repository.CartRepository;
import vn.hiplatui.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
    }

    public Product createProduct(Product pr) {
        return this.productRepository.save(pr);
    }

    public List<Product> fetchProducts() {
        return this.productRepository.findAll();
    }

    public Optional<Product> fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // check user da co cart chua? Neu chua => tao. moi
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                // Tao moi cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(1);

                cart = this.cartRepository.save(otherCart);

            }

            // save Cart_detail
            // Tim product by ID

            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product realProduct = productOptional.get();

                CartDetail cDetail = new CartDetail();
                cDetail.setCart(cart);
                cDetail.setProduct(realProduct);
                cDetail.setPrice(realProduct.getPrice());
                cDetail.setQuantity(1);

                this.cartDetailRepository.save(cDetail);
            }

        }

    }
}

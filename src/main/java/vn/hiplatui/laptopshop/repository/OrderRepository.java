package vn.hiplatui.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hiplatui.laptopshop.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

}

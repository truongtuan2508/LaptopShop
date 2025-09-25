package vn.hiplatui.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hiplatui.laptopshop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User hiplatui);

    List<User> findByEmail(String email);

    User findById(long id);

    void deleteById(long id);

}

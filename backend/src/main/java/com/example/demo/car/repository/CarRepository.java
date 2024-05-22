package com.example.demo.car.repository;

import java.util.List;

import com.example.demo.user.repository.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarRepository extends JpaRepository<CarEntity, Long> {
    boolean existsById(Long id);
    List<CarEntity> findAllByUser (UserEntity user);
}

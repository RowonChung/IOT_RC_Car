package com.example.demo.instruction.repository;

import com.example.demo.car.repository.CarEntity;
import com.example.demo.user.repository.UserEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDateTime;

import lombok.*;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

@Entity
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "instruction")
@DynamicInsert
public class InstructionEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "car_id")
    private CarEntity car;

    @Column(nullable = false, length = 30)
    private String direction; // 스터디 이름

    @Column(nullable = false)
    private Long argument; // 스터디 이름

    @Column(nullable = false, name = "is_finished")
    private boolean isFinished; // 스터디 이름

    @Column(nullable = false, name = "create_at")
    private LocalDateTime createAt; // 스터디 이름


}

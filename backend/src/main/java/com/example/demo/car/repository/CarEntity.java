package com.example.demo.car.repository;

import com.example.demo.user.repository.UserEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import org.hibernate.annotations.DynamicInsert;


import org.hibernate.annotations.DynamicInsert;

@Entity
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "car")
@DynamicInsert
public class CarEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonIgnore // get 요청시 무한참조 현상 발생해서 추가함 TODO: DTO 클래스 처리하는거 생각(이 방법이 더 좋을거 같음)
    private UserEntity user;

    @Column(nullable = false, length = 30, name = "IP_address")
    private String IPAddress; // 스터디 이름

    @Column(nullable = false, length = 30)
    private String location; // 스터디 이름

    @Column(nullable = false)
    private Long temperature; // 스터디 이름

    @Column(nullable = false, name = "light_state")
    private Long LightState; // 스터디 이름
}

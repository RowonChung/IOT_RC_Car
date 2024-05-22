package com.example.demo.car.repository.dto;

import java.util.List;

import com.example.demo.car.repository.CarEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;

public class FindCar {
    @Getter
    @AllArgsConstructor
    public static class FindALlCarResponse{
        private int statusCode;
        private boolean inSuccess;
        private String message;
        private List<CarEntity> carList;
    }

    @Getter
    @AllArgsConstructor
    public static class FindCarResponse{
        private int statusCode;
        private boolean inSuccess;
        private String message;
        private CarEntity carEntity;
    }

}

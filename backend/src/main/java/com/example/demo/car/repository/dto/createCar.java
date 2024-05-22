package com.example.demo.car.repository.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

public class createCar {

    @Data
    public static class CreateCarRequest {
        private String ipAddress;
        private String direction;
        private String longitude;
        private String latitude;
        private Long userId;
        private Long temperature;
        private Long lightState;

    }
    @Getter
    @AllArgsConstructor
    public static class CreateCarResponse{
        private int statusCode;
        private boolean inSuccess;
        private String message;
        private Long carId;
    }

}

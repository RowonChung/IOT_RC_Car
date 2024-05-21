package com.example.demo.car.repository.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

public class createCar {

    @Data
    public static class CreateCarRequest {
        private String IPAddress;
        private String location;
        private Long userId;
        private Long temperature;
        private Long LightState;

    }
    @Getter
    @AllArgsConstructor
    public static class CreateClubResponse{
        private int statusCode;
        private boolean inSuccess;
        private String message;
        private Long clubId;
    }

}

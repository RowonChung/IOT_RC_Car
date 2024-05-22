package com.example.demo.car.repository.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

public class changeCar {
    @Data
    public static class ChangeCarTemperatureRequest{
        private Long carId;
        private Long temperature;
    }

    @Data
    public static class ChangeCarLocationRequest{
        private Long carId;
        private String direction;
        private String longitude;
        private String latitude;
    }

    @Data
    public static class ChangeCarLightStateRequest{
        private Long carId;
    }

    @Getter
    @AllArgsConstructor
    public static class ChangeCarResponse{
        private int code;
        private Boolean inSuccess;
        private String msg;
    }
}

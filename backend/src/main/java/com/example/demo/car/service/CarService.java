package com.example.demo.car.service;

import com.example.demo.car.repository.CarEntity;
import com.example.demo.car.repository.dto.createCar.*;
import com.example.demo.car.repository.dto.changeCar.*;

public interface CarService {
    CarEntity createCar(CreateCarRequest createCarRequest);
    public CarEntity changeLightState(ChangeCarLightStateRequest changeCarLightStateRequest);
    public CarEntity changeLocation(ChangeCarLocationRequest changeCarLocationRequest);
    public CarEntity changeTemperature(ChangeCarTemperatureRequest changeCarTemperatureRequest);
}

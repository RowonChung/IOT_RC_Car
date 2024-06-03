/*
 * iic.h
 *
 *  Created on: 2024. 5. 18.
 *      Author: pc
 */

#ifndef IIC_H_
#define IIC_H_

#include "hal_data.h"

volatile i2c_master_event_t g_iic_callback_event;

void iic_callback(i2c_master_callback_args_t *p_args);

uint8_t read_byte_data(uint8_t reg);
void write_byte_data(int reg, int val);
void write8( int reg, int value );
uint8_t readU8(uint8_t reg);

#endif /* IIC_H_ */

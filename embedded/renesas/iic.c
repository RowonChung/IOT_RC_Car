/*
 * iic.c
 *
 *  Created on: 2024. 5. 18.
 *      Author: pc
 */


#include "iic.h"

void iic_callback(i2c_master_callback_args_t *p_args)
{
    g_iic_callback_event = p_args->event;
}

uint8_t read_byte_data(uint8_t reg){

    R_IIC_MASTER_Write(&g_i2c_master0_ctrl, &reg, 1, true);
    R_BSP_SoftwareDelay(50,BSP_DELAY_UNITS_MILLISECONDS);
    while(g_iic_callback_event!=I2C_MASTER_EVENT_TX_COMPLETE);

    uint8_t buf = 0;
    R_IIC_MASTER_Read(&g_i2c_master0_ctrl, &buf, 1, false);
    R_BSP_SoftwareDelay(50,BSP_DELAY_UNITS_MILLISECONDS);
    while(g_iic_callback_event!=I2C_MASTER_EVENT_RX_COMPLETE);
    return buf;

}

void write_byte_data(int reg, int val){

    uint8_t wbuf[2] = {reg, val};
    R_IIC_MASTER_Write(&g_i2c_master0_ctrl, wbuf, 2, false);
    R_BSP_SoftwareDelay(50,BSP_DELAY_UNITS_MILLISECONDS);
    while(g_iic_callback_event!=I2C_MASTER_EVENT_TX_COMPLETE);

}

void write8( int reg, int value ){
    write_byte_data(reg, value);
}

uint8_t readU8(uint8_t reg){
    return read_byte_data(reg);
}

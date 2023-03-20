# PYNQ-Z2-Arduino-LCDKEYPAD-shield-pcb-and-verilog-design

This project consists of a custom-designed Printed Circuit Board (PCB) and Verilog code for an LCD keypad shield that can be connected to a PYNQ-Z2 FPGA development board and an Arduino.

## Overview

The PYNQ-Z2 is a Zynq-7000 System on Chip (SoC) development board that includes a Xilinx FPGA, ARM Cortex-A9 processor, and a host of other peripherals. The board is compatible with the Arduino ecosystem and can be programmed using the PYNQ framework, which provides an easy-to-use Python API for working with the FPGA and other components.

The LCD keypad shield is a commonly used accessory for Arduino boards that provides a 16x2 character LCD and a keypad for user input. This project adapts the shield for use with the PYNQ-Z2 by designing a custom PCB that connects to the PYNQ-Z2's Arduino-compatible headers and includes level shifters for the LCD and keypad signals.

## PCB Design

The PCB was designed using Altium Designer and includes the following features:

- Connection to PYNQ-Z2 Arduino-compatible headers
- Connection to LCD keypad shield headers
- Level shifters for LCD and keypad signals
- Power supply filtering and decoupling

The design files for the PCB are included in the `pcb` directory.

## Verilog Design

The Verilog code implements a simple interface between the PYNQ-Z2 and the LCD keypad shield. The interface supports the following operations:

- Initialize LCD display
- Write characters to LCD display

The code is designed to be easily integrated into other Verilog designs for the PYNQ-Z2.

The Verilog source files and a sample PYNQ project that uses the LCD keypad shield are included in the `verilog` directory.

## Usage

To use the PCB, the user must first order the PCB from a PCB manufacturer and assemble the components according to the provided Bill of Materials (BOM). The assembled PCB can then be connected to the PYNQ-Z2 and the LCD keypad shield.

To use the Verilog code, the user must first include the source files in their Verilog project and instantiate the top-level module. The interface to the LCD keypad shield can then be accessed using the provided signals and operations.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

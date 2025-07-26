#Efficient-Neuron-Acceleration-through-CORDIC

## Overview

This repository presents a hardware-efficient implementation of arithmetic operations using the CORDIC (COordinate Rotation DIgital Computer) algorithm. These modules aim to serve as foundational components in building custom neural network accelerators with reduced hardware complexity — eliminating the need for multipliers and dividers.

All implementations are done using **pure combinational logic in Verilog**, without pipelining or fixed-point scaling, making this a clean baseline for further hardware optimization.

---

## Implemented Modules

✔️ **CORDIC-Based Multiplication**  
✔️ **CORDIC-Based Division**  
✔️ **CORDIC-Based Hyperbolic Functions** (`tanh`, `sinh`, etc.)

Each module is tested using Verilog testbenches to validate correctness and convergence.

---

## Why CORDIC?

CORDIC replaces complex arithmetic operations with only:
- Shifts
- Additions/Subtractions
- Precomputed lookup values

This is ideal for hardware implementations where:
- Multipliers/dividers are expensive or unavailable
- Area and power efficiency are critical
- Simpler control logic is preferred

These benefits are highly relevant in applications such as:
- Edge AI hardware
- DSP and ANN co-processors
- ASIC/FPGA-based AI accelerators

---


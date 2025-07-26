# Efficient-Neuron-Acceleration-through-CORDIC

## Overview

This repository contains Verilog implementations of arithmetic operations using the CORDIC (COordinate Rotation DIgital Computer) algorithm. All operations are implemented using a Finite State Machine (FSM)-based iterative approach.

The modules include multiplication, division, and hyperbolic functions computed through shift-add operations, without using hardware multipliers or dividers.

---

## Implemented Modules

### 1. CORDIC Multiplier
- Performs multiplication using iterative CORDIC logic.
- Uses only shifts and additions.
- No use of `*` operator.

### 2. CORDIC Divider
- Computes division through a CORDIC-based iterative method.
- No use of `/` operator.

### 3. CORDIC Hyperbolic Function Generator
- Generates hyperbolic functions like:
  - `tanh`
  - `sinh`
  - `cosh`
- Based on the hyperbolic mode of the CORDIC algorithm.

---

## Design Characteristics

- RTL is written in Verilog.
- Each operation is implemented using an FSM.
- The number of clock cycles depends on the iteration count.
- No pipelining or fixed-point scaling has been applied.

---

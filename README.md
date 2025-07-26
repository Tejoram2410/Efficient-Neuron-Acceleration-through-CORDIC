# Efficient-Neuron-Acceleration-through-CORDIC

## Overview

This repository contains Verilog implementations of arithmetic operations using the **CORDIC (COordinate Rotation DIgital Computer)** algorithm. All operations are performed using an **FSM (Finite State Machine)-based iterative structure**. The system works with **8-bit binary numbers** and executes **8 iterations per operation**.

The modules cover multiplication, division, and hyperbolic functions (`tanh`, `sinh`, etc.), all implemented without using hardware multipliers, dividers, or floating-point units.

---

## Supported Operations

### ✅ CORDIC-Based Multiplier
- Performs multiplication using iterative shift-add operations.
- Accepts two 8-bit inputs.
- Executes over 8 FSM-controlled cycles.
- No use of the `*` operator.

### ✅ CORDIC-Based Divider
- Computes division using the CORDIC iterative method.
- Takes two 8-bit inputs (dividend and divisor).
- Operates over 8 FSM-driven iterations.
- No `/` operator used.

### ✅ CORDIC-Based Hyperbolic Function Module
- Computes hyperbolic functions:
  - `tanh(x)`
  - `sinh(x)`
  - `cosh(x)`
- Operates in **hyperbolic mode** of CORDIC.
- Also runs over 8 FSM-controlled steps.
- Designed for 8-bit input width.

---

## Design Details

- **Bit Width:** 8-bit input and output.
- **Iterations:** Each module performs 8 iterations.
- **Control Flow:** All operations are handled using a clearly defined FSM.
- **RTL Language:** Verilog.
- **Computation Type:** Integer-only, shift-add based, no floating point or fixed-point.

---

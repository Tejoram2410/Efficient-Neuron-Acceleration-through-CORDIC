# Efficient-Neuron-Acceleration-through-CORDIC

## Overview

This repository contains Verilog implementations of arithmetic operations using the **CORDIC (COordinate Rotation DIgital Computer)** algorithm. All operations are implemented using an **FSM (Finite State Machine)-based** approach with **8-bit inputs** and a fixed number of **8 iterations** per operation.

The modules include:
- CORDIC-based multiplier
- CORDIC-based divider
- Hyperbolic function generator
- MAC (Multiply-Accumulate) unit built using the CORDIC multiplier and an adder

---

## Modules

### 1. CORDIC-Based Multiplier
- Performs multiplication using shift and add operations.
- Operates on 8-bit inputs.
- Completed in 8 FSM-driven iterations.
- Multiplier logic avoids the use of `*`.

### 2. CORDIC-Based Divider
- Computes division using CORDIC-style iterative subtraction and shifting.
- Takes 8-bit dividend and divisor.
- Fully sequential with 8-state FSM.
- No use of `/` operator.

### 3. CORDIC-Based Hyperbolic Function Unit
- Computes:
  - `tanh(x)`
  - `sinh(x)`
  - `cosh(x)`
- Uses the hyperbolic mode of the CORDIC algorithm.
- Runs for 8 iterations.
- Works with 8-bit binary input values.

### 4. MAC (Multiply-Accumulate) Unit
- Built using the CORDIC multiplier and an 8-bit adder.
- Accepts three 8-bit inputs:
  - Input A and B are multiplied using the CORDIC multiplier.
  - Result is added to a third input C using a separate adder module.
- Fully sequential and uses the same FSM-controlled structure.
- Useful as a fundamental building block for neural network layers or DSP operations.

---

## Design Details

- **Bit Width:** 8-bit inputs and outputs.
- **Iteration Count:** 8 for each operation.
- **Architecture:** FSM-based sequential logic.
- **Arithmetic Base:** Shift-add method; no hardware multipliers or dividers.
- **Language:** Verilog (synthesizable).

---

## Future Work: RECON Integration

As a next step, this project aims to extend toward a full **neuron architecture** by integrating the CORDIC-based modules into a **unified compute engine** called **RECON** (Resource-Efficient CORDIC-Based Neuron). This design, inspired by [RECON (OJCAS 2021)](https://doi.org/10.1109/OJCAS.2020.3042743), allows a single iterative block to perform both:

- **Multiply-Accumulate (MAC)** operations using linear CORDIC mode
- **Non-linear Activation Functions** (`sigmoid`, `tanh`) using hyperbolic mode

### Goals for RECON Integration
• Merge multiplier and hyperbolic modules into a **shared CORDIC datapath**  
• Add FSM enhancements to dynamically switch between MAC and AF modes  
• Introduce **control signals** like `select_mode` and `select_af` for configurability  
• Optimize for **8-bit signed fixed-point precision** (e.g., `<8,5>` format)  
• Explore **power gating techniques** for static power reduction  
• Complete a full neuron cycle (MAC → AF) in a compact iterative loop  

### Why RECON?
- Enables a **single hardware block** to perform the full neuron operation
- Reduces logic duplication and area/power overhead
- Ideal for **ASICs**, **FPGAs**, and **low-power AI edge devices**
- Proven gains: up to **60% reduction in ALP (Area × Latency × Power)** vs traditional designs



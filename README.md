# Efficient-Neuron-Acceleration-through-CORDIC

## Overview

This repository contains Verilog implementations of arithmetic operations using the CORDIC (COordinate Rotation DIgital Computer) algorithm. All modules are built around **Finite State Machines (FSMs)** to carry out iterative computation across clock cycles.

The CORDIC algorithm is used here to perform basic arithmetic operations like multiplication, division, and evaluation of hyperbolic functions. These modules are written in RTL-level Verilog and are intended to demonstrate how complex functions can be computed using only basic shift and add operations.

---

## Implemented Modules

### 1. CORDIC Multiplier

- Performs multiplication between two input values using iterative shift and add operations.
- The design avoids use of the `*` operator or built-in multiplier hardware.
- Internally structured as a sequential FSM with defined states for each computation stage.

### 2. CORDIC Divider

- Computes the division of two inputs using a similar iterative FSM-based approach.
- Does not use the `/` operator.
- Ensures step-by-step convergence toward the correct quotient using the CORDIC division method.

### 3. CORDIC Hyperbolic Function Unit

- Computes hyperbolic functions such as:
  - `tanh(x)`
  - `sinh(x)`
  - `cosh(x)`
- Uses the hyperbolic mode of the CORDIC algorithm.
- Operates over several cycles, transitioning through FSM states to reach final output values.

---

## Design Details

- Each module is fully described in Verilog and simulates sequential behavior.
- FSMs handle control flow and sequencing of operations.
- Inputs are accepted as binary values, and intermediate values are updated over successive clock cycles.
- Output is generated after the FSM completes a fixed number of iterations.

---

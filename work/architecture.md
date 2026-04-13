# 🏗️ ALU Architecture & Block Diagram

## Overall Structure

| Component | OP Code | Operation |
|-----------|---------|-----------|
| adder.vhd | 000 | ADD |
| subtractor.vhd | 001 | SUB |
| multiplier.vhd | 010 | MUL |
| divider.vhd | 011 | DIV |
| ALU internal | 100 | AND |
| ALU internal | 101 | OR |
| ALU internal | 110 | NOT |
| ALU internal | 111 | XOR |

## Inputs & Outputs

| Signal | Size | Direction | Description |
|--------|------|-----------|-------------|
| A | 16-bit | Input | First operand |
| B | 16-bit | Input | Second operand |
| OP | 3-bit | Input | Operation selector |
| RESULT | 32-bit | Output | Operation result |
| CARRY | 1-bit | Output | Overflow flag |
| ZERO | 1-bit | Output | Result is zero |
| DIV_ZERO | 1-bit | Output | Division by zero flag |

## Component Details

### adder.vhd
| Input | Output |
|-------|--------|
| A (16-bit) | RESULT (16-bit) |
| B (16-bit) | CARRY (1-bit) |

### subtractor.vhd
| Input | Output |
|-------|--------|
| A (16-bit) | RESULT (16-bit) |
| B (16-bit) | BORROW (1-bit) |

### multiplier.vhd
| Input | Output |
|-------|--------|
| A (16-bit) | RESULT (32-bit) |
| B (16-bit) | — |

### divider.vhd
| Input | Output |
|-------|--------|
| A (16-bit) | QUOTIENT (16-bit) |
| B (16-bit) | REMAINDER (16-bit) |
| — | DIV_ZERO (1-bit) |

## Architecture Types Used
| File | Architecture Type |
|------|------------------|
| adder.vhd | Behavioral |
| subtractor.vhd | Behavioral |
| multiplier.vhd | Behavioral |
| divider.vhd | Behavioral |
| alu.vhd | Structural |
| testbench.vhd | Behavioral |

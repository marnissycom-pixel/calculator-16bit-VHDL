# 🖩 16-bit ALU Calculator in VHDL

A fully functional 16-bit Arithmetic Logic Unit built in VHDL,
simulated and tested using ModelSim Intel FPGA Edition.

---

## ⚙️ Supported Operations

| OP Code | Operation | Example |
|---------|-----------|---------|
| 000 | ADD | 100 + 200 = 300 |
| 001 | SUB | 500 - 300 = 200 |
| 010 | MUL | 10 × 20 = 200 |
| 011 | DIV | 100 ÷ 4 = 25 |
| 100 | AND | FF00 AND 0FF0 |
| 101 | OR  | FF00 OR 0FF0 |
| 110 | NOT | NOT FF00 |
| 111 | XOR | FF00 XOR 0FF0 |

---

## 🧠 Project Structure

| File | Description |
|------|-------------|
| `adder.vhd` | 16-bit adder with carry |
| `subtractor.vhd` | 16-bit subtractor with borrow |
| `multiplier.vhd` | 16-bit multiplier (32-bit output) |
| `divider.vhd` | 16-bit divider with remainder + div by zero protection |
| `alu.vhd` | Main ALU connecting all components |
| `testbench.vhd` | Testbench simulating all 9 test cases |
| `architecture.md` | Block diagram and signal flow |
| `waveform.png` | Simulation results from ModelSim |

## 🔌 Inputs & Outputs

| Port | Size | Direction | Description |
|------|------|-----------|-------------|
| A | 16 bits | Input | First operand |
| B | 16 bits | Input | Second operand |
| OP | 3 bits | Input | Operation selector |
| RESULT | 32 bits | Output | Operation result |
| CARRY | 1 bit | Output | Overflow flag |
| ZERO | 1 bit | Output | Result is zero flag |
| DIV_ZERO | 1 bit | Output | Division by zero flag |

## 🛠️ Tools Used
- VHDL 2002
- ModelSim Intel FPGA Starter Edition 2020.1

## 💡 Architecture
- **adder, subtractor, multiplier, divider** → behavioral architecture
- **alu** → structural architecture
- **testbench** → behavioral architecture

## 🧪 Test Cases
| Test | A | B | OP | Expected Result |
|------|---|---|----|-----------------|
| ADD | 100 | 200 | 000 | 300 |
| SUB | 500 | 300 | 001 | 200 |
| MUL | 10 | 20 | 010 | 200 |
| DIV | 100 | 4 | 011 | 25 |
| DIV/0 | 100 | 0 | 011 | 0 + DIV_ZERO=1 |
| AND | FF00 | 0FF0 | 100 | 0F00 |
| OR | FF00 | 0FF0 | 101 | FFF0 |
| NOT | FF00 | 0000 | 110 | 00FF |
| XOR | FF00 | 0FF0 | 111 | F0F0 |

## 👨‍💻 Author
Made with ❤️ from Chahine Marnissi

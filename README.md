# 🚦 Traffic Light Controller (Verilog)

A simple Verilog-based 2-way traffic light controller using a finite state machine (FSM).  
This project simulates how traffic lights operate at an intersection with North-South (NS) and East-West (EW) directions.

---

## 🗂️ Files

| File                    | Description                                     |
|-------------------------|-------------------------------------------------|
| `traffic_light_controller.v` | RTL module implementing the FSM logic         |
| `tb_traffic_light.v`         | Testbench to simulate the controller behavior |
| `output_waveform.vcd`        | Waveform output generated from simulation     |
| `waveform.png`               | GTKWave screenshot of the simulation result   |

---

## 🧪 How to Simulate

1. **Compile**

```bash
iverilog -o simv tb_traffic_light.v traffic_light_controller.v

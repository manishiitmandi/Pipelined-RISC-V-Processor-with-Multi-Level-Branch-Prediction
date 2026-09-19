# Pipelined-RISC-V-Processor-with-Multi-Level-Branch-Prediction
A synthesizable 5-stage pipelined RISC-V processor implemented in Verilog HDL, featuring multi-level branch prediction to reduce control hazards and improve instruction throughput (IPC). The design includes full hazard handling, forwarding, and RTL verification using testbenches and benchmark programs.

🚀 Features :-
✅ 5-Stage Pipeline: IF, ID, EX, MEM, WB
✅ Hazard Handling: Data hazard detection + forwarding logic
✅ Multi-Level Branch Prediction: Static prediction, 2-bit dynamic predictor, BTB (Branch Target Buffer) based prediction
✅ Pipeline Control: Stall and flush mechanisms
✅ Synthesizable RTL in Verilog HDL
✅ RTL Verification with testbenches and benchmarks
✅ Achieved >90% branch prediction accuracy and measurable IPC improvement

🏗️ Architecture Overview :-
The processor follows a classic RISC-V 5-stage pipeline:
    IF – Instruction Fetch
    ID – Instruction Decode & Register Fetch
    EX – Execute / ALU / Branch Resolution
    MEM – Data Memory Access
    WB – Write Back

Key Components
1. Program Counter (PC) & Instruction Memory Interface
2. Register File
3. ALU & Control Unit
4. Pipeline Registers (IF/ID, ID/EX, EX/MEM, MEM/WB)
5. Hazard Detection Unit
6. Forwarding Unit
7. Branch Prediction Unit (Static, 2-bit, BTB)

🔮 Branch Prediction Design :- Implemented and evaluated multiple strategies:
1. Static Predictor: Fixed policy (e.g., always taken / not taken)
2. 2-bit Dynamic Predictor: Saturating counter-based prediction
3. BTB (Branch Target Buffer): Stores target addresses for faster control flow redirection

The predictor selection logic allows comparing accuracy and performance impact across strategies.

🧪 Verification & Testing :-
✔️ RTL testbenches written in Verilog
✔️ Tested using:
      Arithmetic and logic instruction sequences
      Branch-heavy benchmarks
      Hazard-intensive instruction streams
✔️ Verified:
      Correct pipeline behavior
      Correct hazard resolution
      Correct branch prediction and recovery

✔️ Measured:
      Branch prediction accuracy (>90%)
      IPC improvement vs no-prediction baseline

🛠️ Tools Used :-
      Language: Verilog HDL
      Simulation: Vivado Simulator 
      Synthesis: Xilinx Vivado
      Waveform Debugging: Vivado

Results:-
✔️ Correct functional execution of RISC-V instruction subset
✔️ Proper handling of data and control hazards
✔️ >90% branch prediction accuracy on branch-heavy benchmarks
✔️ Improved IPC compared to baseline pipeline without prediction

📌 Future Work :-
Add cache (I-Cache / D-Cache)
Support more RISC-V instruction extensions
Implement out-of-order execution or superscalar issue
Add performance counters and profiling support

👨‍💻 Author
Aditya Kumar Gupta
B.Tech Electrical Engineering, IIT Mandi


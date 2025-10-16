# NMOS Amplifier Benchmark

LT-Spice simulations and MATLAB analysis for single-stage NMOS amplifier configurations.

## Contents

- `CS_with_Rs.asc` – CS stage with source degeneration + bypass cap  
- `CS_with_Rs_unbypassed.asc` – CS with degeneration only  
- `CS_noRs.asc` – CS with no source resistor  
- `CS_cascode.asc` – Cascode variant (optional)  
- `CS_with_RsOP.txt` – DC `.op` dump for input resistance  
- `CS_with_RsAC2.txt` – AC sweep dump for Bode plot  
- `project1_analysis.m` – MATLAB script to compute Rin & plot gain  

## Usage

1. **LT-Spice**  
   - Open `.asc` files, ▶ to simulate.  
   - Remove caps + add 1 V test source for `.op` Rin.  
   - Restore caps, set AC=1 on V3, run  
     ```
     .ac dec 100 10 100Meg
     ```  
   - Export → “Wavedata as Text…” creates the `.txt` dumps.

2. **MATLAB**  
   ```matlab
   cd path/to/repo
   project1_analysis

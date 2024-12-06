# DSP_project

1. [Encoding and Decoding Touch-tone (DTMF) signals](#DTMF-Decoding-System-Design)
   
   [Move to Simple Bandpass Filter Design](#Simple-Bandpass-Filter-Design)

   [Move to A Scoring Function](#A-Scoring-Function)

   [Move to DTMF Decode Function](#DTMF-Decode-Function)

   [Move to Telephone Numbers](#Telephone-Numbers)

2. [FIR Filter Design GUI](#FIR-Filter-design)

    [Move to Designing Two Lowpass Filter ](#Designing-Two-Lowpass-Filter)
   
    [Move to Transition Zone of the LPF ](#Transition-Zone-of-the-LPF)

    [Move to Design FIR Filter to Meet Given Specifications](#Design-FIR-Filter-to-Meet-Given-Specifications)
   
    [Move to FIR-Filter design via Optimization](#FIR-Filter-design-via-Optimization)
     
  
  
## DTMF Decoding System Design
The task is to design a DTMF decoding system, which requires three main components:

Bandpass Filters (BPFs) to isolate individual frequency components of the DTMF signal.
A detector to score each BPF output and determine which two frequencies are present in the DTMF tone.
A scoring process that evaluates the BPF outputs and identifies the DTMF frequencies, ensuring the system works effectively even in noisy environments (though for this task, we'll focus on noise-free signals).

#### MATLAB functions:
* dtmfrun.m
* dtmfdesign.m
* dtmfcut.m
* dtmfscore.m
* dtmfdial.m

#### Testing / Main files:
* LabP13_Exercise4_1.m
* LabP13_Exercise4_2.m
* LabP13_Exercise4_3.m
* LabP13_Exercise4_4.m

### Simple Bandpass Filter Design
The objective of this problem is to design a filter bank using bandpass filters (BPFs) for Dual-Tone Multi-Frequency (DTMF) signal detection. The DTMF system is used for detecting keypresses on a telephone keypad. Each keypress generates two tones: one from a low-frequency group and one from a high-frequency group. The goal is to isolate and detect these tones using a set of bandpass filters, each centered around a specific DTMF frequency.

<div style="display: flex; justify-content: space-between;">
  <img src="https://github.com/Ajayvarmann/DSP_project/blob/main/Images/LabP13_Exercise4_1_02.png?raw=true" width="400">
  <img src="https://github.com/Ajayvarmann/DSP_project/blob/main/Images/LabP13_Exercise4_1_03.png?raw=true" width="400">
</div>

### A Scoring Function
This problem focuses on the DTMF (Dual-tone multi-frequency) decoding process, where the goal is to determine the presence or absence of individual tones in a DTMF signal using a scoring function. The function evaluates each tone segment and makes a binary decision (1 or 0) based on the filtered signal. 
Key Objectives is implement the dtmfscore function: This function will filter a short segment of the DTMF signal and score it based on the maximum amplitude of the filtered output.


<div style="display: flex; justify-content: space-between;">
  <img src="https://github.com/Ajayvarmann/DSP_project/blob/main/Images/LabP13_Exercise4_2_01.png?raw=true" width="200">
  <img src="https://github.com/Ajayvarmann/DSP_project/blob/main/Images/LabP13_Exercise4_2_02.png?raw=true" width="200">
  <img src="https://github.com/Ajayvarmann/DSP_project/blob/main/Images/LabP13_Exercise4_2_03.png?raw=true" width="200">
  <img src="https://github.com/Ajayvarmann/DSP_project/blob/main/Images/LabP13_Exercise4_2_04.png?raw=true" width="200">
</div>
<div style="display: flex; justify-content: space-between;">
  <img src="https://github.com/Ajayvarmann/DSP_project/blob/main/Images/LabP13_Exercise4_2_05.png?raw=true" width="200">
  <img src="https://github.com/Ajayvarmann/DSP_project/blob/main/Images/LabP13_Exercise4_2_06.png?raw=true" width="200">
  <img src="https://github.com/Ajayvarmann/DSP_project/blob/main/Images/LabP13_Exercise4_2_07.png?raw=true" width="200">
  <img src="https://github.com/Ajayvarmann/DSP_project/blob/main/Images/LabP13_Exercise4_2_08.png?raw=true" width="200">
</div>
<img src="https://github.com/Ajayvarmann/DSP_project/blob/main/Images/LabP13_Exercise4_2_09.png?raw=true" width="400">

### DTMF Decode Function

<img src="https://github.com/Ajayvarmann/DSP_project/blob/main/Images/LabP13_Exercise4_3_01.png?raw=true" width="400">

### Telephone Numbers
<img src="https://github.com/Ajayvarmann/DSP_project/blob/main/Images/LabP13_Exercise4_4_01.png?raw=true" width="400">

## Designing two Low pass Filter
Filter Design Specifications
Cutoff Frequency (ωc\omega): 0.4π=2⋅2000/10000 Hz
Sampling Frequency (fs​): 10,000 Hz.
Filter Order (MMM):
M=30M = 30M=30: Standard Design.
M=60M = 60M=60: For Transition Zone Analysis.
Window Types:
Rectangular Window: Simple truncation with the wider transition zone. It has higher ripple levels in the passband and the stopband.
Hamming Window: Smooth tapering the narrower transition zone. Compared to the rectangular windows, the ripples are smaller due to the tapering.



 <img src="https://github.com/Ajayvarmann/ECE-6530_team-7_Final-project/blob/main/LabS6_Exercise_2/exercise_1.jpg?raw=true" width="200">

 ## Transition Zone of Low pass filter
 Transition width (Δω=ωs−ωp​):
The transition zone of a lowpass FIR filter is the frequency range between the passband edge (ωp) and the stopband edge (ωs), where the filter transitions from passing to attenuating frequencies. Its width (Δω=ωs−ωp) reflects the sharpness of the filter, with narrower zones indicating closer approximation to an ideal filter. Achieving a smaller transition zone requires higher filter orders or advanced windows like the Hamming window, which balance smooth attenuation and minimal ripples.
Observations:
Increasing M reduces Δω
Relation: Δω=C/L​, where L=M+1(M: filter order)
The GUI for filter design is included in the file inside
## Design FIR Filter to Meet Given Specifications (Hamming)
Filter design for lowpass filters involves five parameters: two band edges, ripple heights in two bands, and
the filter order. There is a sixth factor, which is the type of filter such as a Hamming windowed FIR filter. A
typical design problem would be stated as follows: given the band edges and ripple heights, determine the
minimum order filter that will meet the specs
The calculated order using the formula was 49 and it did not meet the ripple specifications.

 ## FIR Filter Design via Optimization
Many different methods have been developed for filter design via mathematical optimization. One of the
widely used methods is firpm in MATLAB. For designing a LPF, it uses the following two step process:
1. Use the desired specifications for omega_p, omega_s, delta_p, and  delta_s to estimate the filter order (M) that will be
needed. This is done with the MATLAB function firpmord.
2. Use the outputs from firpmord as inputs to the function firpm to run the optimization and obtain
the FIR filter coefficients that should meet the specs on ıp and ıs. In effect, the inputs to firpm are
omega_p, omega_s, M, and the ratio delta_p/delta_s.
The goal  is to design an FIR low pass filter that meets the given specification for passband and stopband ripple using the MATLAB functions  firpmord and firpm.
* ⍵p = 0.68π (Passband edge)
* ⍵s = 0.72π (Stopband edge)
* δp = 0.05 ( Passband ripple tolerance)    
* δs = 0.01 (Stopband ripple tolerance ) 
* ⍵p ,⍵s are normalized for nyquist frequency
             
The Filter designed using this was precise but manually increased the filter order a little to meet the ripple tolerances
<div style="display: flex; justify-content: space-between;">
<img src="https://github.com/Ajayvarmann/ECE-6530_team-7_Final-project/blob/main/Lab_S6_Exercise_3/FILTER_DESIGN_OPTIMIZATION_10.png?raw=true" width="200">
<img src="https://github.com/Ajayvarmann/ECE-6530_team-7_Final-project/blob/main/Lab_S6_Exercise_3/FILTER_DESIGN_OPTIMIZATION_11.png?raw=true" width="200">
<img src="https://github.com/Ajayvarmann/ECE-6530_team-7_Final-project/blob/main/Lab_S6_Exercise_3/FILTER_DESIGN_OPTIMIZATION_14.png?raw=true" width="200">
<img src="https://github.com/Ajayvarmann/ECE-6530_team-7_Final-project/blob/main/Lab_S6_Exercise_3/FILTER_DESIGN_OPTIMIZATION_16.png?raw=true" width="200">
</div>
<div style="display: flex; justify-content: space-between;">
<img src="https://github.com/Ajayvarmann/ECE-6530_team-7_Final-project/blob/main/Lab_S6_Exercise_3/FILTER_DESIGN_OPTIMIZATION_17.png?raw=true" width="200">
<img src="https://github.com/Ajayvarmann/ECE-6530_team-7_Final-project/blob/main/Lab_S6_Exercise_3/FILTER_DESIGN_OPTIMIZATION_18.png?raw=true" width="200">
<img src="https://github.com/Ajayvarmann/ECE-6530_team-7_Final-project/blob/main/Lab_S6_Exercise_3/FILTER_DESIGN_OPTIMIZATION_19.png?raw=true" width="200">

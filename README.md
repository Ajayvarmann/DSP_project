# DSP_project

1. [Encoding and Decoding Touch-tone (DTMF) signals](#DTMF-Decoding-System-Design)
   
   [Move to Simple Bandpass Filter Design](#Simple-Bandpass-Filter-Design)

   [Move to A Scoring Function](#A-Scoring-Function)

   (c) DTMF Decode Function

   (d)Telephone Numbers

3. FIR Filter Design GUI

   (a)Design Two Lowpass Filters

   (b)Transition Zone of the LPF

   (c) Design FIR Filter to Meet Given Specifications

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

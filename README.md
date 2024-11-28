# DSP_project

1. Encoding and Decoding Touch-tone (DTMF) signals
   
   #(a)Simple Bandpass Filter Design

   #(b)A Scoring Function

   (c) DTMF Decode Function

   (d)Telephone Numbers

2. FIR Filter Design GUI

   (a)Design Two Lowpass Filters

   (b)Transition Zone of the LPF

   (c) Design FIR Filter to Meet Given Specifications

[Move to 1.a](#(a)Simple-Bandpass-Filter-Design)
## DTMF Decoding System Design
The task is to design a DTMF decoding system, which requires three main components:

Bandpass Filters (BPFs) to isolate individual frequency components of the DTMF signal.
A detector to score each BPF output and determine which two frequencies are present in the DTMF tone.
A scoring process that evaluates the BPF outputs and identifies the DTMF frequencies, ensuring the system works effectively even in noisy environments (though for this task, we'll focus on noise-free signals).

#### MATLAB functions:
-dtmfrun.m (main function)
-dtmfdesign.m (filter design)
-dtmfcut.m (signal segmentation)
-dtmfscore.m (scoring function)

### Simple Bandpass Filter Design
The objective of this problem is to design a filter bank using bandpass filters (BPFs) for Dual-Tone Multi-Frequency (DTMF) signal detection. The DTMF system is used for detecting keypresses on a telephone keypad. Each keypress generates two tones: one from a low-frequency group and one from a high-frequency group. The goal is to isolate and detect these tones using a set of bandpass filters, each centered around a specific DTMF frequency.

[Move to 1.b](#(b)A-Scoring-Function)
### A Scoring Function
This problem focuses on the DTMF (Dual-tone multi-frequency) decoding process, where the goal is to determine the presence or absence of individual tones in a DTMF signal using a scoring function. The function evaluates each tone segment and makes a binary decision (1 or 0) based on the filtered signal. 
Key Objectives is implement the dtmfscore function: This function will filter a short segment of the DTMF signal and score it based on the maximum amplitude of the filtered output.

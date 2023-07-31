# Spectrogram with Notes

This Matlab program will plot the spectrogram with reference lines of notes. It can be used to analyze the melody of music. 



![spectrogram](winter.png)

**The result of running the program.** The red lines indicate the C notes. The lower one is C5 and the upper one is C6. The solid lines indicate the white keys on the piano (other than C). The dashed lines indicate the black keys on the piano. Adjacent keys are a semitone apart. The blue lines (which can hardly be seen in this picture) indicate the frequency range to plot the reference lines. The melody can be read directly from the plot. The sample is cut from “Winter in the Woods” by Leaving Laurel (https://youtu.be/ggtTHT6ZDu8). 



## Example

1. Use “audioread” function to import the audio file. 
2. Use “spectrogram” function to perform the short-time Fourier transform. 
3. Plot an initial spectrogram to find your interested frequency range, set “fmin” and “fmax”.
4. Run the program again with appropriate parameters and get the result. 



## Reference

**Frequencies of musical notes.** Section “Table of note frequencies” in https://en.wikipedia.org/wiki/Scientific_pitch_notation 

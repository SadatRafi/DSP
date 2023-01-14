%The Frequency of Interest Is 1200 & 2200 Hz
f1 = 1200;                 %Frequency In Hz
f2 = 2200;                 %Frequency In Hz

fs = 26400;                %This Number Can be devided both by f1 & f2 
N = 264; 
Timestamps = [0:N-1]*(1/fs);        
step_size = fs / N;

Test_Signal = 1.5*sin(2 * pi() * f1 * Timestamps) + 1*sin(2 * pi() * f2 * Timestamps);

DFT_Test_Signal = fft(Test_Signal);

Magnitude_values = abs(DFT_Test_Signal);
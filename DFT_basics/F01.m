clear all;
%The Frequency of Interest Is 1200 & 2200 Hz
f1 = 1200;                 %Frequency In Hz
f2 = 2200;                 %Frequency In Hz

fs = 26400;                %This Number Can be devided both by f1 & f2 
N = 264; 
Timestamps = [0:N-1]*(1/fs);        
step_size = fs / N;

Reference_Signal_1 = 1.5*cos((2* pi()*f1*Timestamps)+(3.1416/2));
Reference_Signal_2 = 1.0*cos((2* pi()*f2*Timestamps)+(3.1416/4));

Test_Signal = Reference_Signal_1 + Reference_Signal_2;

DFT_Test_Signal = fft(Test_Signal);

Magnitude_values = zeros(1,N);
Angle_values = zeros(1,N);
Angle_values = arg(DFT_Test_Signal);
for temp = 1 : N
  Magnitude_values(1,temp) = abs(DFT_Test_Signal(temp));
  if (Magnitude_values(1,temp) < 1)
    Angle_values(1,temp) = 0;
  else
    Angle_values(1,temp) = arg(DFT_Test_Signal(temp));
  end
end

figure 01
subplot(2,1,1);
stem(Magnitude_values);
subplot(2,1,2);
stem(Angle_values);


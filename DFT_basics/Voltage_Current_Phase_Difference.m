clear all;
%The Frequency of Interest Is 1200 & 2200 Hz
Frequency = 47.5;            %Frequency In Hz
Phase_of_Voltage = 90;      %Phase In Degree
Phase_of_Current = 45;     %Phase In Degree

fs = 1000;                %Sampling Frequency 
N = 200; 
Timestamps = [0:N-1]*(1/fs);        
step_size = fs / N;

V = 1.5*cos((2* pi()*Frequency*Timestamps)+((3.1416/180)*Phase_of_Voltage));
I = 1.0*cos((2* pi()*Frequency*Timestamps)+((3.1416/180)*Phase_of_Current));

Test_Signal_Set = [V' I'];
DFT_Test_Signal = fft(Test_Signal_Set);

Magnitude_values = zeros(N,2);
Angle_values = zeros(N,2);

for columns = 1:2
  for rows = 1 : N
    Magnitude_values(rows,columns) = abs(DFT_Test_Signal(rows,columns));
    if (Magnitude_values(rows,columns) < 10)
      Angle_values(rows,columns) = 0;
    else
      Angle_values(rows,columns) = (arg(DFT_Test_Signal(rows,columns)))*(180/pi());
    end
  end
end

figure 01;
subplot(2,2,1);
stem(Magnitude_values((1:N/2),1)/(N/2));
ylim ([0 2.5]);

subplot(2,2,2);
stem(Angle_values(1:N/2,1));
ylim ([-180 180]);

subplot(2,2,3);
stem(Magnitude_values((1:N/2),2)/(N/2));
ylim ([0 2.5]);

subplot(2,2,4);
stem(Angle_values(1:N/2,2));
ylim ([-180 180]);

figure 02;
Phase_Difference = (Angle_values(1:N/2,1) - Angle_values(1:N/2,2));
stem(Phase_Difference);
ylim ([-180 180]);
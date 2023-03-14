clear all;
Sampling_Frequency = 1000;     %Sampling Frequency in HZ
Number_of_Samples = 1000;      %DFT resolution is 1 Hz

f1 = 10;
f2 = 25;
f3 = 50;

Time_References = [0 : Number_of_Samples-1]*(1/Sampling_Frequency);
sig_01 = 1.00 * sin(2*3.1416*f1*Time_References);
sig_02 = 0.50 * sin(2*3.1416*f2*Time_References);
sig_03 = 0.25 * sin(2*3.1416*f3*Time_References);
Test_Signal = sig_01 + sig_02 + sig_03;

plot(Test_Signal);

for Target_Frequency = 1 : 100
  s_prev1 = 0;
  s_prev2 = 0;
  normalized_frequency = Target_Frequency / Sampling_Frequency; 
            %This is different from the normaliuzed frequency of filter
  coefficient = 2 * cos(2 * 3.1416 * normalized_frequency);

  for i = 1:Number_of_Samples     %N.B. C indexing will start from 0
    s = Test_Signal(i) + (coefficient * s_prev1) - s_prev2;
    s_prev2 = s_prev1;
    s_prev1 = s;
  end
  power_of_target(Target_Frequency) = abs((s_prev2 * s_prev2) + (s_prev1 * s_prev1) - coefficient * s_prev1 * s_prev2);
end

figure 02;
subplot(1,2,1);
stem(power_of_target);

Amplitude =  2 * sqrt(power_of_target / (Number_of_Samples * Sampling_Frequency));
subplot(1,2,2);
stem(Amplitude);
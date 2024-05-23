% FIR Filter Design and Implementation

% Define filter specifications
order = 50;             % Filter order
cutoff_frequency = 0.2; % Normalized cutoff frequency (0.0 to 1.0)

% Design the FIR filter using the fir1 function
fir_filter = fir1(order, cutoff_frequency);

% Display filter coefficients
disp('Filter Coefficients:');
disp(fir_filter);

% Plot the frequency response of the filter
freqz(fir_filter, 1, 1024, 'half');
title('FIR Filter Frequency Response');
xlabel('Frequency (normalized)');
ylabel('Magnitude');

% Generate a sample input signal
t = 0:0.01:1;           % Time vector
input_signal = sin(2*pi*5*t) + 0.5*sin(2*pi*20*t);

% Apply the FIR filter to the input signal
output_signal = filter(fir_filter, 1, input_signal);

% Plot the input and output signals
figure;
subplot(2, 1, 1);
plot(t, input_signal);
title('Input Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t, output_signal);
title('Output Signal');
xlabel('Time');
ylabel('Amplitude');

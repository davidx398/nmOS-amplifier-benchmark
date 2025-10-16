%% project1_analysis.m
% MATLAB automation for Project 1: CS Amplifier Benchmark
% Reads three tab-delimited text files and:
%  1) Computes R_in from CS_with_RsOP.txt
%  2) Plots the AC Bode curve from CS_with_RsAC2.txt
%  3) (Optionally) Computes R_out from CS_with_Rs_outOP.txt

%% 1) LOAD OP DATA AND COMPUTE R_in
% Read the operating-point table directly
Top = readtable('CS_with_RsOP.txt', 'FileType','text', 'Delimiter','\t');  
% The fifth variable is I(V4)
Iin = abs( Top{1,5} );            % (A)
Rin = 1 / Iin;                    % (Ω)
fprintf('Input resistance R_in = %.3g Ω\n', Rin);

%% 2) LOAD AC SWEEP AND PLOT BODE
fid = fopen('CS_with_RsAC2.txt','r');
% Skip the header line
header = fgetl(fid);
% Now read: col1 = number, col2 = text until end of line
C = textscan(fid, '%f%s', 'Delimiter', '\t');
fclose(fid);
freq   = C{1};     % numeric Hz
rawStr = C{2};     % cell array of strings like "( -1.832e+00dB, ... )"

% Extract the dB number
gain_db = cellfun(@(s) sscanf(s, '(%fdB'), rawStr);

% Plot
figure;
semilogx(freq, gain_db, 'LineWidth',1.5);
grid on;
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');
title('CS Amp Bode (Imported with textscan)');


%% 3) OPTIONAL: LOAD ANOTHER OP FOR R_out
% If you have a file named 'CS_with_Rs_outOP.txt' with I(Vtest_out) in column 5:
% Tout = readtable('CS_with_Rs_outOP.txt','FileType','text','Delimiter','\t');
% Iout = abs( Tout{1,5} );
% Rout = 1 / Iout;
% fprintf('Output resistance R_out = %.3g Ω\n', Rout);


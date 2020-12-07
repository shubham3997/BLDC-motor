mdl = 'bldc_motor';
open_system(mdl);
% The motor model are as follows.
p    = 4;        % Number of pole pairs
Rs   = 0.1;      % Stator resistance per phase           [Ohm]
Ls   = 1e-4;     % Stator self-inductance per phase, Ls  [H]
Ms   = 1e-5;     % Stator mutual inductance, Ms          [H]
psim = 0.0175;   % Maximum permanent magnet flux linkage [Wb]
Jm   = 0.0005;   % Rotor inertia                         [Kg*m^2]
Ts  = 5e-6;  % Fundamental sample time            [s]
Tsc = 1e-4;  % Sample time for inner control loop [s]
Vdc = 48;    % Maximum DC link voltage            [V]

Kpw = 0.1;   % Proportional gain for speed controller
Kiw = 15;     % Integrator gain for speed controller
Kpv = 0.1;   % Proportional gain for voltage controller
Kiv = 0.5;     % Integrator gain for voltage controller 
open_system([mdl '/Visualization/RPM (Outer)']);
sim(mdl);
open_system([mdl '/Control']);
set_param([mdl '/Control/Tune Inner Voltage Loop'],'Value','1');
set_param([mdl '/Control/Tune Outer Speed Loop'],'Value','0');
close_system([mdl '/Visualization/RPM (Outer)']);
open_system([mdl '/Visualization/VDC (Inner)']);
sim(mdl);
set_param([mdl '/Control/Tune Inner Voltage Loop'],'Value','0');
set_param([mdl '/Control/Tune Inner Voltage Loop'],'Value','0');
close_system([mdl '/Visualization/VDC (Inner)']);
open_system([mdl '/Visualization/RPM (Outer)']);
sim(mdl);
Kpv = VoltageLoopGains(1);
Kiv = VoltageLoopGains(2);
set_param([mdl '/Control/Tune Inner Voltage Loop'],'Value','0');
set_param([mdl '/Control/Tune Outer Speed Loop'],'Value','0');
sim(mdl);
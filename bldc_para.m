%% Machine Parameters
p    = 4;        % Number of pole pairs
Rs   = 0.1;      % Stator resistance per phase           [Ohm]
Ls   = 1e-4;     % Stator self-inductance per phase, Ls  [H]
Ms   = 1e-5;     % Stator mutual inductance, Ms          [H]
psim = 0.0175;   % Maximum permanent magnet flux linkage [Wb]
Jm   = 0.0005;   % Rotor inertia                         [Kg*m^2]

%% Control Parameters
Ts  = 5e-6;  % Fundamental sample time            [s]
Tsc = 1e-4;  % Sample time for inner control loop [s]
Vdc = 48;    % Maximum DC link voltage            [V]
Kpw = 0.05;   % Proportional gain speed controller
Kiw = 10;    % Integrator gain speed controller
Kpv = 0.3;   % Proportional gain voltage controller
Kiv = 1.5;   % Integrator gain voltage controller
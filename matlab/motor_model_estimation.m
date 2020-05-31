%% motor model estimation %%
% juan valencia
% may 31 2020

%% Set up %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Change based on your communication setting
mylego = legoev3('usb');                    % Set up MATLAB and EV3 communication

% Change based on your motor port numbers
mymotor = motor(mylego, 'B');              % Set up motor

% Application parameters
EXE_TIME = 10;                              % Application running time in seconds
PERIOD = 0.1;                               % Sampling period
SPEED = 20;                                 % Motor speed
P = 0.01;                                   % P controller parameter
%-------------------------------------------

mymotor.Speed = SPEED;                      % Set motor speed

resetRotation(mymotor);                     % Reset motor rotation counter

start(mymotor1);                            % Start motor

t = timer('TimerFcn', 'stat=false;', 'StartDelay',EXE_TIME);
start(t);

%% Operations %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

stat = true;
lastR = 0;

while stat == true                          % Quit when times up
    r = readRotation(mymotor);              % Read rotation counter in degrees
    
    speed1 = (r - lastR)/PERIOD;            % Calculate the real speed in d/s
    
    diff = speed;                           % P controller
    mymotor.Speed = mymotor1.Speed - int8(diff * P);
    
    lastR1 = r1;
    
    pause(PERIOD);                          % Wait for next sampling period
end

%% Clean up %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

stop(mymotor1);                             % Stop motor 
stop(mymotor2);

clear

%% motor close loop response %%
% juan valencia
% may 31 2020

%% Set up %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Change based on your communication setting
mylego = legoev3('usb');                    % Set up MATLAB and EV3 communication

% Change based on your motor port numbers
mymotor = motor(mylego, 'B');              % Set up motor

% Application parameters
EXE_TIME = 30;                              % Application running time in seconds
PERIOD = 0.1;                               % Sampling period
REF = 60;                                   % Regerence [deg]
P = 0.5;                                      % P controller parameter
%-------------------------------------------

mymotor.Speed = 0;                          % Set motor input power
resetRotation(mymotor);                     % Reset motor rotation counter
start(mymotor);                            % Start motor

t = timer('TimerFcn', 'stat=false;', 'StartDelay',EXE_TIME);
start(t);

%% Operations %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
stat = true;
lastR = 0;
controlInput = 0;

i = 1;
while stat == true % Quit when times up
    ref(i) = REF;
    r(i) = readRotation(mymotor); % Read rotation counter in degrees    
    diff(i) = REF - r(i); % Error    
    controlInput(i) = int8(diff(i) * P); % Control input    
    mymotor.Speed = controlInput(i); 
    i=i+1; % increment loop    
    pause(PERIOD); % Wait for next sampling period
end

%% Stop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
stop(mymotor);                             % Stop motor 

%% Export to .mat %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time_loop = (1:length(r))*PERIOD;
save('close_loop_response.mat','r','diff','controlInput','time_loop','ref');

plot(time_loop,r,'b',time_loop,ref,'m');legend('y','ref');xlabel('time [s]');ylabel('position [deg]');grid on;

%% Clean up %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear

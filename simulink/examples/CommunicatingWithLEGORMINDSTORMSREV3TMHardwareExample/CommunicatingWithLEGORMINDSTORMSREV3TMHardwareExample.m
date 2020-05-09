%% Communicating with LEGO(R) MINDSTORMS(R) EV3(TM) Hardware
%
% This example shows you how to tune the parameter values of and monitor the signals
% from an algorithm running on LEGO MINDSTORMS EV3 hardware.

% Copyright 2013-2015 The MathWorks, Inc.
 

%% Introduction
%
% When you are developing algorithms, it is
% often necessary to determine appropriate values of critical algorithm
% parameters in iterative fashion. Simulink's *External mode* feature enables
% you to accelerate the process by letting you change certain parameter
% values while the model is running on target hardware, without stopping
% the model. When you change parameter values from within Simulink, the
% modified parameter values are communicated to the target hardware
% immediately. The effects of the parameters tuning activity may be
% monitored by viewing algorithm signals on scopes or displays in Simulink.
%
% This example introduces the Simulink *External mode* feature by showing
% you how to:
%
% * Configure communications between Simulink and LEGO MINDSTORMS EV3
% hardware
% * Tune parameters of an algorithm from the same Simulink model that is
% running on the LEGO MINDSTORMS EV3 hardware
% * Use Simulink scopes to monitor results from an algorithm running on
% LEGO MINDSTORMS EV3 hardware

 
%% Prerequisites
%
% We recommend completing
% <docid:legomindstormsev3_ref.example-ev3_gettingstarted Getting Started with LEGO MINDSTORMS EV3 Hardware> example. 
%
 

%% Required Hardware
%
% You will need the following hardware:
% 
% * LEGO MINDSTORMS EV3 Brick
% * EV3 Wi-Fi Dongle or USB Ethernet Adaptor (Recommendation: Apple USB Ethernet Adapter)
%

open_system('ev3_communication');


%% Task 1 - Set up the Network Connection
%
% Please refer to Task 1 and 2 in <docid:legomindstormsev3_ref.example-ev3_gettingstarted Getting Started with LEGO MINDSTORMS EV3 Hardware> example and make a
% note the IP address of the EV3 brick.
%
 
%% Task 2 - Run the Model in External Mode
%
% *1.* Open the <matlab:ev3_communication Communicating with LEGO MINDSTORMS EV3 Hardware> model, which is preconfigured to run on LEGO MINDSTORMS EV3 hardware. 
%
% *2.* In the model, make sure that the *Simulation mode* on the
% toolbar is set to |External|.
%
% *3.* In the model, click *Tools > Run on Target Hardware >
% Options...* . Update the *Host to Target Connection* parameters with the ones found in Task 1 and click *OK*.
%
% *4.* In the model, click the *Run* button on the toolbar.
%


%% Task 3 - Communicate with the Model
% This task shows you how to tune the parameter and monitor the
% execution of hardware from the model.
%
% *1.* Open the *Scope* block. The scope displays the value of signal from the
% left button on the EV3 brick. Press the left button. The scope shows the value of the signal change from 0 to 1.
%
% *2.* Double-click the *Frequency* block in the model and change the value
% of the Constant value parameter to 600.
% When you click *OK* or *Apply*, the tone coming from the speaker of EV3 brick changes
% 

%% Task 4 - Stop communication
%
% *1.* Click the *Stop* button in the Simulink model. This stops both the
% application on the EV3 brick and the simulation on your host machine. 


%% Summary
%
% This example showed a workflow for tuning and monitoring an algorithm
% running on LEGO MINDSTORMS EV3 hardware. In this example you learned:
%
% * How to configure and run a model in External mode on LEGO MINDSTORMS EV3 hardware.
% * How to tune an algorithm parameter and monitor algorithm execution on LEGO MINDSTORMS EV3 hardware
% using the External mode feature.


close_system('ev3_communication', 0); 
 


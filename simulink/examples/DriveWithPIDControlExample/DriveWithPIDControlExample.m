%% Drive with PID Control
%
% This example shows how to simulate a simple closed-loop control algorithm
% in Simulink(R) and how to run it on LEGO(R) MINDSTORMS(R) EV3(TM)
% hardware.
 
% Copyright 2013-2015 The MathWorks, Inc.

 
%% Introduction
%
% In a vehicle using independent wheel control, applying the same power to
% each wheel generally does not result in the vehicle moving straight. This
% is caused by mechanical and surface differences experienced by each of
% the wheels. To reduce deviation in the vehicle heading, a better approach
% is to use a closed-loop controller which adjusts the power applied to two
% motors based on difference in their rotations. One such controller is a
% well-known proportional-integral-derivative (PID) controller.
%
% Proportional-integral-derivative control is a basic control loop feedback
% mechanism. The controller minimizes the difference between the measured
% and the desired value of a chosen system variable by adjusting the system
% control inputs.
%
% This example shows you how to simulate the controller using a simple
% plant model, first with no feedback control (Open-Loop Control), and then
% with feedback control (Closed-Loop Control). This example also
% illustrates how to switch between simulating the PID controller and
% running it on hardware in the same model.


%% Prerequisites
%
% We recommend completing
% <docid:legomindstormsev3_ref.example-ev3_gettingstarted Getting Started with LEGO MINDSTORMS EV3 Hardware> and 
% <docid:legomindstormsev3_ref.example-ev3_communication Communicating with LEGO MINDSTORMS EV3 Hardware> examples. 
%


%% Required Hardware
%
% * LEGO MINDSTORMS EV3 Brick
% * Two LEGO MINDSTORMS EV3 Large Motors
% * EV3 Wi-Fi Dongle or USB Ethernet Adaptor (optional for Steps 3 and 5)
%

open_system('ev3_drive_openloop');


%% Task 1 - Build the LEGO MINDSTORMS EV3 Vehicle and Set up the Network Connection
%
% *1.* Build a vehicle using two motors to control two independent wheels. 
% For example, you can build a vehicle similar to the one described in the printed building instructions in the education core set.
%
% *2.* Set up the connection between EV3 brick and your host machine. Please refer to Task 1 and 2 in <docid:legomindstormsev3_ref.example-ev3_gettingstarted Getting Started with LEGO MINDSTORMS EV3 Hardware> example. 
%

%% Task 2 - Simulate Open-Loop Control Model
%
% This step illustrates that independently powered wheels cause deviations
% in vehicle heading.
%
% *1.* Open the <matlab:ev3_drive_openloop model>. Observe two different
% subsystems in the model.
%
% *2.* Open the *Open-Loop Controller* subsystem. This subsystem controls
% the vehicle driving. Observe that the controller does not use the
% difference between two encoder outputs to control the motors.
%
% *3.* Notice the *Motors* subsystem. The subsystem contains both simulated
% and actual motors. The Environment Controller block takes the outputs of
% the simulated or actual motors, depending on the current environment. This
% allows you to represent both simulated and actual motors in one model. As
% an alternative, you may create two models, one for simulation, and the
% other one for running on actual hardware.
%
% *4.* Click Run button in the Simulink toolbar. Click the *Scope* block
% and observe that the *Encoder Output Mismatch* increases over time. This
% indicates that the vehicle will not move straight.
%

%% 
%open_system('ev3_drive_openloop/Motors')
%% 
%set_param('ev3_drive_openloop', 'StopTime', '120');
%sim('ev3_drive_openloop')
%% 
%open_system('ev3_drive_openloop/Scope')


%% Task 3 - Run Open-Loop Control Model on LEGO MINDSTORMS EV3 Hardware
%
% *1.* Configure the model as described in Task 5 of the
% <docid:legomindstormsev3_ref.example-ev3_gettingstarted Getting Started with LEGO MINDSTORMS EV3 Hardware> example.
%
% *2.* In your Simulink model, click the *Deploy to Hardware* button on 
% the toolbar. The model runs on LEGO MINDSTORMS NXT hardware and the 
% vehicle starts moving.
%
% *3.* Notice that the path of the vehicle is not straight, as predicted by
% the simulation.
%


%% Task 4 - Simulate Closed-Loop Control Model
%
% *1.* Open the <matlab:ev3_drive_closedloop model>. Observe two
% subsystems in the model.
%
% *2.* Double-click *PID Controller* subsystem. Notice that the P control
% is used to synchronize two motors when the vehicle runs straight. Also,
% notice that during a turn, no synchronization is applied.
%
% *3.* Click *Run* button in the Simulink toolbar. Click the *Scope* block
% and observe that the *Encoder Output Mismatch* remains close to zero.
% This indicates that the vehicle will skew less compared to the *Open Loop
% Control* model.
%

%load_system('ev3_drive_closedloop')

%% 
%open_system('ev3_drive_closedloop/Motors')
%% 
%set_param('ev3_drive_closedloop', 'StopTime', '120');
%sim('ev3_drive_closedloop')
%% 
%open_system('ev3_drive_closedloop/Scope')


%% Task 5 - Run Closed-Loop Control Model on LEGO MINDSTORMS EV3 Hardware
%
% *1.* Configure the model as described in Task 5 of the
% <docid:legomindstormsev3_ref.example-ev3_gettingstarted Getting Started with LEGO MINDSTORMS EV3 Hardware> example.
%
% *2.* In your Simulink model, click the *Deploy to Hardware* button on the
% toolbar. The model runs on the LEGO MINDSTORMS EV3 hardware and the
% vehicle starts moving.
%
% *3.* Observe that the path of the vehicle is straighter, as predicted
% by the simulation.
%

%% Other Things to Try
% 
% * Adjust the *PID Controller* settings. Improve the vehicle's ability to
% move straight on a rough or tilted surface.
%
% * Use Simulink *External mode* feature to tune parameters and monitor
% signals.
%

%% Summary
%
% This example showed how to simulate and implements a basic closed-loop
% controller on LEGO MINDSTORMS EV3 hardware. In the example you learned
% that:
% 
% * Open-Loop Control does not ensure straight driving in a vehicle with
% independently powered wheels.
% * Closed-Loop Control uses the difference between two encoder outputs to
% calculate the power that should be applied to each wheel individually.
% * Both simulated and actual hardware may be used in the same model,
% provided that a mechanism for switching between them exists.

close_system('ev3_drive_openloop', 0); 
%close_system('ev3_drive_closedloop', 0);


%% Getting Started with LEGO(R) MINDSTORMS(R) EV3(TM) Hardware
%
% This example shows you how to use Simulink(R) Support Package for LEGO
% MINDSTORMS EV3 Hardware to run a Simulink model on LEGO MINDSTORMS
% EV3 hardware.
 
% Copyright 2013-2017 The MathWorks, Inc.
     
 
%% Introduction
%
% Simulink Support Package for LEGO MINDSTORMS EV3 Hardware enables you to create
% and run Simulink models on LEGO MINDSTORMS EV3 hardware. The support package
% includes a library of Simulink blocks for configuring and accessing LEGO
% MINDSTORMS EV3 sensors and actuators.
% Additionally, the support package enables you to monitor and tune algorithms
% running on LEGO MINDSTORMS EV3 hardware from the same Simulink models
% from which you developed the algorithms.
% 
% In this example you will learn how to create and run a simple Simulink
% model on LEGO MINDSTORMS EV3 hardware. See other examples for LEGO
% MINDSTORMS EV3 hardware to learn how to use External mode and to learn
% how to implement more complex algorithms.
 
 
%% Prerequisites
%
% If you are new to Simulink, we recommend completing the 
% <matlab:web('https://www.mathworks.com/academia/student_center/tutorials/slregister.html','-browser') Interactive Simulink Tutorial>, 
% reading the Getting Started section of the <matlab:doc('simulink') Simulink documentation>   
% and running <matlab:web('https://www.mathworks.com/videos/getting-started-with-simulink-102159.html','-browser')  the Simulink Getting Started example>. 
%
 
 
%% Required Hardware
% 
% You will need the following hardware:
% 
% * LEGO MINDSTORMS EV3 Brick
% * EV3 Wi-Fi Dongle or USB Ethernet Adaptor (Recommendation: Apple USB Ethernet Adapter)
%
 
open_system('ev3_gettingstarted');
 
 
%% Task 1 - Confirm LEGO MINDSTORMS EV3 Firmware Version
% Verify the EV3 firmware version, and, if needed, perform a firmware update:
%
% *1.* Turn on EV3 brick
%
% *2.* Navigate EV3 screen to *Settings > Brick Info*. 
%
% *3.* Verify that *Brick FW* is *V1.03E* or later
%
% *3.* If the firmware version is earlier than V1.03E, use the LEGO EV3 Software to update the firmware.
%
% <<../firmware_version.png>>
%
%% Task 2 - Set Up connection between Host and LEGO MINDSTORMS EV3.
%
% There are four options to set up a connection between LEGO MINDSTORMS EV3 and your Host machine.
%
% *Option 1: USB connection*
% 
% *1.* Use the USB cable to connect the Mini-USB port on the EV3, labelled
% 'PC', and USB port on your host computer.
% 
% *Option 2: Bluetooth connection*
% 
% *1.* Enable Bluetooth on your host computer. If it does not have built-in
% Bluetooth, use a Bluetooth dongle.
%
% *2.* In the EV3 Brick Interface, select Settings > Bluetooth and enable Bluetooth.  
%
% *3.* Pair the host computer and EV3 brick.
% 
% *4.* Navigate EV3 screen to *Settings > Brick Info*. Find the device ID of
% the brick under *ID*.
% 
% *Option 3: Wired network access*
%
% *1.* Plug USB Ethernet Adaptor into EV3 Host USB Port
%
% *2.* Connect USB Ethernet Adaptor to a network socket via an Ethernet cable
%
% *3.* Restart EV3 brick. 
%
% *4.* Navigate EV3 screen to *Settings > Brick Info*. Find the device ID of
% the brick under *ID*.
%
% *5.* Navigate EV3 screen to *Settings > Brick Info*. Find the IP address
% under *IP Address*.
%
% *Option 4: Wireless network access*
%
% *1.* Plug EV3 Wi-Fi Dongle into EV3 Host USB Port
%
% *2.* Navigate EV3 screen to *Settings > WiFi*. Enable WiFi,
% search and connect to a WiFi network. See detailed instructions in EV3
% USER GUIDE. 
%
% *3.* Navigate EV3 screen to *Settings > Brick Info*. Find the device ID of
% the brick under *ID*.
% 
% *4.* Navigate EV3 screen to *Settings > Brick Info*. Find the IP address
% under *IP Address*.
%
% <<../IP_address.png>>
%
% **Test network connection**
%
% For Wired and Wireless network access, perform the following test.
%
% In the MATLAB Command Window, enter *h = legoev3('<EV3 IP address>')*. For example, 
% *h = legoev3('192.168.1.7')*, to confirm the network connection between
% host machine and EV3 brick.
%
%% Task 3 - Review LEGO MINDSTORMS EV3 Block Library
%
% Simulink Support Package for LEGO MINDSTORMS EV3 Hardware provides blocks
% that you can use to work with LEGO MINDSTORMS EV3 sensors and actuators.
%
% *1.* Enter <matlab:simulink simulink> at the MATLAB(R) prompt. This opens
% the Simulink Library Browser.
%
% *2.* In the Simulink Library Browser, navigate to *Simulink Support Package for
% LEGO MINDSTORMS EV3 Hardware*.
%
% *3.* Double-click the *Button* and *Display* block. Review each block mask,
% which contain a description of the block and parameters.
 
 
open_system('legoev3lib');
 
 
%% Task 4 - Create a Model for LEGO MINDSTORMS EV3 Hardware
%
% In this task, you will create a simple Simulink model that detects the
% state of the left button on the EV3 brick
% and displays it on the EV3 brick LCD.
%
% *1.* In MATLAB, select *HOME > New > Simulink Model*.
%
% *2.* Drag the *Button* and *Display* blocks to the model. Use the default
% settings for both blocks.
%
% *3.* Connect the *Button* block to the *Display* block.
%
% *4.* Save your model. 
%
 
 
%% Task 5 - Configure and Run the Model on LEGO MINDSTORMS EV3 Hardware
%
% In this task, you will configure and run your model on the LEGO 
% MINDSTORMS EV3 hardware.
%
% *1.* In your Simulink model, click *Tools > Run on Target Hardware >
% Prepare to Run...* .
%
% *2.* In *Configuration Parameters*, set the 
% *Target hardware* parameter to *LEGO MINDSTORMS EV3*. 
%
% *3.* Update the *Host to Target Connection* parameters with the ones found in Task 2. 
%
% *4.* Click *OK*.
%
% *5.* In your Simulink model, click the *Deploy to Hardware* button on 
% the toolbar. The model will now be deployed to the LEGO MINDSTORMS EV3 hardware.
%
% *6.* Look at the EV3 brick LCD while you press the left button. The LCD
% displays the state of the left button, *0* for not pressed, *1* for
% pressed.
%
% *7.* Save your model. 
% 
% A <matlab:ev3_gettingstarted |pre-configured model|> is
% included for your convenience. To change the IP address setting of the
% preconfigured model, click *Tools > Run on Target Hardware >
% Options...*. 
 
 
%% Task 6 - Stop the Application Running on LEGO MINDSTORMS EV3 Hardware
%
% There are two ways to stop the application running on EV3 brick. 
%
% *Option 1:* Press the *Back* button on EV3 brick.
%
% *Option 2:* Enter a command in the MATLAB Command Window.
% 
% Reuse variable *h* created in Task 2. Enter *h.stopModel('<model name>')*. For example, if your
% model name is *ev3_gettingstarted*, enter
% *h.stopModel('ev3_gettingstarted')*.
 
%% Other Things to Try
%
% * Run an existing model application on EV3 brick from MATLAB command line.
% For example, run command *h.runModel('ev3_gettingstarted')*
%
% * Delete a model application on EV3 brick from MATLAB command line.
% For example, run command *h.deleteModel('ev3_gettingstarted')*
%
 
 
%% Summary
% 
% This example introduced the workflow for creating an algorithm in a
% Simulink model, and then running it on LEGO MINDSTORMS EV3 hardware. In
% this example you learned that:
%
% * Simulink Support Package for LEGO MINDSTORMS EV3 Hardware provides
% blocks for configuring, reading and writing to LEGO MINDSTORMS EV3
% sensors and actuators.
% * You can use the *Deploy to Hardware* button to run the
% model on LEGO MINDSTORMS EV3 hardware.
 
 
close_system('legoev3lib', 0); 
close_system('ev3_gettingstarted', 0);  
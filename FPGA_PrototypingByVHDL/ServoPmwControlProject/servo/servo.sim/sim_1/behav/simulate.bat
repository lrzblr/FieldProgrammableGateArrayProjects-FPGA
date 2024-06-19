@echo off
set xv_path=D:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim tb_angle2pulse_behav -key {Behavioral:sim_1:Functional:tb_angle2pulse} -tclbatch tb_angle2pulse.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

@echo off
set xv_path=D:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto a02ea24dbd56440ab71f70ea4dd6ec1d -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_angle2pulse_behav xil_defaultlib.tb_angle2pulse -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

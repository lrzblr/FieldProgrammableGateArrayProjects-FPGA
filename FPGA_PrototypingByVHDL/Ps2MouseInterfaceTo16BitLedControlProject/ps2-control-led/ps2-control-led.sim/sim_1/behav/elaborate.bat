@echo off
set xv_path=D:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto e2d1a93b6bc1448e9023ae21a5c8463f -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_mouse_led_behav xil_defaultlib.tb_mouse_led -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

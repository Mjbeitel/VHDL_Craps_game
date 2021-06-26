
# stop any simulation that is currently running
quit -sim
# create the default "work" library
 vlib work;
# compile the vhdl source code, and test bench
vcom ../*.vhd
vcom *.vht
vsim work.testbench -Lf 220model -Lf altera_mf
do wave.do
run 1400 ns


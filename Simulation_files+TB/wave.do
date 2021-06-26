onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Clock /testbench/clk
add wave -noupdate -label Roll -radix binary /testbench/roll
add wave -noupdate -label Reset -radix binary /testbench/rst
add wave -noupdate -label Dice_1 -radix unsigned /testbench/rn1
add wave -noupdate -label Dice_2 -radix unsigned /testbench/rn2
add wave -noupdate -label Count -radix unsigned /testbench/cnt
add wave -noupdate -label Point -radix unsigned /testbench/point
add wave -noupdate -label Sum -radix unsigned /testbench/sum
add wave -noupdate -label Win -radix binary /testbench/win
add wave -noupdate -label Lose -radix binary /testbench/lose
add wave -noupdate -label D7 /testbench/D7
add wave -noupdate -label D711 /testbench/D711
add wave -noupdate -label D2312 /testbench/D2312
add wave -noupdate -label Eq /testbench/eq
add wave -noupdate -label Sq /testbench/sp
add wave -noupdate -label Seed1 -radix binary /testbench/seed1
add wave -noupdate -label Seed2 -radix binary /testbench/seed2
add wave -noupdate -label Seed3 -radix binary /testbench/seed3
add wave -noupdate -label Seed4 /testbench/seed4
add wave -noupdate -label Seed5 /testbench/seed5
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1097476 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {780 ns} {1380 ns}

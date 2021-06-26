onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label A -radix unsigned /adder_operator_tb/a_in
add wave -noupdate -label B -radix unsigned /adder_operator_tb/b_in
add wave -noupdate -label Sum -radix unsigned /adder_operator_tb/s_out
add wave -noupdate -label Clk /adder_operator_tb/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {662896 ps} 0}
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
WaveRestoreZoom {0 ps} {710 ns}

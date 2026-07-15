# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
input_rgb { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
result_rank { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 28
	offset_end 35
}
result_suit { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 44
	offset_end 51
}
width { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 60
	offset_end 67
}
height { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 68
	offset_end 75
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control



// Greg's Wade Extruder. 
// It is licensed under the Creative Commons - GNU GPL license. 
//  2010 by GregFrost
// Extruder based on prusa git repo.
// http://www.thingiverse.com/thing:6713
// modified for i3 by vlnofka <vlnofka@gmail.com>

include<../../configuration.scad>
include<../inc/functions.scad>

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Define the hotend_mounting style you want by specifying hotend_mount=style1+style2 etc.
//e.g. wade(hotend_mount=groovemount+peek_reprapsource_mount);
malcolm_hotend_mount=1;
groovemount=2;
peek_reprapsource_mount=4;
arcol_mount=8;
mendel_parts_v6_mount=16; 
grrf_peek_mount=32;
wildseyed_mount=64;
geared_extruder_nozzle=128; // http://reprap.org/wiki/Geared_extruder_nozzle
jhead_mount=256;
geeksbase_mount=512;
malcolm_extrusion_mount=1024;	//broken

//default_extruder_mount=malcolm_extrusion_mount;
//default_extruder_mount=groovemount;
default_extruder_mount=2;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

mounting_holes_legacy=1;
mounting_holes_symmetrical=2;
default_mounting_holes=mounting_holes_symmetrical;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

wade(hotend_mount=default_extruder_mount,
	mounting_holes=default_mounting_holes);

////CarriageVisualisation
color("red")
//x-carriage v2
translate([24,-32.75,base_extra_depth+wade_block_depth]) 
  rotate([0,0,0]) 
    import("../output/x-carriageV2.stl");



//===================================================
// Parameters defining the wade body:

wade_body_offset = 3;
elevation = 9; //zmeneno puvodne 15
wade_block_height=55+elevation;
wade_block_width=24 - wade_body_offset;
wade_block_depth=28;


//echo (m4_nut_diameter);
m3_diameter = 3.4;
m3_nut_diameter = 6.1+0.3;
m3_washer_diameter = 6.9;

m4_diameter = 4.8;
m4_nut_diameter = 8.3;

block_bevel_r=6;

base_thickness=10;
base_length=66;
base_leadout=22;
base_extra_depth=10; //zmeneno puvodne 0

nema17_hole_spacing=31; 
nema17_width=1.7*25.4;
nema17_support_d=nema17_width-nema17_hole_spacing;

screw_head_recess_diameter=7.2;
screw_head_recess_depth=3;

motor_mount_rotation=0;
motor_mount_translation=[46.78,50.78+elevation,0];
//motor_mount_translation=[48,50+elevation,0];
//motor_mount_translation=[52.5,38,0]; //original
motor_mount_thickness=9;

large_wheel_translation=[50.5-(7.4444+32.0111+0.25),34+elevation,0];

m8_clearance_hole=12.6;
hole_for_625=16.3;
608_diameter=22;
625_height = 5;

block_top_right=[wade_block_width,wade_block_height];

layer_thickness=layer_height;
filament_diameter=2;
filament_feed_hole_d=(filament_diameter*1.1)/cos(180/8);
hobbing_depth=0.3;
echo ("filament_feed_hole_d", filament_feed_hole_d);

//This is the distance from the centre of the filament to the centre of the hobbed bolt.
filament_feed_hole_offset=8/2-hobbing_depth+filament_diameter/2;

echo ("filament_feed_hole_offset", filament_feed_hole_offset);

idler_nut_trap_depth=7.5;
idler_nut_thickness=4;

gear_separation=7.4444+32.0111+0.25;

function motor_hole(hole)=[
	motor_mount_translation[0],
	motor_mount_translation[1]]+
	rotated(45+motor_mount_rotation+hole*90)*nema17_hole_spacing/sqrt(2);

// Parameters defining the idler.

filament_pinch=[
	large_wheel_translation[0]-filament_feed_hole_offset-filament_diameter/2,
	large_wheel_translation[1],
	wade_block_depth/2];
idler_axis=filament_pinch-[608_diameter/2,0,0];
idler_fulcrum_offset=608_diameter/2+3.5+m3_diameter/2;
idler_fulcrum=idler_axis-[0,idler_fulcrum_offset,0];
idler_corners_radius=4; 
idler_height=12;
idler_608_diameter=608_diameter+2;
idler_608_height=9;
idler_mounting_hole_across=8;
idler_mounting_hole_up=15;
idler_short_side=wade_block_depth-2;
idler_hinge_r=m3_diameter/2+3.5;
idler_hinge_width=6.5;
idler_end_length=(idler_height-2)+5;
idler_mounting_hole_diameter=m3_diameter+0.25;
idler_mounting_hole_elongation=1;
idler_long_top=idler_mounting_hole_up+idler_mounting_hole_diameter/2+idler_mounting_hole_elongation+2.5;
idler_long_bottom=idler_fulcrum_offset;
idler_long_side=idler_long_top+idler_long_bottom;


module wade(
	hotend_mount=default_extruder_mount,
	mounting_holes=default_mounting_holes)
{
	difference ()
	{
		union()
		{
						
			//The base.
			translate([-base_leadout,-base_thickness/2,0])
			cube([base_length,base_thickness,wade_block_depth+base_extra_depth]);
		}

		block_holes(mounting_holes=mounting_holes);
	
		translate([large_wheel_translation[0]-filament_feed_hole_offset,
			-base_thickness/2,wade_block_depth/2])
		rotate([-90,0,0])
		{
			if (in_mask (hotend_mount,groovemount))
				groovemount_holes ();
		}
	}
}

function in_mask(mask,value)=(mask%(value*2))>(value-1); 

//block_holes();

module block_holes(mounting_holes=default_mounting_holes)
{
echo("bhmh", mounting_holes)
	//Round off the top of the block. 
	translate([0,wade_block_height-block_bevel_r,-1])
	render()
	
	
	

	//translate(motor_mount_translation)
	translate(large_wheel_translation)
	{



			// Mounting holes on the base.
			//translate([0,-base_thickness/2,0])
			translate(
				(mounting_holes==mounting_holes_legacy)?[-3.4,0,-1]:[0,0,0])
			for (mount=[0:1])
			{
				translate([-filament_feed_hole_offset+25*((mount<1)?1:-1),
					-large_wheel_translation[1]-1-base_thickness/2,wade_block_depth/2])
				rotate([-90,0,0])
				rotate(360/16)
				cylinder(r=m4_diameter/2,h=base_thickness+2,$fn=8);	
				// Posun hlavicky M4 sroubu o 2.1 mm
				translate([-filament_feed_hole_offset+25*((mount<1)?1:-1),
					-large_wheel_translation[1]+2.1,
					wade_block_depth/2])
				rotate([-90,0,0])
				// M4 na pridelani hotendu
				cylinder(r=m4_nut_diameter/2,h=10,$fn=6);
			}

	}

	
}



//========================================================
// Modules for defining holes for hotend mounts:
// These assume the extruder is verical with the bottom filament exit hole at [0,0,0].

//groovemount_holes ();
module groovemount_holes ()
{
	extruder_recess_d=16.2; 
	extruder_recess_h=5.5;

	// Recess in base
	translate([0,0,-1])
	cylinder(r=extruder_recess_d/2,h=extruder_recess_h+1);	
}


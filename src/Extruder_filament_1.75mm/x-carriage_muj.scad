// PRUSA iteration3
// x carriage
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

include <../../configuration.scad>
// PRUSA iteration3
// Bearing holders
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

bearing_diameter = 15;

module horizontal_bearing_base(bearings=1){
 translate(v=[0,0,6]) cube(size = [24,8+bearings*25,12], center = true);	
}
module horizontal_bearing_holes(bearings=1){
 cutter_lenght = 10+bearings*25;
 one_holder_lenght = 8+25;
 holder_lenght = 8+bearings*25;
 
 // Main bearing cut
 difference(){
  translate(v=[0,0,12+1.5]) rotate(a=[90,0,0]) translate(v=[0,0,-cutter_lenght/2]) cylinder(h = cutter_lenght, r=bearing_diameter/2, $fn=50);
  // Bearing retainers
  translate(v=[0,1-holder_lenght/2,3+1.5]) cube(size = [24,6,8], center = true);
  translate(v=[0,-1+holder_lenght/2,3+1.5]) cube(size = [24,6,8], center = true);
 }
 
 // Ziptie cutouts
 ziptie_cut_ofset = 0;
 for ( i = [0 : bearings-1] ){
  // For easier positioning I move them by half of one 
  // bearing holder then add each bearign lenght and then center again
  translate(v=[0,-holder_lenght/2,0]) translate(v=[0,one_holder_lenght/2+i*25,0]) difference(){
   union(){
    translate(v=[0,2-6,12]) rotate(a=[90,0,0]) translate(v=[0,0,0]) cylinder(h = 4, r=12.5, $fn=50);
    translate(v=[0,2+6,12]) rotate(a=[90,0,0]) translate(v=[0,0,0]) cylinder(h = 4, r=12.5, $fn=50);
   }
   translate(v=[0,10,12]) rotate(a=[90,0,0]) translate(v=[0,0,0]) cylinder(h = 24, r=10, $fn=50);
  }
 }
 
}
x_rod_distance = 45;

module x_carriage_base(){
 // Small bearing holder
 translate([-33/2,+2,0]) rotate([0,0,90]) horizontal_bearing_base(2);
 hull(){
     // Long bearing holder
     translate([-33/2,x_rod_distance+2,0]) rotate([0,0,90]) horizontal_bearing_base(2);
     // Belt holder base
     translate([-36,20,0]) cube([39,16,17]);
    }
     // Base plate
 translate([-38-7.5,-11.5,0]) cube([39+4+15,68,7+1.5]);

}

module x_carriage_beltcut(){
 position_tweak=-1.2;
 // Cut in the middle for belt
 translate([-2.5-16.5+1,19,7]) cube([4.5,13,15]);
 // Cut clearing space for the belt
 translate([-41.5,5,7]) cube([50,13,15]);
 // Belt slit
 translate([-50,21.5+10,6]) cube([67,0.55,15]);
 // Smooth entrance
 translate([-56,21.7+10,16.5]) rotate([45,0,0]) cube([67,15,15]);
 // Teeth cuts
   for ( i = [0 : 33] ){											  //cube([1,1.7,15]) GT2 a cube([1.7,1.7,15]) T2.5
	translate([15-i*belt_tooth_distance+position_tweak,21.9+8,6+1.5]) cube([belt_tooth_ratio*belt_tooth_distance,1.7,15]);
   }
}

module x_carriage_holes(){
 // Small bearing holder holes cutter
  translate([-33/2,2,0]) rotate([0,0,90]) horizontal_bearing_holes(2);
 // Long bearing holder holes cutter
  translate([-33/2,x_rod_distance+2,0]) rotate([0,0,90]) horizontal_bearing_holes(2);
  // Extruder mounting holes
  translate([-16.5+15,24,-1])cylinder(r=1.7, h=20, $fn=32);
  translate([-16.5+15,24,10])cylinder(r=3.3, h=20, $fn=6); 
  translate([-16.5-15,24,-1])cylinder(r=1.7, h=20, $fn=32);
  translate([-16.5-15,24,10])cylinder(r=3.3, h=20, $fn=6); 	
}

module x_carriage_fancy(){
 // Top right corner
 translate([13.5,-5,0]) translate([0,45+11.5,-1]) rotate([0,0,45]) translate([0,-15,0]) cube([30,30,20]);
 // Bottom right corner
 translate([0,5,0]) translate([0,-11.5,-1]) rotate([0,0,-45]) translate([0,-15,0]) cube([30,30,20]);
 // Bottom ĺeft corner
 translate([-33,5,0]) translate([0,-11.5,-1]) rotate([0,0,-135]) translate([0,-15,0]) cube([30,30,20]);
 // Top left corner
 translate([-33-13.5,-5,0]) translate([0,45+11.5,-1]) rotate([0,0,135]) translate([0,-15,0]) cube([30,30,20]);	
}

// Final part
module x_carriage(){
 difference(){
  x_carriage_base();
  x_carriage_beltcut();
  x_carriage_holes();
  //x_carriage_fancy();
 }
}

x_carriage();

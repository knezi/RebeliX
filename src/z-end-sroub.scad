// PRUSA iteration3
// x end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org
module x_end_holes(){
// Belt hole
// Nut trap
rotate([0,0,30]) cylinder(h = 16, r=4.5, $fn = 6);
}

difference() {
	cube([12,15,4]);
	translate([6,7.5,-5]) x_end_holes();
}

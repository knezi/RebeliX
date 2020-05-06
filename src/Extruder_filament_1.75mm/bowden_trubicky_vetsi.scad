//translate([100,0,0]) import("./bowden_trubicky.stl");
tolerance=2;
polomer_bow=3.5;
/*
difference() {
	union() {
		translate([0,-3,0]) cube([5,43+6,43]);

		translate([0,-13,19.2]) cube([24,25,15]);
		translate([24,-3.5,19.2]) cube([10,3.5,15]);

		translate([0,41-6,19.2]) cube([24,21,15]);
		translate([24,42.65,19.2]) cube([10,3.5,15]);
        
		translate([0,41-6,10]) cube([24,11,15]);
		translate([0,-3,10]) cube([24,15,15]);

		translate([24,51,19.2]) cube([10,5,15]);
	}

//lozisko
	translate([-10,21.5,21.5]) rotate([0,90,0]) cylinder(r=8.2,h=50);

// fliament
	translate([14,-55,21.5+5.2]) rotate([-90,0,0]) cylinder(r=3,h=220,$fn=32);

translate([14,20,21.5+5.2-tolerance]) rotate([-90,0,0]) cylinder(r=polomer_bow,h=100, $fn=16);
translate([14,20,21.5+5.2+tolerance]) rotate([-90,0,0]) cylinder(r=polomer_bow,h=100, $fn=16);
translate([14-polomer_bow,20,21.5+5.2-tolerance]) cube([polomer_bow*2,100,tolerance*2]);


// srouby
	translate([0.5,21.5-15.5,21.5-15.5]) rotate([0,90,0]) cylinder(r=1.6,h=20);
	translate([0.5,21.5+15.5,21.5-15.5]) rotate([0,90,0]) cylinder(r=1.6,h=20);
	translate([0.5,21.5+15.5,21.5+15.5]) rotate([0,90,0]) cylinder(r=1.6,h=20);
	translate([0.5,21.5-15.5,21.5+15.5]) rotate([0,90,0]) cylinder(r=1.6,h=20);



}*/

// IDLER
translate([14.5-7.5,-3,37]) {
	difference() {
		union() {
			translate([-1,-10,0]) cube([16,69,9]);
			translate([4.5-1, 24.5-7-1, -7]) cube([6+2, 14+2, 12]);
			translate([7.5-6-1, 24.5-2.25-1, -7]) cube([12+2, 4.5+2, 8]);
		}
		translate([4.5, 24.5-7, -10]) cube([6, 14, 100]);
		translate([7.5-6, 24.5-2.25, -12]) cube([12, 4.5, 10]);
		translate([-2,9,0]) rotate([0,90,0]) cylinder(r=3,h=44);
		translate([-2,40,0]) rotate([0,90,0]) cylinder(r=3,h=44);
	}
}

// ložisko horní
//translate([9,16.5,26.075]) cube([10,10,10]);


// motor
//translate([24,21.5-21.15, 21.5-21.15]) cube([50,42.3,42.3]);



/*
vyska=20;
// horni kec 
translate([5,0,40]) {
difference() {union(){
	translate([2,-8,0]) cube([17,43+10+6,7.5]);
	//translate([9-7.5-1,20.5-2.5-1,-2]) cube([17,7,2]);

//	translate([0,42,-vyska]) cube([19,5,vyska]);
	}
	

translate([3.5,20.5-2.5,-1]) cube([13,5,6.5]);
translate([9-3,20.5-7.5,-15.5]) cube([6,15,30]);
//translate([9,-1,-1.5-4.5]) rotate([-90,0,0]) cylinder(r=1,h=120, $fn=8);
//translate([9,-1,-1.5-4.5-5]) rotate([-90,0,0]) cylinder(r=1,h=120, $fn=8)
;
//translate([9-1,41,-1.5-4.5-5]) cube([2,10,5]);
}

}
*/

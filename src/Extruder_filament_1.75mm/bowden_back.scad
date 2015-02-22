/*import("/home/knezi/Documents/3d-tiskarna/knezi/RebeliX/src/Extrud
er_filament_1.75mm/Compact_Bowden_Extruder.stl", convexity=3);

translate([20, 0, 0]){
import("/home/knezi/Documents/3d-tiskarna/knezi/RebeliX/src/Extruder_filament_1.75mm/Idler_Part_1.stl", convexity=3);

import("/home/knezi/Documents/3d-tiskarna/knezi/RebeliX/src/Extruder_filament_1.75mm/Idler_Part_2.stl", convexity=3);
}*/

filament_diameter=2;
filament_feed_hole_d=(filament_diameter*1.1)/cos(180/8);
m3_nut_diameter = 6.1;

difference() {
	union() {
		cube([4,42,47]);
		//translate([-40,0]) cube([40,47,5]);
//		translate([-20,0,5]) cube([20,5,5]);
		//translate([-40,42,5]) cube([40,5,45]);

	difference() {
			union() {
				translate([4,-20,0]) cube([20,20,5]);
				translate([10,-20,-1.5]) cube([8,20,1.5]);
			}
			translate([14,-10,-2]) cylinder(r=3.1,h=10);
		}

		translate([0,62,0]) difference() {
			union() {
				translate([4,-20,0]) cube([20,20,5]);
				translate([10,-20,-1.5]) cube([8,20,1.5]);
			}
			translate([14,-10,-2]) cylinder(r=3.1,h=10);
		}
	}
	
	translate([-1,6,5+6])
		rotate([0,90,0]) cylinder(r=1.6,h=10,$fn=8);
	translate([-1,42-(6),5+6])
		rotate([0,90,0]) cylinder(r=1.6,h=10,$fn=8);
	translate([-1,6,5+6+31])
		rotate([0,90,0]) cylinder(r=1.6,h=10,$fn=8);
	translate([-1,42-(6),5+6+31])
		rotate([0,90,0]) cylinder(r=1.6,h=10,$fn=8);

	translate([-1,21,26.5]) {// velka dira pro motor
		rotate([0,90,0]) 	cylinder(r=11,h=10);

		}
}
	



translate([19,21,26.5]) { // uložení ložiska hřídele
	difference() {
		union() {
			translate([0,-21,-26.5]) cube([5,42,39]);
			rotate([0,90,0]) cylinder(r=10,h=6);
		}
		translate([1,0]) rotate([0,90,0]) cylinder(r=8,h=10);
		translate([-1,0]) rotate([0,90,0]) cylinder(r=6,h=11);
		translate([-1,4.4-21,9.4-26.5]) cube([7,5,5]);
		translate([-1,42-7.6-21,9.4-26.5]) cube([7,5,5]);
	}
}



// pruchod filamentu

	translate([4,0,0]) cube([15,42,5]);
difference() {
	union() {
		difference() {
			translate([4,37,9+5+5]) cube([15,5,20]);
//			translate([4+7.5,39.5,35]) rotate([0,0,30]) cylinder(r=m3_nut_diameter/2,h=50,$fn=6);
			translate([4+7.5-2.7,36,34]) cube([5.4, 7, 3]);
			translate([4+7.5,39.5,32.5]) cylinder(r=1.5,h=20,$fn=8);
		}
		difference() {
			translate([4,0,9+5]) cube([20,5,35]);
			translate([4,1,33.5]) cube([15,6,8]);
		}
	};
	
	//upevnění bowdenu
	translate([19-2,36,35]) rotate([-90,30,0]) cylinder(r=1.6,h=50,$fn=6);
	translate([4+3,36,23]) rotate([-90,0,0]) cylinder(r=1.6,h=50,$fn=6);

	translate([11.5,-5, 26.5+4.075]) rotate([-90,0,0]) cylinder(r=filament_feed_hole_d/2,h=50,$fn=8);	
}



//drzak bowden	
translate([0,25,0]) difference() {
	translate([4,37,9+5+5]) cube([15,5,20]);
	//upevnění bowdenu
	translate([19-2,36,35]) rotate([-90,30,0]) cylinder(r=1.6,h=50,$fn=6);
	translate([4+3,36,23]) rotate([-90,0,0]) cylinder(r=1.6,h=50,$fn=6);
}




translate([30,0,0])
// IDLER
difference() {
	union() {
		translate([4.5,1,36.5]) cube([14,41,5]);
		translate([4.5,24,37]) rotate([-180,0]) cube([14,6,3]);
	}
	translate([4,36,36]) cube([15.5,47,2.5]);
	translate([4,0,36]) cube([3.5,9,7]);
	translate([4,46-13,36]) cube([3.5,13,7]);
//	translate([11.5,21,37]) rotate([0,90]) cylinder(r=6.5, h=6, center=true); // test lozisko
	translate([11.5-3,21-7.5,33]) cube([6,15,20]); 
	translate([11.5,21,37]) rotate([0,90,0]) cylinder(r=2, h=12, center=true, $fn=8);
	translate([11.5-6,23,37]) rotate([-180,0]) cube([12,4,10]);
translate([4+7.5,39.5,32.5]) cylinder(r=1.5,h=20,$fn=8);
}




//translate([-10,21,26.5]) rotate([0,90,0]) cylinder(r=4.075, h=40); // test hridel
//translate([11.5,21,37]) rotate([0,90]) cylinder(r=6.5, h=6, center=true); // test lozisko

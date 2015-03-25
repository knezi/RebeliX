//translate([100,0,0]) {
//import("bowden_2.stl");
//}



tolerance=1;
polomer_bow=3.5;
union() {
difference() {
	translate([0,-3,0]) cube([24,43+6,41]);

	//translate([5,-1-5,-1]) cube([24,75,10]);
	translate([5,-1-5,34]) cube([24,75,22]);
	translate([5,5-3,-1]) cube([14,33+6,120]);

	translate([-1,21.5,21.5]) rotate([0,90,0]) cylinder(r=11.5,h=20);
//lozisko
	translate([10,21.5,21.5]) rotate([0,90,0]) cylinder(r=8.2,h=20);

// fiament
	translate([14,-5,21.5+5.2]) rotate([-90,0,0]) cylinder(r=1.1,h=120,$fn=8);

translate([14,20,21.5+5.2-tolerance]) rotate([-90,0,0]) cylinder(r=polomer_bow,h=100, $fn=16);
translate([14,20,21.5+5.2+tolerance]) rotate([-90,0,0]) cylinder(r=polomer_bow,h=100, $fn=16);
translate([14-polomer_bow,20,21.5+5.2-tolerance]) cube([polomer_bow*2,100,tolerance*2]);


// srouby
	translate([-1,21.5-15.5,21.5-15.5]) rotate([0,90,0]) cylinder(r=1.6,h=20);
	translate([-1,21.5+15.5,21.5-15.5]) rotate([0,90,0]) cylinder(r=1.6,h=20);
	translate([-1,21.5+15.5,21.5+15.5]) rotate([0,90,0]) cylinder(r=1.6,h=20);
	translate([-1,21.5-15.5,21.5+15.5]) rotate([0,90,0]) cylinder(r=1.6,h=20);



}


// upevneni na ram
difference() {
union() {
		translate([0,-23,-3]) cube([24,87,5]);
		translate([8.5,-23,-4]) cube([7,87,5]);
	}
	translate([12,-13,-10]) cylinder(r=3.1,h=80);
	translate([12,54,-10]) cylinder(r=3.1,h=80);
	

}
}
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

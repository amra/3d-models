$fn=64;
holeX=8;
holeY=4.5;
screwWidth=3.5;
module screwhole() {
    translate([0,-0.5,0]) difference() {
        cube([holeX,holeY,12]);
        translate([-0.05,-5,0]) rotate([-6,0,0]) cube([holeX+0.1,6.1,20]);
    }
    translate([(holeX-screwWidth)/2,-4,0]) cube([screwWidth,7,10]);
}

//screwhole();

/*
difference() {
cube([12,7,14]);
translate([2,1,-0.05]) screwhole();
}
*/

rotate([90,0,0]) union() {
difference() {
    scale([3,2,2]) import("../Shell.stl");
    union() {
        translate([0,0,-2.5]) scale([3,2,2]) import("Shell.stl");
        translate([75,45,0]) cylinder(r=3, h=30);
        translate([60,45,0]) cylinder(r=3, h=30);
        translate([90,45,0]) cylinder(r=3, h=30);
    }
}

translate([35,0,0]) 
difference() {
    cube([80,40,15]);
    union() {
        translate([-35,0,-2.5]) scale([3,2,2]) import("Shell.stl");
        translate([15,1,15.1]) rotate([0,180,0]) screwhole();
        translate([75,1,15.1]) rotate([0,180,0]) screwhole();
    }
}
}
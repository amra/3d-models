$fn=64;
holeX=8;
holeY=4.5;
screwWidth=3.5;
screwDifference=17.5;
scale=1.8;
module screwhole() {
    translate([0,-0.5,0]) difference() {
        cube([holeX,holeY,12]);
        translate([-0.05,-5,0]) rotate([-6,0,0]) cube([holeX+0.1,6.1,20]);
    }
    translate([(holeX-screwWidth)/2,-4,0]) cube([screwWidth,7,10]);
}

module brushhole(x,y,angle) {
    translate([x,y,0]) rotate([0,0,angle]) difference() {
        scale([1.5,1.2,1]) cylinder(r=5, h=30);
        translate([-1,4,-1]) cube([2,2,30]);
    }
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
    scale([scale,scale,scale]) import("../Shell.stl");
    union() {
        translate([0,0,-2.5]) scale([scale,scale,scale]) import("Shell.stl");
        brushhole(46,35,180);
        brushhole(32,55,225);
        brushhole(60,55,135);
    }
}

translate([25,0,0]) 
difference() {
    cube([40,40,15]);
    union() {
        translate([-25,0,-1.5]) scale([scale,scale,scale]) import("Shell.stl");
        translate([16.25,1,15.1]) rotate([0,180,0]) screwhole();
        translate([33.75,1,15.1]) rotate([0,180,0]) screwhole();
    }
}
}
resize([2,4,0.5]) import("../seahorse-shape.stl");
translate([0.6,-0.25,0]) rotate([0,0,-20]) difference() {
    cube([0.55,1.2,0.5]);
    translate([0,0.7,-0.5]) rotate([0,0,45]) cube([1,1,1.5]);
}
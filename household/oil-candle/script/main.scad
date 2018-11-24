$fn=64;
radius=30;
height=5;
inner=17;
difference() {
    rotate([0,0,14]) translate([0,0,-2*height]) linear_extrude(height = 10) import("flower.dxf");
    rotate([90,0,0]) cylinder(r=7, h=radius+2);
    rotate([90,0,120]) cylinder(r=7, h=radius+2);
    rotate([90,0,240]) cylinder(r=7, h=radius+2);
    translate([0,0,-10+0.2]) cylinder(r=1.2, h=5); // Wick hole.
    translate([0,0,0]) scale([1,1,0.4]) sphere(inner); // Center hole.
}

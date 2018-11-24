$fn=64;
radius=30;
height=5;
inner=17;
difference() {
    rotate([0,0,-9]) translate([-1,1,-2*height]) linear_extrude(height = 10) import("flower-5.dxf");
    star(5);
    translate([0,0,-1]) star(5);
    translate([0,0,-1.5]) star(5);
    translate([0,0,-9.5+0.2]) cylinder(r=1.2, h=5); // Wick hole.
    translate([0,0,0]) scale([1,1,0.4]) sphere(inner); // Center hole.
}

module star(sRadius) {
    rotate([90,0,0]) cylinder(r=sRadius, h=radius+2);
    rotate([90,0,72]) cylinder(r=sRadius, h=radius+2);
    rotate([90,0,144]) cylinder(r=sRadius, h=radius+2);
    rotate([90,0,216]) cylinder(r=sRadius, h=radius+2);
    rotate([90,0,288]) cylinder(r=sRadius, h=radius+2);    
}
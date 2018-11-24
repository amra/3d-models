$fn=64;
height=4;
radius=30;
inner=10;

module rayBasic(myRadius, myHeight, side) {
    intersection() {
        translate([0,0,height]) rotate([90,0,0]) 
        difference() {
            translate([3*side,0,0]) cylinder(r=myRadius, h=myHeight);
            translate([50*side,0,0]) cube(100, center = true);
        }
        translate([0,0,-myRadius]) cylinder(r=myHeight,h=3*myRadius);
    }
}

module ray(angle, myRadius, myHeight) {
    rotate([0,0,angle]) translate([0.01,0,0]) rayBasic(myRadius, myHeight, 1);
    rotate([0,0,angle]) translate([-0.01,0,0]) rayBasic(myRadius, myHeight, -1);
}

difference() {
    union() {
        cylinder(r=radius,h=height);
        ray(0, 10, radius);
        ray(120, 10, radius);
        ray(240, 10, radius);
        translate([0,0,-10]) cylinder(r=3, h=10);  // Wick hole.
        translate([0,0,5]) scale([0.75,0.75,1.2]) sphere(inner+1); // Center hole.
    }
    ray(0, 7, radius+0.1);
    ray(120,7, radius+0.1);
    ray(240,7, radius+0.1);
    translate([0,0,-4]) resize([3,3,11]) sphere(2.5); // Wick hole.
    translate([0,0,7]) scale([0.75,0.75,1.2]) sphere(inner); // Center hole.
    translate([0,0,-2.5]) cylinder(h = 14, r1 = 4.55, r2 = 16, center = false); // Center hole.
    translate([-2*radius,-2*radius,height-0.01]) cube(4*radius);
}

$fn = 64;

radius_big=150;
radius=15;
arc=60;
arc_core=45;
arc_side=7.5;

module pie_slice(r=3.0,a=30, h=10) {
  linear_extrude(height=h)
  intersection() {
    circle(r=r);
    square(r);
    rotate(a-90) square(r);
  }
}

hyperboloid_size=25;
hyperboloid_width=10;
function points() = concat([ for (x = [0 : hyperboloid_size]) [hyperboloid_width + x * x / hyperboloid_size, x] ], [[0, hyperboloid_size], [0, 0] ]);

module hyperboloid() {
    render() union() {
        rotate_extrude() polygon(points());
        rotate_extrude() polygon(-points());
    }
}

difference() {
    intersection() {
        // base arc
        render() intersection() {
            rotate_extrude(convexity = 2) translate([radius_big, 0, 0]) circle(r = radius);
            translate([0,0,-1]) pie_slice(r=radius_big+radius+1,a=arc,h=radius+1);
        }
        union() {
            rotate([0,0,arc_side]) translate([0,0,0]) pie_slice(r=radius_big+radius+1,a=arc_core,h=radius+1);
            // wing one
            hull() {
                rotate([0,0,arc_side/1.5]) translate([radius_big,0,0]) cylinder(h=radius/2, r=radius);
                rotate([0,0,arc_side]) translate([radius_big,0,0]) cylinder(h=radius/2, r=radius);
            }
            // wing two
            hull() {
                rotate([0,0,arc_core+arc_side]) translate([radius_big,0,0]) cylinder(h=radius/2, r=radius);
                rotate([0,0,arc_core+arc_side*3/2.25]) translate([radius_big,0,0]) cylinder(h=radius/2, r=radius);
            }
        }
    }

    // finger space
    union() {
        rotate([0,0,15]) translate([130,0,0]) hyperboloid();
        rotate([0,0,25]) translate([130,0,0]) hyperboloid();
        rotate([0,0,35]) translate([130,0,0]) hyperboloid();
        rotate([0,0,45]) translate([130,0,0]) hyperboloid();
    }

    // screw hole one
    rotate([0,0,arc_side/2]) translate([radius_big,0,-radius]) cylinder(h=2*radius, r=2);
    // screw hole two
    rotate([0,0,arc_core+arc_side*3/2]) translate([radius_big,0,-radius]) cylinder(h=2*radius, r=2);
}


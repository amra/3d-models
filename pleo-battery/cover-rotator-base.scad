$fn=64;
corner_radius=5;
height=3;
plate_height=1;
plate_length=44;
plate_width=29.3;
wall_thickness=5;

rotator_diameter=20;
rotator_wall=2;
rotator_height=3;
rotator_mount_inner=4;
rotator_mount_thickness=1;

wing_length=5;
wing_width=3;

diff=0.1;

//core
difference() {
    cylinder(h=rotator_height, d=rotator_diameter);
    translate([0,0,-diff]) difference() {
        cylinder(h=rotator_height+2*diff, d=rotator_diameter-rotator_wall);
        difference() {
            cylinder(h=rotator_height+2*diff, d=rotator_mount_inner+2*rotator_mount_thickness);
            cylinder(h=rotator_height+2*diff, d=rotator_mount_inner);
        }
    }
}

//wings
difference() {
    union() {
        translate([0,0,rotator_height/2]) cube([rotator_diameter+wing_length*2,wing_width,rotator_height], center = true);
        translate([rotator_diameter/2+wing_length,0,0]) cylinder(h=rotator_height, d=wing_width);
        translate([-rotator_diameter/2-wing_length,0,0]) cylinder(h=rotator_height, d=wing_width);
    }
    translate([0,0,-diff]) cylinder(h=rotator_height+2*diff, d=rotator_diameter);
}

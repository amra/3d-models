$fn=64;
corner_radius=5;
height=3;
plate_height=1;
plate_length=44;
plate_width=29.3;
wall_thickness=5;

rotator_diameter=25;
rotator_base_height=1;
rotator_top_height=3;
rotator_top_diameter=10;
handle_space=3;

wing_length=5;
wing_width=3;

diff=0.1;

cylinder(h=rotator_base_height, d=rotator_diameter);
translate([0,0,rotator_base_height]) cylinder(h=rotator_top_height,d=rotator_top_diameter);
translate([0,0,rotator_base_height]) difference() {
    cylinder(h=rotator_top_height,d=rotator_diameter);
    translate([-rotator_diameter/2-diff,-handle_space,0]) cube(rotator_diameter+2*diff);
}
translate([-rotator_top_diameter/2,-handle_space,rotator_base_height]) cube([rotator_top_diameter,handle_space,rotator_top_height]);

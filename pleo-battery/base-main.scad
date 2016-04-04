$fn=64;
corner_radius=5;
plate_height=0.3;
plate_length=44;
plate_width=29.3;

contact_hole_radius=5;
contact_hole_distance=2;

locator_width=3;
locator_length=10;
locator_height=5;
locator_rotation=25;
locator_distance=18;

translate([corner_radius,corner_radius,0]) difference() {
    union() {
        minkowski() {
            cube([plate_length-2 * corner_radius, plate_width-2 * corner_radius, plate_height/2]);
            cylinder(r=corner_radius, h=plate_height/2);
        }
        contact_hole_color(plate_length/2, contact_hole_distance + contact_hole_radius);
        contact_hole_color(plate_length/2, plate_width - contact_hole_distance - contact_hole_radius);
        contact_hole_color(contact_hole_distance + contact_hole_radius, plate_width - contact_hole_distance - contact_hole_radius);
    }
    contact_hole(contact_hole_distance + contact_hole_radius, contact_hole_distance + contact_hole_radius);
    contact_hole(plate_length - contact_hole_distance - contact_hole_radius, plate_width - contact_hole_distance - contact_hole_radius);
    contact_hole(plate_length - contact_hole_distance - contact_hole_radius, contact_hole_distance + contact_hole_radius);
    translate([locator_distance-corner_radius, plate_width/2-corner_radius, -1]) rotate([0,0,locator_rotation]) translate([0,-locator_length/2,0]) cube([locator_width,locator_length,locator_height]);
}

module contact_hole(x, y) {
    translate([x - corner_radius, y - corner_radius, -1]) cylinder(h=2, r=contact_hole_radius);
}
module contact_hole_color(x, y, colorname="Lime") {
    translate([x - corner_radius, y - corner_radius, 0]) color(colorname, 1) cylinder(h=plate_height, r=contact_hole_radius);
}

module pillar(x) {
    translate([x, plate_width/2, plate_height]) difference() {
        cylinder(h=pillar_height, r=pillar_radius);
        translate([0,0,pillar_height/2+1]) cylinder(h=pillar_height/2, r=pillar_hole_radius);
    }
}

pillar_height=50;
pillar_radius=2;
pillar_hole_radius=1.5;
pillar(plate_length/3);
pillar(plate_length*2/3);

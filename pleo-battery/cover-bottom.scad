$fn=64;
corner_radius=5;
height=3;
plate_height=1;
plate_length=44;
plate_width=29.3;
wall_thickness=5;

pillar_radius=2;
pillar_hole_radius=1.5;
pillar_mount_radius=2.5;
pillar_mount_height=0.5;

rotator_mount_diameter=20;
rotator_mount_thickness=1;
rotator_mount_height=1;

translate([corner_radius,corner_radius,0]) difference() {
    minkowski() {
        cube([plate_length-2 * corner_radius, plate_width-2 * corner_radius, height/2]);
        cylinder(r=corner_radius, h=height/2);
    }
    minkowski() {
        translate([corner_radius/2,corner_radius/2,plate_height]) cube([plate_length-2 * corner_radius - wall_thickness, plate_width-2 * corner_radius - wall_thickness, height/2]);
        cylinder(r=corner_radius, h=height/2);
    }
    //side entrance
    translate([-corner_radius,-corner_radius,0]) union() {
        translate([5,-1,plate_height]) cube([plate_length/2,10,height]);
        translate([plate_length/2-5,plate_width+1-10,plate_height]) cube([plate_length/2,10,height]);
    }
    translate([-corner_radius,-corner_radius,0]) union() {
        pillar_hole(plate_length/3);
        pillar_hole(plate_length*2/3);
    }
}

//rotator_mount
translate([plate_length/2,plate_width/2,plate_height]) difference() {
    cylinder(d=rotator_mount_diameter, h=rotator_mount_height);
    translate([0,0,-1]) cylinder(d=rotator_mount_diameter-2*rotator_mount_thickness, h=rotator_mount_height+2);
}

module pillar_hole(x) {
    translate([x, plate_width/2, 0]) {
        translate([0,0,-1]) cylinder(h=pillar_mount_height+1, r=pillar_mount_radius);
        translate([0,0,-1]) cylinder(h=10, r=pillar_hole_radius);
    }
}



// add screw holders
// add centre rotation cylinder
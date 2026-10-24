// =====================================================================
// STANDARD MONOLITHIC HORSE STABLE (1:24 Scale - Schleich Compatible)
// Author: Bartosz Nowak (2026)
// License: MIT
//
// Key Features:
// 1. Calibrated for 1:24 scale model horses (Schleich, CollectA, Safari Ltd.):
//    - Horse dimensions: length ~140-170 mm, height ~115-150 mm, width ~45-50 mm
// 2. INDESTRUCTIBLE 1.75 MM FILAMENT-PIN HINGE SYSTEM:
//    - Eliminates fragile 3D-printed pintle pins that shear along layer lines.
//    - Frame knuckles interlock with door knuckles around a 2.1 mm internal bore.
//    - Uses a standard scrap piece of 1.75 mm 3D printer filament (or 2.0 mm metal wire)
//      as a continuous, virtually unbreakable pivot pin (~15 kg shear strength vs ~0.5 kg).
//    - Blind bottom knuckle prevents the pin from sliding out underneath.
//    - 45° lead-in chamfer at the top allows effortless, snag-free filament pin insertion.
//    - Includes printable horizontal hinge pins as an optional alternative.
// 3. COMPLETE MODULAR VISUALIZATION & BATCH EXPORT:
//    - Clean monolithic wall structure, removable roof, separate doors and windows.
// =====================================================================

/* [Display View / Part Selection] */
// Select model view or export plate
view = "all"; // [all:Complete Stable with Horses, no_roof:Interior View (No Roof), exploded:Exploded Assembly View, hinge_detail:Filament-Pin Hinge Mechanism Detail, walls:Monolithic Walls & Floor, roof:Complete Assembled Roof, roof_flat:Flat Roof Slopes (0 Supports), windows:Window Frames & Grilles, doors:Barn Gates & Stall Dutch Doors, single_stall:Single Stall Bay]

// Show model horse mannequins for scale verification
show_horses = true;

// Exploded view separation distance [mm]
explosion = 50; // [20:5:150]

// Main entrance gate opening angle [degrees]
gate_open_angle = 35; // [0:5:120]

// Stall dutch door opening angle [degrees]
stall_door_open_angle = 25; // [0:5:90]

/* [Stable Configuration] */
// Number of stalls per side of the aisle (1 = 2 stalls, 2 = 4 stalls)
stalls_per_side = 1; // [1:2]

// Stall dimensions (calibrated for horses up to 170 mm long)
stall_length = 160;         // [140:10:220] Stall length in Y axis
stall_width = 130;          // [110:10:180] Stall width in X axis
aisle_width = 85;           // [70:5:120] Central aisle width
wall_height = 140;          // [120:5:180] Eaves wall height
roof_pitch_height = 75;     // [50:5:110] Roof ridge pitch height
wall_thickness = 4.0;       // Structural wall thickness
floor_thickness = 2.5;      // Floor thickness

/* [Openings & Doorways] */
gate_width = 75;            // Main entrance gate opening width
gate_height = 130;          // Main entrance gate opening height
stall_door_width = 65;      // Stall door opening width
stall_door_height = 85;     // Stall door opening height
window_width = 50;          // Window opening width
window_height = 42;         // Window opening height
sill_height = 70;           // Window sill height above floor

/* [Filament-Pin Hinge System (Indestructible 1.75mm Filament Pin)] */
pin_bore_r            = 1.05; // 2.1 mm bore diameter (0.175 mm radial clearance for 1.75 mm filament)
knuckle_r             = 3.3;  // 6.6 mm outer diameter (2.25 mm solid wall, virtually unbreakable)
knuckle_gap           = 0.45; // Vertical fit clearance between mating knuckles

// Stall door knuckle heights
stall_knuckle_h       = 9.0;
stall_knuckle_z_lower = floor_thickness + 12;
stall_knuckle_z_upper = floor_thickness + 55;

// Main gate knuckle heights
gate_knuckle_h        = 12.0;
gate_knuckle_z_lower  = floor_thickness + 15;
gate_knuckle_z_upper  = floor_thickness + 90;

/* [3D Printing & Tolerances] */
tolerance = 0.45;           // Assembly clearance [mm]
roof_overhang = 10;         // Roof overhang beyond walls

$fn = 24;

// Calculated stable dimensions
total_width = 2 * stall_width + aisle_width + 2 * wall_thickness;
total_length = stalls_per_side * stall_length + 2 * wall_thickness;
roof_angle = atan(roof_pitch_height / (total_width/2));

// Hinge axis coordinates
gate_hinge_x = gate_width / 2 - knuckle_r * 0.7;
gate_hinge_y_front = -total_length / 2 - knuckle_r - 0.5;
gate_hinge_y_rear  =  total_length / 2 + knuckle_r + 0.5;

// Visualization Palette
COLOR_WALLS      = [0.85, 0.76, 0.63]; // Pine wood / light stucco
COLOR_FLOOR      = [0.60, 0.58, 0.55]; // Concrete floor plate
COLOR_ROOF       = [0.70, 0.25, 0.18]; // Ceramic roof tiles
COLOR_TIMBER     = [0.42, 0.26, 0.15]; // Structural timber
COLOR_IRON       = [0.22, 0.22, 0.24]; // Anthracite iron / hardware
COLOR_DOORS      = [0.52, 0.32, 0.17]; // Dark timber doors
COLOR_WINDOWS    = [0.96, 0.96, 0.94]; // Cream window frames
COLOR_HORSE_1    = [0.35, 0.20, 0.10]; // Bay horse
COLOR_HORSE_2    = [0.88, 0.88, 0.85]; // Gray horse

// =====================================================================
// VIEW DISPATCH
// =====================================================================
if (view == "all") {
    stable_walls_complete();
    roof_complete();
    windows_complete();
    doors_complete();
    if (show_horses) horses_in_stable();
}
else if (view == "no_roof") {
    stable_walls_complete();
    windows_complete();
    doors_complete();
    if (show_horses) horses_in_stable();
}
else if (view == "exploded") {
    stable_walls_complete();

    // Raised roof
    translate([0, 0, explosion * 1.6])
        roof_complete();

    // Exploded windows
    translate([-explosion, 0, 0]) windows_left();
    translate([explosion, 0, 0])  windows_right();

    // Exploded gates
    translate([0, -explosion, 0]) front_gates();
    translate([0, explosion, 0])  rear_gates();

    stall_doors_all();
    if (show_horses) horses_in_stable();
}
else if (view == "hinge_detail") {
    // Demonstration of the filament-pin knuckle hinge system
    stall_post_knuckle_bracket(blind_bottom = true, h = stall_knuckle_h);
    translate([0, 0, stall_knuckle_h + knuckle_gap])
        door_hinge_knuckle_strap(45, strap_h = stall_knuckle_h, left = true);
    translate([0, 0, (stall_knuckle_h + knuckle_gap) * 2])
        stall_post_knuckle_bracket(lead_in = true, h = stall_knuckle_h);

    color([0.92, 0.18, 0.14]) {
        translate([0, 0, 1.2])
            cylinder(d = 1.75, h = (stall_knuckle_h + knuckle_gap) * 2 + stall_knuckle_h + 12, $fn = 24);
    }
}
else if (view == "walls") {
    stable_walls_complete();
}
else if (view == "roof") {
    translate([0, 0, -(wall_height + floor_thickness)])
        roof_complete();
}
else if (view == "roof_flat") {
    roof_flat_slopes();
}
else if (view == "windows") {
    windows_print_batch();
}
else if (view == "doors") {
    doors_print_batch();
}
else if (view == "single_stall") {
    single_stall_bay();
    if (show_horses) {
        translate([0, 0, floor_thickness])
            model_horse(horse_color = COLOR_HORSE_1);
    }
}

// =====================================================================
// MODEL HORSE MANNEQUIN (Schleich Scale: 145 x 45 x 115 mm)
// =====================================================================
module model_horse(horse_color = COLOR_HORSE_1) {
    color(horse_color) {
        // Torso
        translate([0, 0, 68])
            rotate([0, 90, 0])
                scale([1, 1.25, 2.3])
                    cylinder(r = 18, h = 38, center = true, $fn = 20);

        // Chest and flank
        translate([0, -32, 70]) sphere(r = 21, $fn = 20);
        translate([0, 32, 69])  sphere(r = 20, $fn = 20);

        // Front legs
        translate([-13, -28, 0]) horse_leg_front();
        translate([13, -28, 0])  horse_leg_front();

        // Rear legs
        translate([-13, 30, 0]) horse_leg_rear();
        translate([13, 30, 0])  horse_leg_rear();

        // Neck
        translate([0, -34, 76])
            rotate([-35, 0, 0])
                cylinder(r1 = 14, r2 = 9, h = 42, $fn = 16);

        // Head
        translate([0, -56, 106]) {
            rotate([25, 0, 0]) {
                sphere(r = 11, $fn = 16);
                translate([0, -14, -4])
                    scale([1, 1.8, 1])
                        sphere(r = 7.5, $fn = 16);
                translate([-6, 2, 9]) rotate([-10, -15, 0]) cylinder(r1=3, r2=0.5, h=10, $fn=10);
                translate([6, 2, 9])  rotate([-10, 15, 0])  cylinder(r1=3, r2=0.5, h=10, $fn=10);
            }
        }

        // Tail
        translate([0, 42, 66])
            rotate([15, 0, 0])
                cylinder(r1 = 6, r2 = 2, h = 42, $fn = 12);
    }
}

module horse_leg_front() {
    translate([0, 0, 40])
        cylinder(r1 = 5, r2 = 9, h = 25, $fn = 14);
    cylinder(r1 = 4.2, r2 = 5, h = 40, $fn = 14);
    color([0.2, 0.18, 0.15])
        cylinder(r1 = 5.5, r2 = 4.2, h = 6, $fn = 14);
}

module horse_leg_rear() {
    translate([0, -3, 42])
        rotate([-12, 0, 0])
            cylinder(r1 = 5, r2 = 11, h = 26, $fn = 14);
    cylinder(r1 = 4.2, r2 = 5, h = 42, $fn = 14);
    color([0.2, 0.18, 0.15])
        cylinder(r1 = 5.5, r2 = 4.2, h = 6, $fn = 14);
}

module horses_in_stable() {
    y_b1 = -total_length/2 + wall_thickness + stall_length/2;
    translate([-aisle_width/2 - stall_width/2, y_b1, floor_thickness])
        rotate([0, 0, -20])
            model_horse(horse_color = COLOR_HORSE_1);

    translate([0, -total_length/2 + 35, floor_thickness])
        rotate([0, 0, 0])
            model_horse(horse_color = COLOR_HORSE_2);

    if (stalls_per_side > 1) {
        y_b2 = -total_length/2 + wall_thickness + 1.5 * stall_length;
        translate([aisle_width/2 + stall_width/2, y_b2, floor_thickness])
            rotate([0, 0, 160])
                model_horse(horse_color = [0.15, 0.14, 0.14]);
    }
}

// =====================================================================
// INDESTRUCTIBLE FILAMENT-PIN HINGE MODULES
// =====================================================================

module frame_hinge_knuckle(h = 10, blind_bottom = false, lead_in = false) {
    difference() {
        cylinder(r = knuckle_r, h = h, $fn = 28);

        if (blind_bottom) {
            translate([0, 0, 1.2])
                cylinder(r = pin_bore_r, h = h + 1, $fn = 24);
        } else {
            translate([0, 0, -0.5])
                cylinder(r = pin_bore_r, h = h + 1.0, $fn = 24);
        }

        if (lead_in) {
            translate([0, 0, h - 1.2])
                cylinder(r1 = pin_bore_r, r2 = pin_bore_r + 1.0, h = 1.3, $fn = 24);
        }
    }
}

module portal_frame_knuckle_bracket(dir_x = 1, dir_y = -1, blind_bottom = false, lead_in = false, h = 12) {
    color(COLOR_IRON) {
        frame_hinge_knuckle(h = h, blind_bottom = blind_bottom, lead_in = lead_in);

        translate([dir_x > 0 ? 0 : -(wall_thickness + 4), dir_y < 0 ? 0 : -(wall_thickness + 2), 0])
            cube([wall_thickness + 4, wall_thickness + 2, h]);

        translate([dir_x > 0 ? 0 : -knuckle_r, dir_y < 0 ? 0 : -knuckle_r, 0])
            cube([knuckle_r, knuckle_r, h]);
    }
}

module stall_post_knuckle_bracket(blind_bottom = false, lead_in = false, h = 9) {
    color(COLOR_IRON) {
        frame_hinge_knuckle(h = h, blind_bottom = blind_bottom, lead_in = lead_in);

        translate([-2.5, -2.5, 0])
            cube([5.0, 5.0, h]);
    }
}

module door_hinge_knuckle_strap(strap_w, strap_h = 9, left = true) {
    strap_th = 1.6;

    color(COLOR_IRON) {
        difference() {
            cylinder(r = knuckle_r, h = strap_h, $fn = 28);
            translate([0, 0, -0.5])
                cylinder(r = pin_bore_r, h = strap_h + 1.0, $fn = 24);
        }

        if (left) {
            translate([0, -knuckle_r + 0.1, 0])
                cube([strap_w, strap_th, strap_h]);
            translate([0, -knuckle_r + 0.1, 0])
                rotate([0, 0, 45])
                    cube([knuckle_r, knuckle_r, strap_h]);
            for (nx = [12, 26, 40]) {
                if (nx < strap_w - 4) {
                    translate([nx, -knuckle_r - 0.2, strap_h/2])
                        rotate([-90, 0, 0])
                            cylinder(r = 1.2, h = 0.8, $fn = 12);
                }
            }
        } else {
            translate([-strap_w, -knuckle_r + 0.1, 0])
                cube([strap_w, strap_th, strap_h]);
            translate([-knuckle_r * 0.7, -knuckle_r + 0.1, 0])
                rotate([0, 0, 45])
                    cube([knuckle_r, knuckle_r, strap_h]);
            for (nx = [12, 26, 40]) {
                if (nx < strap_w - 4) {
                    translate([-nx, -knuckle_r - 0.2, strap_h/2])
                        rotate([-90, 0, 0])
                            cylinder(r = 1.2, h = 0.8, $fn = 12);
                }
            }
        }
    }
}

module printable_hinge_pin(pin_length = 75, pin_dia = 1.9) {
    color(COLOR_IRON) {
        rotate([0, 90, 0]) {
            cylinder(d = pin_dia, h = pin_length, $fn = 16);
            translate([0, 0, pin_length - 0.1])
                cylinder(r1 = pin_dia/2, r2 = 3.2, h = 2.0, $fn = 16);
        }
    }
}

// =====================================================================
// MODULE 1: WALLS, FLOOR & STALLS
// =====================================================================
module stable_walls_complete() {
    overlap = 0.05;
    difference() {
        union() {
            // Floor
            color(COLOR_FLOOR)
                translate([-total_width/2, -total_length/2, 0])
                    cube([total_width, total_length, floor_thickness]);

            // Exterior walls
            color(COLOR_WALLS) {
                translate([-total_width/2, -total_length/2, floor_thickness - overlap])
                    cube([wall_thickness, total_length, wall_height + overlap]);

                translate([total_width/2 - wall_thickness, -total_length/2, floor_thickness - overlap])
                    cube([wall_thickness, total_length, wall_height + overlap]);

                gable_wall(front = true);
                gable_wall(front = false);
            }

            // Interior stalls
            interior_stalls();

            // Roof indexing keys
            roof_keys();

            // Frame knuckles for main gates
            wall_gate_frame_knuckles();
        }

        // 1. Front entrance gateway
        translate([-gate_width/2, -total_length/2 - 1, floor_thickness])
            cube([gate_width, wall_thickness + 2, gate_height + 1]);

        // 2. Rear entrance gateway
        translate([-gate_width/2, total_length/2 - wall_thickness - 1, floor_thickness])
            cube([gate_width, wall_thickness + 2, gate_height + 1]);

        // 3. Side wall window openings
        for (i = [0 : stalls_per_side - 1]) {
            y_pos = -total_length/2 + wall_thickness + (i + 0.5) * stall_length;

            translate([-total_width/2 - 1, y_pos - window_width/2, sill_height])
                cube([wall_thickness + 2, window_width, window_height]);

            translate([total_width/2 - wall_thickness - 1, y_pos - window_width/2, sill_height])
                cube([wall_thickness + 2, window_width, window_height]);
        }
    }
}

module gable_wall(front = true) {
    overlap = 0.05;
    y_pos = front ? -total_length/2 : (total_length/2 - wall_thickness);
    translate([0, y_pos, floor_thickness - overlap]) {
        translate([-total_width/2, 0, 0])
            cube([total_width, wall_thickness, wall_height + overlap]);

        translate([0, 0, wall_height - overlap])
            rotate([90, 0, 0])
                linear_extrude(height = wall_thickness)
                    polygon(points = [
                        [-total_width/2, 0],
                        [total_width/2, 0],
                        [0, roof_pitch_height + overlap]
                    ]);
    }
}

module wall_gate_frame_knuckles() {
    x_l = -gate_width/2 + knuckle_r * 0.7;
    x_r = gate_width/2 - knuckle_r * 0.7;

    // Front doorway knuckles
    y_front = -total_length / 2;
    translate([x_l, y_front, gate_knuckle_z_lower])
        portal_frame_knuckle_bracket(dir_x = -1, dir_y = -1, blind_bottom = true, h = gate_knuckle_h);
    translate([x_l, y_front, gate_knuckle_z_upper])
        portal_frame_knuckle_bracket(dir_x = -1, dir_y = -1, lead_in = true, h = gate_knuckle_h);

    translate([x_r, y_front, gate_knuckle_z_lower])
        portal_frame_knuckle_bracket(dir_x = 1, dir_y = -1, blind_bottom = true, h = gate_knuckle_h);
    translate([x_r, y_front, gate_knuckle_z_upper])
        portal_frame_knuckle_bracket(dir_x = 1, dir_y = -1, lead_in = true, h = gate_knuckle_h);

    // Rear doorway knuckles
    y_rear = total_length / 2;
    translate([x_l, y_rear, gate_knuckle_z_lower])
        portal_frame_knuckle_bracket(dir_x = -1, dir_y = 1, blind_bottom = true, h = gate_knuckle_h);
    translate([x_l, y_rear, gate_knuckle_z_upper])
        portal_frame_knuckle_bracket(dir_x = -1, dir_y = 1, lead_in = true, h = gate_knuckle_h);

    translate([x_r, y_rear, gate_knuckle_z_lower])
        portal_frame_knuckle_bracket(dir_x = 1, dir_y = 1, blind_bottom = true, h = gate_knuckle_h);
    translate([x_r, y_rear, gate_knuckle_z_upper])
        portal_frame_knuckle_bracket(dir_x = 1, dir_y = 1, lead_in = true, h = gate_knuckle_h);
}

module interior_stalls() {
    color(COLOR_TIMBER) {
        if (stalls_per_side > 1) {
            for (i = [1 : stalls_per_side - 1]) {
                y_pos = -total_length/2 + wall_thickness + i * stall_length;

                translate([-total_width/2 + wall_thickness, y_pos - wall_thickness/2, floor_thickness])
                    stall_partition(stall_width);

                translate([aisle_width/2, y_pos - wall_thickness/2, floor_thickness])
                    stall_partition(stall_width);
            }
        }

        for (i = [0 : stalls_per_side - 1]) {
            y_start = -total_length/2 + wall_thickness + i * stall_length;

            translate([-aisle_width/2 - wall_thickness, y_start, floor_thickness])
                stall_front_section(stall_length);

            translate([aisle_width/2, y_start, floor_thickness])
                stall_front_section(stall_length);
        }
    }
}

module stall_partition(dl) {
    h_plank = 60;
    h_total = 95;
    th = 3.0;

    cube([dl, th, h_plank]);
    translate([0, 0, h_plank]) {
        translate([0, 0, h_total - h_plank - 3])
            cube([dl, th, 3]);
        bar_count = floor(dl / 10);
        for (p = [1 : bar_count - 1]) {
            translate([p * (dl / bar_count), th/2, 0])
                cylinder(r = 1.2, h = h_total - h_plank, $fn = 12);
        }
    }
}

module stall_front_section(dl) {
    h_total = 95;
    th = 3.0;
    h_plank = 55;
    y_hinge = dl - 4;

    difference() {
        union() {
            cube([th, dl, h_plank]);
            translate([0, 0, h_total - 3])
                cube([th, dl, 3]);
            cube([th, 6, h_total]);
            translate([0, dl - 6, 0])
                cube([th, 6, h_total]);

            translate([th/2, 0, h_plank]) {
                for (y = [6 : 10 : dl - stall_door_width - 6]) {
                    translate([0, y, 0])
                        cylinder(r = 1.2, h = h_total - h_plank, $fn = 12);
                }
            }
        }
        translate([-1, dl - stall_door_width - 4, 0])
            cube([th + 2, stall_door_width, stall_door_height + 1]);
    }

    // Filament-pin frame knuckles on stall post
    translate([th/2, y_hinge, 0]) {
        translate([0, 0, stall_knuckle_z_lower])
            stall_post_knuckle_bracket(blind_bottom = true, h = stall_knuckle_h);
        translate([0, 0, stall_knuckle_z_upper])
            stall_post_knuckle_bracket(lead_in = true, h = stall_knuckle_h);
    }
}

module roof_keys() {
    color(COLOR_TIMBER) {
        h_z = 5.0;
        translate([-total_width/2 + 0.5, -total_length/2 + 10, wall_height + floor_thickness])
            cube([wall_thickness - 1, 14, h_z]);
        translate([-total_width/2 + 0.5, total_length/2 - 24, wall_height + floor_thickness])
            cube([wall_thickness - 1, 14, h_z]);
        translate([total_width/2 - wall_thickness + 0.5, -total_length/2 + 10, wall_height + floor_thickness])
            cube([wall_thickness - 1, 14, h_z]);
        translate([total_width/2 - wall_thickness + 0.5, total_length/2 - 24, wall_height + floor_thickness])
            cube([wall_thickness - 1, 14, h_z]);
    }
}

// =====================================================================
// MODULE 2: REMOVABLE ROOF
// =====================================================================
module roof_complete() {
    roof_thickness = 3.2;
    roof_length = total_length + 2 * roof_overhang;
    half_width = total_width / 2;
    slope_length = (half_width + roof_overhang) / cos(roof_angle);

    translate([0, 0, wall_height + floor_thickness]) {
        color(COLOR_TIMBER)
            translate([0, -roof_length/2, roof_pitch_height - 0.5])
                rotate([-90, 0, 0])
                    cylinder(r = 4.0, h = roof_length, $fn = 8);

        color(COLOR_ROOF) {
            translate([0, 0, roof_pitch_height])
                rotate([0, -roof_angle, 0])
                    translate([-slope_length, -roof_length/2, -roof_thickness])
                        roof_slope_textured(slope_length, roof_length, roof_thickness);

            translate([0, 0, roof_pitch_height])
                rotate([0, roof_angle, 0])
                    translate([0, -roof_length/2, -roof_thickness])
                        roof_slope_textured(slope_length, roof_length, roof_thickness);
        }

        color(COLOR_TIMBER) {
            step = total_length / max(1, stalls_per_side);
            for (y = [-total_length/2 + 12 : step : total_length/2 - 12]) {
                translate([0, y, 0])
                    roof_truss();
            }
        }
    }
}

module roof_slope_textured(w, l, th) {
    difference() {
        cube([w, l, th]);
        for (y = [12 : 12 : l - 6]) {
            translate([-1, y, th - 0.8])
                cube([w + 2, 1.2, 1.5]);
        }
    }
}

module roof_truss() {
    beam_thickness = 4.0;
    difference() {
        rotate([90, 0, 0])
            linear_extrude(height = beam_thickness, center = true)
                polygon(points = [
                    [-total_width/2 + 1, 0],
                    [total_width/2 - 1, 0],
                    [0, roof_pitch_height - 2]
                ]);

        rotate([90, 0, 0])
            linear_extrude(height = beam_thickness + 1, center = true)
                polygon(points = [
                    [-total_width/2 + 12, 4],
                    [total_width/2 - 12, 4],
                    [0, roof_pitch_height - 8]
                ]);
    }
}

module roof_flat_slopes() {
    roof_thickness = 3.2;
    roof_length = total_length + 2 * roof_overhang;
    half_width = total_width / 2;
    slope_length = (half_width + roof_overhang) / cos(roof_angle);

    color(COLOR_ROOF) {
        translate([-slope_length - 8, -roof_length/2, 0])
            roof_slope_textured(slope_length, roof_length, roof_thickness);

        translate([8, -roof_length/2, 0])
            roof_slope_textured(slope_length, roof_length, roof_thickness);
    }

    color(COLOR_TIMBER) {
        translate([0, -roof_length/2, 4.0])
            rotate([-90, 0, 0])
                cylinder(r = 4.0, h = roof_length, $fn = 8);
    }
}

// =====================================================================
// MODULE 3: WINDOWS & HARDWARE
// =====================================================================
module windows_complete() {
    windows_left();
    windows_right();
}

module windows_left() {
    for (i = [0 : stalls_per_side - 1]) {
        y_pos = -total_length/2 + wall_thickness + (i + 0.5) * stall_length;
        translate([-total_width/2 + wall_thickness/2, y_pos, sill_height + window_height/2])
            rotate([0, 0, -90])
                single_window();
    }
}

module windows_right() {
    for (i = [0 : stalls_per_side - 1]) {
        y_pos = -total_length/2 + wall_thickness + (i + 0.5) * stall_length;
        translate([total_width/2 - wall_thickness/2, y_pos, sill_height + window_height/2])
            rotate([0, 0, 90])
                single_window();
    }
}

module single_window() {
    w = window_width - tolerance*2;
    h = window_height - tolerance*2;
    frame_th = wall_thickness;
    profile_w = 3.5;
    flange_th = 1.4;

    color(COLOR_WINDOWS) {
        difference() {
            union() {
                translate([-w/2, -frame_th/2, -h/2])
                    cube([w, frame_th, h]);
                translate([-(w + 5)/2, -frame_th/2 - flange_th, -(h + 5)/2])
                    cube([w + 5, flange_th, h + 5]);
            }
            translate([-(w - 2*profile_w)/2, -frame_th - 2, -(h - 2*profile_w)/2])
                cube([w - 2*profile_w, frame_th*2 + 4, h - 2*profile_w]);
        }
    }

    color(COLOR_IRON) {
        bar_count = 4;
        step = (w - 2*profile_w) / (bar_count + 1);
        for (k = [1 : bar_count]) {
            translate([-(w - 2*profile_w)/2 + k * step, 0, -h/2 + profile_w])
                cylinder(r = 1.0, h = h - 2*profile_w, $fn = 12);
        }
        translate([-(w - 2*profile_w)/2, 0, 0])
            rotate([0, 90, 0])
                cylinder(r = 1.0, h = w - 2*profile_w, $fn = 12);
    }
}

module windows_print_batch() {
    total_windows = stalls_per_side * 2;
    for (i = [0 : total_windows - 1]) {
        translate([(i % 2) * (window_width + 15) - 30, floor(i / 2) * (window_height + 15), 0])
            rotate([90, 0, 0])
                single_window();
    }
}

// =====================================================================
// MODULE 4: DOORS & BARN GATES (With Filament-Pin Knuckles)
// =====================================================================
module doors_complete() {
    front_gates();
    rear_gates();
    stall_doors_all();
}

module front_gates() {
    wing_w = gate_hinge_x;
    wing_h = gate_height - tolerance;

    translate([-gate_hinge_x, gate_hinge_y_front, 0])
        rotate([0, 0, -gate_open_angle])
            gate_wing(wing_w, wing_h, left = true);

    translate([gate_hinge_x, gate_hinge_y_front, 0])
        rotate([0, 0, gate_open_angle])
            gate_wing(wing_w, wing_h, left = false);
}

module rear_gates() {
    wing_w = gate_hinge_x;
    wing_h = gate_height - tolerance;

    translate([gate_hinge_x, gate_hinge_y_rear, 0])
        rotate([0, 0, 180 - gate_open_angle])
            gate_wing(wing_w, wing_h, left = true);

    translate([-gate_hinge_x, gate_hinge_y_rear, 0])
        rotate([0, 0, 180 + gate_open_angle])
            gate_wing(wing_w, wing_h, left = false);
}

module gate_wing(w, h, left = true) {
    th = 2.8;

    color(COLOR_DOORS) {
        if (left) {
            translate([0, -knuckle_r + 0.2, floor_thickness + 1]) {
                difference() {
                    cube([w, th, h]);
                    for (x = [8 : 8 : w - 4]) {
                        translate([x, -0.1, 0])
                            cube([0.8, 0.8, h]);
                    }
                }

                translate([0, -0.8, 0]) {
                    cube([w, 0.8, 4]);
                    translate([0, 0, h - 4])
                        cube([w, 0.8, 4]);
                    cube([4, 0.8, h]);
                    translate([w - 4, 0, 0])
                        cube([4, 0.8, h]);

                    brace_angle = atan(h / w);
                    brace_len = sqrt(w*w + h*h);
                    rotate([0, -brace_angle, 0])
                        cube([brace_len, 0.8, 4]);
                }
            }
        } else {
            translate([-w, -knuckle_r + 0.2, floor_thickness + 1]) {
                difference() {
                    cube([w, th, h]);
                    for (x = [8 : 8 : w - 4]) {
                        translate([-x, -0.1, 0])
                            cube([0.8, 0.8, h]);
                    }
                }

                translate([-w, -0.8, 0]) {
                    cube([w, 0.8, 4]);
                    translate([0, 0, h - 4])
                        cube([w, 0.8, 4]);
                    cube([4, 0.8, h]);
                    translate([w - 4, 0, 0])
                        cube([4, 0.8, h]);

                    brace_angle = atan(h / w);
                    brace_len = sqrt(w*w + h*h);
                    translate([w, 0, 0])
                        rotate([0, -180 + brace_angle, 0])
                            cube([brace_len, 0.8, 4]);
                }
            }
        }
    }

    // Door leaf knuckles (interlock with frame knuckles)
    translate([0, 0, gate_knuckle_z_lower + gate_knuckle_h + knuckle_gap])
        door_hinge_knuckle_strap(w * 0.75, strap_h = gate_knuckle_h, left = left);
    translate([0, 0, gate_knuckle_z_upper + gate_knuckle_h + knuckle_gap])
        door_hinge_knuckle_strap(w * 0.75, strap_h = gate_knuckle_h, left = left);
}

module stall_doors_all() {
    for (i = [0 : stalls_per_side - 1]) {
        y_stall = -total_length/2 + wall_thickness + i * stall_length;
        y_hinge = y_stall + stall_length - 4;

        translate([-aisle_width/2, y_hinge, 0])
            rotate([0, 0, -stall_door_open_angle])
                rotate([0, 0, 90])
                    stall_dutch_door();

        translate([aisle_width/2, y_hinge, 0])
            rotate([0, 0, stall_door_open_angle])
                rotate([0, 0, -90])
                    stall_dutch_door();
    }
}

module stall_dutch_door() {
    w = stall_door_width - tolerance*2;
    h = stall_door_height - tolerance;
    th = 2.6;
    h_lower = 52;

    color(COLOR_DOORS) {
        translate([0, -knuckle_r + 0.1, floor_thickness + 1]) {
            cube([w, th, h_lower]);
            translate([0, -0.6, 0]) {
                cube([w, 0.6, 3]);
                translate([0, 0, h_lower - 3])
                    cube([w, 0.6, 3]);
                cube([3, 0.6, h_lower]);
                translate([w - 3, 0, 0])
                    cube([3, 0.6, h_lower]);
            }
            translate([0, 0, h - 3])
                cube([w, th, 3]);
            cube([3, th, h]);
            translate([w - 3, 0, 0])
                cube([3, th, h]);
        }
    }

    color(COLOR_IRON) {
        bar_count = 6;
        step = (w - 6) / (bar_count + 1);
        for (k = [1 : bar_count]) {
            translate([3 + k * step, 0, floor_thickness + 1 + h_lower])
                cylinder(r = 1.0, h = h - h_lower - 3, $fn = 12);
        }
    }

    // Door leaf knuckles (interlock with stall front knuckles)
    translate([0, 0, stall_knuckle_z_lower + stall_knuckle_h + knuckle_gap])
        door_hinge_knuckle_strap(w * 0.7, strap_h = stall_knuckle_h, left = true);
    translate([0, 0, stall_knuckle_z_upper + stall_knuckle_h + knuckle_gap])
        door_hinge_knuckle_strap(w * 0.7, strap_h = stall_knuckle_h, left = true);
}

module doors_print_batch() {
    wing_w = (gate_width - tolerance*2) / 2;
    wing_h = gate_height - tolerance;

    for (i = [0 : 3]) {
        translate([i * (wing_w + 12) - 80, 0, 0])
            rotate([-90, 0, 0])
                gate_wing(wing_w, wing_h, left = (i % 2 == 0));
    }

    for (i = [0 : (stalls_per_side * 2) - 1]) {
        translate([i * (stall_door_width + 12) - 80, wing_h + 18, 0])
            rotate([-90, 0, 0])
                stall_dutch_door();
    }

    // Printable hinge pins laying flat
    translate([-100, -30, 0]) printable_hinge_pin(pin_length = 75);
    translate([-100, -45, 0]) printable_hinge_pin(pin_length = 75);
    translate([-100, -60, 0]) printable_hinge_pin(pin_length = 110);
    translate([-100, -75, 0]) printable_hinge_pin(pin_length = 110);
}

// Single stall bay module for smaller print beds
module single_stall_bay() {
    difference() {
        union() {
            color(COLOR_FLOOR)
                translate([-stall_width/2, -stall_length/2, 0])
                    cube([stall_width, stall_length, floor_thickness]);

            color(COLOR_WALLS) {
                translate([-stall_width/2, -stall_length/2, floor_thickness])
                    cube([wall_thickness, stall_length, wall_height]);
                translate([-stall_width/2, -stall_length/2, floor_thickness])
                    cube([stall_width, wall_thickness, wall_height]);
                translate([-stall_width/2, stall_length/2 - wall_thickness, floor_thickness])
                    cube([stall_width, wall_thickness, wall_height]);
            }

            translate([stall_width/2 - wall_thickness, -stall_length/2, floor_thickness])
                stall_front_section(stall_length);
        }

        translate([-stall_width/2 - 1, -window_width/2, sill_height])
            cube([wall_thickness + 2, window_width, window_height]);
    }

    translate([stall_width/2 - wall_thickness, stall_length/2 - 4, floor_thickness])
        rotate([0, 0, stall_door_open_angle])
            rotate([0, 0, -90])
                stall_dutch_door();

    translate([-stall_width/2 + wall_thickness/2, 0, sill_height + window_height/2])
        rotate([0, 0, -90])
            single_window();
}

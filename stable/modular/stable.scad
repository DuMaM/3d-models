// =====================================================================
// MODULAR HORSE STABLE SYSTEM (1:24 Scale - Schleich Compatible)
// Optimized for QIDI Q1 Pro 3D Printer (Build Volume: 245 x 245 x 240 mm)
// License: MIT
// Author: Bartosz Nowak (2026)
//
// Key Features:
// 1. MODULAR EXTENSIBILITY: Chained bay segments using dovetail joints.
//    - 1 bay segment = 2 stalls (left & right) + central aisle section.
//    - Change `segment_count` in Customizer to expand (2, 4, 6, 8+ stalls).
// 2. 100% QIDI Q1 PRO COMPATIBLE (245 x 245 mm):
//    - Every single part is under 200 mm, fitting comfortably on the bed.
//    - Large gable walls split into side pillars, doorway portal, and roof triangle halves.
//    - Roof slopes print completely flat with ZERO supports.
// 3. MULTI-COLOR PRINTING WITHOUT AMS/MMU:
//    - Organized into color batches for printing with different filament spools:
//      * STALLS & INTERIOR: Brown wood filament
//      * EXTERIOR WALLS: White/Cream filament
//      * FLOOR TILES: Gray concrete/stone filament
//      * ROOF SLOPES: Terracotta/Red tile filament
//      * DOORS, WINDOWS, HARDWARE: Black/Anthracite filament
// 4. FUNCTIONAL PINTLE & STRAP HINGES:
//    - Walls feature vertical pintle pins.
//    - Doors feature straps with eyelet barrels that slide directly onto the pins.
// =====================================================================

/* [Stable Expansion Settings] */
// Number of modular bay segments (1 segment = 2 stalls, 2 = 4 stalls, 3 = 6 stalls...)
segment_count = 2; // [1:6]

// Display View / Build Plate Selection
view = "all"; // [all:Complete Stable with Horses, no_roof:Interior View (No Roof), exploded_segment:Exploded Segment Assembly, qidi_bed_stalls:QIDI Bed: Stall Partitions (Brown), qidi_bed_floor:QIDI Bed: Floor Tiles (Gray), qidi_bed_side_wall:QIDI Bed: Side Wall Panel (White), qidi_bed_gable:QIDI Bed: Gable Wall Sections (White), qidi_bed_roof:QIDI Bed: Roof Slopes (Red/Terracotta), qidi_bed_doors_windows:QIDI Bed: Gates, Doors & Windows (Accent), wall_side_panel:Single Side Wall Panel, stall_partition:Single Stall Partition, stall_front_panel:Single Stall Front Panel, floor_stall_tile:Single Stall Floor Tile, floor_aisle_tile:Single Aisle Floor Tile, gable_side_pillar:Single Gable Side Pillar, gable_doorway_portal:Single Gable Doorway Portal, gable_triangle_half:Half Gable Roof Triangle, roof_slope_panel:Single Roof Slope Panel, roof_truss_half:Half Roof Truss, main_gate_wing:Single Main Gate Wing, stall_door:Single Stall Door, window_frame:Single Window Frame]

// Show QIDI Q1 Pro build plate wireframe (245 x 245 mm)
show_qidi_bed = false;

// Show horse models for scale verification
show_horses = true;

// Exploded view separation distance [mm]
explosion = 45; // [20:5:100]

// Main barn gate opening angle [degrees]
gate_open_angle = 35; // [0:5:120]

// Stall door opening angle [degrees]
stall_door_open_angle = 25; // [0:5:90]

/* [Main Dimensions (Calibrated for 150mm tall x 171mm long horse)] */
stall_length = 200;          // Length of 1 stall bay in Y axis (horse is 171 mm -> 29 mm clearance)
stall_width = 140;           // Width of 1 stall in X axis (horse is 50 mm -> 90 mm clearance)
aisle_width = 95;            // Width of central aisle in X axis
wall_height = 170;           // Wall height to eaves (horse is 150 mm -> wall is 20 mm taller than ears)
roof_pitch_height = 75;      // Height of roof ridge above eaves (total interior height: 245 mm)
wall_thickness = 4.0;        // Structural wall thickness
floor_thickness = 4.0;       // Floor tile thickness
groove_depth = 1.8;          // Depth of floor guide groove for walls

/* [Openings & Doorways] */
gate_width = 85;             // Main entrance gate opening width
gate_height = 162;           // Main gate opening height (12 mm clean clearance over horse's ears)
stall_door_width = 75;       // Stall door opening width
stall_door_height = 105;     // Stall door height
window_width = 56;           // Stall window width
window_height = 48;          // Stall window height
sill_height = 85;            // Window sill height from floor

/* [Dovetail Joint Dimensions] */
dovetail_base = 14.0;        // Narrow base width of dovetail [mm]
dovetail_tip = 20.0;         // Wide tip width of dovetail [mm]
dovetail_length = 8.0;       // Dovetail projection [mm]
dovetail_clearance = 0.35;   // 3D printing fit clearance [mm]

/* [Hinge Dimensions (Pintle & Strap)] */
pintle_pin_r = 1.3;          // Radius of wall pin (2.6 mm diameter)
pintle_pin_h = 7.0;          // Height of wall pin
barrel_outer_r = 2.8;        // Outer radius of door eyelet barrel (5.6 mm diameter)
barrel_inner_r = 1.65;       // Inner radius of eyelet (3.3 mm diameter, 0.35 mm radial clearance)
barrel_h = 5.5;              // Height of door barrel

/* [3D Printing & Tolerances] */
tolerance = 0.45;            // General assembly fit clearance [mm]
roof_overhang = 10;          // Eaves overhang beyond exterior walls

// QIDI Q1 Pro bed dimensions
QIDI_X = 245;
QIDI_Y = 245;
QIDI_Z = 240;

$fn = 24;

// Calculated global dimensions
total_width = 2 * stall_width + aisle_width + 2 * wall_thickness;
total_length = segment_count * stall_length + 2 * wall_thickness;
roof_angle = atan(roof_pitch_height / (total_width / 2));

// Hinge axis coordinates
gate_hinge_x = gate_width / 2 - barrel_outer_r * 0.7;
gate_hinge_z_lower = floor_thickness + 20;
gate_hinge_z_upper = floor_thickness + 110;
stall_hinge_z_lower = floor_thickness + 16;
stall_hinge_z_upper = floor_thickness + 66;

// Visualization Palette
COLOR_WALLS      = [0.90, 0.88, 0.82]; // Light cream / stucco
COLOR_FLOOR      = [0.55, 0.53, 0.50]; // Gray concrete
COLOR_ROOF       = [0.72, 0.25, 0.18]; // Terracotta / ceramic red
COLOR_TIMBER     = [0.42, 0.26, 0.15]; // Brown timber & stalls
COLOR_IRON       = [0.20, 0.20, 0.22]; // Anthracite iron / bars
COLOR_DOORS      = [0.48, 0.28, 0.15]; // Darker wood for doors
COLOR_WINDOWS    = [0.24, 0.24, 0.26]; // Charcoal / dark iron accent frames
COLOR_HORSE_1    = [0.35, 0.20, 0.10]; // Bay horse
COLOR_HORSE_2    = [0.88, 0.88, 0.85]; // Gray horse

// Optional path to external horse STL file (leave empty to use built-in dummy mannequin)
horse_stl_path = "/home/bnowak/Pobrane/horse+ready_stls (2)/obj_1_horse ready.stl_A.stl";

// =====================================================================
// MAIN VIEW DISPATCH
// =====================================================================
if (view == "all") {
    stable_complete(with_roof = true);
    if (show_horses) place_horses();
    if (show_qidi_bed) qidi_build_bed();
}
else if (view == "no_roof") {
    stable_complete(with_roof = false);
    if (show_horses) place_horses();
    if (show_qidi_bed) qidi_build_bed();
}
else if (view == "exploded_segment") {
    exploded_segment_view();
    if (show_horses) {
        translate([aisle_width/2 + stall_width/2, stall_length/2, floor_thickness])
            horse_model(horse_color = COLOR_HORSE_1);
    }
}

// --- QIDI Q1 PRO PRINT PLATES (By Filament Color) ---
else if (view == "qidi_bed_stalls") {
    // BROWN TIMBER FILAMENT: Stall front + partition laying completely flat (fits on 245x245)
    qidi_build_bed();
    // Stall front: 200 mm long, 110 mm tall, 3 mm thick -> lay flat along Y
    translate([-110, -stall_length/2, 3.0])
        rotate([0, 90, 0])
            stall_front_panel(left = true);

    // Stall partition: 140 mm wide, 110 mm tall, 3 mm thick -> lay flat rotated 90 deg
    translate([5, -stall_width/2, 3.0])
        rotate([90, 0, 90])
            stall_partition_panel();
}
else if (view == "qidi_bed_floor") {
    // GRAY CONCRETE FILAMENT: Stall floor (140x200) + Aisle floor (95x200) (combined 235x200 mm <= 245)
    qidi_build_bed();
    translate([-QIDI_X/2 + 5, -QIDI_Y/2 + 22, 0]) {
        floor_stall_tile(left = true);
        translate([stall_width + 2, 0, 0])
            floor_aisle_tile();
    }
}
else if (view == "qidi_bed_side_wall") {
    // WHITE/CREAM FILAMENT: Side wall panel with window (200 x 170 mm, fits on 245x245)
    qidi_build_bed();
    translate([-wall_height/2, -stall_length/2, wall_thickness])
        rotate([0, 90, 0])
            wall_side_panel();
}
else if (view == "qidi_bed_gable") {
    // WHITE/CREAM FILAMENT: Gable side pillars (144x170) + doorway portal (95x170)
    qidi_build_bed();
    translate([-120, -wall_height/2, wall_thickness])
        rotate([-90, 0, 0])
            gable_side_pillar(left = true);
    translate([26, -wall_height/2, wall_thickness])
        rotate([-90, 0, 0])
            gable_doorway_portal();
}
else if (view == "qidi_bed_roof") {
    // RED TERRACOTTA FILAMENT: Roof slope (200 x 200 mm flat, 0 supports) + ridge beam
    qidi_build_bed();
    translate([-QIDI_X/2 + 15, -QIDI_Y/2 + 20, 0]) {
        roof_slope_panel();
        translate([210, 0, 4.0])
            rotate([-90, 0, 0])
                cylinder(r = 4.0, h = stall_length, $fn = 8);
    }
}
else if (view == "qidi_bed_doors_windows") {
    // ACCENT / BLACK FILAMENT: Gates, doors, windows and hinges
    qidi_build_bed();
    translate([-110, -75, 0]) {
        rotate([-90, 0, 0]) main_gate_wing(gate_hinge_x, gate_height - tolerance, left = true);
        translate([48, 0, 0])
            rotate([-90, 0, 0]) main_gate_wing(gate_hinge_x, gate_height - tolerance, left = false);
        translate([98, 0, 0])
            rotate([-90, 0, 0]) stall_dutch_door();
        translate([190, 30, 0]) rotate([90, 0, 0]) single_window();
        translate([190, 105, 0]) rotate([90, 0, 0]) single_window();
    }
}
else if (view == "dovetail_detail") {
    floor_stall_tile(left = true);
    translate([stall_width + 16, 0, 0])
        floor_aisle_tile();
}

// --- SINGLE PARTS (For STL Export to QIDI Slicer) ---
else if (view == "wall_side_panel") {
    rotate([90, 0, 0]) wall_side_panel();
}
else if (view == "stall_partition") {
    rotate([90, 0, 0]) stall_partition_panel();
}
else if (view == "stall_front_panel") {
    rotate([90, 0, 0]) stall_front_panel(left = true);
}
else if (view == "floor_stall_tile") {
    floor_stall_tile(left = true);
}
else if (view == "floor_aisle_tile") {
    floor_aisle_tile();
}
else if (view == "gable_side_pillar") {
    rotate([90, 0, 0]) gable_side_pillar(left = true);
}
else if (view == "gable_doorway_portal") {
    rotate([90, 0, 0]) gable_doorway_portal();
}
else if (view == "gable_triangle_half") {
    rotate([90, 0, 0]) gable_triangle_half(left = true);
}
else if (view == "roof_slope_panel") {
    roof_slope_panel();
}
else if (view == "roof_truss_half") {
    rotate([90, 0, 0]) roof_truss_half(left = true);
}
else if (view == "main_gate_wing") {
    rotate([-90, 0, 0]) main_gate_wing(gate_hinge_x, gate_height - tolerance, left = true);
}
else if (view == "stall_door") {
    rotate([-90, 0, 0]) stall_dutch_door();
}
else if (view == "window_frame") {
    rotate([90, 0, 0]) single_window();
}

// =====================================================================
// QIDI Q1 PRO BUILD ENVELOPE (245 x 245 x 240 mm)
// =====================================================================
module qidi_build_bed() {
    color([0.2, 0.6, 0.9, 0.15]) {
        translate([-QIDI_X/2, -QIDI_Y/2, 0])
            cube([QIDI_X, QIDI_Y, 2.0]);
    }
    color([0.1, 0.4, 0.8, 0.8]) {
        translate([-QIDI_X/2, -QIDI_Y/2, 0]) {
            difference() {
                cube([QIDI_X, QIDI_Y, 2.2]);
                translate([2, 2, -1])
                    cube([QIDI_X - 4, QIDI_Y - 4, 5]);
            }
        }
    }
}

// =====================================================================
// COMPLETE STABLE ASSEMBLY
// =====================================================================
module stable_complete(with_roof = true) {
    for (s = [0 : segment_count - 1]) {
        y_seg = s * stall_length;
        translate([0, y_seg, 0]) {
            stable_segment_assembled(index = s);
            if (with_roof) {
                translate([0, 0, wall_height + floor_thickness])
                    roof_segment();
            }
        }
    }

    // Front gable wall (split into parts for 3D printing)
    gable_wall_assembled(front = true);

    // Rear gable wall
    gable_wall_assembled(front = false);

    // Rear stall partitions
    translate([0, segment_count * stall_length, 0]) {
        translate([-aisle_width/2 - stall_width, 0, floor_thickness - groove_depth])
            stall_partition_panel();
        translate([aisle_width/2, 0, floor_thickness - groove_depth])
            stall_partition_panel();
    }
}

// Single assembled bay segment (2 stalls + aisle)
module stable_segment_assembled(index = 0) {
    // Floor tiles
    translate([-aisle_width/2 - stall_width, 0, 0])
        floor_stall_tile(left = true);
    translate([-aisle_width/2, 0, 0])
        floor_aisle_tile();
    translate([aisle_width/2, 0, 0])
        floor_stall_tile(left = false);

    // Exterior side walls
    translate([-aisle_width/2 - stall_width, 0, floor_thickness - groove_depth])
        wall_side_panel();
    translate([aisle_width/2 + stall_width - wall_thickness, 0, floor_thickness - groove_depth])
        wall_side_panel();

    // Windows
    translate([-aisle_width/2 - stall_width + wall_thickness/2, stall_length/2, sill_height + window_height/2])
        rotate([0, 0, -90]) single_window();
    translate([aisle_width/2 + stall_width - wall_thickness/2, stall_length/2, sill_height + window_height/2])
        rotate([0, 0, 90]) single_window();

    // Partitions
    translate([-aisle_width/2 - stall_width, 0, floor_thickness - groove_depth])
        stall_partition_panel();
    translate([aisle_width/2, 0, floor_thickness - groove_depth])
        stall_partition_panel();

    // Stall aisle front walls
    translate([-aisle_width/2, 0, floor_thickness - groove_depth])
        stall_front_panel(left = true);
    translate([aisle_width/2 - wall_thickness, 0, floor_thickness - groove_depth])
        stall_front_panel(left = false);

    // Stall Dutch doors
    y_hinge = stall_length - 4;
    translate([-aisle_width/2, y_hinge, 0])
        rotate([0, 0, -stall_door_open_angle])
            rotate([0, 0, 90])
                stall_dutch_door();

    translate([aisle_width/2, y_hinge, 0])
        rotate([0, 0, stall_door_open_angle])
            rotate([0, 0, -90])
                stall_dutch_door();
}

// =====================================================================
// GABLE WALL SYSTEM (Split into 245x245 mm Bed-Compatible Sections)
// =====================================================================
module gable_wall_assembled(front = true) {
    y_pos = front ? -wall_thickness : (segment_count * stall_length);
    dir = front ? -1 : 1;

    translate([0, y_pos, 0]) {
        // 1. Left side pillar (width: 144 mm, height: 170 mm -> FITS QIDI!)
        translate([-total_width/2, 0, 0])
            gable_side_pillar(left = true);

        // 2. Central doorway portal (width: 95 mm, height: 170 mm -> FITS QIDI!)
        translate([-aisle_width/2, 0, 0])
            gable_doorway_portal(dir_y = dir);

        // 3. Right side pillar (width: 144 mm, height: 170 mm -> FITS QIDI!)
        translate([aisle_width/2, 0, 0])
            gable_side_pillar(left = false);

        // 4. Roof gable triangle (split into two 192 mm halves -> FITS QIDI!)
        translate([0, 0, wall_height + floor_thickness]) {
            gable_triangle_half(left = true);
            gable_triangle_half(left = false);
        }

        // 5. Gate wings
        wing_w = gate_hinge_x;
        wing_h = gate_height - tolerance;
        gate_y = dir < 0 ? -barrel_outer_r - 0.5 : wall_thickness + barrel_outer_r + 0.5;

        if (front) {
            translate([-gate_hinge_x, gate_y, 0])
                rotate([0, 0, -gate_open_angle])
                    main_gate_wing(wing_w, wing_h, left = true);

            translate([gate_hinge_x, gate_y, 0])
                rotate([0, 0, gate_open_angle])
                    main_gate_wing(wing_w, wing_h, left = false);
        } else {
            translate([gate_hinge_x, gate_y, 0])
                rotate([0, 0, 180 - gate_open_angle])
                    main_gate_wing(wing_w, wing_h, left = true);

            translate([-gate_hinge_x, gate_y, 0])
                rotate([0, 0, 180 + gate_open_angle])
                    main_gate_wing(wing_w, wing_h, left = false);
        }
    }
}

// Side pillar of gable wall (144 x 170 mm)
module gable_side_pillar(left = true) {
    pillar_w = stall_width + wall_thickness;
    color(COLOR_WALLS) {
        difference() {
            union() {
                translate([0, 0, floor_thickness])
                    cube([pillar_w, wall_thickness, wall_height]);
                // Bottom alignment tongue into floor
                translate([0, 0.4, floor_thickness - groove_depth])
                    cube([pillar_w, wall_thickness - 0.8, groove_depth + 0.1]);

                // Interlocking tongue to portal
                if (left) {
                    translate([pillar_w, 0.8, floor_thickness])
                        cube([3.0, wall_thickness - 1.6, wall_height]);
                }
            }
            if (!left) {
                // Interlocking groove from portal
                translate([-0.5, 0.5, floor_thickness - 1])
                    cube([3.5, wall_thickness - 1.0, wall_height + 2]);
            }
        }
    }
}

// Central doorway portal with lintel and hinge pins (95 x 170 mm)
module gable_doorway_portal(dir_y = -1) {
    color(COLOR_WALLS) {
        difference() {
            union() {
                translate([0, 0, floor_thickness])
                    cube([aisle_width, wall_thickness, wall_height]);

                translate([0, 0.4, floor_thickness - groove_depth])
                    cube([aisle_width, wall_thickness - 0.8, groove_depth + 0.1]);

                translate([aisle_width, 0.8, floor_thickness])
                    cube([3.0, wall_thickness - 1.6, wall_height]);
            }

            // Doorway cutout
            translate([(aisle_width - gate_width)/2, -1, floor_thickness])
                cube([gate_width, wall_thickness + 2, gate_height + 1]);

            translate([-0.5, 0.5, floor_thickness - 1])
                cube([3.5, wall_thickness - 1.0, wall_height + 2]);
        }

        // Hinge pins
        x_l = (aisle_width - gate_width)/2 + barrel_outer_r * 0.7;
        x_r = (aisle_width + gate_width)/2 - barrel_outer_r * 0.7;

        for (z = [gate_hinge_z_lower, gate_hinge_z_upper]) {
            translate([x_l, dir_y < 0 ? 0 : wall_thickness, z])
                pintle_gate_bracket(dir_x = -1, dir_y = dir_y);
            translate([x_r, dir_y < 0 ? 0 : wall_thickness, z])
                pintle_gate_bracket(dir_x = 1, dir_y = dir_y);
        }
    }
}

// Half of gable roof triangle (width: 192 mm, height: 75 mm -> FITS QIDI!)
module gable_triangle_half(left = true) {
    half_base = total_width / 2;
    color(COLOR_WALLS) {
        difference() {
            union() {
                rotate([90, 0, 0])
                    linear_extrude(height = wall_thickness)
                        polygon(points = [
                            [left ? -half_base : 0, 0],
                            [left ? 0 : half_base, 0],
                            [0, roof_pitch_height]
                        ]);

                if (left) {
                    translate([-2.5, -wall_thickness + 0.8, 10])
                        cube([2.5, wall_thickness - 1.6, roof_pitch_height - 20]);
                }
            }
            if (!left) {
                translate([-0.5, -wall_thickness + 0.5, 9])
                    cube([3.0, wall_thickness - 1.0, roof_pitch_height - 18]);
            }
        }
    }
}

// =====================================================================
// MODULAR FLOOR TILES (Dovetail Joints)
// =====================================================================
module floor_stall_tile(left = true) {
    color(COLOR_FLOOR) {
        difference() {
            union() {
                cube([stall_width, stall_length, floor_thickness]);

                // Dovetail tabs in Y direction
                translate([stall_width * 0.3, stall_length, 0])
                    dovetail_tab();
                translate([stall_width * 0.7, stall_length, 0])
                    dovetail_tab();

                // Dovetail tabs toward central aisle
                if (left) {
                    translate([stall_width, stall_length * 0.25, 0])
                        rotate([0, 0, -90])
                            dovetail_tab();
                    translate([stall_width, stall_length * 0.75, 0])
                        rotate([0, 0, -90])
                            dovetail_tab();
                }
            }

            // Female dovetail pockets in -Y
            translate([stall_width * 0.3, 0, -0.1])
                dovetail_pocket();
            translate([stall_width * 0.7, 0, -0.1])
                dovetail_pocket();

            if (!left) {
                translate([0, stall_length * 0.25, -0.1])
                    rotate([0, 0, 90])
                        dovetail_pocket();
                translate([0, stall_length * 0.75, -0.1])
                    rotate([0, 0, 90])
                        dovetail_pocket();
            }

            // Wall guide grooves
            x_outer = left ? 0 : stall_width - wall_thickness;
            translate([x_outer - 0.2, -1, floor_thickness - groove_depth])
                cube([wall_thickness + 0.4, stall_length + 2, groove_depth + 0.5]);

            translate([-1, -0.2, floor_thickness - groove_depth])
                cube([stall_width + 2, wall_thickness + 0.4, groove_depth + 0.5]);

            x_front = left ? stall_width - wall_thickness : 0;
            translate([x_front - 0.2, -1, floor_thickness - groove_depth])
                cube([wall_thickness + 0.4, stall_length + 2, groove_depth + 0.5]);
        }
    }
}

module floor_aisle_tile() {
    color(COLOR_FLOOR * 0.95) {
        difference() {
            union() {
                cube([aisle_width, stall_length, floor_thickness]);

                // Dovetail tab in Y direction
                translate([aisle_width/2, stall_length, 0])
                    dovetail_tab();

                // Dovetail tabs toward right stall (+X)
                translate([aisle_width, stall_length * 0.25, 0])
                    rotate([0, 0, -90])
                        dovetail_tab();
                translate([aisle_width, stall_length * 0.75, 0])
                    rotate([0, 0, -90])
                        dovetail_tab();
            }

            translate([aisle_width/2, 0, -0.1])
                dovetail_pocket();

            // Pockets from left stall (-X)
            translate([0, stall_length * 0.25, -0.1])
                rotate([0, 0, 90])
                    dovetail_pocket();
            translate([0, stall_length * 0.75, -0.1])
                rotate([0, 0, 90])
                    dovetail_pocket();
        }
    }
}

module dovetail_tab() {
    linear_extrude(height = floor_thickness)
        polygon(points = [
            [-dovetail_base/2, 0],
            [-dovetail_tip/2, dovetail_length],
            [dovetail_tip/2, dovetail_length],
            [dovetail_base/2, 0]
        ]);
}

module dovetail_pocket() {
    base_c = dovetail_base + 2 * dovetail_clearance;
    tip_c = dovetail_tip + 2 * dovetail_clearance;
    len_c = dovetail_length + dovetail_clearance;

    linear_extrude(height = floor_thickness + 0.5)
        polygon(points = [
            [-base_c/2, -0.5],
            [-tip_c/2, len_c],
            [tip_c/2, len_c],
            [base_c/2, -0.5]
        ]);
}

// =====================================================================
// STALL PANELS (Walls, Partitions, Fronts)
// =====================================================================
module wall_side_panel() {
    color(COLOR_WALLS) {
        difference() {
            union() {
                cube([wall_thickness, stall_length, wall_height]);
                // Bottom tongue into floor groove
                translate([0.2, 0, -groove_depth])
                    cube([wall_thickness - 0.4, stall_length, groove_depth + 0.1]);
                // Vertical alignment tongue (+Y)
                translate([0.5, stall_length, 0])
                    cube([wall_thickness - 1.0, 3.0, wall_height]);
                // Roof locating tab
                translate([0.5, stall_length/2 - 10, wall_height])
                    cube([wall_thickness - 1.0, 20, 5.0]);
            }
            // Window cutout
            translate([-1, stall_length/2 - window_width/2, sill_height])
                cube([wall_thickness + 2, window_width, window_height]);
            // Vertical groove (-Y)
            translate([-0.5, -0.1, -groove_depth])
                cube([wall_thickness + 1.0, 3.5, wall_height + groove_depth + 1]);
        }
    }
}

module stall_partition_panel() {
    h_solid = 70;
    h_total = 110;
    th = 3.0;

    color(COLOR_TIMBER) {
        union() {
            cube([stall_width, th, h_solid]);
            translate([0, 0.2, -groove_depth])
                cube([stall_width, th - 0.4, groove_depth + 0.1]);

            translate([0, 0, h_solid]) {
                translate([0, 0, h_total - h_solid - 3])
                    cube([stall_width, th, 3]);
                bar_count = floor(stall_width / 10);
                for (p = [1 : bar_count - 1]) {
                    translate([p * (stall_width / bar_count), th/2, 0])
                        cylinder(r = 1.2, h = h_total - h_solid, $fn = 12);
                }
            }
            cube([6, th, h_total]);
            translate([stall_width - 6, 0, 0])
                cube([6, th, h_total]);
        }
    }
}

module stall_front_panel(left = true) {
    h_total = 110;
    th = 3.0;
    h_solid = 65;
    y_hinge = stall_length - 4;

    color(COLOR_TIMBER) {
        difference() {
            union() {
                cube([th, stall_length, h_solid]);
                translate([0.2, 0, -groove_depth])
                    cube([th - 0.4, stall_length, groove_depth + 0.1]);
                translate([0, 0, h_total - 3])
                    cube([th, stall_length, 3]);
                cube([th, 6, h_total]);
                translate([0, stall_length - 6, 0])
                    cube([th, 6, h_total]);

                translate([th/2, 0, h_solid]) {
                    for (y = [6 : 10 : stall_length - stall_door_width - 6]) {
                        translate([0, y, 0])
                            cylinder(r = 1.2, h = h_total - h_solid, $fn = 12);
                    }
                }
            }
            // Stall door opening
            translate([-1, stall_length - stall_door_width - 4, 0])
                cube([th + 2, stall_door_width, stall_door_height + 1]);
        }

        // Hinge pintle brackets on stall post
        translate([th/2, y_hinge, 0]) {
            translate([0, 0, stall_hinge_z_lower]) pintle_stall_bracket();
            translate([0, 0, stall_hinge_z_upper]) pintle_stall_bracket();
        }
    }
}

// =====================================================================
// ROOF SYSTEM (Slopes Print Flat Without Supports)
// =====================================================================
module roof_segment() {
    th = 3.2;
    half_w = total_width / 2;
    slope_l = (half_w + roof_overhang) / cos(roof_angle);

    // Ridge beam with connector pin
    color(COLOR_TIMBER) {
        translate([0, 0, roof_pitch_height - 0.5]) {
            rotate([-90, 0, 0])
                cylinder(r = 4.0, h = stall_length, $fn = 8);
            translate([0, stall_length, 0])
                rotate([-90, 0, 0])
                    cylinder(r = 2.0, h = 8.0, $fn = 12);
        }
    }

    // Slopes
    color(COLOR_ROOF) {
        translate([0, 0, roof_pitch_height])
            rotate([0, -roof_angle, 0])
                translate([-slope_l, 0, -th])
                    roof_slope_panel();

        translate([0, 0, roof_pitch_height])
            rotate([0, roof_angle, 0])
                translate([0, 0, -th])
                    roof_slope_panel();
    }

    // Two-piece roof truss (each half is under 200 mm)
    color(COLOR_TIMBER) {
        translate([0, stall_length/2, 0]) {
            roof_truss_half(left = true);
            roof_truss_half(left = false);
        }
    }
}

// Single roof slope panel (approx 200 x 200 mm - prints 100% flat, 0 supports)
module roof_slope_panel() {
    half_w = total_width / 2;
    slope_l = (half_w + roof_overhang) / cos(roof_angle);
    th = 3.2;

    color(COLOR_ROOF) {
        difference() {
            cube([slope_l, stall_length, th]);
            for (y = [12 : 12 : stall_length - 6]) {
                translate([-1, y, th - 0.8])
                    cube([slope_l + 2, 1.2, 1.5]);
            }
        }
    }
}

// Half-truss with ridge lap joint (width: 192 mm, height: 75 mm -> FITS QIDI!)
module roof_truss_half(left = true) {
    beam_th = 4.0;
    half_w = total_width / 2;

    color(COLOR_TIMBER) {
        rotate([90, 0, 0]) {
            linear_extrude(height = beam_th, center = true) {
                polygon(points = [
                    [left ? -half_w + 1 : 0, 0],
                    [left ? 0 : half_w - 1, 0],
                    [0, roof_pitch_height - 2]
                ]);
            }
        }
    }
}

// =====================================================================
// HARDWARE: HINGES, DOORS AND WINDOWS
// =====================================================================
module pintle_gate_bracket(dir_x = 1, dir_y = -1) {
    color(COLOR_IRON) {
        translate([dir_x > 0 ? 0 : -(wall_thickness + 4), dir_y < 0 ? 0 : -(wall_thickness + 2), 0])
            cube([wall_thickness + 4, wall_thickness + 2, 7.0]);

        cylinder(r = barrel_outer_r + 0.6, h = 3.0, $fn = 24);

        translate([0, 0, 3.0]) {
            cylinder(r = pintle_pin_r, h = pintle_pin_h, $fn = 24);
            translate([0, 0, pintle_pin_h])
                cylinder(r1 = pintle_pin_r, r2 = pintle_pin_r * 0.4, h = 1.6, $fn = 24);
        }
    }
}

module pintle_stall_bracket() {
    color(COLOR_IRON) {
        cylinder(r = barrel_outer_r + 0.5, h = 2.5, $fn = 24);
        translate([0, 0, 2.5]) {
            cylinder(r = pintle_pin_r, h = pintle_pin_h, $fn = 24);
            translate([0, 0, pintle_pin_h])
                cylinder(r1 = pintle_pin_r, r2 = pintle_pin_r * 0.4, h = 1.4, $fn = 24);
        }
        translate([-2, -2, 0])
            cube([4, 4, 2.5]);
    }
}

module hinge_strap(strap_w, left = true) {
    strap_th = 1.3;
    strap_h = barrel_h;

    color(COLOR_IRON) {
        difference() {
            cylinder(r = barrel_outer_r, h = barrel_h, $fn = 24);
            translate([0, 0, -1])
                cylinder(r = barrel_inner_r, h = barrel_h + 2, $fn = 24);
        }

        if (left) {
            translate([0, -barrel_outer_r + 0.1, 0])
                cube([strap_w, strap_th, strap_h]);
            for (nx = [10, 24, 38]) {
                if (nx < strap_w - 4) {
                    translate([nx, -barrel_outer_r - 0.2, strap_h/2])
                        rotate([-90, 0, 0])
                            cylinder(r = 1.1, h = 0.8, $fn = 12);
                }
            }
        } else {
            translate([-strap_w, -barrel_outer_r + 0.1, 0])
                cube([strap_w, strap_th, strap_h]);
            for (nx = [10, 24, 38]) {
                if (nx < strap_w - 4) {
                    translate([-nx, -barrel_outer_r - 0.2, strap_h/2])
                        rotate([-90, 0, 0])
                            cylinder(r = 1.1, h = 0.8, $fn = 12);
                }
            }
        }
    }
}

module main_gate_wing(w, h, left = true) {
    th = 2.8;
    color(COLOR_DOORS) {
        if (left) {
            translate([0, -barrel_outer_r + 0.2, floor_thickness + 1]) {
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

                    diag_angle = atan(h / w);
                    diag_len = sqrt(w*w + h*h);
                    rotate([0, -diag_angle, 0])
                        cube([diag_len, 0.8, 4]);
                }
            }
        } else {
            translate([-w, -barrel_outer_r + 0.2, floor_thickness + 1]) {
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

                    diag_angle = atan(h / w);
                    diag_len = sqrt(w*w + h*h);
                    translate([w, 0, 0])
                        rotate([0, -180 + diag_angle, 0])
                            cube([diag_len, 0.8, 4]);
                }
            }
        }
    }

    translate([0, 0, gate_hinge_z_lower + 3.0])
        hinge_strap(w * 0.75, left = left);
    translate([0, 0, gate_hinge_z_upper + 3.0])
        hinge_strap(w * 0.75, left = left);
}

module stall_dutch_door() {
    w = stall_door_width - tolerance * 2;
    h = stall_door_height - tolerance;
    th = 2.6;
    h_lower = 60;

    color(COLOR_DOORS) {
        translate([0, -barrel_outer_r + 0.1, floor_thickness + 1]) {
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

    translate([0, 0, stall_hinge_z_lower + 2.5])
        hinge_strap(w * 0.7, left = true);
    translate([0, 0, stall_hinge_z_upper + 2.5])
        hinge_strap(w * 0.7, left = true);
}

module single_window() {
    w = window_width - tolerance * 2;
    h = window_height - tolerance * 2;
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

// =====================================================================
// EXPLODED SEGMENT VIEW (Assembly Diagram)
// =====================================================================
module exploded_segment_view() {
    translate([-aisle_width/2 - stall_width, 0, 0])
        floor_stall_tile(left = true);
    translate([-aisle_width/2, 0, 0])
        floor_aisle_tile();
    translate([aisle_width/2, 0, 0])
        floor_stall_tile(left = false);

    translate([-aisle_width/2 - stall_width - explosion, 0, explosion * 0.4])
        wall_side_panel();
    translate([aisle_width/2 + stall_width - wall_thickness + explosion, 0, explosion * 0.4])
        wall_side_panel();

    translate([-aisle_width/2 - stall_width - explosion*1.6, stall_length/2, sill_height + window_height/2])
        rotate([0, 0, -90]) single_window();
    translate([aisle_width/2 + stall_width + explosion*1.6, stall_length/2, sill_height + window_height/2])
        rotate([0, 0, 90]) single_window();

    translate([-aisle_width/2 - stall_width, -explosion*0.5, explosion * 0.6])
        stall_partition_panel();
    translate([aisle_width/2, -explosion*0.5, explosion * 0.6])
        stall_partition_panel();

    translate([-aisle_width/2 + 10, 0, explosion * 0.5])
        stall_front_panel(left = true);
    translate([aisle_width/2 - wall_thickness - 10, 0, explosion * 0.5])
        stall_front_panel(left = false);

    translate([-aisle_width/2 + 15, stall_length - 4, explosion * 0.5])
        rotate([0, 0, 90]) stall_dutch_door();
    translate([aisle_width/2 - 15, stall_length - 4, explosion * 0.5])
        rotate([0, 0, -90]) stall_dutch_door();

    translate([0, 0, wall_height + floor_thickness + explosion * 1.5])
        roof_segment();
}

// =====================================================================
// HORSE MODEL & PLACEMENT
// =====================================================================
module horse_model(horse_color = COLOR_HORSE_1) {
    color(horse_color) {
        if (horse_stl_path != "") {
            translate([-175, -160, 0])
                import(horse_stl_path);
        } else {
            // Built-in dummy mannequin (approx 171 x 50 x 150 mm)
            translate([0, 0, 85])
                rotate([0, 90, 0])
                    scale([1, 1.25, 2.3])
                        cylinder(r = 22, h = 48, center = true, $fn = 20);
        }
    }
}

module place_horses() {
    translate([-aisle_width/2 - stall_width/2, stall_length * 0.5, floor_thickness])
        rotate([0, 0, -20])
            horse_model(horse_color = COLOR_HORSE_1);

    translate([0, stall_length * 0.3, floor_thickness])
        rotate([0, 0, 0])
            horse_model(horse_color = COLOR_HORSE_2);

    if (segment_count > 1) {
        translate([aisle_width/2 + stall_width/2, stall_length * 1.5, floor_thickness])
            rotate([0, 0, 160])
                horse_model(horse_color = [0.15, 0.14, 0.14]);
    }
}

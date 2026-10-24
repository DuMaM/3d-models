// =====================================================================
// STANDARD MONOLITHIC HORSE STABLE (1:24 Scale - Schleich Compatible)
// Author: Bartosz Nowak (2026)
// Calibrated for 1:24 scale model horses (Schleich, CollectA, Safari Ltd.):
// - Horse dimensions: length ~140-170 mm, height ~115-150 mm, width ~45-50 mm
// =====================================================================

/* [Display View / Part Selection] */
// Select model view or export plate
view = "all"; // [all:Complete Stable with Horses, no_roof:Interior View (No Roof), exploded:Exploded Assembly View, walls:Monolithic Walls & Floor, roof:Complete Assembled Roof, roof_flat:Flat Roof Slopes (0 Supports), windows:Window Frames & Grilles, doors:Barn Gates & Stall Dutch Doors, single_stall:Single Stall Bay]

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

// Wymiary boksu (dostosowane do konia o dł. 140 mm i szer. 45 mm)
stall_length = 160;         // [140:10:220] Długość boksu w osi Y (koń ma 130-150 mm)
stall_width = 130;       // [110:10:180] Szerokość boksu w osi X
aisle_width = 85;    // [70:5:120] Szerokość alei stajennej (swobodny ruch konia)

// Wysokości budynku (koń Schleich ma 105-120 mm wysokości)
wall_height = 140;        // [120:5:180] Wysokość ścian bocznych do okapu
roof_pitch_height = 75;       // [50:5:110] Wysokość trójkątnego szczytu dachu
wall_thickness = 4.0;        // Grubość ścian nośnych
floor_thickness = 2.5;       // Grubość płyty posadzki

/* [Wymiary przejść i otworów Schleich] */
gate_width = 75;         // Szerokość przejścia wrót głównych (koń ma ~45 mm szerokości)
gate_height = 130;         // Wysokość wrót głównych (koń ma ~115 mm wysokości)
stall_door_width = 65;  // Szerokość drzwi do boksu
stall_door_height = 85;   // Wysokość drzwi boksu (dolna połówka bezpieczna)
window_width = 50;         // Szerokość okna
window_height = 42;          // Wysokość okna
sill_height = 70;      // Wysokość parapetu (koń wygląda przez okno z wysokością pyska ~85-110 mm)

/* [Wymiary zawiasów stajennych] */
pintle_pin_r = 1.3;    // Promień czopa/sworznia na ścianie [mm] (średnica 2.6 mm)
pintle_pin_h = 7.0;    // Wysokość czopa zawiasu [mm]
barrel_outer_r = 2.8;          // Zewnętrzny promień tulei na drzwiach [mm] (średnica 5.6 mm)
barrel_inner_r = 1.65;         // Wewnętrzny promień tulei (średnica 3.3 mm, tolerance 0.35 mm pod czop 2.6 mm)
barrel_h = 5.5;       // Wysokość ucha/tulei zawiasowej [mm]

/* [Druk 3D i pasowanie] */
tolerance = 0.45;                  // Luz montażowy elementów [mm]
roof_overhang = 10;             // Okap dachu poza obrys budynku

$fn = 24;

// Wyliczone wymiary całkowite stajni
total_width = 2 * stall_width + aisle_width + 2 * wall_thickness;
total_length = stalls_per_side * stall_length + 2 * wall_thickness;
roof_angle = atan(roof_pitch_height / (total_width/2));

// Paleta barw
COLOR_WALLS      = [0.85, 0.76, 0.63]; // Drewno sosnowe / jasny tynk
COLOR_FLOOR    = [0.60, 0.58, 0.55]; // Płyta posadzkowa
COLOR_ROOF      = [0.70, 0.25, 0.18]; // Dachówka ceramiczna
COLOR_TIMBER      = [0.42, 0.26, 0.15]; // Belki konstrukcyjne
COLOR_IRON       = [0.22, 0.22, 0.24]; // Stal antracyt / kraty
COLOR_DOORS      = [0.52, 0.32, 0.17]; // Ciemne drewno
COLOR_WINDOWS      = [0.96, 0.96, 0.94]; // Kremowo-białe ramy
COLOR_HORSE_1    = [0.35, 0.20, 0.10]; // Gniady koń Schleich
COLOR_HORSE_2    = [0.88, 0.88, 0.85]; // Siwy koń Schleich

// =====================================================================
// DYSPOZYCJA WIDOKÓW
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

    // Dach uniesiony do góry
    translate([0, 0, explosion * 1.6])
        roof_complete();

    // Okna wysunięte w osi X
    translate([-explosion, 0, 0]) windows_left();
    translate([explosion, 0, 0])  windows_right();

    // Wrota wysunięte w osi Y
    translate([0, -explosion, 0]) front_gates();
    translate([0, explosion, 0])  rear_gates();

    stall_doors_all();
    if (show_horses) horses_in_stable();
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
    // Widok pojedynczego boksu (kompaktowy moduł mieszczący się na stole 200x200 mm)
    single_stall_bay();
    if (show_horses) {
        translate([0, 0, floor_thickness])
            model_horse(horse_color = COLOR_HORSE_1);
    }
}

// =====================================================================
// MODEL FIGURKI KONIA SCHLEICH (Dokładne gabaryty: 145 x 45 x 115 mm)
// =====================================================================
module model_horse(horse_color = COLOR_HORSE_1) {
    color(horse_color) {
        // Tułów (owalny korpus)
        translate([0, 0, 68])
            rotate([0, 90, 0])
                scale([1, 1.25, 2.3])
                    cylinder(r = 18, h = 38, center = true, $fn = 20);

        // Klatka piersiowa i zad
        translate([0, -32, 70])
            sphere(r = 21, $fn = 20);
        translate([0, 32, 69])
            sphere(r = 20, $fn = 20);

        // Nogi przednie (lewa i prawa)
        translate([-13, -28, 0]) horse_leg_front();
        translate([13, -28, 0])  horse_leg_front();

        // Nogi tylne (lewa i prawa)
        translate([-13, 30, 0]) horse_leg_rear();
        translate([13, 30, 0])  horse_leg_rear();

        // Szyja wygięta ku górze
        translate([0, -34, 76])
            rotate([-35, 0, 0])
                cylinder(r1 = 14, r2 = 9, h = 42, $fn = 16);

        // Głowa i pysk
        translate([0, -56, 106]) {
            rotate([25, 0, 0]) {
                // Czerep
                sphere(r = 11, $fn = 16);
                // Chrapy / pysk
                translate([0, -14, -4])
                    scale([1, 1.8, 1])
                        sphere(r = 7.5, $fn = 16);
                // Uszy (szczyt na wysokości ~118 mm)
                translate([-6, 2, 9]) rotate([-10, -15, 0]) cylinder(r1=3, r2=0.5, h=10, $fn=10);
                translate([6, 2, 9])  rotate([-10, 15, 0])  cylinder(r1=3, r2=0.5, h=10, $fn=10);
            }
        }

        // Ogon
        translate([0, 42, 66])
            rotate([15, 0, 0])
                cylinder(r1 = 6, r2 = 2, h = 42, $fn = 12);
    }
}

module horse_leg_front() {
    // Udo / bark
    translate([0, 0, 40])
        cylinder(r1 = 5, r2 = 9, h = 25, $fn = 14);
    // Nadpęcie i pęcina
    cylinder(r1 = 4.2, r2 = 5, h = 40, $fn = 14);
    // Kopyto
    color([0.2, 0.18, 0.15])
        cylinder(r1 = 5.5, r2 = 4.2, h = 6, $fn = 14);
}

module horse_leg_rear() {
    // Zad / staw skokowy
    translate([0, -3, 42])
        rotate([-12, 0, 0])
            cylinder(r1 = 5, r2 = 11, h = 26, $fn = 14);
    // Dolna część nogi
    cylinder(r1 = 4.2, r2 = 5, h = 42, $fn = 14);
    // Kopyto
    color([0.2, 0.18, 0.15])
        cylinder(r1 = 5.5, r2 = 4.2, h = 6, $fn = 14);
}

// Konie umieszczone w stajni do demonstracji skali i przestrzeni
module horses_in_stable() {
    // Koń 1: w lewym boksie, swobodnie stojący i wyglądający przez okno lub drzwi
    y_b1 = -total_length/2 + wall_thickness + stall_length/2;
    translate([-aisle_width/2 - stall_width/2, y_b1, floor_thickness])
        rotate([0, 0, -20])
            model_horse(horse_color = COLOR_HORSE_1);

    // Koń 2: w korytarzu środkowym, wchodzący przez główne wrota
    translate([0, -total_length/2 + 35, floor_thickness])
        rotate([0, 0, 0])
            model_horse(horse_color = COLOR_HORSE_2);

    // Jeśli stajnia 4-boksowa, dodaj konia w prawym boksie
    if (stalls_per_side > 1) {
        y_b2 = -total_length/2 + wall_thickness + 1.5 * stall_length;
        translate([aisle_width/2 + stall_width/2, y_b2, floor_thickness])
            rotate([0, 0, 160])
                model_horse(horse_color = [0.15, 0.14, 0.14]); // Kary koń
    }
}

// =====================================================================
// MODUŁ 1: ŚCIANY, POSADZKA I BOKSY
// =====================================================================
module stable_walls_complete() {
    overlap = 0.05;
    difference() {
        union() {
            // Posadzka
            color(COLOR_FLOOR)
                translate([-total_width/2, -total_length/2, 0])
                    cube([total_width, total_length, floor_thickness]);

            // Ściany obwodowe
            color(COLOR_WALLS) {
                // Ściana lewa
                translate([-total_width/2, -total_length/2, floor_thickness - overlap])
                    cube([wall_thickness, total_length, wall_height + overlap]);

                // Ściana prawa
                translate([total_width/2 - wall_thickness, -total_length/2, floor_thickness - overlap])
                    cube([wall_thickness, total_length, wall_height + overlap]);

                // Ściany szczytowe
                sciana_szczytowa(front = true);
                sciana_szczytowa(front = false);
            }

            // Przegrody boksów wewnątrz
            boksy_wewnetrzne();

            // Prowadnice ustalające dach
            zamki_dachu();

            // Wsporniki ścienne zawiasów na wrotach wejściowych (front i tył)
            zawiasy_scienne_wrot();
        }

        // --- OTWORY W ŚCIANACH ---
        // 1. Wrota frontowe (wysokie na 130 mm pod konia o wys. 115 mm)
        translate([-gate_width/2, -total_length/2 - 1, floor_thickness])
            cube([gate_width, wall_thickness + 2, gate_height + 1]);

        // 2. Wrota tylne
        translate([-gate_width/2, total_length/2 - wall_thickness - 1, floor_thickness])
            cube([gate_width, wall_thickness + 2, gate_height + 1]);

        // 3. Okna boksów w ścianach bocznych
        for (i = [0 : stalls_per_side - 1]) {
            y_pos = -total_length/2 + wall_thickness + (i + 0.5) * stall_length;

            // Otwór lewy
            translate([-total_width/2 - 1, y_pos - window_width/2, sill_height])
                cube([wall_thickness + 2, window_width, window_height]);

            // Otwór prawy
            translate([total_width/2 - wall_thickness - 1, y_pos - window_width/2, sill_height])
                cube([wall_thickness + 2, window_width, window_height]);
        }
    }
}

// Ściana szczytowa
module sciana_szczytowa(front = true) {
    overlap = 0.05;
    y_pos = front ? -total_length/2 : (total_length/2 - wall_thickness);
    translate([0, y_pos, floor_thickness - overlap]) {
        // Prostokątna ściana dolna
        translate([-total_width/2, 0, 0])
            cube([total_width, wall_thickness, wall_height + overlap]);

        // Trójkąt szczytowy
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

// Przegrody i fronty boksów
module boksy_wewnetrzne() {
    color(COLOR_TIMBER) {
        // Ściany działowe poprzeczne (jeśli >1 boks na stronę)
        if (stalls_per_side > 1) {
            for (i = [1 : stalls_per_side - 1]) {
                y_pos = -total_length/2 + wall_thickness + i * stall_length;

                // Lewa przegroda
                translate([-total_width/2 + wall_thickness, y_pos - wall_thickness/2, floor_thickness])
                    przegroda_miedzyboksowa(stall_width);

                // Prawa przegroda
                translate([aisle_width/2, y_pos - wall_thickness/2, floor_thickness])
                    przegroda_miedzyboksowa(stall_width);
            }
        }

        // Ścianki oddzielające boksy od korytarza środkowego
        for (i = [0 : stalls_per_side - 1]) {
            y_start = -total_length/2 + wall_thickness + i * stall_length;

            // Lewy front boksu
            translate([-aisle_width/2 - wall_thickness, y_start, floor_thickness])
                front_boksu(stall_length);

            // Prawy front boksu
            translate([aisle_width/2, y_start, floor_thickness])
                front_boksu(stall_length);
        }
    }
}

// Przegroda między boksami (bezpieczna dla koni Schleich)
module przegroda_miedzyboksowa(dl) {
    h_pelna = 60;      // Drewniana deska do wysokości brzucha konia
    h_calkowita = 95;  // Całkowita wysokość przegrody z kratą
    gr = 3.0;

    cube([dl, gr, h_pelna]);
    translate([0, 0, h_pelna]) {
        translate([0, 0, h_calkowita - h_pelna - 3])
            cube([dl, gr, 3]);
        liczba_pretow = floor(dl / 10);
        for (p = [1 : liczba_pretow - 1]) {
            translate([p * (dl / liczba_pretow), gr/2, 0])
                cylinder(r = 1.2, h = h_calkowita - h_pelna, $fn = 12);
        }
    }
}

// =====================================================================
// ELEMENTY MECHANICZNE ZAWIASÓW STAJENNYCH (Pintle & Strap Hinges)
// =====================================================================

// Pozycje osi obrotu zawiasów wrót głównych
x_zawias_wrot = gate_width/2 - barrel_outer_r * 0.7;
y_zawias_front = -total_length/2 - barrel_outer_r - 0.5;
y_zawias_tyl   =  total_length/2 + barrel_outer_r + 0.5;
z_zawias_dolny_wrot = floor_thickness + 20;
z_zawias_gorny_wrot = floor_thickness + 105;

// Pozycje zawiasów drzwi do boksów
z_zawias_dolny_boksu = floor_thickness + 16;
z_zawias_gorny_boksu = floor_thickness + 66;

// Wspornik ścienny ze sworzniem pionowym (Wall Pintle Bracket)
// Położenie [0,0,0] to oś pionowa sworznia
module wspornik_zawiasu_wrot(kierunek_x = 1, zwrot_y = -1) {
    color(COLOR_IRON) {
        // Ramię mocujące do ościeżnicy / ściany
        translate([kierunek_x > 0 ? 0 : -(wall_thickness + 4), zwrot_y < 0 ? 0 : -(wall_thickness + 2), 0])
            cube([wall_thickness + 4, wall_thickness + 2, 7.0]);

        // Półka nośna (kołnierz oporowy)
        cylinder(r = barrel_outer_r + 0.6, h = 3.0, $fn = 24);

        // Pionowy sworzeń / czop stalowy
        translate([0, 0, 3.0]) {
            cylinder(r = pintle_pin_r, h = pintle_pin_h, $fn = 24);
            // Stożek wprowadzający na szczycie sworznia
            translate([0, 0, pintle_pin_h])
                cylinder(r1 = pintle_pin_r, r2 = pintle_pin_r * 0.4, h = 1.6, $fn = 24);
        }
    }
}

// Wspornik zawiasowy na słupku boksu stajennego
module wspornik_zawiasu_boksu() {
    color(COLOR_IRON) {
        // Półka wystająca ze słupka
        cylinder(r = barrel_outer_r + 0.5, h = 2.5, $fn = 24);
        // Sworzeń pionowy
        translate([0, 0, 2.5]) {
            cylinder(r = pintle_pin_r, h = pintle_pin_h, $fn = 24);
            translate([0, 0, pintle_pin_h])
                cylinder(r1 = pintle_pin_r, r2 = pintle_pin_r * 0.4, h = 1.4, $fn = 24);
        }
        // Kotew w słupek
        translate([-2, -2, 0])
            cube([4, 4, 2.5]);
    }
}

// Pas zawiasowy montowany na skrzydle drzwi (z tuleją obrotową)
// Położenie [0,0,0] to oś tulei nasuwanej na sworzeń
module pas_zawiasowy_skrzydla(szer_pasa, lewe = true) {
    gr_pasa = 1.3;
    wys_pasa = barrel_h;

    color(COLOR_IRON) {
        difference() {
            // Tuleja / ucho zawiasowe nasuwane od góry na sworzeń ścienny
            cylinder(r = barrel_outer_r, h = barrel_h, $fn = 24);
            // Przelotowy otwór pod sworzeń ścienny
            translate([0, 0, -1])
                cylinder(r = barrel_inner_r, h = barrel_h + 2, $fn = 24);
        }

        // Płaskownik stalowy mocowany do skrzydła drzwi
        if (lewe) {
            translate([0, -barrel_outer_r + 0.1, 0])
                cube([szer_pasa, gr_pasa, wys_pasa]);
            // Ozdobne kute nity stajenne
            for (nx = [10, 22, 34]) {
                if (nx < szer_pasa - 4) {
                    translate([nx, -barrel_outer_r - 0.2, wys_pasa/2])
                        rotate([-90, 0, 0])
                            cylinder(r = 1.1, h = 0.8, $fn = 12);
                }
            }
        } else {
            translate([-szer_pasa, -barrel_outer_r + 0.1, 0])
                cube([szer_pasa, gr_pasa, wys_pasa]);
            for (nx = [10, 22, 34]) {
                if (nx < szer_pasa - 4) {
                    translate([-nx, -barrel_outer_r - 0.2, wys_pasa/2])
                        rotate([-90, 0, 0])
                            cylinder(r = 1.1, h = 0.8, $fn = 12);
                }
            }
        }
    }
}

// Wsporniki zawiasowe na ościeżnicy wrót stajni
module zawiasy_scienne_wrot() {
    // Wrota frontowe
    for (z = [z_zawias_dolny_wrot, z_zawias_gorny_wrot]) {
        translate([-x_zawias_wrot, y_zawias_front, z])
            wspornik_zawiasu_wrot(kierunek_x = -1, zwrot_y = -1);
        translate([x_zawias_wrot, y_zawias_front, z])
            wspornik_zawiasu_wrot(kierunek_x = 1, zwrot_y = -1);
    }
    // Wrota tylne
    for (z = [z_zawias_dolny_wrot, z_zawias_gorny_wrot]) {
        translate([-x_zawias_wrot, y_zawias_tyl, z])
            wspornik_zawiasu_wrot(kierunek_x = -1, zwrot_y = 1);
        translate([x_zawias_wrot, y_zawias_tyl, z])
            wspornik_zawiasu_wrot(kierunek_x = 1, zwrot_y = 1);
    }
}

// Front boksu od korytarza ze zintegrowanymi czopami zawiasowymi
module front_boksu(dl) {
    h_calkowita = 95;
    gr = 3.0;
    h_pelna = 55;
    y_zawiasu_boksu = dl - 4;

    difference() {
        union() {
            cube([gr, dl, h_pelna]);
            translate([0, 0, h_calkowita - 3])
                cube([gr, dl, 3]);
            cube([gr, 6, h_calkowita]);
            translate([0, dl - 6, 0])
                cube([gr, 6, h_calkowita]);

            // Krata nad częścią stałą
            translate([gr/2, 0, h_pelna]) {
                for (y = [6 : 10 : dl - stall_door_width - 6]) {
                    translate([0, y, 0])
                        cylinder(r = 1.2, h = h_calkowita - h_pelna, $fn = 12);
                }
            }
        }
        // Przejście drzwiowe do boksu
        translate([-1, dl - stall_door_width - 4, 0])
            cube([gr + 2, stall_door_width, stall_door_height + 1]);
    }

    // Sworznie zawiasowe na słupku ościeżnicy boksu
    translate([gr/2, y_zawiasu_boksu, 0]) {
        translate([0, 0, z_zawias_dolny_boksu]) wspornik_zawiasu_boksu();
        translate([0, 0, z_zawias_gorny_boksu]) wspornik_zawiasu_boksu();
    }
}

// Wypusty ustalające pozycję dachu
module zamki_dachu() {
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
// MODUŁ 2: DACH ZDEJMOWANY
// =====================================================================
module roof_complete() {
    roof_thickness = 3.2;
    roof_length = total_length + 2 * roof_overhang;
    half_width = total_width / 2;
    slope_length = (half_width + roof_overhang) / cos(roof_angle);

    translate([0, 0, wall_height + floor_thickness]) {
        // Kalenica
        color(COLOR_TIMBER)
            translate([0, -roof_length/2, roof_pitch_height - 0.5])
                rotate([-90, 0, 0])
                    cylinder(r = 4.0, h = roof_length, $fn = 8);

        // Połacie dachu
        color(COLOR_ROOF) {
            // Połać lewa
            translate([0, 0, roof_pitch_height])
                rotate([0, -roof_angle, 0])
                    translate([-slope_length, -roof_length/2, -roof_thickness])
                        roof_slope_textured(slope_length, roof_length, roof_thickness);

            // Połać prawa
            translate([0, 0, roof_pitch_height])
                rotate([0, roof_angle, 0])
                    translate([0, -roof_length/2, -roof_thickness])
                        roof_slope_textured(slope_length, roof_length, roof_thickness);
        }

        // Krokwie / wiązary
        color(COLOR_TIMBER) {
            krok = total_length / max(1, stalls_per_side);
            for (y = [-total_length/2 + 12 : krok : total_length/2 - 12]) {
                translate([0, y, 0])
                    roof_truss();
            }
        }
    }
}

module roof_slope_textured(szer, dl, gr) {
    difference() {
        cube([szer, dl, gr]);
        for (y = [12 : 12 : dl - 6]) {
            translate([-1, y, gr - 0.8])
                cube([szer + 2, 1.2, 1.5]);
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

// Połacie dachu i kalenica ułożone płasko do druku 3D (0 podpór, czysta powierzchnia)
module roof_flat_slopes() {
    roof_thickness = 3.2;
    roof_length = total_length + 2 * roof_overhang;
    half_width = total_width / 2;
    slope_length = (half_width + roof_overhang) / cos(roof_angle);

    color(COLOR_ROOF) {
        // Połać lewa
        translate([-slope_length - 8, -roof_length/2, 0])
            roof_slope_textured(slope_length, roof_length, roof_thickness);

        // Połać prawa
        translate([8, -roof_length/2, 0])
            roof_slope_textured(slope_length, roof_length, roof_thickness);
    }

    // Kalenica leżąca na stole
    color(COLOR_TIMBER) {
        translate([0, -roof_length/2, 4.0])
            rotate([-90, 0, 0])
                cylinder(r = 4.0, h = roof_length, $fn = 8);
    }
}

// =====================================================================
// MODUŁ 3: OKNA (Kołnierz dociskowy + krata stajenna)
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
                okno_pojedyncze();
    }
}

module windows_right() {
    for (i = [0 : stalls_per_side - 1]) {
        y_pos = -total_length/2 + wall_thickness + (i + 0.5) * stall_length;
        translate([total_width/2 - wall_thickness/2, y_pos, sill_height + window_height/2])
            rotate([0, 0, 90])
                okno_pojedyncze();
    }
}

module okno_pojedyncze() {
    szer = window_width - tolerance*2;
    wys = window_height - tolerance*2;
    gr_ramy = wall_thickness;
    szer_profilu = 3.5;
    gr_kolnierza = 1.4;

    color(COLOR_WINDOWS) {
        difference() {
            union() {
                translate([-szer/2, -gr_ramy/2, -wys/2])
                    cube([szer, gr_ramy, wys]);
                // Kołnierz zewnętrzny
                translate([-(szer + 5)/2, -gr_ramy/2 - gr_kolnierza, -(wys + 5)/2])
                    cube([szer + 5, gr_kolnierza, wys + 5]);
            }
            translate([-(szer - 2*szer_profilu)/2, -gr_ramy - 2, -(wys - 2*szer_profilu)/2])
                cube([szer - 2*szer_profilu, gr_ramy*2 + 4, wys - 2*szer_profilu]);
        }
    }

    color(COLOR_IRON) {
        liczba_szczeblin = 4;
        krok = (szer - 2*szer_profilu) / (liczba_szczeblin + 1);
        for (k = [1 : liczba_szczeblin]) {
            translate([-(szer - 2*szer_profilu)/2 + k * krok, 0, -wys/2 + szer_profilu])
                cylinder(r = 1.0, h = wys - 2*szer_profilu, $fn = 12);
        }
        translate([-(szer - 2*szer_profilu)/2, 0, 0])
            rotate([0, 90, 0])
                cylinder(r = 1.0, h = szer - 2*szer_profilu, $fn = 12);
    }
}

module windows_print_batch() {
    lacznie_okien = stalls_per_side * 2;
    for (i = [0 : lacznie_okien - 1]) {
        translate([(i % 2) * (window_width + 15) - 30, floor(i / 2) * (window_height + 15), 0])
            rotate([90, 0, 0])
                okno_pojedyncze();
    }
}

// =====================================================================
// MODUŁ 4: DRZWI I WROTA STAJENNE (Z funkcjonalnymi tulejami zawiasowymi)
// =====================================================================
module doors_complete() {
    front_gates();
    rear_gates();
    stall_doors_all();
}

module front_gates() {
    szer_skrzydla = x_zawias_wrot;
    wys = gate_height - tolerance;

    // Skrzydło lewe obracające się wokół sworznia lewego
    translate([-x_zawias_wrot, y_zawias_front, 0])
        rotate([0, 0, -gate_open_angle])
            skrzydlo_wrot(szer_skrzydla, wys, lewe = true);

    // Skrzydło prawe obracające się wokół sworznia prawego
    translate([x_zawias_wrot, y_zawias_front, 0])
        rotate([0, 0, gate_open_angle])
            skrzydlo_wrot(szer_skrzydla, wys, lewe = false);
}

module rear_gates() {
    szer_skrzydla = x_zawias_wrot;
    wys = gate_height - tolerance;

    translate([x_zawias_wrot, y_zawias_tyl, 0])
        rotate([0, 0, 180 - gate_open_angle])
            skrzydlo_wrot(szer_skrzydla, wys, lewe = true);

    translate([-x_zawias_wrot, y_zawias_tyl, 0])
        rotate([0, 0, 180 + gate_open_angle])
            skrzydlo_wrot(szer_skrzydla, wys, lewe = false);
}

// Skrzydło wrót ze wzmocnieniem "Z" oraz funkcjonalnymi pasami i tulejami zawiasowymi
module skrzydlo_wrot(szer, wys, lewe = true) {
    gr = 2.8;

    // Deski skrzydła
    color(COLOR_DOORS) {
        if (lewe) {
            translate([0, -barrel_outer_r + 0.2, floor_thickness + 1]) {
                difference() {
                    cube([szer, gr, wys]);
                    for (x = [8 : 8 : szer - 4]) {
                        translate([x, -0.1, 0])
                            cube([0.8, 0.8, wys]);
                    }
                }

                // Zastrzał "Z"
                translate([0, -0.8, 0]) {
                    cube([szer, 0.8, 4]);
                    translate([0, 0, wys - 4])
                        cube([szer, 0.8, 4]);
                    cube([4, 0.8, wys]);
                    translate([szer - 4, 0, 0])
                        cube([4, 0.8, wys]);

                    kat_skosu = atan(wys / szer);
                    dl_skosu = sqrt(szer*szer + wys*wys);
                    rotate([0, -kat_skosu, 0])
                        cube([dl_skosu, 0.8, 4]);
                }
            }
        } else {
            translate([-szer, -barrel_outer_r + 0.2, floor_thickness + 1]) {
                difference() {
                    cube([szer, gr, wys]);
                    for (x = [8 : 8 : szer - 4]) {
                        translate([x, -0.1, 0])
                            cube([0.8, 0.8, wys]);
                    }
                }

                // Zastrzał "Z"
                translate([0, -0.8, 0]) {
                    cube([szer, 0.8, 4]);
                    translate([0, 0, wys - 4])
                        cube([szer, 0.8, 4]);
                    cube([4, 0.8, wys]);
                    translate([szer - 4, 0, 0])
                        cube([4, 0.8, wys]);

                    kat_skosu = atan(wys / szer);
                    dl_skosu = sqrt(szer*szer + wys*wys);
                    translate([szer, 0, 0])
                        rotate([0, -180 + kat_skosu, 0])
                            cube([dl_skosu, 0.8, 4]);
                }
            }
        }
    }

    // Pasy stalowe z tulejami obrotowymi nasuwanymi na sworznie ścienne
    translate([0, 0, z_zawias_dolny_wrot + 3.0])
        pas_zawiasowy_skrzydla(szer * 0.75, lewe = lewe);
    translate([0, 0, z_zawias_gorny_wrot + 3.0])
        pas_zawiasowy_skrzydla(szer * 0.75, lewe = lewe);
}

module stall_doors_all() {
    for (i = [0 : stalls_per_side - 1]) {
        y_boksu = -total_length/2 + wall_thickness + i * stall_length;
        y_zawiasu = y_boksu + stall_length - 4;

        // Boks lewy
        translate([-aisle_width/2, y_zawiasu, 0])
            rotate([0, 0, -stall_door_open_angle])
                rotate([0, 0, 90])
                    drzwi_boksu_holenderskie();

        // Boks prawy
        translate([aisle_width/2, y_zawiasu, 0])
            rotate([0, 0, stall_door_open_angle])
                rotate([0, 0, -90])
                    drzwi_boksu_holenderskie();
    }
}

module drzwi_boksu_holenderskie() {
    szer = stall_door_width - tolerance*2;
    wys = stall_door_height - tolerance;
    gr = 2.6;
    wys_dolna = 52;

    color(COLOR_DOORS) {
        translate([0, -barrel_outer_r + 0.1, floor_thickness + 1]) {
            cube([szer, gr, wys_dolna]);
            // Zastrzał "X"
            translate([0, -0.6, 0]) {
                cube([szer, 0.6, 3]);
                translate([0, 0, wys_dolna - 3])
                    cube([szer, 0.6, 3]);
                cube([3, 0.6, wys_dolna]);
                translate([szer - 3, 0, 0])
                    cube([3, 0.6, wys_dolna]);
            }
            translate([0, 0, wys - 3])
                cube([szer, gr, 3]);
            cube([3, gr, wys]);
            translate([szer - 3, 0, 0])
                cube([3, gr, wys]);
        }
    }

    color(COLOR_IRON) {
        liczba_szczeblin = 6;
        krok = (szer - 6) / (liczba_szczeblin + 1);
        for (k = [1 : liczba_szczeblin]) {
            translate([3 + k * krok, 0, floor_thickness + 1 + wys_dolna])
                cylinder(r = 1.0, h = wys - wys_dolna - 3, $fn = 12);
        }
    }

    // Pasy zawiasowe z tulejami nasuwanymi na sworznie słupka boksu
    translate([0, 0, z_zawias_dolny_boksu + 2.5])
        pas_zawiasowy_skrzydla(szer * 0.7, lewe = true);
    translate([0, 0, z_zawias_gorny_boksu + 2.5])
        pas_zawiasowy_skrzydla(szer * 0.7, lewe = true);
}

module doors_print_batch() {
    szer_skrzydla = (gate_width - tolerance*2) / 2;
    wys_w = gate_height - tolerance;

    for (i = [0 : 3]) {
        translate([i * (szer_skrzydla + 10) - 80, 0, 0])
            rotate([-90, 0, 0])
                skrzydlo_wrot(szer_skrzydla, wys_w, lewe = (i % 2 == 0));
    }

    for (i = [0 : (stalls_per_side * 2) - 1]) {
        translate([i * (stall_door_width + 10) - 80, wys_w + 18, 0])
            rotate([-90, 0, 0])
                drzwi_boksu_holenderskie();
    }
}

// Kompaktowy moduł pojedynczego boksu (do druku na drukarkach 200x200 mm)
module single_stall_bay() {
    difference() {
        union() {
            // Podłoga boksu
            color(COLOR_FLOOR)
                translate([-stall_width/2, -stall_length/2, 0])
                    cube([stall_width, stall_length, floor_thickness]);

            // Ściana tylna zewnętrzna
            color(COLOR_WALLS)
                translate([-stall_width/2, -stall_length/2, floor_thickness])
                    cube([wall_thickness, stall_length, wall_height]);

            // Ściany boczne
            color(COLOR_WALLS) {
                translate([-stall_width/2, -stall_length/2, floor_thickness])
                    cube([stall_width, wall_thickness, wall_height]);
                translate([-stall_width/2, stall_length/2 - wall_thickness, floor_thickness])
                    cube([stall_width, wall_thickness, wall_height]);
            }

            // Front boksu od korytarza
            translate([stall_width/2 - wall_thickness, -stall_length/2, floor_thickness])
                front_boksu(stall_length);
        }

        // Okno w ścianie zewnętrznej
        translate([-stall_width/2 - 1, -window_width/2, sill_height])
            cube([wall_thickness + 2, window_width, window_height]);
    }

    // Drzwi boksu
    translate([stall_width/2 - wall_thickness, stall_length/2 - 4, floor_thickness])
        rotate([0, 0, stall_door_open_angle])
            rotate([0, 0, -90])
                drzwi_boksu_holenderskie();

    // Okno
    translate([-stall_width/2 + wall_thickness/2, 0, sill_height + window_height/2])
        rotate([0, 0, -90])
            okno_pojedyncze();
}

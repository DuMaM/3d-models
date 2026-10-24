// =====================================================================
// SYSTEM MODUŁOWEJ STAJNI DLA KONI SCHLEICH (Skala 1:24)
// ZOPTYMALIZOWANY POD DRUKARKĘ 3D QIDI Q1 PRO (Pole: 245 x 245 x 240 mm)
//
// Główne cechy:
// 1. DOWOLNA LICZBA BOKSÓW: segmenty łączone na jaskółczy ogon (dovetail)
// 2. 100% ELEMENTÓW MIEŚCI SIĘ W POLU 245 x 245 mm:
//    - Duże ściany szczytowe podzielone na filary boczne i portal wrót
//    - Trójkąt szczytowy i krokwie podzielone na pół-wiązary
//    - Połacie dachu drukowane płasko bez podpór
// 3. DRUK WIELOKOLOROWY (osobne filamenty bez konieczności AMS/MMU):
//    - BOKSY (np. filament brązowy / drewno)
//    - ŚCIANY ZEWNĘTRZNE (np. filament biały / kremowy)
//    - POSADZKA (np. filament szary beton / antracyt)
//    - DACH (np. filament czerwony / terakota)
//    - OKNA, KRATY, ZAWIASY (np. filament czarny / stal)
// =====================================================================

/* [Konfiguracja rozbudowy stajni] */
// Liczba powtarzalnych segmentów wzdłuż stajni (1 segment = 2 boksy, 2 segmenty = 4 boksy, 3 segmenty = 6 boksów itd.)
liczba_segmentow = 2; // [1:6]

// Wybór wyświetlanej części / stołu roboczego
widok = "calosc"; // [calosc:Złożona stajnia z końmi, bez_dachu:Wnętrze bez dachu (do zabawy), rozstrzelony_segment:Widok montażowy 1 segmentu, stol_qidi_boksy:STÓŁ QIDI: Elementy boksów (brąz), stol_qidi_posadzka:STÓŁ QIDI: Posadzka boksu i korytarza (szary), stol_qidi_sciana_zewn:STÓŁ QIDI: Ściana boczna z oknem (biały), stol_qidi_szczyt:STÓŁ QIDI: Elementy ściany szczytowej (biały), stol_qidi_dach:STÓŁ QIDI: Połać dachu i kalenica (czerwony), stol_qidi_drzwi_okna:STÓŁ QIDI: Wrota, drzwi i okna, panel_sciana_boczna:Pojedyncza ściana boczna, panel_przegroda:Pojedyncza przegroda boksu, panel_front_boksu:Pojedynczy front boksu, panel_podloga_boks:Pojedyncza posadzka boksu, panel_podloga_korytarz:Pojedyncza posadzka korytarza, szczyt_filar_boczny:Pojedynczy filar szczytowy, szczyt_portal_wrot:Pojedynczy portal wrót, szczyt_trojkat_polowa:Pół-trójkąt szczytu dachu, polac_dachu_pojedyncza:Pojedyncza połać dachu, krokiew_polowa:Pół-krokiew wiązara]

// Wyświetl obrys stołu roboczego QIDI Q1 Pro (245 x 245 mm)
pokaz_stol_qidi = false;

// Pokaż manekiny koni Schleich dla weryfikacji skali
pokaz_konie = true;

// Rozsunięcie w widoku montażowym [mm]
eksplozja = 45; // [20:5:100]

// Kąt otwarcia wrót głównych [stopnie]
kat_wrot = 35; // [0:5:120]

// Kąt otwarcia drzwi boksów [stopnie]
kat_drzwi_boksow = 25; // [0:5:90]

/* [Wymiary dopasowane do modelu konia użytkownika] */
// Model konia: obj_1_horse ready.stl_A.stl
// Dokładne wymiary z pliku STL: długość = 171.0 mm, szerokość = 50.0 mm, wysokość = 149.9 mm
dlugosc_boksu = 200;         // Długość boksu w osi Y (koń ma 171 mm -> 29 mm luzu wzdłuż boksu)
szerokosc_boksu = 140;       // Szerokość boksu w osi X (koń ma 50 mm -> 90 mm luzu wszerz)
szerokosc_korytarza = 95;    // Szerokość korytarza w osi X (swobodny ruch konia)
wysokosc_scian = 170;        // Wysokość ścian do okapu (koń ma 150 mm -> ściana 20 mm wyższa od uszu)
wysokosc_szczytu = 75;       // Wysokość trójkąta szczytowego dachu (pod kalenicą aż 245 mm!)
grubosc_sciany = 4.0;        // Grubość ścian nośnych
grubosc_podlogi = 4.0;       // Grubość posadzki (z rowkami prowadzącymi na ściany)
glebokosc_rowka = 1.8;       // Głębokość rowka wpustowego na ścianę w posadzce

/* [Wymiary przejść i otworów dla konia o wys. 150 mm i szer. 50 mm] */
szerokosc_wrot = 85;         // Szerokość wrót głównych (koń ma 50 mm -> 35 mm luzu)
wysokosc_wrot = 162;         // Wysokość wrót głównych (koń ma 150 mm -> 12 mm czystego prześwitu nad uszami!)
szerokosc_drzwi_boksu = 75;  // Szerokość drzwi boksu (koń ma 50 mm -> 25 mm luzu)
wysokosc_drzwi_boksu = 105;  // Wysokość drzwi boksu
szerokosc_okna = 56;         // Szerokość okna boksu
wysokosc_okna = 48;          // Wysokość okna
wysokosc_parapetu = 85;      // Wysokość parapetu od podłogi (koń wygląda przez okno)

/* [Wymiary zamków jaskółczy ogon (Dovetail)] */
szer_jaskolki_baza = 14.0;   // Wąska podstawa trapezu [mm]
szer_jaskolki_glowa = 20.0;  // Szeroka główka trapezu [mm]
dlugosc_jaskolki = 8.0;      // Wysunięcie zamka [mm]
luz_zamka = 0.35;            // Luz pasowania zamka pod druk FDM [mm]

/* [Wymiary zawiasów stajennych] */
r_sworznia_zawiasu = 1.3;    // Promień czopa/sworznia na ścianie (średnica 2.6 mm)
h_sworznia_zawiasu = 7.0;    // Wysokość czopa
r_tulei_zewn = 2.8;          // Promień zewnętrzny tulei drzwi (średnica 5.6 mm)
r_tulei_wewn = 1.65;         // Promień wewnętrzny (średnica 3.3 mm, luz 0.35 mm)
h_tulei_zawiasu = 5.5;       // Wysokość tulei

/* [Druk 3D i pasowanie] */
luz = 0.45;                  // Ogólny luz montażowy [mm]
okap_dachu = 10;             // Okap dachu poza budynek

// Parametry stołu QIDI Q1 Pro
QIDI_X = 245;
QIDI_Y = 245;
QIDI_Z = 240;

$fn = 24;

// Wymiary globalne wyliczone
szerokosc_calkowita = 2 * szerokosc_boksu + szerokosc_korytarza + 2 * grubosc_sciany;
dlugosc_calkowita = liczba_segmentow * dlugosc_boksu + 2 * grubosc_sciany;
kat_dachu = atan(wysokosc_szczytu / (szerokosc_calkowita/2));

// Koordynaty osi zawiasów wrót
x_zawias_wrot = szerokosc_wrot/2 - r_tulei_zewn * 0.7;
z_zawias_dolny_wrot = grubosc_podlogi + 20;
z_zawias_gorny_wrot = grubosc_podlogi + 105;
z_zawias_dolny_boksu = grubosc_podlogi + 16;
z_zawias_gorny_boksu = grubosc_podlogi + 66;

// Paleta barw
KOLOR_SCIAN      = [0.90, 0.88, 0.82]; // Jasny krem / tynk zewnętrzny
KOLOR_PODLOGI    = [0.55, 0.53, 0.50]; // Szary beton posadzkowy
KOLOR_DACHU      = [0.72, 0.25, 0.18]; // Czerwona dachówka / cegła
KOLOR_BELEK      = [0.42, 0.26, 0.15]; // Brązowe drewno konstrukcyjne i boksy
KOLOR_KRAT       = [0.20, 0.20, 0.22]; // Stal antracyt / kraty
KOLOR_DRZWI      = [0.48, 0.28, 0.15]; // Ciemniejsze drewno drzwiowe
KOLOR_OKIEN      = [0.96, 0.96, 0.94]; // Kremowo-białe ramy
KOLOR_KONIA_1    = [0.35, 0.20, 0.10]; // Gniady koń Schleich
KOLOR_KONIA_2    = [0.88, 0.88, 0.85]; // Siwy koń Schleich

// =====================================================================
// DYSPOZYCJA GŁÓWNYCH WIDOKÓW
// =====================================================================
if (widok == "calosc") {
    stajnia_kompletna(z_dachem = true);
    if (pokaz_konie) rozmiesc_konie();
    if (pokaz_stol_qidi) obrys_stolu_qidi();
}
else if (widok == "bez_dachu") {
    stajnia_kompletna(z_dachem = false);
    if (pokaz_konie) rozmiesc_konie();
    if (pokaz_stol_qidi) obrys_stolu_qidi();
}
else if (widok == "rozstrzelony_segment") {
    rozstrzelony_segment();
    if (pokaz_konie) {
        translate([szerokosc_korytarza/2 + szerokosc_boksu/2, dlugosc_boksu/2, grubosc_podlogi])
            figurka_konia_schleich(kolor_konia = KOLOR_KONIA_1);
    }
}

// --- WIDOKI STOŁÓW DRUKARKI QIDI Q1 PRO (Wg kolorów filamentu) ---
else if (widok == "stol_qidi_boksy") {
    // FILAMENT BRĄZOWY / DREWNO: Front boksu + przegroda międzyboksowa (mieszczą się razem na 245x245)
    obrys_stolu_qidi();
    translate([-QIDI_X/2 + 25, -QIDI_Y/2 + 20, 0]) {
        rotate([90, 0, 0])
            panel_frontu_boksu(lewy = true);
        translate([0, 115, 0])
            rotate([90, 0, 0])
                panel_przegrody_boksu();
    }
}
else if (widok == "stol_qidi_posadzka") {
    // FILAMENT SZARY BETON: Posadzka boksu (130x160) + posadzka korytarza (85x160) (razem 215x160 mm)
    obrys_stolu_qidi();
    translate([-QIDI_X/2 + 15, -QIDI_Y/2 + 40, 0]) {
        panel_podlogi_boksu(lewy = true);
        translate([szerokosc_boksu + 3, 0, 0])
            panel_podlogi_korytarza();
    }
}
else if (widok == "stol_qidi_sciana_zewn") {
    // FILAMENT JASNY / BIAŁY: Ściana boczna z oknem (160 x 140 mm, idealnie na stole)
    obrys_stolu_qidi();
    translate([-QIDI_X/2 + 40, -QIDI_Y/2 + 50, 0])
        rotate([90, 0, 0])
            panel_sciany_bocznej();
}
else if (widok == "stol_qidi_szczyt") {
    // FILAMENT JASNY / BIAŁY: Filary szczytowe (134x140) + portal wrót (85x140) rozbite pod stół 245x245
    obrys_stolu_qidi();
    translate([-QIDI_X/2 + 15, -QIDI_Y/2 + 50, 0]) {
        rotate([90, 0, 0]) szczyt_filar_boczny(lewy = true);
        translate([szerokosc_boksu + 6, 0, 0])
            rotate([90, 0, 0]) szczyt_portal_wrot();
    }
}
else if (widok == "stol_qidi_dach") {
    // FILAMENT CZERWONY: Połać dachu (185 x 160 mm) + kalenica (160 mm) ułożone płasko (0 podpór)
    obrys_stolu_qidi();
    translate([-QIDI_X/2 + 30, -QIDI_Y/2 + 40, 0]) {
        polac_dachu_segmentu();
        translate([195, 0, 4.0])
            rotate([-90, 0, 0])
                cylinder(r = 4.0, h = dlugosc_boksu, $fn = 8);
    }
}
else if (widok == "stol_qidi_drzwi_okna") {
    // FILAMENT AKCENTOWY (Kraty, drzwi, wrota, okna)
    obrys_stolu_qidi();
    translate([-QIDI_X/2 + 25, -QIDI_Y/2 + 20, 0]) {
        // Wrota (2 skrzydła)
        rotate([-90, 0, 0]) skrzydlo_wrot(x_zawias_wrot, wysokosc_wrot - luz, lewe = true);
        translate([45, 0, 0])
            rotate([-90, 0, 0]) skrzydlo_wrot(x_zawias_wrot, wysokosc_wrot - luz, lewe = false);
        // Drzwi boksu
        translate([95, 0, 0])
            rotate([-90, 0, 0]) drzwi_boksu_holenderskie();
        // 2 Okna
        translate([175, 10, 0]) rotate([90, 0, 0]) okno_pojedyncze();
        translate([175, 75, 0]) rotate([90, 0, 0]) okno_pojedyncze();
    }
}

// --- POJEDYNCZE PANELE (Do eksportu STL na stół QIDI) ---
else if (widok == "panel_sciana_boczna") {
    rotate([90, 0, 0]) panel_sciany_bocznej();
}
else if (widok == "panel_przegroda") {
    rotate([90, 0, 0]) panel_przegrody_boksu();
}
else if (widok == "panel_front_boksu") {
    rotate([90, 0, 0]) panel_frontu_boksu(lewy = true);
}
else if (widok == "panel_podloga_boks") {
    panel_podlogi_boksu(lewy = true);
}
else if (widok == "panel_podloga_korytarz") {
    panel_podlogi_korytarza();
}
else if (widok == "szczyt_filar_boczny") {
    rotate([90, 0, 0]) szczyt_filar_boczny(lewy = true);
}
else if (widok == "szczyt_portal_wrot") {
    rotate([90, 0, 0]) szczyt_portal_wrot();
}
else if (widok == "szczyt_trojkat_polowa") {
    rotate([90, 0, 0]) szczyt_trojkat_polowa(lewa = true);
}
else if (widok == "polac_dachu_pojedyncza") {
    polac_dachu_segmentu();
}
else if (widok == "krokiew_polowa") {
    rotate([90, 0, 0]) krokiew_polowa(lewa = true);
}

// =====================================================================
// WIZUALIZACJA POLA ROBOCZEGO QIDI Q1 PRO (245 x 245 x 240 mm)
// =====================================================================
module obrys_stolu_qidi() {
    color([0.2, 0.6, 0.9, 0.15]) {
        translate([-QIDI_X/2, -QIDI_Y/2, 0])
            cube([QIDI_X, QIDI_Y, 2.0]);
    }
    color([0.1, 0.4, 0.8, 0.8]) {
        // Obrys krawędzi stołu
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
// MODEL STAJNI ZE ZŁOŻONYCH MODUŁÓW
// =====================================================================
module stajnia_kompletna(z_dachem = true) {
    for (s = [0 : liczba_segmentow - 1]) {
        y_seg = s * dlugosc_boksu;
        translate([0, y_seg, 0]) {
            segment_stajenny_zmontowany(indeks = s);
            if (z_dachem) {
                translate([0, 0, wysokosc_scian + grubosc_podlogi])
                    segment_dachu();
            }
        }
    }

    // Ściana szczytowa przednia (złożona z 3 modułów mieszczących się na QIDI)
    translate([0, 0, 0])
        sciana_szczytowa_zmontowana(front = true);

    // Ściana szczytowa tylna
    translate([0, liczba_segmentow * dlugosc_boksu, 0])
        sciana_szczytowa_zmontowana(front = false);

    // Przegroda końcowa tylna
    translate([0, liczba_segmentow * dlugosc_boksu, 0]) {
        translate([-szerokosc_korytarza/2 - szerokosc_boksu, 0, grubosc_podlogi - glebokosc_rowka])
            panel_przegrody_boksu();
        translate([szerokosc_korytarza/2, 0, grubosc_podlogi - glebokosc_rowka])
            panel_przegrody_boksu();
    }
}

// Segment złożony (2 boksy + korytarz)
module segment_stajenny_zmontowany(indeks = 0) {
    // Posadzki
    translate([-szerokosc_korytarza/2 - szerokosc_boksu, 0, 0])
        panel_podlogi_boksu(lewy = true);
    translate([-szerokosc_korytarza/2, 0, 0])
        panel_podlogi_korytarza();
    translate([szerokosc_korytarza/2, 0, 0])
        panel_podlogi_boksu(lewy = false);

    // Ściany boczne z oknami
    translate([-szerokosc_korytarza/2 - szerokosc_boksu, 0, grubosc_podlogi - glebokosc_rowka])
        panel_sciany_bocznej();
    translate([szerokosc_korytarza/2 + szerokosc_boksu - grubosc_sciany, 0, grubosc_podlogi - glebokosc_rowka])
        panel_sciany_bocznej();

    // Okna
    translate([-szerokosc_korytarza/2 - szerokosc_boksu + grubosc_sciany/2, dlugosc_boksu/2, wysokosc_parapetu + wysokosc_okna/2])
        rotate([0, 0, -90]) okno_pojedyncze();
    translate([szerokosc_korytarza/2 + szerokosc_boksu - grubosc_sciany/2, dlugosc_boksu/2, wysokosc_parapetu + wysokosc_okna/2])
        rotate([0, 0, 90]) okno_pojedyncze();

    // Przegrody międzyboksowe
    translate([-szerokosc_korytarza/2 - szerokosc_boksu, 0, grubosc_podlogi - glebokosc_rowka])
        panel_przegrody_boksu();
    translate([szerokosc_korytarza/2, 0, grubosc_podlogi - glebokosc_rowka])
        panel_przegrody_boksu();

    // Fronty boksów
    translate([-szerokosc_korytarza/2, 0, grubosc_podlogi - glebokosc_rowka])
        panel_frontu_boksu(lewy = true);
    translate([szerokosc_korytarza/2 - grubosc_sciany, 0, grubosc_podlogi - glebokosc_rowka])
        panel_frontu_boksu(lewy = false);

    // Drzwi do boksów
    y_zawiasu_boksu = dlugosc_boksu - 4;
    translate([-szerokosc_korytarza/2, y_zawiasu_boksu, 0])
        rotate([0, 0, -kat_drzwi_boksow])
            rotate([0, 0, 90])
                drzwi_boksu_holenderskie();

    translate([szerokosc_korytarza/2, y_zawiasu_boksu, 0])
        rotate([0, 0, kat_drzwi_boksow])
            rotate([0, 0, -90])
                drzwi_boksu_holenderskie();
}

// =====================================================================
// PANELE ŚCIANY SZCZYTOWEJ PODZIELONEJ POD QIDI Q1 PRO (Max wymiar < 180 mm)
// =====================================================================
module sciana_szczytowa_zmontowana(front = true) {
    y_pos = front ? -grubosc_sciany : (liczba_segmentow * dlugosc_boksu);
    zwrot = front ? -1 : 1;

    translate([0, y_pos, 0]) {
        // 1. Lewy filar szczytowy (szer. 134 mm, wys. 140 mm -> FITS QIDI!)
        translate([-szerokosc_calkowita/2, 0, 0])
            szczyt_filar_boczny(lewy = true);

        // 2. Centralny portal wrót z nadprożem i zawiasami (szer. 85 mm, wys. 140 mm -> FITS QIDI!)
        translate([-szerokosc_korytarza/2, 0, 0])
            szczyt_portal_wrot(zwrot_y = zwrot);

        // 3. Prawy filar szczytowy (szer. 134 mm, wys. 140 mm -> FITS QIDI!)
        translate([szerokosc_korytarza/2, 0, 0])
            szczyt_filar_boczny(lewy = false);

        // 4. Trójkąt szczytowy dachu (podzielony na 2 połówki o szerokości 176 mm -> FITS QIDI!)
        translate([0, 0, wysokosc_scian + grubosc_podlogi]) {
            szczyt_trojkat_polowa(lewa = true);
            szczyt_trojkat_polowa(lewa = false);
        }

        // 5. Skrzydła wrót
        szer_skrzydla = x_zawias_wrot;
        wys_w = wysokosc_wrot - luz;
        y_wrot = zwrot < 0 ? -r_tulei_zewn - 0.5 : grubosc_sciany + r_tulei_zewn + 0.5;

        if (front) {
            translate([-x_zawias_wrot, y_wrot, 0])
                rotate([0, 0, -kat_wrot])
                    skrzydlo_wrot(szer_skrzydla, wys_w, lewe = true);

            translate([x_zawias_wrot, y_wrot, 0])
                rotate([0, 0, kat_wrot])
                    skrzydlo_wrot(szer_skrzydla, wys_w, lewe = false);
        } else {
            translate([x_zawias_wrot, y_wrot, 0])
                rotate([0, 0, 180 - kat_wrot])
                    skrzydlo_wrot(szer_skrzydla, wys_w, lewe = true);

            translate([-x_zawias_wrot, y_wrot, 0])
                rotate([0, 0, 180 + kat_wrot])
                    skrzydlo_wrot(szer_skrzydla, wys_w, lewe = false);
        }
    }
}

// Boczny filar ściany szczytowej (szer. 134 x wys. 140 mm)
module szczyt_filar_boczny(lewy = true) {
    szer_filara = szerokosc_boksu + grubosc_sciany;
    color(KOLOR_SCIAN) {
        difference() {
            union() {
                // Ściana
                translate([0, 0, grubosc_podlogi])
                    cube([szer_filara, grubosc_sciany, wysokosc_scian]);
                // Dolne pióro
                translate([0, 0.4, grubosc_podlogi - glebokosc_rowka])
                    cube([szer_filara, grubosc_sciany - 0.8, glebokosc_rowka + 0.1]);

                // Pióro łączące z portalem wrót
                if (lewy) {
                    translate([szer_filara, 0.8, grubosc_podlogi])
                        cube([3.0, grubosc_sciany - 1.6, wysokosc_scian]);
                }
            }
            if (!lewy) {
                // Wpust pod pióro portalu
                translate([-0.5, 0.5, grubosc_podlogi - 1])
                    cube([3.5, grubosc_sciany - 1.0, wysokosc_scian + 2]);
            }
        }
    }
}

// Środkowy portal wrót wejściowych z nadprożem i zawiasami (szer. 85 x wys. 140 mm)
module szczyt_portal_wrot(zwrot_y = -1) {
    color(KOLOR_SCIAN) {
        difference() {
            union() {
                // Słupki bramowe i nadproże
                translate([0, 0, grubosc_podlogi])
                    cube([szerokosc_korytarza, grubosc_sciany, wysokosc_scian]);

                // Dolne pióro
                translate([0, 0.4, grubosc_podlogi - glebokosc_rowka])
                    cube([szerokosc_korytarza, grubosc_sciany - 0.8, glebokosc_rowka + 0.1]);

                // Pióro boczne prawe (do prawego filara)
                translate([szerokosc_korytarza, 0.8, grubosc_podlogi])
                    cube([3.0, grubosc_sciany - 1.6, wysokosc_scian]);
            }

            // Otwór wrót głównych
            translate([(szerokosc_korytarza - szerokosc_wrot)/2, -1, grubosc_podlogi])
                cube([szerokosc_wrot, grubosc_sciany + 2, wysokosc_wrot + 1]);

            // Wpust lewy (od lewego filara)
            translate([-0.5, 0.5, grubosc_podlogi - 1])
                cube([3.5, grubosc_sciany - 1.0, wysokosc_scian + 2]);
        }

        // Sworznie zawiasowe wrót
        x_lewy = (szerokosc_korytarza - szerokosc_wrot)/2 + r_tulei_zewn * 0.7;
        x_prawy = (szerokosc_korytarza + szerokosc_wrot)/2 - r_tulei_zewn * 0.7;

        for (z = [z_zawias_dolny_wrot, z_zawias_gorny_wrot]) {
            translate([x_lewy, zwrot_y < 0 ? 0 : grubosc_sciany, z])
                wspornik_zawiasu_wrot(kierunek_x = -1, zwrot_y = zwrot_y);
            translate([x_prawy, zwrot_y < 0 ? 0 : grubosc_sciany, z])
                wspornik_zawiasu_wrot(kierunek_x = 1, zwrot_y = zwrot_y);
        }
    }
}

// Połówka trójkąta szczytowego dachu (szer. 176 mm x wys. 75 mm -> FITS QIDI!)
module szczyt_trojkat_polowa(lewa = true) {
    polowa_bazy = szerokosc_calkowita / 2;
    color(KOLOR_SCIAN) {
        difference() {
            union() {
                rotate([90, 0, 0])
                    linear_extrude(height = grubosc_sciany)
                        polygon(points = [
                            [lewa ? -polowa_bazy : 0, 0],
                            [lewa ? 0 : polowa_bazy, 0],
                            [0, wysokosc_szczytu]
                        ]);

                // Zamek łączący na kalenicy
                if (lewa) {
                    translate([-2.5, -grubosc_sciany + 0.8, 10])
                        cube([2.5, grubosc_sciany - 1.6, wysokosc_szczytu - 20]);
                }
            }
            if (!lewa) {
                translate([-0.5, -grubosc_sciany + 0.5, 9])
                    cube([3.0, grubosc_sciany - 1.0, wysokosc_szczytu - 18]);
            }
        }
    }
}

// =====================================================================
// PANELE POSADZKI ZE SZCZEPIANIEM MODUŁOWYM (Dovetail)
// =====================================================================
module panel_podlogi_boksu(lewy = true) {
    color(KOLOR_PODLOGI) {
        difference() {
            union() {
                cube([szerokosc_boksu, dlugosc_boksu, grubosc_podlogi]);

                // Zamki dovetail w osi Y do kolejnego segmentu
                translate([szerokosc_boksu * 0.3, dlugosc_boksu, 0])
                    zamek_jaskolczy_ogon_meski();
                translate([szerokosc_boksu * 0.7, dlugosc_boksu, 0])
                    zamek_jaskolczy_ogon_meski();

                // Zamki dovetail w stronę korytarza
                if (lewy) {
                    translate([szerokosc_boksu, dlugosc_boksu * 0.25, 0])
                        rotate([0, 0, -90])
                            zamek_jaskolczy_ogon_meski();
                    translate([szerokosc_boksu, dlugosc_boksu * 0.75, 0])
                        rotate([0, 0, -90])
                            zamek_jaskolczy_ogon_meski();
                }
            }

            // Gniazda żeńskie od strony wejściowej (-Y)
            translate([szerokosc_boksu * 0.3, 0, -0.1])
                zamek_jaskolczy_ogon_zenski();
            translate([szerokosc_boksu * 0.7, 0, -0.1])
                zamek_jaskolczy_ogon_zenski();

            // Gniazda żeńskie od korytarza dla prawego boksu
            if (!lewy) {
                translate([0, dlugosc_boksu * 0.25, -0.1])
                    rotate([0, 0, 90])
                        zamek_jaskolczy_ogon_zenski();
                translate([0, dlugosc_boksu * 0.75, -0.1])
                    rotate([0, 0, 90])
                        zamek_jaskolczy_ogon_zenski();
            }

            // Rowki montażowe na ściany
            x_zewn = lewy ? 0 : szerokosc_boksu - grubosc_sciany;
            translate([x_zewn - 0.2, -1, grubosc_podlogi - glebokosc_rowka])
                cube([grubosc_sciany + 0.4, dlugosc_boksu + 2, glebokosc_rowka + 0.5]);

            translate([-1, -0.2, grubosc_podlogi - glebokosc_rowka])
                cube([szerokosc_boksu + 2, grubosc_sciany + 0.4, glebokosc_rowka + 0.5]);

            x_front = lewy ? szerokosc_boksu - grubosc_sciany : 0;
            translate([x_front - 0.2, -1, grubosc_podlogi - glebokosc_rowka])
                cube([grubosc_sciany + 0.4, dlugosc_boksu + 2, glebokosc_rowka + 0.5]);
        }
    }
}

module panel_podlogi_korytarza() {
    color(KOLOR_PODLOGI * 0.95) {
        difference() {
            union() {
                cube([szerokosc_korytarza, dlugosc_boksu, grubosc_podlogi]);

                // Zamki wzdłuż Y
                translate([szerokosc_korytarza/2, dlugosc_boksu, 0])
                    zamek_jaskolczy_ogon_meski();

                // Zamki w stronę prawego boksu (+X)
                translate([szerokosc_korytarza, dlugosc_boksu * 0.25, 0])
                    rotate([0, 0, -90])
                        zamek_jaskolczy_ogon_meski();
                translate([szerokosc_korytarza, dlugosc_boksu * 0.75, 0])
                    rotate([0, 0, -90])
                        zamek_jaskolczy_ogon_meski();
            }

            translate([szerokosc_korytarza/2, 0, -0.1])
                zamek_jaskolczy_ogon_zenski();

            // Gniazda od lewego boksu (-X)
            translate([0, dlugosc_boksu * 0.25, -0.1])
                rotate([0, 0, 90])
                    zamek_jaskolczy_ogon_zenski();
            translate([0, dlugosc_boksu * 0.75, -0.1])
                rotate([0, 0, 90])
                    zamek_jaskolczy_ogon_zenski();
        }
    }
}

module zamek_jaskolczy_ogon_meski() {
    linear_extrude(height = grubosc_podlogi)
        polygon(points = [
            [-szer_jaskolki_baza/2, 0],
            [-szer_jaskolki_glowa/2, dlugosc_jaskolki],
            [szer_jaskolki_glowa/2, dlugosc_jaskolki],
            [szer_jaskolki_baza/2, 0]
        ]);
}

module zamek_jaskolczy_ogon_zenski() {
    baza_z = szer_jaskolki_baza + 2 * luz_zamka;
    glowa_z = szer_jaskolki_glowa + 2 * luz_zamka;
    dl_z = dlugosc_jaskolki + luz_zamka;

    linear_extrude(height = grubosc_podlogi + 0.5)
        polygon(points = [
            [-baza_z/2, -0.5],
            [-glowa_z/2, dl_z],
            [glowa_z/2, dl_z],
            [baza_z/2, -0.5]
        ]);
}

// =====================================================================
// PANELE BOKSÓW (Ściany, przegrody, fronty)
// =====================================================================
module panel_sciany_bocznej() {
    color(KOLOR_SCIAN) {
        difference() {
            union() {
                cube([grubosc_sciany, dlugosc_boksu, wysokosc_scian]);
                translate([0.2, 0, -glebokosc_rowka])
                    cube([grubosc_sciany - 0.4, dlugosc_boksu, glebokosc_rowka + 0.1]);
                translate([0.5, dlugosc_boksu, 0])
                    cube([grubosc_sciany - 1.0, 3.0, wysokosc_scian]);
                translate([0.5, dlugosc_boksu/2 - 10, wysokosc_scian])
                    cube([grubosc_sciany - 1.0, 20, 5.0]);
            }
            translate([-1, dlugosc_boksu/2 - szerokosc_okna/2, wysokosc_parapetu])
                cube([grubosc_sciany + 2, szerokosc_okna, wysokosc_okna]);
            translate([-0.5, -0.1, -glebokosc_rowka])
                cube([grubosc_sciany + 1.0, 3.5, wysokosc_scian + glebokosc_rowka + 1]);
        }
    }
}

module panel_przegrody_boksu() {
    h_pelna = 60;
    h_calkowita = 95;
    gr = 3.0;

    color(KOLOR_BELEK) {
        union() {
            cube([szerokosc_boksu, gr, h_pelna]);
            translate([0, 0.2, -glebokosc_rowka])
                cube([szerokosc_boksu, gr - 0.4, glebokosc_rowka + 0.1]);

            translate([0, 0, h_pelna]) {
                translate([0, 0, h_calkowita - h_pelna - 3])
                    cube([szerokosc_boksu, gr, 3]);
                liczba_pretow = floor(szerokosc_boksu / 10);
                for (p = [1 : liczba_pretow - 1]) {
                    translate([p * (szerokosc_boksu / liczba_pretow), gr/2, 0])
                        cylinder(r = 1.2, h = h_calkowita - h_pelna, $fn = 12);
                }
            }
            cube([6, gr, h_calkowita]);
            translate([szerokosc_boksu - 6, 0, 0])
                cube([6, gr, h_calkowita]);
        }
    }
}

module panel_frontu_boksu(lewy = true) {
    h_calkowita = 95;
    gr = 3.0;
    h_pelna = 55;
    y_zawiasu_boksu = dlugosc_boksu - 4;

    color(KOLOR_BELEK) {
        difference() {
            union() {
                cube([gr, dlugosc_boksu, h_pelna]);
                translate([0.2, 0, -glebokosc_rowka])
                    cube([gr - 0.4, dlugosc_boksu, glebokosc_rowka + 0.1]);
                translate([0, 0, h_calkowita - 3])
                    cube([gr, dlugosc_boksu, 3]);
                cube([gr, 6, h_calkowita]);
                translate([0, dlugosc_boksu - 6, 0])
                    cube([gr, 6, h_calkowita]);

                translate([gr/2, 0, h_pelna]) {
                    for (y = [6 : 10 : dlugosc_boksu - szerokosc_drzwi_boksu - 6]) {
                        translate([0, y, 0])
                            cylinder(r = 1.2, h = h_calkowita - h_pelna, $fn = 12);
                    }
                }
            }
            translate([-1, dlugosc_boksu - szerokosc_drzwi_boksu - 4, 0])
                cube([gr + 2, szerokosc_drzwi_boksu, wysokosc_drzwi_boksu + 1]);
        }

        translate([gr/2, y_zawiasu_boksu, 0]) {
            translate([0, 0, z_zawias_dolny_boksu]) wspornik_zawiasu_boksu();
            translate([0, 0, z_zawias_gorny_boksu]) wspornik_zawiasu_boksu();
        }
    }
}

// =====================================================================
// MODUŁ DACHU PODZIELONY POD QIDI Q1 PRO (Max wymiar < 190 mm)
// =====================================================================
module segment_dachu() {
    gr_dachu = 3.2;
    polowa_szer = szerokosc_calkowita / 2;
    dlugosc_stoku = (polowa_szer + okap_dachu) / cos(kat_dachu);

    // Kalenica odcinka
    color(KOLOR_BELEK) {
        translate([0, 0, wysokosc_szczytu - 0.5]) {
            rotate([-90, 0, 0])
                cylinder(r = 4.0, h = dlugosc_boksu, $fn = 8);
            translate([0, dlugosc_boksu, 0])
                rotate([-90, 0, 0])
                    cylinder(r = 2.0, h = 8.0, $fn = 12);
        }
    }

    // Połacie dachu (każda połać ma 185 x 160 mm -> FITS QIDI!)
    color(KOLOR_DACHU) {
        translate([0, 0, wysokosc_szczytu])
            rotate([0, -kat_dachu, 0])
                translate([-dlugosc_stoku, 0, -gr_dachu])
                    polac_dachu_segmentu();

        translate([0, 0, wysokosc_szczytu])
            rotate([0, kat_dachu, 0])
                translate([0, 0, -gr_dachu])
                    polac_dachu_segmentu();
    }

    // Wiązar złożony z dwóch pół-krokwi (szerokość każdej to 180 mm -> FITS QIDI!)
    color(KOLOR_BELEK) {
        translate([0, dlugosc_boksu/2, 0]) {
            krokiew_polowa(lewa = true);
            krokiew_polowa(lewa = false);
        }
    }
}

// Pojedyncza połać dachowa segmentu (185 x 160 mm - drukowana płasko bez podpór)
module polac_dachu_segmentu() {
    polowa_szer = szerokosc_calkowita / 2;
    dlugosc_stoku = (polowa_szer + okap_dachu) / cos(kat_dachu);
    gr = 3.2;

    color(KOLOR_DACHU) {
        difference() {
            cube([dlugosc_stoku, dlugosc_boksu, gr]);
            for (y = [12 : 12 : dlugosc_boksu - 6]) {
                translate([-1, y, gr - 0.8])
                    cube([dlugosc_stoku + 2, 1.2, 1.5]);
            }
        }
    }
}

// Pół-krokiew wiązara z zamkiem na szczycie (szer. 180 mm x wys. 75 mm -> FITS QIDI!)
module krokiew_polowa(lewa = true) {
    gr_belki = 4.0;
    polowa_w = szerokosc_calkowita / 2;

    color(KOLOR_BELEK) {
        rotate([90, 0, 0]) {
            linear_extrude(height = gr_belki, center = true) {
                polygon(points = [
                    [lewa ? -polowa_w + 1 : 0, 0],
                    [lewa ? 0 : polowa_w - 1, 0],
                    [0, wysokosc_szczytu - 2]
                ]);
            }
        }
    }
}

// =====================================================================
// ZAWIASY, DRZWI I OKNA
// =====================================================================
module wspornik_zawiasu_wrot(kierunek_x = 1, zwrot_y = -1) {
    color(KOLOR_KRAT) {
        translate([kierunek_x > 0 ? 0 : -(grubosc_sciany + 4), zwrot_y < 0 ? 0 : -(grubosc_sciany + 2), 0])
            cube([grubosc_sciany + 4, grubosc_sciany + 2, 7.0]);

        cylinder(r = r_tulei_zewn + 0.6, h = 3.0, $fn = 24);

        translate([0, 0, 3.0]) {
            cylinder(r = r_sworznia_zawiasu, h = h_sworznia_zawiasu, $fn = 24);
            translate([0, 0, h_sworznia_zawiasu])
                cylinder(r1 = r_sworznia_zawiasu, r2 = r_sworznia_zawiasu * 0.4, h = 1.6, $fn = 24);
        }
    }
}

module wspornik_zawiasu_boksu() {
    color(KOLOR_KRAT) {
        cylinder(r = r_tulei_zewn + 0.5, h = 2.5, $fn = 24);
        translate([0, 0, 2.5]) {
            cylinder(r = r_sworznia_zawiasu, h = h_sworznia_zawiasu, $fn = 24);
            translate([0, 0, h_sworznia_zawiasu])
                cylinder(r1 = r_sworznia_zawiasu, r2 = r_sworznia_zawiasu * 0.4, h = 1.4, $fn = 24);
        }
        translate([-2, -2, 0])
            cube([4, 4, 2.5]);
    }
}

module pas_zawiasowy_skrzydla(szer_pasa, lewe = true) {
    gr_pasa = 1.3;
    wys_pasa = h_tulei_zawiasu;

    color(KOLOR_KRAT) {
        difference() {
            cylinder(r = r_tulei_zewn, h = h_tulei_zawiasu, $fn = 24);
            translate([0, 0, -1])
                cylinder(r = r_tulei_wewn, h = h_tulei_zawiasu + 2, $fn = 24);
        }

        if (lewe) {
            translate([0, -r_tulei_zewn + 0.1, 0])
                cube([szer_pasa, gr_pasa, wys_pasa]);
            for (nx = [10, 22, 34]) {
                if (nx < szer_pasa - 4) {
                    translate([nx, -r_tulei_zewn - 0.2, wys_pasa/2])
                        rotate([-90, 0, 0])
                            cylinder(r = 1.1, h = 0.8, $fn = 12);
                }
            }
        } else {
            translate([-szer_pasa, -r_tulei_zewn + 0.1, 0])
                cube([szer_pasa, gr_pasa, wys_pasa]);
            for (nx = [10, 22, 34]) {
                if (nx < szer_pasa - 4) {
                    translate([-nx, -r_tulei_zewn - 0.2, wys_pasa/2])
                        rotate([-90, 0, 0])
                            cylinder(r = 1.1, h = 0.8, $fn = 12);
                }
            }
        }
    }
}

module skrzydlo_wrot(szer, wys, lewe = true) {
    gr = 2.8;
    color(KOLOR_DRZWI) {
        if (lewe) {
            translate([0, -r_tulei_zewn + 0.2, grubosc_podlogi + 1]) {
                difference() {
                    cube([szer, gr, wys]);
                    for (x = [8 : 8 : szer - 4]) {
                        translate([x, -0.1, 0])
                            cube([0.8, 0.8, wys]);
                    }
                }
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
            translate([-szer, -r_tulei_zewn + 0.2, grubosc_podlogi + 1]) {
                difference() {
                    cube([szer, gr, wys]);
                    for (x = [8 : 8 : szer - 4]) {
                        translate([x, -0.1, 0])
                            cube([0.8, 0.8, wys]);
                    }
                }
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

    translate([0, 0, z_zawias_dolny_wrot + 3.0])
        pas_zawiasowy_skrzydla(szer * 0.75, lewe = lewe);
    translate([0, 0, z_zawias_gorny_wrot + 3.0])
        pas_zawiasowy_skrzydla(szer * 0.75, lewe = lewe);
}

module drzwi_boksu_holenderskie() {
    szer = szerokosc_drzwi_boksu - luz*2;
    wys = wysokosc_drzwi_boksu - luz;
    gr = 2.6;
    wys_dolna = 52;

    color(KOLOR_DRZWI) {
        translate([0, -r_tulei_zewn + 0.1, grubosc_podlogi + 1]) {
            cube([szer, gr, wys_dolna]);
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

    color(KOLOR_KRAT) {
        liczba_szczeblin = 6;
        krok = (szer - 6) / (liczba_szczeblin + 1);
        for (k = [1 : liczba_szczeblin]) {
            translate([3 + k * krok, 0, grubosc_podlogi + 1 + wys_dolna])
                cylinder(r = 1.0, h = wys - wys_dolna - 3, $fn = 12);
        }
    }

    translate([0, 0, z_zawias_dolny_boksu + 2.5])
        pas_zawiasowy_skrzydla(szer * 0.7, lewe = true);
    translate([0, 0, z_zawias_gorny_boksu + 2.5])
        pas_zawiasowy_skrzydla(szer * 0.7, lewe = true);
}

module okno_pojedyncze() {
    szer = szerokosc_okna - luz*2;
    wys = wysokosc_okna - luz*2;
    gr_ramy = grubosc_sciany;
    szer_profilu = 3.5;
    gr_kolnierza = 1.4;

    color(KOLOR_OKIEN) {
        difference() {
            union() {
                translate([-szer/2, -gr_ramy/2, -wys/2])
                    cube([szer, gr_ramy, wys]);
                translate([-(szer + 5)/2, -gr_ramy/2 - gr_kolnierza, -(wys + 5)/2])
                    cube([szer + 5, gr_kolnierza, wys + 5]);
            }
            translate([-(szer - 2*szer_profilu)/2, -gr_ramy - 2, -(wys - 2*szer_profilu)/2])
                cube([szer - 2*szer_profilu, gr_ramy*2 + 4, wys - 2*szer_profilu]);
        }
    }

    color(KOLOR_KRAT) {
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

// =====================================================================
// WIDOK MONTAŻOWY SEGMENTU (Exploded View)
// =====================================================================
module rozstrzelony_segment() {
    translate([-szerokosc_korytarza/2 - szerokosc_boksu, 0, 0])
        panel_podlogi_boksu(lewy = true);
    translate([-szerokosc_korytarza/2, 0, 0])
        panel_podlogi_korytarza();
    translate([szerokosc_korytarza/2, 0, 0])
        panel_podlogi_boksu(lewy = false);

    translate([-szerokosc_korytarza/2 - szerokosc_boksu - eksplozja, 0, eksplozja * 0.4])
        panel_sciany_bocznej();
    translate([szerokosc_korytarza/2 + szerokosc_boksu - grubosc_sciany + eksplozja, 0, eksplozja * 0.4])
        panel_sciany_bocznej();

    translate([-szerokosc_korytarza/2 - szerokosc_boksu - eksplozja*1.6, dlugosc_boksu/2, wysokosc_parapetu + wysokosc_okna/2])
        rotate([0, 0, -90]) okno_pojedyncze();
    translate([szerokosc_korytarza/2 + szerokosc_boksu + eksplozja*1.6, dlugosc_boksu/2, wysokosc_parapetu + wysokosc_okna/2])
        rotate([0, 0, 90]) okno_pojedyncze();

    translate([-szerokosc_korytarza/2 - szerokosc_boksu, -eksplozja*0.5, eksplozja * 0.6])
        panel_przegrody_boksu();
    translate([szerokosc_korytarza/2, -eksplozja*0.5, eksplozja * 0.6])
        panel_przegrody_boksu();

    translate([-szerokosc_korytarza/2 + 10, 0, eksplozja * 0.5])
        panel_frontu_boksu(lewy = true);
    translate([szerokosc_korytarza/2 - grubosc_sciany - 10, 0, eksplozja * 0.5])
        panel_frontu_boksu(lewy = false);

    translate([-szerokosc_korytarza/2 + 15, dlugosc_boksu - 4, eksplozja * 0.5])
        rotate([0, 0, 90]) drzwi_boksu_holenderskie();
    translate([szerokosc_korytarza/2 - 15, dlugosc_boksu - 4, eksplozja * 0.5])
        rotate([0, 0, -90]) drzwi_boksu_holenderskie();

    translate([0, 0, wysokosc_scian + grubosc_podlogi + eksplozja * 1.5])
        segment_dachu();
}

// =====================================================================
// MODEL FIGURKI KONIA UŻYTKOWNIKA (Zaimportowany bezpośrednio z pliku STL)
// Wymiary rzeczywiste: długość = 171.0 mm, szerokość = 50.0 mm, wysokość = 149.9 mm
// =====================================================================
sciezka_konia_stl = "/home/bnowak/Pobrane/horse+ready_stls (2)/obj_1_horse ready.stl_A.stl";

module figurka_konia_schleich(kolor_konia = KOLOR_KONIA_1) {
    color(kolor_konia) {
        // Wycentrowanie modelu STL i osadzenie kopyt dokładnie na podłodze Z=0
        translate([-175, -160, 0])
            import(sciezka_konia_stl);
    }
}

module rozmiesc_konie() {
    translate([-szerokosc_korytarza/2 - szerokosc_boksu/2, dlugosc_boksu * 0.5, grubosc_podlogi])
        rotate([0, 0, -20])
            figurka_konia_schleich(kolor_konia = KOLOR_KONIA_1);

    translate([0, dlugosc_boksu * 0.3, grubosc_podlogi])
        rotate([0, 0, 0])
            figurka_konia_schleich(kolor_konia = KOLOR_KONIA_2);

    if (liczba_segmentow > 1) {
        translate([szerokosc_korytarza/2 + szerokosc_boksu/2, dlugosc_boksu * 1.5, grubosc_podlogi])
            rotate([0, 0, 160])
                figurka_konia_schleich(kolor_konia = [0.15, 0.14, 0.14]);
    }
}

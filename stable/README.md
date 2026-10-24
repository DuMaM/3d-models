# Horse Stable 3D Printable Collection (1:24 Scale — Schleich Compatible)

A comprehensive parametric 3D model system designed in **OpenSCAD** for 1:24 scale model horses (Schleich, CollectA, Safari Ltd., Breyer 1:24, and custom 3D printed horses up to $150\text{ mm}$ tall).

[![OpenSCAD](https://img.shields.io/badge/OpenSCAD-2021.01+-blue.svg)](https://openscad.org)

---

## Stable Variants

This repository provides two distinct architectural variations to match different 3D printer build volumes and modeling preferences:

```
stable/
├── modular/      <-- Recommended for QIDI Q1 Pro (245x245 mm) & infinite stall expansion
└── standard/     <-- Complete monolithic shell for large-format printers (350x200 mm+)
```

---

### 1. 🧩 [Modular Horse Stable (`stable/modular/`)](modular/)
**Optimized for QIDI Q1 Pro ($245 \times 245 \times 240\text{ mm}$) and Standard 3D Printers**

| Modular Stable Overview | Interior Bay Stalls View |
| :---: | :---: |
| [![Modular Overview](modular/stable_overview.png)](modular/) | [![Modular Interior](modular/stable_interior.png)](modular/) |

* **100% QIDI Q1 Pro Compatible:** Every component is under $200\text{ mm}$ (leaving a safe $45\text{ mm}$ margin on $245\text{ mm}$ beds).
* **Infinite Dovetail Expansion:** Expand from 2 stalls to 4, 6, 8 or more stalls by chaining modular bay segments.
* **Multi-Color Printing Without AMS/MMU:** Pre-arranged into filament color plates (wood brown, concrete gray, facade cream, terracotta red, anthracite iron).
* **Indestructible 1.75 mm Filament-Pin Knuckle Hinges:** Eliminates fragile 3D-printed pintle pins that snap along layer lines. Interlocking multi-knuckles use a standard scrap snippet of 1.75 mm 3D printer filament (or metal rod) as a continuous pivot pin with blind bottom stop and 45° top lead-in chamfer.
* **Assembly Manual:** Step-by-step assembly guide included in [`ASSEMBLY.md`](modular/ASSEMBLY.md).

👉 **[Go to Modular Stable Details, STLs & Assembly Guide](modular/)**

---

### 2. 🏛️ [Standard Monolithic Stable (`stable/standard/`)](standard/)
**Designed as Complete Structural Assemblies for Large-Format 3D Printers**

| Standard Monolithic Overview | Interior Overview |
| :---: | :---: |
| [![Standard Overview](standard/stable_overview.png)](standard/) | [![Standard Interior](standard/stable_interior.png)](standard/) |

* **Monolithic Structure:** Exterior walls, stall dividers, and floor base are unified into single rigid subassemblies.
* **Minimum Assembly:** Print the walls, print the roof, drop the doors onto the hinges, and the stable is ready.
* **Requires Large Build Volume:** Wall shell footprint is $353 \times 168 \times 140\text{ mm}$ (requires $\ge 350\text{ mm}$ bed, or scaling).
* **Lift-Off Roof & Flat Slopes:** Full removable roof with flat-printable slope options.

👉 **[Go to Standard Stable Details & STLs](standard/)**

---

## Comparison Summary

| Feature | [Modular Stable](modular/) | [Standard Stable](standard/) |
|---|---|---|
| **Target Build Volume** | $245 \times 245 \times 240\text{ mm}$ (QIDI Q1 Pro, Ender 3, Bambu P1/X1) | $\ge 350 \times 200 \times 150\text{ mm}$ (Large format / scaled) |
| **Max Single Part Size** | $\le 200\text{ mm}$ | $353\text{ mm}$ |
| **Expansion System** | Modular bay segments with dovetail joints (2, 4, 6, 8+ stalls) | Fixed 2-stall shell (parameterized in SCAD) |
| **Multi-Color Friendly** | Yes (organized by spool color batches without AMS) | Requires multi-toolhead/AMS or painting |
| **Assembly Required** | Moderate (guided tongue-and-groove + dovetails) | Minimal (drop-in doors & roof) |
| **Assembly Manual** | Included ([`ASSEMBLY.md`](modular/ASSEMBLY.md)) | Single-step placement |

---

## Copyright

Copyright (c) 2026 **Bartosz Nowak**. All rights reserved.

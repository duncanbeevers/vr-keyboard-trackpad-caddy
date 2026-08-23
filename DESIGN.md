# Elevated Magic Trackpad & Logitech MX Keys Mini Lap Caddy
## System Design Document & Architectural Reference

This document serves as the single source of truth for the physical architecture, mechanical invariants, hardware tolerances, and 3D printing constraints of the **Monolithic Elevated Trackpad Shelf & MX Keys Mini Lap Caddy**.

Any agent or engineer modifying this codebase must adhere to the design principles and geometric constraints detailed below.

---

## 1. Project Overview & Design Philosophy

### 1.1 Objective
The assembly is an ergonomic lap dock engineered to securely hold a **Logitech MX Keys Mini** keyboard in the user's lap with an **Apple Magic Trackpad 2/3** elevated directly above and behind the keyboard's top function key row.

### 1.2 Core Mechanical Invariants
1. **One-Handed Lift Rigidity**: The user must be able to pick up the entire assembly by grabbing either the keyboard edge, lap runner, or trackpad tray with a single hand without flexing, twisting, or dropping either device.
2. **Zero-Rattle Positive Retention**:
   - The keyboard is captured between a continuous, full-width front retaining chin and deep, moment-resisting rear clamp jaws.
   - The trackpad drops snugly into a dedicated sloped perimeter tray with a rear finger push notch for easy removal.
3. **Monolithic Printability on Small Beds (Prusa Mini $180\times 180\times 180\text{ mm}$)**:
   - Eliminated fragile, loose modular dovetail joints.
   - The unified chassis is printed as a single monolithic part tilted diagonally ($45^\circ$ in $Z$, $-35^\circ$ in $X$), fitting within the Prusa Mini's $180\text{ mm}$ cubic build envelope ($311.7\text{ mm}$ space diagonal).
4. **Ergonomic Continuity**:
   - No sharp corners or scrape points.
   - All ground-contact runner edges feature uniform $2.0\text{ mm}$ fillets.
   - The trackpad glass sits uniformly $1.0\text{ mm}$ proud of the tray perimeter.
   - The power switch notch features waterfall convex round-overs and filleted trough bottoms for smooth fingertip access.

---

## 2. Hardware Geometry & Reference Models

| Device | Dimensions ($W \times D \times H$) | Key Geometric Features | Reference Model |
| :--- | :--- | :--- | :--- |
| **Logitech MX Keys Mini** | $296.0\text{ mm} \times 132.0\text{ mm} \times 20.5\text{ mm}$ | • Front chin thickness: $6.0 - 6.5\text{ mm}$<br>• Deck resting slope: $5.5^\circ$<br>• Rear cylindrical battery bar: $274\text{ mm}$ wide, $26\text{ mm}$ deep, $16.0\text{ mm}$ bar / $18.8\text{ mm}$ total rear height<br>• Corner radius: $12.0\text{ mm}$ | [`mx_keys_mini.scad`](mx_keys_mini.scad) |
| **Apple Magic Trackpad 2/3** | $160.0\text{ mm} \times 114.9\text{ mm} \times 10.9\text{ mm}$ | • Front edge height: $4.9 - 5.0\text{ mm}$<br>• Rear edge height: $10.9 - 11.5\text{ mm}$<br>• Wedge slope angle: $\approx 3.2^\circ$<br>• Vertical corner radius: $8.5\text{ mm}$<br>• Flat bottom face with 4 rubber feet ($d=7.5\text{ mm}$)<br>• Rear USB-C / Lightning port: Centered ($X = 0$)<br>• Rear power switch: $22\text{ mm}$ from right edge ($X = +58.0\text{ mm}$) | [`magic_trackpad.scad`](magic_trackpad.scad) |

---

## 3. Structural Subsystems & Assemblies

```
+-----------------------------------------------------------------------------------+
|                            ELEVATED TRACKPAD SHELF                                |
|  - Sloped perimeter tray matching 3.2° Magic Trackpad wedge                       |
|  - Glass sits 1.0mm proud at all perimeter points                                 |
|  - Rear USB-C port cutout (X=0) & Waterfall power switch notch (X=+58mm)          |
|  - Semicircular push hole (Ø30mm) accessible from unobstructed rear               |
+-----------------------------------------------------------------------------------+
                                         │
                         [CANTILEVER RISER STRUTS]
                         - Thick structural hull (10mm)
                         - Solid backplate crossbrace
                         - Elevation: +46.0mm | Tilt: 6.0° forward
                                         │
+-----------------------------------------------------------------------------------+
|                        MOMENT-RESISTING REAR BATTERY JAWS                         |
|  - 14.0mm heavy fulcrum wall | 5.5mm top clamping beam                            |
|  - 13.5mm forward overhang (>50% battery bar depth) with entry lead-in chamfer    |
|  - 19.8mm pocket height angled at 5.5° deck slope                                 |
+-----------------------------------------------------------------------------------+
                                         │
+-----------------------------------------------------------------------------------+
|                            KEYBOARD LAP CRADLE BASE                               |
|  - Twin full-length lap runners (26mm wide, 5mm thick, 114mm center spacing)      |
|  - Full-width continuous front retaining chin (140mm wide, 7.6mm sloped pocket)   |
|  - High-stiffness X-crossbrace linking lap runners across the lap span            |
|  - Continuous 2.0mm bottom corner fillets across all ground-contact edges         |
+-----------------------------------------------------------------------------------+
```

### 3.1 Keyboard Lap Cradle Base
- **Runners (`single_monolithic_runner`)**:
  - Twin continuous rails spanning from `front_y - FRONT_LIP_WALL` to `rear_y + REAR_JAW_WALL`.
  - Width: `RUNNER_WIDTH = 26.0mm`; Thickness: `RUNNER_THICKNESS = 5.0mm`; Spacing: `STRUT_SPACING = 114.0mm`.
  - All bottom perimeter edges have `CORNER_R = 2.0mm` round-overs for comfort on thighs/legs.
- **Continuous Front Retaining Chin (`continuous_front_retaining_chin`)**:
  - Full-width monolithic beam spanning $140.0\text{ mm}$ across the entire front of both runners, grounded directly from $Z = 0$ (the print bed) to $Z = \text{FRONT\_LIP\_HEIGHT} = 14.8\text{ mm}$.
  - Subtractive retention pocket carved above `RUNNER_THICKNESS = 5.0mm` angled at `KB_TILT_ANGLE = 5.5°` with a calibrated `FRONT_LIP_GAP = 7.6mm` opening.
  - **Trough Floor Continuity**: The internal floor of the front pocket is $100\%$ flat and coplanar with the top face of the runner struts (`Z = RUNNER_THICKNESS = 5.0mm`), preventing any ridge or step, while the base beneath it is a solid grounded beam resting on the build plate.
  - Overhang catch depth: `FRONT_CATCH_DEPTH = 3.5mm`.
  - All outer ground-contact edges feature matching `CORNER_R = 2.0mm` fillets (`FRONT+BOT`, `LEFT+BOT`, `RIGHT+BOT`).
- **Lap Crossbracing (`x_lap_crossbrace`)**:
  - Diagonal X-truss bridging the left and right runners between the front crossbar and rear battery anchor.
  - Bounds remain cleanly inside runner boundaries so the outer side rails remain smooth.
- **Rear Battery Clamp Jaws (`rear_battery_jaw`)**:
  - Beefy upright clamping blocks (`REAR_JAW_WALL = 14.0mm`, `REAR_JAW_TOP_THICKNESS = 5.5mm`).
  - Pocket height: `KB_BATTERY_BAR_HEIGHT = 19.8mm` angled at $5.5^\circ$, providing a snug fit with $1.0\text{ mm}$ play for the $18.8\text{ mm}$ battery bar.
  - Overhang: `REAR_JAW_OVERHANG = 13.5mm` (encapsulating $>50\%$ of the battery bar depth) with a $30^\circ$ entry lead-in chamfer for easy slide-in insertion.

### 3.2 Cantilever Riser Struts & Backplate
- **Cantilever Risers (`single_integrated_riser`)**:
  - Continuous monolithic structural hull (`RISER_THICKNESS = 10.0mm`) directly enveloping the top and back wall of the rear battery jaw (`Z = 30.8mm`) and terminating smoothly under the trackpad tray (`Z = 46.0mm`).
- **Torsional Backplate (`riser_struts`)**:
  - Solid, continuous angled backplate connecting the twin cantilever risers across the $114\text{ mm}$ span to resist bending and torsional racking during one-handed lift.
- **Clearance Geometry**:
  - Elevation: `SHELF_ELEVATION_Z = 46.0mm` (leaves ample vertical space to reach the keyboard's top function row).
  - Setback: `SHELF_SETBACK_Y = 16.0mm` behind the keyboard rear edge.
  - Forward tilt: `SHELF_TILT_ANGLE = 6.0°`.

### 3.3 Sloped Trackpad Tray
- **Sloped Rim Profile**:
  - Top rim is planar-trimmed at the trackpad's exact wedge angle ($\approx 3.2^\circ$) with `LIP_RECESS = 1.0mm`:
    - **Front wall height**: $4.0\text{ mm}$ above tray floor ($1.0\text{ mm}$ lower than trackpad front height $5.0\text{ mm}$).
    - **Rear wall height**: $10.5\text{ mm}$ above tray floor ($1.0\text{ mm}$ lower than trackpad rear height $11.5\text{ mm}$).
  - Glass top surface remains slightly proud around the entire perimeter, eliminating wrist/palm bumping.
- **Flat Cavity Floor**:
  - Cavity corner rounding is strictly in the vertical Z-plane (`rounding = TP_CORNER_R, edges = "Z"`).
  - Cavity bottom-to-wall intersection is a crisp $90^\circ$ square corner (no filleted "bowl"), allowing the flat-bottomed Magic Trackpad to seat fully flat.
- **Ports & Controls**:
  - **Rear Charging Port**: Centered at $X = 0$ (`TP_PORT_WIDTH = 14.0mm`, `TP_PORT_HEIGHT = 7.5mm`).
  - **Power Switch Notch (`power_switch_smooth_notch`)**: Positioned at $X = \text{TP\_WIDTH}/2 - 22.0\text{ mm} = +58.25\text{ mm}$ (`switch_width = 18.0mm`) with convex rounded-over top lips ($r=2.5\text{ mm}$) and concave base trough fillets ($r=2.0\text{ mm}$).
  - **Rear Push Notch**: Semicircular cutout ($\varnothing 30\text{ mm}$) extending into the rear open zone behind the keyboard, allowing the user to reach underneath and pop out the trackpad.

---

## 4. File Architecture & Slicing / Print Guide

### 4.1 File Inventory
- [`main.scad`](main.scad): Master OpenSCAD / BOSL2 source file containing the complete monolithic caddy model.
- [`elevated_shelf_spike.scad`](elevated_shelf_spike.scad): Spike development model with full feature set.
- [`mx_keys_mini.scad`](mx_keys_mini.scad): Standalone reference model for Logitech MX Keys Mini.
- [`magic_trackpad.scad`](magic_trackpad.scad): Standalone reference model for Apple Magic Trackpad 2/3.

### 4.2 Slicing & Print Orientation
- **Render Mode Selector**:
  - `MODE = "assembled"`: Standard horizontal view with devices visible in `$preview`.
  - `MODE = "single_piece_diagonal"`: Optimized 3D printing orientation:
    ```openscad
    translate([0, 0, BED_Z / 2])
        zrot(45)
            xrot(-35)
                monolithic_assembly();
    ```
- **Prusa Mini Bounding Box**:
  - Bed Volume: $180\text{ mm} \times 180\text{ mm} \times 180\text{ mm}$ ($311.7\text{ mm}$ space diagonal).
  - Monolithic Assembly 3D Diagonal: $\approx 276.5\text{ mm} \le 311.7\text{ mm}$.
- **Print Recommendations**:
  - **Material**: PETG or PLA+ (PETG recommended for structural flex resistance and layer adhesion).
  - **Infill**: 20% - 25% Gyroid with 3 to 4 perimeters for high bending stiffness.
  - **Supports**: Organic / tree supports under the elevated cantilever overhangs.

---

## 5. Verification Commands

To verify and re-render visual checkpoints from the command line:

```bash
# Isometric View (with devices installed)
/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o spike_iso.png --imgsize=1200,900 --projection=p --camera=0,-140,70,55,0,25,650 main.scad

# Side Profile (checking clearances and 5.5° / 6.0° angles)
/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o spike_side.png --imgsize=1200,900 --projection=o --camera=0,30,20,90,0,-90,450 main.scad

# Trackpad Top View (checking ports, power switch, and tray perimeter)
/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o spike_tray_top.png --imgsize=1200,900 --projection=p --camera=40,54,57,60,0,40,230 main.scad

# Prusa Mini Diagonal Print Bed Fit View
/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o spike_tilted_mini.png --imgsize=1200,900 --projection=p --camera=20,-20,80,45,0,35,420 -D 'MODE="single_piece_diagonal"' -D 'SHOW_BED_BOUNDS=true' main.scad
```

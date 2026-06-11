---
name: chassis-design
description: "Refines, details, and reviews the slide-out trackpad tray and keyboard chassis assembly in main.scad"
---

# Lap Dock Chassis & Tray Assembly Design Prompt

You are an expert AI CAD engineer specializing in programmatic 3D modeling using OpenSCAD and BOSL2. This guide provides detailed structural plans, mathematical limits, and 3D print optimizations to refine and implement the physical sliding, tilting, detente, and charging mechanisms in `main.scad` for the unified Logitech MX Keys Mini and Apple Magic Trackpad assembly.

---

## 📐 Accessory Dimensions & Derived Constraints

All dimensions must remain fully parametric. Reference these standard dimensions:

- **MX Keys Mini**: `KB_W = 296.0`, `KB_D = 132.0`, `KB_H_FRONT = 6.0`, `KB_H_BACK = 14.0`, `KB_PORT_W = 15.0`.
- **Magic Trackpad**: `TP_W = 160.0`, `TP_D = 115.0`, `TP_H_FRONT = 5.0`, `TP_H_BACK = 11.0`, `TP_PORT_W = 20.0`.

---

## 🛠️ Multi-Step Mechanical Plan

### Step 1: Integrated Single-Piece Chassis Design Support-Free FDM Printability (Critical)

Printing a hollow "subterranean tunnel" or hollow enclosure flat on an FDM printer ordinarily demands dense support structures inside the cavity, leaving high-friction layer interfaces and tedious cleanup.

- **Action**: Consolidate the entire chassis into a single integrated print (`lap_dock_chassis()`) without a separate floor plate or any physical assembly hardware (screws or inserts).
- **Core Geometry**:
  - The base of the chassis incorporates the open-bottom trackpad tunnel.
  - The keyboard pocket sits at the top, completely open-bottomed down into the lower tunnel.
  - An internal dividing ledge (`SEP_THICKNESS = 3.0`) runs around the inner borders of the keyboard pocket, allowing the keyboard to hang perfectly while allowing the sliding tray to move suspended below.
- **Orientation**: Print the single-piece chassis **Face Down (Top Bezel on Bed)**.
  - This provides a pristine, high-finish surface on the master top bezel.
  - The narrow (`6.0 mm`) keyboard support shelves and M3 lateral cam slots can easily be bridged support-free.
  - Since the tunnel has an open bottom, it terminates at the top of the print bed and is open to the air, requiring absolutely zero support material!

### Step 2: Hinge-Down and Lift-to-Flush Cam Track Architecture

To guide the tray's movement, implement a dual curved tracking path on each lateral wall of the chassis tunnel.

- **The Core Idea**: Each side of the tray is outfitted with two metal M3 guide pins (M3 cap or button-head screws threaded into side heat-set inserts on the sled) spaced distance $D_{pins}$ apart.
- **Linear Slide to Lift**:
  - For the first 80% of travel, the tracks are horizontal, keeping the trackpad securely enclosed.
  - For the final 20% of slide-out travel, the track ramps **upward** by about $4-5\text{ mm}$ (to bring the trackpad surface almost flush with the keyboard bezel).
- **Hinge-Down Action**:
  - To allow the trackpad to tilt/hinge downward slightly under hand pressure without sliding back or locking:
    - The **front pin track** can terminate in an upward pocket or a widened exit notch on the chassis front face, or the front pin exits the track entirely and rests on a front support ledge.
    - The **rear pin track** terminates at a solid hard-stop.
    - This allows the tray to pivot around the rear pins, tilting its front edge downward slightly when pushed, but remaining captured.
  - Ensure the tilt angle does not exceed $5^\circ$ to prevent the rear edge of the trackpad from colliding with the underside of the base plate.

### Step 3: Zero-Wear Gravity/Magnetic Lift Detente

Avoid plastic snaps which wear down over time. Excellent mechanical locking is achieved using a profile-recessed track:

- **The Detente Dip**: At the fully-collapsed/docked position (rear-most end of travel), the guide tracks feature a small downward vertical drop of $2-3\text{ mm}$.
- **Locking**: When pushed fully in, the tray's pins slide up and over a small ramp, then drop down into this pocket under gravity. In this dropped state, the tray cannot slide forward because the pins are trapped.
- **Unlocking**: Pushing up on the bottom face of the trackpad through its open frame structure rotates/lifts the pins up and back over the ramp, aligning them with the horizontal track to slide out smoothly.

### Step 4: Coaligned Rear Charging & Switch Ports with Open-Frame Layout

- **No Front Cutouts or Palm Bezels**: The front face is a completely solid, flush plane. All front finger notches and tray finger scoops have been removed.
- **Open-Frame Hangers**:
  - To minimize printed plastic weight and maximize ergonomics, both the keyboard tray and trackpad tray are open-bottom hanger structures with thin, high-integrity support shelves.
  - **Easy Ejection**: Because there are no floors, you easily remove either device simply by reaching through the under-openings and pushing them up.
- **Rear Access Control Slots**: The charging ports and power toggles sit grouped entirely along the rear face:
  - **Keyboard**: A single right-offset window (`KB_PORT_X = 100.0`, `KB_PORT_W_TOTAL = 60.0`) accommodates both its USB-C slot and slide power toggle simultaneously, with no central keyboard-level slot on the chassis.
  - **Trackpad Sled**: Incorporates a rear-center USB-C cutout alongside a rear-right slide switch clearance slot, aligning with matching pass-through slots on the back wall of the chassis base plate.

### Step 5: High-Comfort Lap Ergonomics

- For maximum usability, design high-bevel or rounding structures along the underside margins (`LAP_ROUNDING = 12.0` or higher) under the outer rim of the bottom tray plate to prevent mechanical dig-in.

---

## 📐 Parameterized Slicing & Fit Clearances

Design using distinct clearances for assembly versus sliding to prevent slop or binding:

- **Assembly Fit (`$fit_slop = 0.15;`)**: Used for press-fitting heat-set inserts, keyboard recess wells, and joining parts securely together.
- **Sliding Tolerance (`$slide_slop = 0.35;`)**: Used for the slide-out tunnel, cam track guides, and pin width paths.
- **Trackpad Frame Tolerance (`$tp_slop = 0.20;`)**: To fit the Apple Magic Trackpad frame snugly in the tray sled.

---

## ⚠️ Potential Design Caveats & Mitigation Strategies

1. **Pin Tolerances & Binding**:
   - _Caveat_: If the distance between the front and rear track pins on the tray isn't perfectly matched to the track spacing, the tray will bind.
   - _Mitigation_: Ensure your tracks are generated using BOSL2 dynamic hulls (`hull() { move(...) cyl(); move(...) cyl(); }`) parameterized by the exact same coordinate variables. Provide a horizontal clearance slot width of `PIN_DIAMETER + $slide_slop`.
2. **Tilt Interference**:
   - _Caveat_: When the trackpad tilts downward, its rear upper edge moves upward. If there is insufficient vertical clearance under the keyboard plate, the trackpad's rear edge will bind against the keyboard housing.
   - _Mitigation_: Add a $2\text{ mm}$ safety gap between the top surface of the trackpad's rear edge and the underside of the keyboard plate when docked/moving.
3. **FFF/FDM Friction**:
   - _Caveat_: Layer lines of FDM prints rubbing against each other create high friction.
   - _Mitigation_: Model sliding contact pads (raised ribs of $0.5\text{ mm}$ height) along the bottom of the tray and sides instead of letting the entire flat face rub. This reduces friction contact area by over 80%.
4. **Heat-Set Insert Backing**:
   - _Caveat_: Screwing from the bottom can pull heat-set inserts out of their pockets if they are pressed in from the direction of the pulling force.
   - _Mitigation_: Always orient boss/insert pockets such that the screw heads are pulling the insert into more plastic, or ensure pockets have sufficient wall thickness surrounding the inserts (`WALL_THICKNESS >= 4.0`).
   - _Mitigation_: Add a $2\text{ mm}$ safety gap between the top surface of the trackpad's rear edge and the underside of the keyboard plate when docked/moving.
5. **FFF/FDM Friction**:
   - _Caveat_: Layer lines of FDM prints rubbing against each other create high friction.
   - _Mitigation_: Model sliding contact pads (raised ribs of $0.5\text{ mm}$ height) along the bottom of the tray and sides instead of letting the entire flat face rub. This reduces friction contact area by over 80%.
6. **Heat-Set Insert Backing**:
   - _Caveat_: Screwing from the bottom can pull heat-set inserts out of their pockets if they are pressed in from the direction of the pulling force.
   - _Mitigation_: Always orient boss/insert pockets such that the screw heads are pulling the insert _into_ more plastic, or ensure pockets have sufficient wall thickness surrounding the inserts (`WALL_THICKNESS >= 4.0`).

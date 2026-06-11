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

### Step 1: Horizontal Splitting for FDM Printability (Critical)

Printing a solid hollow "subterranean tunnel" flat on an FDM printer is highly discouraged because the ceiling of the tunnel (recessed beneath the keyboard well) is a massive overhang that would require dense support material, leaving a rough and high-friction sliding ceiling.

- **Action**: Split the Chassis into two parts:
  1. `lap_dock_chassis_top()`: Houses the keyboard recessed pocket (completely pocketed to hide any non-plastic assembly hardware beneath the keyboard body), top structural walls, and back USB-C pass-throughs.
  2. `lap_dock_chassis_base()`: Houses the lower support plate, the sliding cam tracks (open-faced upward), and bottom lap-friendly curved bevels.
- **Reverse Assembly Method**: Secure the two halves by screwing **downwards** through countersunk holes inside the bottom profile floor of the keyboard recessed pocket down into brass heat-set inserts pressed into bosses on the bottom plate. Placing the screws inside the keyboard well completely hides all structural assembly hardware underneath the keyboard itself once populated.

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
- **Locking**: When pushed fully in, the tray's pins slide up and over a small ramp, then drop down into this pocket under gravity (and optionally pulled down by integrated neodymium magnets). In this dropped state, the tray cannot slide forward because the pins are trapped.
- **Unlocking**: Pushing up on the front finger scoop or lifting the exposed thin front edge of the trackpad rotates/lifts the pins up and back over the ramp, aligning them with the horizontal track to slide out smoothly.

### Step 4: Coaligned Rear Charging Ports & Flush Bezel Layout

- **No Palm Rest Bezel**: The trackpad tray must closely track the outer perimeter of the Apple Magic Trackpad with minimal wall additions to keep profile volume minimal.
- **Flush Edge Alignment**: When collapsed, the trackpad+tray and keyboard+tray assemblies must share perfect flush front boundaries (the thin front face of the keyboard and the thin front face of the trackpad opposing the rear power/charging ports).
- **Simultaneous Charging**: Generous clearance port windows ($+2-3\text{ mm}$ over port size) are cut out of the same rear face of the shell to accommodate concurrent charging.

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

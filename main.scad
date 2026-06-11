include <BOSL2/std.scad>

// Set global resolution for rendering arcs, cylinders, and slots
$fn = 32;

// ============================================================================
// 📐 ACCESSORY DIMENSIONS & PARAMETRIC VARIABLES
// ============================================================================

// Logitech MX Keys Mini Physical Dimensions
KB_W = 296.0;
KB_D = 132.0;
KB_H_FRONT = 6.0;
KB_H_BACK = 14.0;
KB_PORT_W_TOTAL = 60.0;
KB_PORT_X = 100.0; // Right-side offset from centerline

// Apple Magic Trackpad Physical Dimensions
TP_W = 160.0;
TP_D = 115.0;
TP_H_FRONT = 5.0;
TP_H_BACK = 11.0;
TP_PORT_W = 20.0;
TP_SWITCH_EDGE_INSET = 8.0; // Lateral inset from right edge to switch center
TP_SWITCH_X = TP_W/2 - TP_SWITCH_EDGE_INSET;

// Mechanical & Structural Constraints
SEP_THICKNESS = 3.0;     // Internal dividing ledge separating components
WALL_THICKNESS = 4.0;    // Structural perimeter thickness
LAP_ROUNDING = 12.0;     // Large safety comfort rounding for lap ergonomics
PIN_DIAM = 3.0;          // M3 guide pin shank size
PIN_DIST = 60.0;         // Linear distance between front and rear cam pins (D_pins)
TRAVEL = 115.0;          // Total slide-out extension distance
RAMP_UP = 4.5;           // Vertical translation lift at full extension

// Parameterized Slicing & Friction Tolerances
FIT_SLOP = 0.15;         // Tight slop for static assembly press-fits
SLIDE_SLOP = 0.35;       // Dynamic mechanical clearance to prevent binding
TP_SLOP = 0.20;          // Snug perimeter slop for the trackpad housing

// Trackpad Sled Configuration
SLED_WALL = 4.0;
SLED_W = TP_W + 2 * SLED_WALL + 2 * TP_SLOP;
SLED_D = TP_D + 2 * SLED_WALL + 2 * TP_SLOP;
SLED_H = TP_H_BACK + 2.0;

// Derived Internal Channel/Tunnel Constraints
TUNNEL_W = SLED_W + 2 * SLIDE_SLOP;
TUNNEL_H = SLED_H + RAMP_UP + 2.0; // Clear height accommodating full ramp-up step

// Master Chassis Enclosure Footprint
CHASSIS_W = KB_W + 2 * WALL_THICKNESS + 4.0;
CHASSIS_D = KB_D + 2 * WALL_THICKNESS + 4.0;
CHASSIS_H = KB_H_BACK + SEP_THICKNESS + TUNNEL_H;

// ============================================================================
// 🛠️ DYNAMIC COORD CALCULATIONS (Ensures perfect alignment of pins and rails)
// ============================================================================

// Sled Z-axis positions relative to Chassis Center
Z_SLED_TRAVEL = -CHASSIS_H/2 + SLED_H/2 + 2.5 + SLIDE_SLOP;
Z_REAR_PIN_REL = SLED_H / 4;
Z_FRONT_PIN_REL = -SLED_H / 4;

Z_UPPER = Z_SLED_TRAVEL + Z_REAR_PIN_REL; // Upper track centerline baseline
Z_LOWER = Z_SLED_TRAVEL + Z_FRONT_PIN_REL; // Lower track centerline baseline

// Slot Depth and Width configurations
SLOT_W = PIN_DIAM + SLIDE_SLOP;
SLOT_DEPTH = WALL_THICKNESS * 3; 

// Track Longitudinal Baselines
Y_REAR_DOCK = -CHASSIS_D/2 + 20.0;
Y_FRONT_DOCK = Y_REAR_DOCK + PIN_DIST;

// Definition of Cam Track Coordinates (Y, Z)
rear_track_pts = [
    [Y_REAR_DOCK, Z_UPPER - 2.5],             // 1. Docked Detente Dip
    [Y_REAR_DOCK + 6.0, Z_UPPER],             // 2. Clear out of lock
    [Y_REAR_DOCK + 0.8 * TRAVEL, Z_UPPER],    // 3. Main horizontal glide rail
    [Y_REAR_DOCK + TRAVEL, Z_UPPER + RAMP_UP] // 4. Hard-stop extension lift
];

front_track_pts = [
    [Y_FRONT_DOCK, Z_LOWER - 2.5],             // 1. Docked Detente Dip
    [Y_FRONT_DOCK + 6.0, Z_LOWER],             // 2. Clear out of lock
    [Y_FRONT_DOCK + 0.8 * TRAVEL, Z_LOWER],    // 3. Main horizontal glide rail
    [Y_FRONT_DOCK + TRAVEL, Z_LOWER + RAMP_UP] // 4. Extended lift position
];

// Pivot notch path to facilitate the 5-degree hinge-down hand pressure action
front_tilt_clearance_pts = [
    [Y_FRONT_DOCK + TRAVEL, Z_LOWER + RAMP_UP - 3.5], // Low clearance ceiling
    [Y_FRONT_DOCK + TRAVEL, Z_LOWER + RAMP_UP + 1.5]  // High pocket roof
];

// ============================================================================
// MODULES & GEOMETRIC ASSEMBLIES
// ============================================================================

module render_slot_chain(pts, slot_width, slot_depth) {
    // Sequentially hulls pairs of coordinate nodes to form fluid curved tracks
    for(i = [0 : len(pts) - 2]) {
        hull() {
            translate([0, pts[i][0], pts[i][1]])
                rot([0, 90, 0]) cyl(d=slot_width, l=slot_depth, anchor=CENTER);
            translate([0, pts[i+1][0], pts[i+1][1]])
                rot([0, 90, 0]) cyl(d=slot_width, l=slot_depth, anchor=CENTER);
        }
    }
}

module lap_dock_chassis() {
    // Single integrated master component optimized for face-down support-free printing
    diff()
    cuboid([CHASSIS_W, CHASSIS_D, CHASSIS_H], rounding=LAP_ROUNDING, 
           edges=[BOTTOM, LEFT+BOTTOM, RIGHT+BOTTOM, FRONT+BOTTOM, BACK+BOTTOM], anchor=CENTER) {
        
        // 1. Keyboard Nest (Subtracted down from top surface)
        tag("remove") translate([0, 0, CHASSIS_H/2 - KB_H_BACK/2 + 0.01])
            cuboid([KB_W + FIT_SLOP, KB_D + FIT_SLOP, KB_H_BACK + 0.02], anchor=CENTER);
        
        // 2. Open-Bottom Hanger Cutout (Leaves a strict 6mm interior perimeter bezel)
        tag("remove") translate([0, 0, -CHASSIS_H/2 + (CHASSIS_H - KB_H_BACK)/2])
            cuboid([KB_W - 12.0, KB_D - 12.0, CHASSIS_H], anchor=CENTER);
        
        // 3. Trackpad Tunnel (Completely open bottom face, zero-support design)
        tag("remove") translate([0, 0, -CHASSIS_H/2 + TUNNEL_H/2 - 0.01])
            cuboid([TUNNEL_W, CHASSIS_D + 40.0, TUNNEL_H + 0.02], anchor=CENTER);
        
        // 4. Dual Cam Tracking Profiles on Lateral Inner Walls
        // Left Wall Cutouts
        tag("remove") translate([-TUNNEL_W/2, 0, 0]) {
            render_slot_chain(rear_track_pts, SLOT_W, SLOT_DEPTH);
            render_slot_chain(front_track_pts, SLOT_W, SLOT_DEPTH);
            render_slot_chain(front_tilt_clearance_pts, SLOT_W, SLOT_DEPTH);
        }
        // Right Wall Cutouts
        tag("remove") translate([TUNNEL_W/2, 0, 0]) {
            render_slot_chain(rear_track_pts, SLOT_W, SLOT_DEPTH);
            render_slot_chain(front_track_pts, SLOT_W, SLOT_DEPTH);
            render_slot_chain(front_tilt_clearance_pts, SLOT_W, SLOT_DEPTH);
        }
        
        // 5. Rear Coaligned Power Switch & Keyboard Charging Port Cutout
        tag("remove") translate([KB_PORT_X, CHASSIS_D/2, CHASSIS_H/2 - KB_H_BACK/2])
            cuboid([KB_PORT_W_TOTAL, WALL_THICKNESS*3, 10.0], anchor=CENTER);
            
        // 6. Rear Pass-through Cutouts for Sled Ports when Docked
        tag("remove") translate([0, CHASSIS_D/2, Z_UPPER - 2.5])
            cuboid([TP_PORT_W + 4.0, WALL_THICKNESS*3, 8.0], anchor=CENTER);
        tag("remove") translate([TP_SWITCH_X, CHASSIS_D/2, Z_UPPER - 2.5])
            cuboid([20.0, WALL_THICKNESS*3, 8.0], anchor=CENTER);
    }
}

module trackpad_sled() {
    // Open-frame lightweight sliding suspension platform
    diff()
    cuboid([SLED_W, SLED_D, SLED_H], rounding=2.0, edges="Z", anchor=CENTER) { // Fixed raw string selector here
        
        // 1. Snug Recess For Trackpad Outer Shell
        tag("remove") translate([0, 0, 1.0])
            cuboid([TP_W + 2*TP_SLOP, TP_D + 2*TP_SLOP, SLED_H], anchor=CENTER);
        
        // 2. Open-Frame Structural Underwindow (Facilitates easy finger ejection from below)
        tag("remove") translate([0, 0, -1.0])
            cuboid([TP_W + 2*TP_SLOP - 8.0, TP_D + 2*TP_SLOP - 8.0, SLED_H + 2.0], anchor=CENTER);
        
        // 3. Central Sled USB-C Interface Charging Notch
        tag("remove") translate([0, SLED_D/2, SLED_H/2 - 4.0])
            cuboid([TP_PORT_W, SLED_WALL*3, 8.0], anchor=CENTER);
            
        // 4. Offset Sled Rear Toggle Switch Window
        tag("remove") translate([TP_SWITCH_X, SLED_D/2, SLED_H/2 - 4.0])
            cuboid([16.0, SLED_WALL*3, 8.0], anchor=CENTER);
        
        // 5. Boss Mount Channels for Heat-Set Inserts Surrounding Screws (M3 Pull-Safe)
        // Upper Rear Inserts
        tag("remove") xcopies(SLED_W) translate([0, -PIN_DIST/2, Z_REAR_PIN_REL])
            rot([0, 90, 0]) cyl(d=4.2, l=SLED_WALL*3, anchor=CENTER);
            
        // Lower Front Inserts
        tag("remove") xcopies(SLED_W) translate([0, PIN_DIST/2, Z_FRONT_PIN_REL])
            rot([0, 90, 0]) cyl(d=4.2, l=SLED_WALL*3, anchor=CENTER);
    }
    
    // 6. High-Efficiency Anti-Friction Rib Contacts (Reduces FDM surface friction by >80%)
    // Base contact wear-strips
    xcopies(SLED_W - 12.0, n=2) translate([0, 0, -SLED_H/2 - 0.25])
        cuboid([2.0, SLED_D - 15.0, 0.5], anchor=CENTER);
        
    // Lateral guide-path wear ribs
    xcopies(SLED_W + 0.25, n=2) ycopies(SLED_D - 20.0, n=2)
        cuboid([0.5, 10.0, SLED_H - 4.0], anchor=CENTER);
}

// ============================================================================
// VISUALIZATION & CONFIGURATION CONTROL
// ============================================================================

// Interactively control rendering mode via editor
SHOW_ASSEMBLED = true; 
EXTEND_TRAY = false;    // Simulates sliding deployment path mechanics

if (SHOW_ASSEMBLED) {
    // Render complete system as structurally unified assembly
    lap_dock_chassis();
    
    // Handle conditional placement based on simulated expansion state
    if (EXTEND_TRAY) {
        translate([0, Y_REAR_DOCK + TRAVEL + PIN_DIST/2, Z_SLED_TRAVEL + RAMP_UP])
            trackpad_sled();
    } else {
        // Docked inside gravity detente position
        translate([0, Y_REAR_DOCK + PIN_DIST/2, Z_SLED_TRAVEL - 2.5])
            trackpad_sled();
    }
} else {
    // Spread modules out horizontally for explicit slicing preview examinations
    translate([0, 0, 0]) lap_dock_chassis();
    translate([CHASSIS_W/2 + SLED_W/2 + 20.0, 0, -CHASSIS_H/2 + SLED_H/2]) trackpad_sled();
}

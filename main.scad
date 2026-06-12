include <BOSL2/std.scad>

// Set global resolution for rendering arcs, cylinders, and slots
$fn = 32;

// ============================================================================
// VISUALIZATION & CONFIGURATION CONTROL
// ============================================================================

// Optional non-printable hardware visualization
SHOW_NON_PRINTABLE_PINS = true;
PIN_COLOR = "gold";

// Visual finish palette
CHASSIS_COLOR = "lightgray";
CHASSIS_INNER_COLOR = "gainsboro";
TRAY_INNER_COLOR = "slategray";

// Interactively control rendering mode via editor
SHOW_ASSEMBLED = true; 
EXTEND_TRAY = false;    // Simulates sliding deployment path mechanics
RENDER_CHASSIS = true;  // Allows rendering chassis alone
RENDER_TRAY = true;     // Allows rendering trackpad sled alone
CUTAWAY_VIEW = false;   // Clips view to reveal internal geometry

// OpenSCAD animation controls ($t runs from 0.0 to 1.0)
ANIMATE_TRAY = true;
ANIM_EXTEND_PHASE = 0.62; // 0..62%: slide to ramp crest
ANIM_DROP_PHASE = 0.14;   // 62..76%: drop from crest into detent pocket
ANIM_DETENT_SETTLE_PHASE = 0.06; // Hold in detent before tilt starts
ANIM_TILT_DEG = 15.0;

// Cut-away clipping block settings
CUTAWAY_KEEP_RIGHT_HALF = true;
CUTAWAY_MARGIN = 20.0;

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
EXTEND_LIFT = RAMP_UP + 3.0; // Extra pop-up at full extension for flush rear-edge alignment
CAM_TRACK_DROP = 3.0;    // Lowers the entire sled/cam-track path to keep tray clear of chassis

// Parameterized Slicing & Friction Tolerances
FIT_SLOP = 0.15;         // Tight slop for static assembly press-fits
SLIDE_SLOP = 0.35;       // Dynamic mechanical clearance to prevent binding
TP_SLOP = 0.20;          // Snug perimeter slop for the trackpad housing

// Trackpad Sled Configuration
SLED_WALL = 4.0;
SLED_W = TP_W + 2 * SLED_WALL + 2 * TP_SLOP;
SLED_D = TP_D + 2 * SLED_WALL + 2 * TP_SLOP;
SLED_H = TP_H_BACK + 2.0;
SLED_REAR_EXTENSION = 14.0; // Extra rear wall extension to keep the hinge pin captured while the tray extends farther

// Derived Internal Channel/Tunnel Constraints
TUNNEL_W = SLED_W + 2 * SLIDE_SLOP;
TUNNEL_H = SLED_H + RAMP_UP + 2.0; // Clear height accommodating full ramp-up step

// Master Chassis Enclosure Footprint
CHASSIS_W = KB_W + 2 * WALL_THICKNESS + 4.0;
CHASSIS_D = KB_D + 2 * WALL_THICKNESS + 4.0;
CHASSIS_H = KB_H_BACK + SEP_THICKNESS + TUNNEL_H;
TOP_FRAME_H = KB_H_BACK + SEP_THICKNESS; // Minimal keyboard-only chassis head
TOP_FRAME_Z = CHASSIS_H/2 - TOP_FRAME_H/2;

// ============================================================================
// 🛠️ DYNAMIC COORD CALCULATIONS (Ensures perfect alignment of pins and rails)
// ============================================================================

// Sled Z-axis positions relative to Chassis Center
Z_SLED_TRAVEL = -CHASSIS_H/2 + SLED_H/2 + 2.5 + SLIDE_SLOP - CAM_TRACK_DROP;
Z_REAR_PIN_REL = SLED_H / 4;
Z_FRONT_PIN_REL = -SLED_H / 4;

Z_UPPER = Z_SLED_TRAVEL + Z_REAR_PIN_REL; // Upper track centerline baseline
Z_LOWER = Z_SLED_TRAVEL + Z_FRONT_PIN_REL; // Lower track centerline baseline

// Slot Depth and Width configurations
SLOT_W = PIN_DIAM + SLIDE_SLOP;
SLOT_DEPTH = WALL_THICKNESS * 3; 
PIN_PROTRUSION = 1.0; // Side protrusion of printed guide pins beyond sled outer wall

// Dedicated internal track-wall sizing (kept below keyboard ledge)
TRACK_WALL_W = WALL_THICKNESS;
TRACK_WALL_D = CHASSIS_D - 2*WALL_THICKNESS;
// Place wall centerlines just outside the tunnel envelope so tray sidewalls keep clearance.
TRACK_WALL_SPAN_X = TUNNEL_W + TRACK_WALL_W;
TRACK_WALL_Z = -CHASSIS_H/2 + TUNNEL_H/2 - 0.01;

// Track Longitudinal Baselines
FRONT_CLOSED_CLEARANCE = 1.0; // Keep sled front just inside chassis front when docked
Y_CLOSED_TRAY_CENTER = -CHASSIS_D/2 + SLED_D/2 + FRONT_CLOSED_CLEARANCE;
Y_REAR_DOCK = Y_CLOSED_TRAY_CENTER - PIN_DIST/2;
Y_FRONT_DOCK = Y_REAR_DOCK + PIN_DIST;

// Front retention geometry: ramp-up and end detent pocket.
FRONT_RAMP_START_FRAC = 0.82; // Fraction of travel where lift ramp begins
FRONT_DETENT_LEN = 7.0;       // Longitudinal distance from crest start to track end
FRONT_DETENT_FLOOR_LEN = 3.0; // Flat seated floor length at very end
FRONT_DETENT_DROP = 1.8;      // Vertical drop at detent floor vs ramp crest
FRONT_HINGE_POCKET_DROP = 3.5;
FRONT_HINGE_POCKET_RISE = 1.5;

// Clamp cam geometry to physical track-wall depth so ramp/detent stay inside rails.
TRACK_END_MARGIN = 4.0;
TRACK_FRONT_LIMIT = -TRACK_WALL_D/2 + TRACK_END_MARGIN;
MAX_TRACK_TRAVEL = max(0, Y_FRONT_DOCK - TRACK_FRONT_LIMIT);
EFFECTIVE_TRAVEL = min(TRAVEL, MAX_TRACK_TRAVEL);

// Definition of Cam Track Coordinates (Y, Z)
rear_track_pts = [
    [Y_REAR_DOCK, Z_UPPER - 2.5],                                  // 1. Docked detente dip
    [Y_REAR_DOCK - 6.0, Z_UPPER],                                  // 2. Clear out of lock
    [Y_REAR_DOCK - FRONT_RAMP_START_FRAC * EFFECTIVE_TRAVEL, Z_UPPER],       // 3. Main horizontal glide rail
    [Y_REAR_DOCK - EFFECTIVE_TRAVEL + FRONT_DETENT_LEN, Z_UPPER + EXTEND_LIFT], // 4. Front ramp crest
    [Y_REAR_DOCK - EFFECTIVE_TRAVEL + FRONT_DETENT_FLOOR_LEN, Z_UPPER + EXTEND_LIFT - FRONT_DETENT_DROP], // 5. Drop into detent
    [Y_REAR_DOCK - EFFECTIVE_TRAVEL, Z_UPPER + EXTEND_LIFT - FRONT_DETENT_DROP] // 6. Flat detent floor
];

front_track_pts = [
    [Y_FRONT_DOCK, Z_LOWER - 2.5],                                  // 1. Docked detente dip
    [Y_FRONT_DOCK - 6.0, Z_LOWER],                                  // 2. Clear out of lock
    [Y_FRONT_DOCK - FRONT_RAMP_START_FRAC * EFFECTIVE_TRAVEL, Z_LOWER],       // 3. Main horizontal glide rail
    [Y_FRONT_DOCK - EFFECTIVE_TRAVEL + FRONT_DETENT_LEN, Z_LOWER + EXTEND_LIFT], // 4. Front ramp crest
    [Y_FRONT_DOCK - EFFECTIVE_TRAVEL + FRONT_DETENT_FLOOR_LEN, Z_LOWER + EXTEND_LIFT - FRONT_DETENT_DROP], // 5. Drop into detent
    [Y_FRONT_DOCK - EFFECTIVE_TRAVEL, Z_LOWER + EXTEND_LIFT - FRONT_DETENT_DROP] // 6. Flat detent floor
];

FRONT_HINGE_POCKET_Y = Y_FRONT_DOCK - EFFECTIVE_TRAVEL + FRONT_DETENT_LEN;
FRONT_HINGE_POCKET_BOTTOM_Z = Z_LOWER + EXTEND_LIFT - FRONT_DETENT_DROP - FRONT_HINGE_POCKET_DROP;
FRONT_HINGE_POCKET_TOP_Z = Z_LOWER + EXTEND_LIFT - FRONT_DETENT_DROP + FRONT_HINGE_POCKET_RISE;

// Pivot notch path to facilitate the 5-degree hinge-down hand pressure action
front_tilt_clearance_pts = [
    [FRONT_HINGE_POCKET_Y, FRONT_HINGE_POCKET_BOTTOM_Z], // Bottom of hinge pocket directly below crest
    [FRONT_HINGE_POCKET_Y, FRONT_HINGE_POCKET_TOP_Z]     // Pocket roof / tilt clearance
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
    // Keyboard head frame: minimal-height shell sized only for the keyboard pocket.
    translate([0, 0, TOP_FRAME_Z])
    diff()
    cuboid([CHASSIS_W, CHASSIS_D, TOP_FRAME_H], anchor=CENTER) {

        // 1. Keyboard Nest (Subtracted down from top surface)
        tag("remove") translate([0, 0, TOP_FRAME_H/2 - KB_H_BACK/2 + 0.01])
            cuboid([KB_W + FIT_SLOP, KB_D + FIT_SLOP, KB_H_BACK + 0.02], anchor=CENTER);

        // 2. Open-bottom hanger cutout leaves a perimeter support shelf for keyboard.
        tag("remove") translate([0, 0, -TOP_FRAME_H/2 + (TOP_FRAME_H - KB_H_BACK)/2])
            cuboid([KB_W - 12.0, KB_D - 12.0, TOP_FRAME_H + 0.02], anchor=CENTER);

        // 3. Rear coaligned keyboard power/charging opening.
        tag("remove") translate([KB_PORT_X, CHASSIS_D/2, TOP_FRAME_H/2 - KB_H_BACK/2])
            cuboid([KB_PORT_W_TOTAL, WALL_THICKNESS*3, 10.0], anchor=CENTER);
    }

    // 7. Dedicated internal cam-track walls.
    // Positioned in the tunnel zone so they do not rise into the keyboard shelf volume.
    xcopies(TRACK_WALL_SPAN_X)
    translate([0, 0, TRACK_WALL_Z])
    diff()
    cuboid([TRACK_WALL_W, TRACK_WALL_D, TUNNEL_H], anchor=CENTER) {
        tag("remove") render_slot_chain(z_shifted_track(rear_track_pts, -TRACK_WALL_Z), SLOT_W, SLOT_DEPTH);
        tag("remove") render_slot_chain(z_shifted_track(front_track_pts, -TRACK_WALL_Z), SLOT_W, SLOT_DEPTH);
        tag("remove") render_slot_chain(z_shifted_track(front_tilt_clearance_pts, -TRACK_WALL_Z), SLOT_W, SLOT_DEPTH);
    }
}

module trackpad_sled() {
    // Open-frame lightweight sliding suspension platform
    union() {
        diff()
        cuboid([SLED_W, SLED_D, SLED_H], anchor=CENTER) { // Fixed raw string selector here
            
            // 1. Snug Recess For Trackpad Outer Shell
            tag("remove") translate([0, 0, 1.0])
                cuboid([TP_W + 2*TP_SLOP, TP_D + 2*TP_SLOP, SLED_H], anchor=CENTER);
            
            // 2. Open-Frame Structural Underwindow (Facilitates easy finger ejection from below)
            tag("remove") translate([0, 0, -1.0])
                cuboid([TP_W + 2*TP_SLOP - 8.0, TP_D + 2*TP_SLOP - 8.0, SLED_H + 2.0], anchor=CENTER);
            
            // 3. Central Sled USB-C Interface Charging Notch
            tag("remove") translate([0, SLED_D/2, SLED_H/2 - 4.0 + 0.01])
                cuboid([TP_PORT_W, SLED_WALL*3, 8.02], anchor=CENTER);
                
            // 4. Offset Sled Rear Toggle Switch Window
            tag("remove") translate([TP_SWITCH_X, SLED_D/2, SLED_H/2 - 4.0 + 0.01])
                cuboid([16.0, SLED_WALL*3, 8.02], anchor=CENTER);
            
            // 5. Through-bores for M3 guide pins (or screw shanks) on both side walls
            // Upper Rear Inserts
            tag("remove") xcopies(SLED_W) translate([0, -PIN_DIST/2, Z_REAR_PIN_REL])
                rot([0, 90, 0]) cyl(d=4.2, l=SLED_WALL*3, anchor=CENTER);
                
            // Lower Front Inserts
            tag("remove") xcopies(SLED_W) translate([0, PIN_DIST/2, Z_FRONT_PIN_REL])
                rot([0, 90, 0]) cyl(d=4.2, l=SLED_WALL*3, anchor=CENTER);
        }

        // Rear wall extensions on the back face (+Y) that give the hinge pins more trailing support
        // without blocking the center rear cutouts for power and USB access.
        xcopies(SLED_W - SLED_WALL) translate([0, SLED_D/2 + SLED_REAR_EXTENSION/2, 0])
            cuboid([SLED_WALL, SLED_REAR_EXTENSION, SLED_H], anchor=CENTER);
    }

    // 6. High-Efficiency Anti-Friction Rib Contacts (Reduces FDM surface friction by >80%)
    // Base contact wear-strips
    xcopies(SLED_W - 12.0, n=2) translate([0, 0, -SLED_H/2 - 0.25])
        cuboid([2.0, SLED_D - 15.0, 0.5], anchor=CENTER);
        
    // Lateral guide-path wear ribs
    xcopies(SLED_W + 0.25, n=2) ycopies(SLED_D - 20.0, n=2)
        cuboid([0.5, 10.0, SLED_H - 4.0], anchor=CENTER);
}

module non_printable_guide_pins() {
    // Visual-only hardware: side guide pins that run in chassis slots.
    color(PIN_COLOR)
    xcopies(SLED_W) {
        translate([0, -PIN_DIST/2, Z_REAR_PIN_REL])
            rot([0, 90, 0]) cyl(d=PIN_DIAM, l=SLED_WALL + 2*PIN_PROTRUSION, anchor=CENTER);
        translate([0, PIN_DIST/2, Z_FRONT_PIN_REL])
            rot([0, 90, 0]) cyl(d=PIN_DIAM, l=SLED_WALL + 2*PIN_PROTRUSION, anchor=CENTER);
    }
}

module chassis_colored() {
    color(CHASSIS_COLOR)
        lap_dock_chassis();

    // Subtle accent pass for interior tunnel and cavity faces.
    color(CHASSIS_INNER_COLOR)
    intersection() {
        lap_dock_chassis();
        translate([0, 0, -CHASSIS_H/2 + TUNNEL_H/2 - 0.01])
            cuboid([TUNNEL_W + 0.2, CHASSIS_D + 40.2, TUNNEL_H + 0.24], anchor=CENTER);
    }
}

module tray_colored() {
    trackpad_sled();

    // Accent pass for inner tray frame surfaces around the trackpad pocket.
    color(TRAY_INNER_COLOR)
    intersection() {
        trackpad_sled();
        translate([0, 0, 1.0])
            cuboid([TP_W + 2*TP_SLOP + 0.2, TP_D + 2*TP_SLOP + 0.2, SLED_H + 0.24], anchor=CENTER);
    }
}

function clamp01(v) = min(1, max(0, v));
function lerp(a, b, t) = a + (b - a) * t;
function z_shifted_track(pts, dz) = [for (p = pts) [p[0], p[1] + dz]];
function sample_track(pts, t) =
    let(
        segs = len(pts) - 1,
        st = clamp01(t) * segs,
        i = min(segs - 1, floor(st)),
        f = st - i
    )
    [
        lerp(pts[i][0], pts[i + 1][0], f),
        lerp(pts[i][1], pts[i + 1][1], f)
    ];

module placed_trackpad_sled() {
    // Track progression is split into: slide-to-crest, detent drop, then hold.
    segs = len(rear_track_pts) - 1;
    crest_u = (len(rear_track_pts) - 3) / segs; // Crest index is point 3 for 6-point track.
    drop_end_phase = min(0.99, ANIM_EXTEND_PHASE + ANIM_DROP_PHASE);

    rear_crest_pos = rear_track_pts[len(rear_track_pts) - 3];
    front_crest_pos = front_track_pts[len(front_track_pts) - 3];
    rear_detent_pos = rear_track_pts[len(rear_track_pts) - 1];
    front_detent_pos = front_track_pts[len(front_track_pts) - 1];

    slide_progress = !ANIMATE_TRAY
        ? (EXTEND_TRAY ? 1 : 0)
        : ($t <= ANIM_EXTEND_PHASE
            ? clamp01(($t / max(0.0001, ANIM_EXTEND_PHASE)) * crest_u)
            : crest_u);

    drop_progress = !ANIMATE_TRAY
        ? (EXTEND_TRAY ? 1 : 0)
        : ($t <= ANIM_EXTEND_PHASE
            ? 0
            : clamp01(($t - ANIM_EXTEND_PHASE) / max(0.0001, ANIM_DROP_PHASE)));

    tilt_start_phase = min(0.995, drop_end_phase + ANIM_DETENT_SETTLE_PHASE);
    tilt_progress = ANIMATE_TRAY
        ? clamp01(($t - tilt_start_phase) / (1 - tilt_start_phase))
        : 0;
    tilt_deg = ANIM_TILT_DEG * tilt_progress;

    rear_slide_pos = sample_track(rear_track_pts, slide_progress);
    front_slide_pos = sample_track(front_track_pts, slide_progress);

    // Solve a base rigid transform so BOTH pin centers land on their cam tracks.
    local_rear_y = -PIN_DIST/2;
    local_rear_z = Z_REAR_PIN_REL;
    local_front_y = PIN_DIST/2;
    local_front_z = Z_FRONT_PIN_REL;

    crest_world_dy = front_crest_pos[0] - rear_crest_pos[0];
    crest_world_dz = front_crest_pos[1] - rear_crest_pos[1];
    local_dy = local_front_y - local_rear_y;
    local_dz = local_front_z - local_rear_z;

    crest_pitch_deg = atan2(crest_world_dz, crest_world_dy) - atan2(local_dz, local_dy);
    crest_c = cos(crest_pitch_deg);
    crest_s = sin(crest_pitch_deg);
    crest_ty = rear_crest_pos[0] - (local_rear_y*crest_c - local_rear_z*crest_s);
    crest_tz = rear_crest_pos[1] - (local_rear_y*crest_s + local_rear_z*crest_c);

    pivot_local_y = local_front_y;
    pivot_local_z = local_front_z;
    pivot_crest_world_y = FRONT_HINGE_POCKET_Y;
    pivot_crest_world_z = front_crest_pos[1];
    pivot_seated_world_z = FRONT_HINGE_POCKET_BOTTOM_Z;
    vertical_drop_dz = pivot_seated_world_z - pivot_crest_world_z;

    in_vertical_drop_or_hold = (!ANIMATE_TRAY && EXTEND_TRAY) || (ANIMATE_TRAY && $t > ANIM_EXTEND_PHASE);

    slide_world_dy = front_slide_pos[0] - rear_slide_pos[0];
    slide_world_dz = front_slide_pos[1] - rear_slide_pos[1];
    slide_pitch_deg = atan2(slide_world_dz, slide_world_dy) - atan2(local_dz, local_dy);
    slide_c = cos(slide_pitch_deg);
    slide_s = sin(slide_pitch_deg);
    slide_ty = rear_slide_pos[0] - (local_rear_y*slide_c - local_rear_z*slide_s);
    slide_tz = rear_slide_pos[1] - (local_rear_y*slide_s + local_rear_z*slide_c);

    slide_pivot_is_front_track = front_slide_pos[0] > rear_slide_pos[0];
    slide_pivot_world_y = slide_pivot_is_front_track ? front_slide_pos[0] : rear_slide_pos[0];
    slide_pivot_world_z = slide_pivot_is_front_track ? front_slide_pos[1] : rear_slide_pos[1];
    slide_pivot_local_y = slide_pivot_is_front_track ? local_front_y : local_rear_y;
    slide_pivot_local_z = slide_pivot_is_front_track ? local_front_z : local_rear_z;

    base_pitch_deg = in_vertical_drop_or_hold ? crest_pitch_deg : slide_pitch_deg;
    base_ty = in_vertical_drop_or_hold ? crest_ty : slide_ty;
    base_tz = in_vertical_drop_or_hold ? crest_tz + vertical_drop_dz * drop_progress : slide_tz;
    pivot_world_y = in_vertical_drop_or_hold ? pivot_crest_world_y : slide_pivot_world_y;
    pivot_world_z = in_vertical_drop_or_hold ? lerp(pivot_crest_world_z, pivot_seated_world_z, drop_progress) : slide_pivot_world_z;
    pivot_local_y = in_vertical_drop_or_hold ? local_front_y : slide_pivot_local_y;
    pivot_local_z = in_vertical_drop_or_hold ? local_front_z : slide_pivot_local_z;

    if (SHOW_ASSEMBLED) {
        // Stage 1: both pins follow cam tracks. Stage 2: tilt around the detent-seated rear pin.
        rot([tilt_deg, 0, 0], cp=[0, pivot_world_y, pivot_world_z])
            translate([0, base_ty, base_tz])
                rot([base_pitch_deg, 0, 0]) {
                    tray_colored();
                    if (SHOW_NON_PRINTABLE_PINS)
                        non_printable_guide_pins();
                }
    } else {
        // Spread modules out horizontally for explicit slicing preview examinations
        translate([CHASSIS_W/2 + SLED_W/2 + 20.0, 0, 0])
            rot([tilt_deg, 0, 0], cp=[0, base_ty + pivot_local_y, base_tz + pivot_local_z])
                translate([0, base_ty, base_tz])
                    rot([base_pitch_deg, 0, 0]) {
                        tray_colored();
                        if (SHOW_NON_PRINTABLE_PINS)
                            non_printable_guide_pins();
                    }
    }
}

module render_layout() {
    if (RENDER_CHASSIS)
        chassis_colored();

    if (RENDER_TRAY)
        placed_trackpad_sled();
}

if (CUTAWAY_VIEW) {
    // Intersect the render with a large half-space cuboid to inspect internals.
    intersection() {
        render_layout();

        // Keep either right (+X) or left (-X) half of the current scene.
        translate([(CUTAWAY_KEEP_RIGHT_HALF ? 1 : -1) * (CHASSIS_W/2 + CUTAWAY_MARGIN) / 2, 0, 0])
            cuboid([CHASSIS_W + CUTAWAY_MARGIN, CHASSIS_D + 2*TRAVEL + 2*CUTAWAY_MARGIN, CHASSIS_H + SLED_H + 2*RAMP_UP + 2*CUTAWAY_MARGIN], anchor=CENTER);
    }
} else {
    render_layout();
}

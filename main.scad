include <BOSL2/std.scad>
include <BOSL2/screws.scad>

/* [Global Display Options] */
// Render target selection (Toggle to isolate parts)
PART_TO_RENDER = "assembly"; // [assembly, chassis, tray]

// Slide-out distance to preview the drawer extension
EXPLODE_DISTANCE = 0; // [0:150]

/* [Hardware & Printing Configuration] */
// Printer-specific slop tolerance for clean fits
$slop = 0.25; 
// Smoothness profile for circular bores/roundings
$fn = 64;
// Diameter of the metal guide pin screw thread (M3 standard)
PIN_DIAMETER = 3.0;
// Diameter of the brass heat-set insert outer wall
INSERT_DIAMETER = 4.2;
// Depth of the brass heat-set insert pocket
INSERT_DEPTH = 5.0;

/* [Logitech MX Keys Mini Dimensions] */
KB_W = 296.0;
KB_D = 132.0;
KB_H_FRONT = 6.0;
KB_H_BACK = 14.0;
KB_PORT_W = 15.0; 

/* [Apple Magic Trackpad Dimensions] */
TP_W = 160.0;
TP_D = 115.0;
TP_H_FRONT = 5.0;
TP_H_BACK = 11.0;
TP_PORT_W = 20.0; 

/* [Chassis Structural Properties] */
WALL_THICKNESS = 4.0;
LAP_ROUNDING = 12.0; // Ergonomic edge rounding for lap comfort

// Derived dimensional variables
CHASSIS_W = KB_W + (WALL_THICKNESS * 2);
CHASSIS_D = KB_D + (WALL_THICKNESS * 2);
CHASSIS_H = KB_H_BACK + TP_H_BACK + WALL_THICKNESS + 4;

TRAY_W = TP_W + 8.0; 
TRAY_D = TP_D + WALL_THICKNESS;
TRAY_H = TP_H_BACK + 3.0;

// Output Rendering Controller Logic
if (PART_TO_RENDER == "chassis" || PART_TO_RENDER == "assembly") {
    lap_dock_chassis();
}

if (PART_TO_RENDER == "tray" || PART_TO_RENDER == "assembly") {
    // Slips the tray forward out of its tunnel based on the slider value
    fwd(PART_TO_RENDER == "assembly" ? (EXPLODE_DISTANCE) : 0) {
        trackpad_tray();
    }
}

// Upper keyboard housing chassis
module lap_dock_chassis() {
    diff()
    cuboid([CHASSIS_W, CHASSIS_D, CHASSIS_H], rounding=LAP_ROUNDING, edges=BOTTOM, anchor=CENTER) {
        
        // 1. Keyboard Recessed Pocket (Wedge-shaped cut)
        align(TOP, inside=true)
        tag("remove")
        up(0.01)
        prismoid(size1=[KB_W + $slop*2, KB_D + $slop*2], 
                 size2=[KB_W + $slop*2, KB_D + $slop*2], 
                 h=KB_H_BACK + 1, 
                 anchor=TOP);
        
        // 2. Subterranean Trackpad Storage Tunnel
        align(BOTTOM, inside=true)
        tag("remove")
        down(0.01)
        cuboid([TRAY_W + $slop*4, CHASSIS_D + 2, TRAY_H + $slop*4], anchor=BOTTOM);
        
        // 3. Dual Cam-Tracks (Left and Right internal guide slot grooves)
        tag("remove")
        xcopies(spacing = TRAY_W + $slop*2) {
            hull() {
                translate([0, -CHASSIS_D/2 + 20, -CHASSIS_H/2 + WALL_THICKNESS + 2]) rotate([0,90,0]) cyl(d=PIN_DIAMETER+$slop, h=10, anchor=CENTER);
                translate([0,  CHASSIS_D/4,      -CHASSIS_H/2 + WALL_THICKNESS + 2]) rotate([0,90,0]) cyl(d=PIN_DIAMETER+$slop, h=10, anchor=CENTER);
            }
            hull() {
                translate([0,  CHASSIS_D/4,      -CHASSIS_H/2 + WALL_THICKNESS + 2]) rotate([0,90,0]) cyl(d=PIN_DIAMETER+$slop, h=10, anchor=CENTER);
                translate([0,  CHASSIS_D/2 - 15, -CHASSIS_H/2 + TRAY_H + 1])        rotate([0,90,0]) cyl(d=PIN_DIAMETER+$slop, h=10, anchor=CENTER);
            }
        }
        
        // 4. Rear Charging Port Pass-Through Window
        tag("remove")
        translate([0, CHASSIS_D/2, 0]) {
            // Keyboard charging path
            translate([0, 0, CHASSIS_H/4]) cuboid([KB_PORT_W, WALL_THICKNESS * 3, KB_H_BACK], anchor=CENTER);
            // Trackpad charging path
            translate([0, 0, -CHASSIS_H/4]) cuboid([TP_PORT_W, WALL_THICKNESS * 3, TRAY_H], anchor=CENTER);
        }
        
        // 5. Neodymium Magnet Pocket for Home Detente
        align(BOTTOM, inside=true)
        tag("remove")
        translate([0, -CHASSIS_D/2 + 15, -0.01])
        cyl(d=6.2, h=2.2, anchor=BOTTOM);
    }
}

// Sliding trackpad tray sled
module trackpad_tray() {
    diff()
    cuboid([TRAY_W, TRAY_D, TRAY_H], rounding=2, edges=BOTTOM, anchor=CENTER) {
        
        // 1. Trackpad Nest Pocket
        align(TOP, inside=true)
        tag("remove")
        up(0.01)
        prismoid(size1=[TP_W + $slop*2, TP_D + $slop*2], 
                 size2=[TP_W + $slop*2, TP_D + $slop*2], 
                 h=TP_H_BACK + 0.5, 
                 anchor=TOP);
        
        // 2. Lateral Bores for Sled Heat-Set Inserts (Cleaned up cylinder cuts)
        tag("remove")
        xcopies(spacing = TRAY_W) {
            // Rear Pin Bore
            translate([0, -TRAY_D/3, 0]) rotate([0, 90, 0]) cyl(d=INSERT_DIAMETER, l=INSERT_DEPTH * 2, anchor=CENTER);
            // Front Pin Bore
            translate([0,  TRAY_D/3, 0]) rotate([0, 90, 0]) cyl(d=INSERT_DIAMETER, l=INSERT_DEPTH * 2, anchor=CENTER);
        }
        
        // 3. Matching Magnet Pocket on Sled Base
        align(BOTTOM, inside=true)
        tag("remove")
        translate([0, -TRAY_D/2 + 15, -0.01])
        cyl(d=6.2, h=2.2, anchor=BOTTOM);
        
        // 4. Ergonomic Front Finger Scoop
        align(FRONT, inside=true)
        tag("remove")
        fwd(0.01)
        cuboid([40, WALL_THICKNESS + 2, TRAY_H + 2], rounding=4, edges="Y", anchor=CENTER);
    }
}

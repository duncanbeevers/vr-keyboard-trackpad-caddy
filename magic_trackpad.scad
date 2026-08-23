include <BOSL2/std.scad>

/*
 * Apple Magic Trackpad (2 & 3 / USB-C & Lightning) - Dimensional Reference Model
 * Standalone BOSL2 model capturing exterior wedge geometry, corner roundings,
 * frosted glass top, power switch, charging port, and rubber feet.
 */

/* [Trackpad Dimensions (Apple Magic Trackpad 2/3)] */
TP_WIDTH           = 160.00; // Total width (mm) - [Apple spec: 16.0 cm]
TP_DEPTH           = 114.90; // Total depth (mm) - [Apple spec: 11.49 cm]
TP_FRONT_HEIGHT    = 4.90;   // Front edge height (mm) - [Apple spec: 0.49 cm]
TP_REAR_HEIGHT     = 10.90;  // Rear edge height (mm) - [Apple spec: 1.09 cm]
TP_CORNER_RADIUS   = 8.50;   // Corner rounding radius (mm)
TP_GLASS_THICKNESS = 0.80;   // Frosted glass top surface thickness (mm)

/* [Ports & Controls (Rear Edge)] */
TP_PORT_TYPE        = "usb_c"; // ["usb_c": USB-C Port (Magic Trackpad 3 / 2024), "lightning": Lightning Port (Magic Trackpad 2)]
TP_PORT_WIDTH       = 9.00;    // Port cutout width (mm)
TP_PORT_HEIGHT      = 3.50;    // Port cutout height (mm)
TP_SWITCH_OFFSET    = 12.50;   // Distance from right edge to power switch center (mm) - [Verified via ruler photo: 12.5mm]
TP_SWITCH_WIDTH     = 5.50;    // Power switch cavity width (mm) - [Verified via ruler photo: 5.5mm]
TP_SWITCH_HEIGHT    = 2.40;    // Power switch cavity height (mm) - [Verified via ruler photo: 2.4mm]
TP_RF_WINDOW_WIDTH  = 26.00;   // Antenna window width (mm)

/* [Rubber Feet] */
TP_FOOT_DIAMETER    = 7.50;    // Foot diameter (mm)
TP_FOOT_THICKNESS   = 0.60;    // Foot height (mm)
TP_FOOT_INSET_X     = 14.00;   // Inset from side edge (mm)
TP_FOOT_INSET_Y     = 14.00;   // Inset from front/back edge (mm)

/* [Tolerances & Quality] */
$fn = 64;

// Default preview when opened directly
magic_trackpad();

/**
 * magic_trackpad() - BOSL2 attachable module for Apple Magic Trackpad
 *
 * @param anchor     BOSL2 anchor (default: CENTER)
 * @param spin       BOSL2 spin angle (default: 0)
 * @param orient     BOSL2 orientation vector (default: UP)
 * @param colors     Whether to apply realistic material colors (default: true)
 * @param dark_mode  Whether to render in Space Black / Space Gray styling (default: false)
 */
module magic_trackpad(anchor = CENTER, spin = 0, orient = UP, colors = true, dark_mode = false) {
    total_size = [TP_WIDTH, TP_DEPTH, TP_REAR_HEIGHT + TP_FOOT_THICKNESS];
    
    wedge_angle = atan((TP_REAR_HEIGHT - TP_FRONT_HEIGHT) / TP_DEPTH);
    mid_height  = (TP_FRONT_HEIGHT + TP_REAR_HEIGHT) / 2;
    
    c_metal  = colors ? (dark_mode ? "#3A3D40" : "#D2D5D8") : undef;
    c_glass  = colors ? (dark_mode ? "#202124" : "#F4F5F7") : undef;
    c_dark   = colors ? "#1A1A1A" : undef;
    c_accent = colors ? "#34A853" : undef; // Green power switch
    c_rubber = colors ? "#4A4D50" : undef;
    c_rf     = colors ? (dark_mode ? "#2B2D30" : "#E8EAED") : undef;

    attachable(anchor, spin, orient, size = total_size) {
        translate([0, 0, -total_size.z / 2]) {
            
            // 1. Unibody Aluminum Wedge Enclosure (below glass top)
            color(c_metal) {
                difference() {
                    intersection() {
                        // 2D rounded rectangle extruded vertically
                        linear_extrude(height = TP_REAR_HEIGHT * 2, center = false) {
                            rect([TP_WIDTH, TP_DEPTH], rounding = TP_CORNER_RADIUS);
                        }

                        // Half-space below the sloped glass interface
                        translate([0, 0, mid_height - TP_GLASS_THICKNESS]) {
                            xrot(wedge_angle) {
                                translate([0, 0, -500])
                                    cube([1000, 1000, 1000], center = true);
                            }
                        }
                    }

                    // Power switch cavity on rear vertical face
                    translate([
                        TP_WIDTH/2 - TP_SWITCH_OFFSET,
                        TP_DEPTH/2,
                        (TP_REAR_HEIGHT - TP_GLASS_THICKNESS) / 2
                    ]) {
                        cuboid([TP_SWITCH_WIDTH, 2.0, TP_SWITCH_HEIGHT], rounding = 1.0, edges = "Y", anchor = CENTER);
                    }

                    // Charging Port cavity on rear vertical face (centered)
                    translate([
                        0,
                        TP_DEPTH/2,
                        (TP_REAR_HEIGHT - TP_GLASS_THICKNESS) / 2
                    ]) {
                        cuboid([TP_PORT_WIDTH, 2.0, TP_PORT_HEIGHT], rounding = (TP_PORT_TYPE == "usb_c" ? 1.4 : 0.6), edges = "Y", anchor = CENTER);
                    }
                }
            }

            // 2. Frosted Glass Top Surface (Wedge Sloped Plate)
            color(c_glass) {
                intersection() {
                    linear_extrude(height = TP_REAR_HEIGHT * 2, center = false) {
                        rect([TP_WIDTH, TP_DEPTH], rounding = TP_CORNER_RADIUS);
                    }

                    translate([0, 0, mid_height - TP_GLASS_THICKNESS]) {
                        xrot(wedge_angle) {
                            translate([0, 0, TP_GLASS_THICKNESS / 2])
                                cube([TP_WIDTH + 20, TP_DEPTH + 20, TP_GLASS_THICKNESS], center = true);
                        }
                    }
                }
            }

            // 3. Power Switch Slider on Rear Face (with green ON indicator)
            translate([
                TP_WIDTH/2 - TP_SWITCH_OFFSET,
                TP_DEPTH/2 - 0.2,
                (TP_REAR_HEIGHT - TP_GLASS_THICKNESS) / 2
            ]) {
                // Cavity background
                color(c_dark)
                    cuboid([TP_SWITCH_WIDTH - 0.2, 0.6, TP_SWITCH_HEIGHT - 0.2], rounding = 0.8, edges = "Y", anchor = CENTER);
                // Active green indicator stripe (revealed when switch is ON / right)
                color(c_accent)
                    translate([-1.2, 0.1, 0])
                        cuboid([1.8, 0.4, TP_SWITCH_HEIGHT - 0.6], anchor = CENTER);
                // Small metallic slider pip knob
                color(c_metal)
                    translate([1.2, 0.2, 0])
                        cyl(d = TP_SWITCH_HEIGHT - 0.4, h = 0.8, rounding = 0.3, orient = FWD, anchor = CENTER);
            }

            // 4. Charging Port Interior (Lightning or USB-C)
            translate([
                0,
                TP_DEPTH/2 - 0.2,
                (TP_REAR_HEIGHT - TP_GLASS_THICKNESS) / 2
            ]) {
                color(c_dark)
                    cuboid([TP_PORT_WIDTH - 0.6, 0.8, TP_PORT_HEIGHT - 0.6], rounding = 1.0, edges = "Y", anchor = CENTER);
            }

            // 5. RF / Antenna Pass-through strip on rear top edge
            color(c_rf) {
                translate([
                    -TP_WIDTH/4,
                    TP_DEPTH/2 - 0.5,
                    TP_REAR_HEIGHT - TP_GLASS_THICKNESS - 1.0
                ]) {
                    cuboid([TP_RF_WINDOW_WIDTH, 1.2, 1.8], anchor = CENTER);
                }
            }

            // 6. Underside Rubber Feet (4 corners)
            color(c_rubber) {
                for (x_pos = [-TP_WIDTH/2 + TP_FOOT_INSET_X, TP_WIDTH/2 - TP_FOOT_INSET_X]) {
                    for (y_pos = [-TP_DEPTH/2 + TP_FOOT_INSET_Y, TP_DEPTH/2 - TP_FOOT_INSET_Y]) {
                        translate([x_pos, y_pos, -TP_FOOT_THICKNESS]) {
                            cylinder(d = TP_FOOT_DIAMETER, h = TP_FOOT_THICKNESS, anchor = BOT);
                        }
                    }
                }
            }
        }
        children();
    }
}

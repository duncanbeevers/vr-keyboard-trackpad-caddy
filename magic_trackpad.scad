include <BOSL2/std.scad>

/*
 * Apple Magic Trackpad 2 / 3 - Dimensionally Accurate Reference Model
 * Captures:
 * - Width: 160.0mm
 * - Depth: 114.9mm
 * - Front Wedge Height: 5.0mm
 * - Rear Wedge Height: 10.9mm
 * - Corner Radius: 8.0mm (vertical edges)
 * - Flat Bottom Face with 4 Rubber Contact Feet
 * - Centered Lightning / USB-C Port (X = 0.0)
 * - Power Toggle Slider (X = 46.0)
 */

/* [Magic Trackpad Parameters] */
TP_WIDTH = 160.0;
TP_DEPTH = 114.9;
TP_FRONT_H = 5.0;
TP_REAR_H = 10.9;
TP_CORNER_R = 8.0;
TP_SWITCH_X = 46.0;
TP_SWITCH_W = 9.0;
TP_SWITCH_H = 3.5;
TP_PORT_W = 9.5;
TP_PORT_H = 3.2;

$fn = 64;

// Default standalone preview
magic_trackpad();

module magic_trackpad() {
    wedge_angle = atan((TP_REAR_H - TP_FRONT_H) / TP_DEPTH);
    mid_h = (TP_FRONT_H + TP_REAR_H) / 2;

    color([0.90, 0.90, 0.94, 0.92]) { // Silver aluminum / frosted glass finish
        diff() {
            // 1. Solid Outer Wedge Body with Vertical Rounded Corners
            cuboid([TP_WIDTH, TP_DEPTH, TP_REAR_H + 10], rounding = TP_CORNER_R, edges = "Z", anchor = BOT);

            // 2. Angled Top Slicing Plane establishing the precise Magic Trackpad wedge slope
            tag("remove")
                translate([0, 0, mid_h])
                    xrot(wedge_angle)
                        cuboid([TP_WIDTH + 20, TP_DEPTH * 2, 20], anchor = BOT);

            // 3. Lightning / USB-C Port Cutout (Centered on Rear Edge)
            tag("remove")
                translate([0, TP_DEPTH / 2, TP_PORT_H / 2 + 1.2])
                    cuboid([TP_PORT_W, 6.0, TP_PORT_H], rounding = 1.0, edges = "Y", anchor = CENTER);

            // 4. Power Slide Switch Cavity (Rear Edge, X = 46mm)
            tag("remove")
                translate([TP_SWITCH_X, TP_DEPTH / 2, TP_SWITCH_H / 2 + 1.2])
                    cuboid([TP_SWITCH_W, 6.0, TP_SWITCH_H], rounding = 0.5, edges = "Y", anchor = CENTER);
        }

        // 5. 4 Corner Rubber Contact Feet on Bottom Face
        color([0.2, 0.2, 0.2, 1.0])
            xcopies(spacing = TP_WIDTH - 28, n = 2) {
                ycopies(spacing = TP_DEPTH - 28, n = 2) {
                    translate([0, 0, -0.4])
                        cyl(d = 7.0, h = 0.4, anchor = BOT);
                }
            }
    }
}

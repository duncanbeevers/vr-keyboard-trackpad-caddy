include <BOSL2/std.scad>

/*
 * Logitech MX Keys Mini - Dimensionally Accurate Reference Model
 * Captures:
 * - Width: 296.0mm
 * - Depth: 132.0mm
 * - Front Chin Height: 7.0mm
 * - Rear Height (Battery Bar): 16.0mm / Total Key Height: 20.5mm
 * - Corner Radius: 5.0mm
 * - Power Switch & USB-C Port on rear edge
 */

/* [MX Keys Mini Parameters] */
MX_WIDTH = 296.0;
MX_DEPTH = 132.0;
MX_FRONT_H = 7.0;
MX_REAR_BATTERY_H = 16.0;
MX_BATTERY_DEPTH = 25.0;
MX_CORNER_R = 5.0;
MX_KEY_AREA_W = 286.0;
MX_KEY_AREA_D = 118.0;
MX_KEY_H = 3.0;

$fn = 64;

// Default standalone preview
mx_keys_mini();

module mx_keys_mini() {
    wedge_angle = atan((MX_REAR_BATTERY_H - MX_FRONT_H) / (MX_DEPTH - MX_BATTERY_DEPTH / 2));

    color([0.28, 0.28, 0.32, 0.9]) { // Space gray / slate finish
        diff() {
            union() {
                // 1. Sloped Main Aluminum Deck
                hull() {
                    // Front edge rounded bar
                    translate([0, -MX_DEPTH / 2 + MX_CORNER_R, MX_FRONT_H / 2])
                        cuboid([MX_WIDTH, MX_CORNER_R * 2, MX_FRONT_H], rounding = MX_CORNER_R, edges = "Z", anchor = CENTER);

                    // Rear deck transition (before battery bar)
                    translate([0, MX_DEPTH / 2 - MX_BATTERY_DEPTH, MX_FRONT_H / 2 + 3.0])
                        cuboid([MX_WIDTH, 10, MX_FRONT_H + 3.0], rounding = MX_CORNER_R, edges = "Z", anchor = CENTER);

                    // Rear battery bar cylindrical hull
                    translate([0, MX_DEPTH / 2 - MX_BATTERY_DEPTH / 2, MX_REAR_BATTERY_H / 2])
                        cuboid([MX_WIDTH - 20, MX_BATTERY_DEPTH, MX_REAR_BATTERY_H], rounding = MX_CORNER_R, edges = "Z", anchor = CENTER);
                }

                // 2. Keybed Deck Area
                translate([0, -MX_DEPTH / 2 + MX_KEY_AREA_D / 2 + 5, MX_FRONT_H - 1])
                    xrot(-wedge_angle * 0.4)
                        color([0.18, 0.18, 0.20, 0.95])
                            cuboid([MX_KEY_AREA_W, MX_KEY_AREA_D, MX_KEY_H], rounding = 2.0, edges = "Z", anchor = BOT);
            }

            // 3. USB-C Charging Port (Rear Edge, right of center)
            tag("remove")
                translate([85.0, MX_DEPTH / 2, MX_REAR_BATTERY_H - 4.5])
                    cuboid([9.0, 10.0, 3.2], rounding = 1.0, edges = "Y", anchor = CENTER);

            // 4. Power Slide Switch (Rear Edge, further right)
            tag("remove")
                translate([105.0, MX_DEPTH / 2, MX_REAR_BATTERY_H - 4.5])
                    cuboid([8.0, 10.0, 3.5], rounding = 0.5, edges = "Y", anchor = CENTER);
        }
    }
}

include <BOSL2/std.scad>

$fn = 100;

// --- Parameters ---
TP_W = 160;
TP_D = 115;
TP_CORNER_RAD = 10;
WALL_THICK = 3;
FRAME_H = 11;

// Support Settings
SUPPORT_W = 12;
SUPPORT_LEN = 12; 
SUPPORT_H = 2;

// Strut settings
STRUT_LENGTH = 140;
STRUT_WIDTH = 20;
STRUT_BATTERY_CHANNEL_WIDTH = 25;
STRUT_HEIGHT = 20;
STRUT_TINE_HEIGHT = 5;

// --- Main Assembly ---
diff("cutout") {
    union() {
        // 1. Trackpad Frame
        rect_tube(size=[TP_W, TP_D], 
                  wall=WALL_THICK, 
                  h=FRAME_H, 
                  rounding=TP_CORNER_RAD,
                  anchor=BOT);

        // 2. Corner Supports
        // Using basic rotation to align supports to interior walls
        for (x_dir = [-1, 1], y_dir = [-1, 1]) {
            translate([x_dir * ((TP_W/2) - WALL_THICK), y_dir * ((TP_D/2) - WALL_THICK), 0])
            translate(x_dir > 0 ? [-SUPPORT_W/2, (y_dir > 0 ? 0 : SUPPORT_LEN), 0] : [SUPPORT_W/2, (y_dir > 0 ? 0 : SUPPORT_LEN), 0])
            cuboid(
                [SUPPORT_W, SUPPORT_LEN, SUPPORT_H], 
                rounding=2,
                edges="Z",
                anchor=BOT+BACK,
                except=[
                    (y_dir > 0 ? BACK : FRONT)+(x_dir > 0 ? LEFT : RIGHT),
                    (y_dir > 0 ? FRONT : BACK)+(x_dir > 0 ? RIGHT : LEFT)
                ],
            );
        }

        // 3. Struts and Rear Fork Assembly
        back(TP_D/2) {
            for (x = [-50, 50]) {
                translate([x, 0, 0]) {
                    // Strut body
                    cuboid([STRUT_WIDTH, STRUT_LENGTH, 8], anchor=FRONT+BOT,);
                    translate([0, STRUT_LENGTH, 0]) {
                        // Near tine
                        translate([0, -STRUT_BATTERY_CHANNEL_WIDTH, 0]) cuboid([STRUT_WIDTH, 5, STRUT_TINE_HEIGHT + STRUT_HEIGHT], rounding=2, anchor=BOT+FRONT);
                        // Far rear tine
                        translate([0, 0, 0]) cuboid([STRUT_WIDTH, 5, STRUT_TINE_HEIGHT + STRUT_HEIGHT], rounding=2, anchor=BOT+FRONT, except=[FRONT+BOT, FRONT+LEFT, FRONT+RIGHT]);
                    }
                }
            }
        }
    }

    // 4. Port Notches
    tag("cutout") forward(TP_D/2) {
        translate([-40, 0, 0]) cuboid([20, WALL_THICK*2, 6], anchor=BOT);
        translate([40, 0, 0]) cuboid([10, WALL_THICK*2, 6], anchor=BOT);
    }
}

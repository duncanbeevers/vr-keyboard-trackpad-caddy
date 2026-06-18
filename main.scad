include <BOSL2/std.scad>

// Trackpad Settings
TRACKPAD_WIDTH = 160;
TRACKPAD_DEPTH = 115;
TRACKPAD_CORNER_RADIUS = 10;
TRACKPAD_WALL_THICKNESS = 2;
TRACKPAD_FRAME_FRONT_HEIGHT = 5;
TRACKPAD_FRAME_REAR_HEIGHT = 11;
TRACKPAD_CHARGING_PORT_WIDTH = 10;
TRACKPAD_CHARGING_PORT_HEIGHT = 6;
TRACKPAD_POWER_SWITCH_PORT_WIDTH = 20;
TRACKPAD_POWER_SWITCH_PORT_HEIGHT = TRACKPAD_FRAME_REAR_HEIGHT / 1.5;
TRACKPAD_POWER_SWITCH_PORT_DEPTH = 10;
FOOTPAD_SUPPORT_WIDTH = 12;
FOOTPAD_SUPPORT_LENGTH = 12; 
FOOTPAD_SUPPORT_HEIGHT = 2;

// Keyboard Strut settings
STRUT_LENGTH = 131;
STRUT_WIDTH = 20;
STRUT_BATTERY_CHANNEL_WIDTH = 25;
STRUT_HEIGHT = 20;
STRUT_TINE_HEIGHT = 5;
STRUT_TINE_THICKNESS = 5;
STRUT_ROUNDING = 1;
STRUT_SEPARATION = 70;

/* [Hidden] */

$fn = 100;
BOOLEAN_EPS = 0.1;

module trackpad_outer_solid(height) {
    linear_extrude(height=height)
        offset(r=TRACKPAD_CORNER_RADIUS)
            square(
                [
                    TRACKPAD_WIDTH - (TRACKPAD_CORNER_RADIUS * 2),
                    TRACKPAD_DEPTH - (TRACKPAD_CORNER_RADIUS * 2)
                ],
                center=true
            );
}

module trackpad_outer_inverse(height) {
    difference() {
        translate([0, 0, -BOOLEAN_EPS / 2])
            cuboid(
                [
                    TRACKPAD_WIDTH + BOOLEAN_EPS,
                    TRACKPAD_DEPTH + BOOLEAN_EPS,
                    height + BOOLEAN_EPS
                ],
                anchor=BOT
            );

        translate([0, 0, -BOOLEAN_EPS / 2])
            trackpad_outer_solid(height + BOOLEAN_EPS);
    }
}

// --- Main Assembly ---
union() {
    // Trackpad frame with port notches
    diff("cutout") {
        union() {
            // 1. Trackpad Frame
            rect_tube(
                size=[TRACKPAD_WIDTH, TRACKPAD_DEPTH], 
                wall=TRACKPAD_WALL_THICKNESS, 
                h=TRACKPAD_FRAME_REAR_HEIGHT,
                rounding=TRACKPAD_CORNER_RADIUS,
                anchor=BOT
            );

            // 2. Corner Supports
            difference() {
                union() {
                    for (x_dir = [-1, 1], y_dir = [-1, 1]) {
                        translate(
                            [
                                x_dir * ((TRACKPAD_WIDTH / 2) - TRACKPAD_WALL_THICKNESS),
                                y_dir * ((TRACKPAD_DEPTH / 2) - TRACKPAD_WALL_THICKNESS),
                                0
                            ]
                        )
                        translate(
                            x_dir > 0 ?
                                [-FOOTPAD_SUPPORT_WIDTH / 2, (y_dir > 0 ? 0 : FOOTPAD_SUPPORT_LENGTH), 0] :
                                [FOOTPAD_SUPPORT_WIDTH / 2, (y_dir > 0 ? 0 : FOOTPAD_SUPPORT_LENGTH), 0]
                        )

                        cuboid(
                            [FOOTPAD_SUPPORT_WIDTH, FOOTPAD_SUPPORT_LENGTH, FOOTPAD_SUPPORT_HEIGHT], 
                            rounding=STRUT_ROUNDING,
                            edges="Z",
                            anchor=BOT+BACK,
                            except=[
                                (y_dir > 0 ? BACK : FRONT) + (x_dir > 0 ? LEFT : RIGHT),
                                (y_dir > 0 ? FRONT : BACK) + (x_dir > 0 ? RIGHT : LEFT)
                            ],
                        );
                    }
                }

                trackpad_outer_inverse(FOOTPAD_SUPPORT_HEIGHT);
            }
        }

        // 4. Port Notches (relative to trackpad frame only)
        tag("cutout") back(TRACKPAD_DEPTH / 2) {
            // Power-switch cut-out
            right(TRACKPAD_WIDTH / 2)
            up(TRACKPAD_FRAME_REAR_HEIGHT)
            cuboid(
                [
                    TRACKPAD_POWER_SWITCH_PORT_WIDTH,
                    (TRACKPAD_POWER_SWITCH_PORT_DEPTH * 2) + 0.1,
                    TRACKPAD_POWER_SWITCH_PORT_HEIGHT
                ],
                anchor=TOP+RIGHT,
                rounding=2,
                except=[BACK, RIGHT, TOP]
            );

            // Charging port cut-out
            up(TRACKPAD_FRAME_REAR_HEIGHT / 2)
            cuboid(
                [
                    TRACKPAD_CHARGING_PORT_WIDTH,
                    (TRACKPAD_WALL_THICKNESS * 2) + 0.1,
                    TRACKPAD_CHARGING_PORT_HEIGHT
                ],
                anchor=CENTER,
                rounding=2,
                except=[FRONT, BACK]
            );
        }

        // Slope wedge: front edge lower than rear edge
        tag("cutout") hull() {
            up(TRACKPAD_FRAME_FRONT_HEIGHT)
            fwd((TRACKPAD_DEPTH / 2) + 0.2)
            cuboid(
                [TRACKPAD_WIDTH * 1.1, 0.3, TRACKPAD_FRAME_REAR_HEIGHT],
                anchor=BOT+FRONT
            );

            up(TRACKPAD_FRAME_REAR_HEIGHT)
            back((TRACKPAD_DEPTH / 2) + 0.2)
            cuboid(
                [TRACKPAD_WIDTH * 1.1, 0.3, TRACKPAD_FRAME_REAR_HEIGHT],
                anchor=BOT+BACK
            );
        }
    }

    // 3. Struts and Rear Fork Assembly (not affected by port notches)
    back(TRACKPAD_DEPTH / 2) {
        for (x = [-STRUT_SEPARATION / 2, STRUT_SEPARATION / 2]) {
            translate([x, 0, 0]) {
                // Strut body
                cuboid(
                    [STRUT_WIDTH, STRUT_LENGTH, 8],
                    anchor=FRONT+BOT,
                    rounding=STRUT_ROUNDING,
                    except=[FRONT, BACK]
                );

                translate([0, STRUT_LENGTH, 0]) {
                    // Far rear tine
                    translate([0, 0, 0])
                    cuboid(
                        [STRUT_WIDTH, STRUT_TINE_THICKNESS, STRUT_TINE_HEIGHT + STRUT_HEIGHT],
                        rounding=STRUT_ROUNDING,
                        anchor=BOT
                    );

                    // Near tine
                    translate([0, -STRUT_BATTERY_CHANNEL_WIDTH, 0])
                    cuboid(
                        [STRUT_WIDTH, STRUT_TINE_THICKNESS, STRUT_TINE_HEIGHT + STRUT_HEIGHT],
                        rounding=2,
                        anchor=BOT
                    );
                }
            }
        }
    }
}

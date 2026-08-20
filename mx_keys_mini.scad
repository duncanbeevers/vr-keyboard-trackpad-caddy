include <BOSL2/std.scad>

/*
 * Logitech MX Keys Mini - Dimensional Reference Model
 * Standalone BOSL2 model capturing exterior geometry, rear battery bar protrusion,
 * wedge tilt profile, corner roundings, individual keycaps, port and switch locations.
 */

/* [Overall Keyboard Dimensions] */
MX_MINI_TOTAL_WIDTH    = 295.99; // Total keyboard body width (mm)
MX_MINI_TOTAL_DEPTH    = 131.95; // Total depth from front edge to rear of battery bar (mm)
MX_MINI_TOTAL_HEIGHT   = 20.97;  // Total height at rear top (including battery bar & feet)
MX_MINI_TILT_ANGLE     = 5.50;   // Natural resting tilt angle (deg)

/* [Main Body Plate] */
MX_MINI_BODY_WIDTH     = MX_MINI_TOTAL_WIDTH; // 295.99 mm
MX_MINI_BODY_DEPTH     = 119.00; // Front plate depth before rear battery bar protrusion (mm)
MX_MINI_BODY_THICKNESS = 6.00;   // Aluminum plate / chassis thickness (mm)
MX_MINI_CORNER_RADIUS  = 12.00;  // Sweeping corner rounding radius on main plate (mm)

/* [Rear Battery & Electronics Bar] */
MX_MINI_BAR_WIDTH      = 256.00; // Battery bar width (mm)
MX_MINI_BAR_PROTRUSION = MX_MINI_TOTAL_DEPTH - MX_MINI_BODY_DEPTH; // ~12.95 mm protruding out back
MX_MINI_BAR_DEPTH      = 26.00;  // Total front-to-back depth of battery bar (mm)
MX_MINI_BAR_RADIUS     = 8.50;   // Corner radius on battery bar ends and bottom (mm)

/* [Keybed Geometry & Individual Keys] */
MX_MINI_KEYBED_WIDTH   = 283.00;
MX_MINI_KEYBED_DEPTH   = 106.00;
MX_MINI_KEY_HEIGHT     = 1.80;   // Keycap protrusion above plate (mm)
MX_MINI_KEY_ROUNDING   = 3.20;   // Soft squircle keycap corner rounding radius (mm)
MX_MINI_CORNER_KEY_R   = 7.50;   // Deep curvature on outer corner keys matching frame (mm)
MX_MINI_KEYBED_MARGIN_BOTTOM = 6.0;

/* [Ports & Controls (on Rear Face of Battery Bar)] */
MX_MINI_POWER_SWITCH_OFFSET = 20.0; // Distance from battery bar right end to switch center (mm)
MX_MINI_POWER_SWITCH_SIZE   = [9.0, 3.5, 4.0];
MX_MINI_USBC_OFFSET         = 44.0; // Distance from battery bar right end to USB-C center (mm)
MX_MINI_USBC_SIZE           = [9.0, 3.5, 4.0];

/* [LED Indicator (Pill-shaped on top face of battery bar)] */
MX_MINI_LED_OFFSET          = 18.0; // Distance from battery bar right end to LED center (mm)
MX_MINI_LED_SIZE            = [3.8, 1.4, 0.2]; // Pill dimensions [width, depth, height]

/* [Rubber Feet] */
MX_MINI_FRONT_FOOT_SIZE     = [16.0, 4.5, 0.8];
MX_MINI_REAR_FOOT_SIZE      = [18.0, 6.0, 0.8];

/* [Tolerances & Quality] */
$fn = 64;

// Default preview when opened directly
mx_keys_mini();

/**
 * mx_keys_mini() - BOSL2 attachable module for Logitech MX Keys Mini
 *
 * @param anchor  BOSL2 anchor (default: CENTER)
 * @param spin    BOSL2 spin angle (default: 0)
 * @param orient  BOSL2 orientation vector (default: UP)
 * @param colors  Whether to apply realistic material colors (default: true)
 */
module mx_keys_mini(anchor = CENTER, spin = 0, orient = UP, colors = true) {
    total_size = [MX_MINI_TOTAL_WIDTH, MX_MINI_TOTAL_DEPTH, MX_MINI_TOTAL_HEIGHT];

    c_metal   = colors ? "#6A6E73" : undef;
    c_bar_top = colors ? "#505458" : undef;
    c_bar_bot = colors ? "#2E3033" : undef;
    c_keycap  = colors ? "#232528" : undef;
    c_accent  = colors ? "#34A853" : undef; // Green for power on
    c_rubber  = colors ? "#1A1A1A" : undef;
    c_led     = colors ? "#4CAF50" : undef;
    c_logo    = colors ? "#C8CCD0" : undef;

    y_front_edge  = -MX_MINI_TOTAL_DEPTH / 2;
    y_body_center = y_front_edge + MX_MINI_BODY_DEPTH / 2;
    y_bar_rear    = MX_MINI_TOTAL_DEPTH / 2;
    y_bar_center  = y_bar_rear - MX_MINI_BAR_DEPTH / 2;
    y_front_feet  = y_front_edge + 7.0;

    // The underside battery bar drop needed to level feet on flat ground
    feet_span_y   = y_bar_center - y_front_feet;
    bar_drop      = feet_span_y * tan(MX_MINI_TILT_ANGLE); // ~10.75mm

    attachable(anchor, spin, orient, size = total_size) {
        translate([0, 0, -total_size.z / 2]) {
            // Pivot around the front rubber feet contact line so bottom of feet rests exactly at Z = 0
            translate([0, y_front_feet, MX_MINI_FRONT_FOOT_SIZE.z]) {
                xrot(MX_MINI_TILT_ANGLE) {
                    translate([0, -y_front_feet, 0]) {

                        // 1. Main Keyboard Top Deck / Body Plate
                        color(c_metal) {
                            translate([0, y_body_center, 0]) {
                                cuboid(
                                    [MX_MINI_BODY_WIDTH, MX_MINI_BODY_DEPTH, MX_MINI_BODY_THICKNESS],
                                    rounding = MX_MINI_CORNER_RADIUS,
                                    edges = "Z",
                                    anchor = BOT
                                );
                            }
                        }

                        // 2. Protruding Rear Battery & Electronics Bar
                        // Top flush portion
                        color(c_bar_top) {
                            translate([0, y_bar_center, 0]) {
                                cuboid(
                                    [MX_MINI_BAR_WIDTH, MX_MINI_BAR_DEPTH, MX_MINI_BODY_THICKNESS],
                                    rounding = MX_MINI_BAR_RADIUS,
                                    edges = [BACK+LEFT, BACK+RIGHT],
                                    anchor = BOT
                                );
                            }
                        }

                        // Underside riser pod
                        color(c_bar_bot) {
                            translate([0, y_bar_center, 0]) {
                                cuboid(
                                    [MX_MINI_BAR_WIDTH, MX_MINI_BAR_DEPTH, bar_drop],
                                    rounding = MX_MINI_BAR_RADIUS,
                                    edges = [FWD+BOT, BACK+BOT, LEFT+BOT, RIGHT+BOT, BACK+LEFT, BACK+RIGHT, FWD+LEFT, FWD+RIGHT],
                                    anchor = TOP
                                );
                            }
                        }

                        // 3. Individual Keys Grid (75% Compact Layout)
                        color(c_keycap) {
                            translate([
                                -MX_MINI_KEYBED_WIDTH / 2,
                                y_front_edge + MX_MINI_KEYBED_MARGIN_BOTTOM,
                                MX_MINI_BODY_THICKNESS
                            ]) {
                                mx_mini_keys(
                                    total_width  = MX_MINI_KEYBED_WIDTH,
                                    total_depth  = MX_MINI_KEYBED_DEPTH,
                                    key_height   = MX_MINI_KEY_HEIGHT,
                                    key_radius   = MX_MINI_KEY_ROUNDING,
                                    corner_radius = MX_MINI_CORNER_KEY_R
                                );
                            }
                        }

                        // 4. "logi" logo badge on top center of the rear protrusion
                        color(c_logo) {
                            translate([0, y_bar_rear - MX_MINI_BAR_PROTRUSION / 2, MX_MINI_BODY_THICKNESS + 0.05]) {
                                cuboid([14.0, 4.5, 0.1], rounding = 1.0, edges = "Z", anchor = BOT);
                            }
                        }

                        // 5. Pill-shaped Status LED on top right of the rear protrusion
                        color(c_led) {
                            translate([
                                MX_MINI_BAR_WIDTH / 2 - MX_MINI_LED_OFFSET,
                                y_bar_rear - MX_MINI_BAR_PROTRUSION / 2,
                                MX_MINI_BODY_THICKNESS + 0.05
                            ]) {
                                cuboid(
                                    MX_MINI_LED_SIZE,
                                    rounding = MX_MINI_LED_SIZE.y / 2,
                                    edges = "Z",
                                    anchor = BOT
                                );
                            }
                        }

                        // 6. Rear Vertical Face Controls
                        // Power switch
                        translate([
                            MX_MINI_BAR_WIDTH / 2 - MX_MINI_POWER_SWITCH_OFFSET,
                            y_bar_rear,
                            MX_MINI_BODY_THICKNESS / 2
                        ]) {
                            color(c_keycap)
                                cuboid([MX_MINI_POWER_SWITCH_SIZE.x, 1.0, MX_MINI_POWER_SWITCH_SIZE.z], anchor = CENTER);
                            color(c_accent)
                                translate([1.5, 0.4, 0])
                                    cuboid([3.0, 1.2, MX_MINI_POWER_SWITCH_SIZE.z * 0.8], anchor = CENTER);
                        }

                        // USB-C Charging Port
                        translate([
                            MX_MINI_BAR_WIDTH / 2 - MX_MINI_USBC_OFFSET,
                            y_bar_rear,
                            MX_MINI_BODY_THICKNESS / 2
                        ]) {
                            color(c_keycap)
                                cuboid([MX_MINI_USBC_SIZE.x, 1.0, MX_MINI_USBC_SIZE.z], rounding = 1.5, edges = "Y", anchor = CENTER);
                        }

                        // 7. Rubber Feet (3 front, 2 rear)
                        color(c_rubber) {
                            for (x_pos = [-MX_MINI_BODY_WIDTH / 2 + 35.0, 0, MX_MINI_BODY_WIDTH / 2 - 35.0]) {
                                translate([
                                    x_pos,
                                    y_front_feet,
                                    -MX_MINI_FRONT_FOOT_SIZE.z
                                ]) {
                                    cuboid(MX_MINI_FRONT_FOOT_SIZE, rounding = 2.0, edges = "Z", anchor = BOT);
                                }
                            }

                            for (x_pos = [-MX_MINI_BAR_WIDTH / 2 + 22.0, MX_MINI_BAR_WIDTH / 2 - 22.0]) {
                                translate([
                                    x_pos,
                                    y_bar_center,
                                    -bar_drop - MX_MINI_REAR_FOOT_SIZE.z
                                ]) {
                                    cuboid(MX_MINI_REAR_FOOT_SIZE, rounding = 3.0, edges = "Z", anchor = BOT);
                                }
                            }
                        }
                    }
                }
            }
        }
        children();
    }
}

/**
 * mx_mini_keys() - Generates the 6-row 75% compact key layout for MX Keys Mini
 */
module mx_mini_keys(total_width, total_depth, key_height, key_radius, corner_radius) {
    gap_x = 1.5;
    gap_y = 1.5;
    total_u = 15.0;
    pitch_x = (total_width + gap_x) / total_u;
    
    // Row Heights (Row 0 = bottom spacebar row, Row 5 = top function row)
    fn_h    = 11.5; // Shorter top function row
    alpha_h = (total_depth - fn_h - 5 * gap_y) / 5; // ~17.4 mm per alpha row

    // Key layout row definitions (unit widths per key, each row sums to exactly 15.0U):
    row5 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]; // Esc (0), F1-F12, Ins, Del (14) (15U)
    row4 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2];    // `~, 1-0, -, =, Backspace (15U)
    row3 = [1.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.5]; // Tab, Q-P, [, ], \ (15U)
    row2 = [1.75, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2.25]; // Caps, A-L, ;, ', Enter (15U)
    row1 = [2.25, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2.75];    // LShift, Z-/, RShift (15U)
    row0 = [1.0, 1.0, 1.0, 1.25, 5.75, 1.25, 1.0, 0.90, 0.95, 0.90]; // Bottom row + arrow cluster (15U)

    // Row Y offsets from front to back
    y0 = 0;
    y1 = y0 + alpha_h + gap_y;
    y2 = y1 + alpha_h + gap_y;
    y3 = y2 + alpha_h + gap_y;
    y4 = y3 + alpha_h + gap_y;
    y5 = y4 + alpha_h + gap_y;

    // Render Rows 1 to 4 (Standard alpha rows)
    render_key_row(row1, y1, alpha_h, pitch_x, gap_x, key_height, key_radius);
    render_key_row(row2, y2, alpha_h, pitch_x, gap_x, key_height, key_radius);
    render_key_row(row3, y3, alpha_h, pitch_x, gap_x, key_height, key_radius);
    render_key_row(row4, y4, alpha_h, pitch_x, gap_x, key_height, key_radius);

    // Render Row 5 (Function row with Esc top-left and Del top-right rounded corners)
    render_fn_row(row5, y5, fn_h, pitch_x, gap_x, key_height, key_radius, corner_radius);

    // Render Row 0 (Bottom row with Ctrl bottom-left, Right-arrow bottom-right, and half-height arrow cluster)
    render_bottom_row(row0, y0, alpha_h, pitch_x, gap_x, gap_y, key_height, key_radius, corner_radius);
}

module render_key_row(row_units, y_pos, row_height, pitch_x, gap_x, key_height, key_radius) {
    for (i = [0 : len(row_units) - 1]) {
        x_offset = (i == 0) ? 0 : sum([for (j = [0 : i - 1]) row_units[j]]) * pitch_x;
        key_w = row_units[i] * pitch_x - gap_x;

        translate([x_offset, y_pos, 0]) {
            linear_extrude(height = key_height) {
                rect([key_w, row_height], rounding = min(key_radius, min(key_w, row_height) / 4), anchor = FWD+LEFT);
            }
        }
    }
}

module render_fn_row(row_units, y_pos, row_height, pitch_x, gap_x, key_height, key_radius, corner_radius) {
    for (i = [0 : len(row_units) - 1]) {
        x_offset = (i == 0) ? 0 : sum([for (j = [0 : i - 1]) row_units[j]]) * pitch_x;
        key_w = row_units[i] * pitch_x - gap_x;
        r_std = min(key_radius, min(key_w, row_height) / 4);
        r_corner = min(corner_radius, row_height - r_std - 0.5);

        // BOSL2 rect rounding order: [NE, NW, SW, SE]
        corner_roundings = 
            (i == 0) ? [r_std, r_corner, r_std, r_std] : // Esc (NW / Top-Left)
            (i == len(row_units) - 1) ? [r_corner, r_std, r_std, r_std] : // Del (NE / Top-Right)
            r_std; // Standard inner keys

        translate([x_offset, y_pos, 0]) {
            linear_extrude(height = key_height) {
                rect([key_w, row_height], rounding = corner_roundings, anchor = FWD+LEFT);
            }
        }
    }
}

module render_bottom_row(row_units, y_pos, row_height, pitch_x, gap_x, gap_y, key_height, key_radius, corner_radius) {
    half_h = (row_height - gap_y) / 2;
    r_std  = min(key_radius, row_height / 4);
    r_half = min(key_radius, half_h / 3);
    r_arrow_corner = min(corner_radius, half_h - 1.0);

    for (i = [0 : len(row_units) - 1]) {
        x_offset = (i == 0) ? 0 : sum([for (j = [0 : i - 1]) row_units[j]]) * pitch_x;
        key_w = row_units[i] * pitch_x - gap_x;

        if (i == 0) {
            // Left Fn/Ctrl (SW / Bottom-Left corner rounded to match frame)
            translate([x_offset, y_pos, 0]) {
                linear_extrude(height = key_height) {
                    rect([key_w, row_height], rounding = [r_std, r_std, corner_radius, r_std], anchor = FWD+LEFT);
                }
            }
        } else if (i == 7) {
            // Left Arrow (half-height on bottom half of row)
            translate([x_offset, y_pos, 0]) {
                linear_extrude(height = key_height) {
                    rect([key_w, half_h], rounding = r_half, anchor = FWD+LEFT);
                }
            }
        } else if (i == 8) {
            // Up / Down arrow stacked pair (half-height each)
            // Down Arrow (bottom)
            translate([x_offset, y_pos, 0]) {
                linear_extrude(height = key_height) {
                    rect([key_w, half_h], rounding = r_half, anchor = FWD+LEFT);
                }
            }
            // Up Arrow (top)
            translate([x_offset, y_pos + half_h + gap_y, 0]) {
                linear_extrude(height = key_height) {
                    rect([key_w, half_h], rounding = r_half, anchor = FWD+LEFT);
                }
            }
        } else if (i == 9) {
            // Right Arrow (half-height on bottom half of row, SE / Bottom-Right corner rounded to match frame)
            translate([x_offset, y_pos, 0]) {
                linear_extrude(height = key_height) {
                    rect([key_w, half_h], rounding = [1.0, 1.0, 1.0, r_arrow_corner], anchor = FWD+LEFT);
                }
            }
        } else {
            // Standard bottom row keys (Opt, Cmd, Space, Cmd, Opt)
            translate([x_offset, y_pos, 0]) {
                linear_extrude(height = key_height) {
                    rect([key_w, row_height], rounding = r_std, anchor = FWD+LEFT);
                }
            }
        }
    }
}

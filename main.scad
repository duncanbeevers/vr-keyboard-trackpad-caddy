include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

$VPD = 300;

/* [Trackpad Settings] */
TRACKPAD_WALL_THICKNESS = 2;
TRACKPAD = [160 + TRACKPAD_WALL_THICKNESS * 2, 115 + TRACKPAD_WALL_THICKNESS * 2, 12];
TRACKPAD_CORNER_RADIUS = 10;
TRACKPAD_FRAME_FRONT_HEIGHT = 5;
TRACKPAD_CHARGING_PORT = [12, TRACKPAD_WALL_THICKNESS, 6.8];
TRACKPAD_POWER_SWITCH_PORT = [21, 11, TRACKPAD.z / 1.5];
FOOTPAD_SUPPORT = [15, 15, 2];
PORT_ROUNDING_RADIUS = 2;

/* [Keyboard Strut settings] */
STRUT_TINE_DEPTH = 5;
STRUT = [20, 130 + STRUT_TINE_DEPTH, 4];
STRUT_TINE_REAR = [STRUT.x, STRUT_TINE_DEPTH, 21]; 
STRUT_ROUNDING = 1;
STRUT_BATTERY_CHANNEL_WIDTH = 25;
STRUT_SEPARATION = 70;
STRUT_CROSSBRACE = [STRUT_SEPARATION, 10, STRUT.z / 1.5]; 
STRUT_CROSSBRACE_OFFSET = 20;
CLIP_SIZE = 2;

/* [Hidden] */
$fn = 72;
$slop = 0.05; // 3D printing tolerance gap handled natively by BOSL2 joiners

// Calculate global Y split coordinate location
Y_CUT_PLANE = (TRACKPAD.y + STRUT.y) / 2;

// Main Pipeline
partition_and_dovetail(y_position = Y_CUT_PLANE, spread = 20) assembly();

module assembly() {
    frame() position(BACK+BOT) struts(anchor = FWD+BOT);
}

// Partitioning module using bounding box masking to isolate halves
module partition_and_dovetail(y_position, spread) {
    /* [Local Dovetail settings] */
    DOVETAIL_WIDTH = STRUT.x / 1.6;  // Total width of the dovetail joint
    DOVETAIL_LENGTH = 5;  // How far the dovetail neck extends along the Y-axis
    DOVETAIL_ANGLE = 20;  // Locking flare angle
    DOVETAIL_TAPER = 5;
    DOVETAIL_Z = -TRACKPAD.z / 2;  // Keep dovetails anchored to the bottom of the struts.
    // DOVETAIL_Z = 0;

    if (spread == 0) {
        children();
    } else {
        // 1. FRONT HALF ASSEMBLY (Moves Forward)
        translate([0, -spread/2, 0]) {
            union() {
                intersection() {
                    children();
                    translate([0, y_position - 500, 0]) cube([1000, 1000, 1000], center=true);
                }
                // Fuse solid male tabs directly onto the cut face of each strut (+Y direction)
                xcopies(spacing = STRUT_SEPARATION, n = 2)
                    translate([0, y_position, DOVETAIL_Z])
                        xrot(-90)
                            dovetail(gender="male", w=DOVETAIL_WIDTH, h=DOVETAIL_LENGTH, slide=STRUT.z, angle=DOVETAIL_ANGLE, taper=DOVETAIL_TAPER, anchor=BOTTOM+BACK);
            }
        }
        
        // 2. BACK HALF ASSEMBLY (Moves Backward)
        translate([0, spread/2, 0]) {
            difference() {
                intersection() {
                    children();
                    translate([0, y_position + 500, 0]) cube([1000, 1000, 1000], center=true);
                }
                // yrot(180) corrects the internal female tracking direction to run upward (+Z)
                xcopies(spacing = STRUT_SEPARATION, n = 2)
                    translate([0, y_position, DOVETAIL_Z])
                        yrot(180) xrot(90)
                            // Slide thickness gets a tiny over-height modifier (+0.1) for a clean face through-cut
                            dovetail(gender="female", w=DOVETAIL_WIDTH, h=DOVETAIL_LENGTH, slide=STRUT.z + 0.1, angle=DOVETAIL_ANGLE, taper=DOVETAIL_TAPER, anchor=BOTTOM+BACK, $slop=$slop);
            }
        }
    }
}

// Trackpad frame with port notches
module frame(anchor = CENTER, spin=0, orient=UP) {
    attachable(anchor, spin, orient, size = TRACKPAD) {
        union() {
            diff() {
                // 1. Trackpad Frame
                rect_tube(size=[TRACKPAD.x, TRACKPAD.y], h=TRACKPAD.z, wall=TRACKPAD_WALL_THICKNESS, rounding=TRACKPAD_CORNER_RADIUS, anchor = CENTER);

                // 2. Continuous reinforcement band attached to frame walls at bottom
                position(BOT)
                rect_tube(size=[TRACKPAD.x - 2*TRACKPAD_WALL_THICKNESS, TRACKPAD.y - 2*TRACKPAD_WALL_THICKNESS],
                          h=FOOTPAD_SUPPORT.z, wall=20, rounding=6, irounding=4, anchor=BOT);
                // 3. Trackpad Power Switch Port    
                position(BACK+RIGHT+TOP) move([1, 1, 0]) tag("remove")
                    rounded_prism(rect([TRACKPAD_POWER_SWITCH_PORT.x, TRACKPAD_POWER_SWITCH_PORT.y]), height = TRACKPAD_POWER_SWITCH_PORT.z,
                        k = 0.93, joint_bot = PORT_ROUNDING_RADIUS, joint_top = -PORT_ROUNDING_RADIUS, joint_sides = 0.01, anchor = TOP+RIGHT+BACK);

                // 4. Trackpad Charging Port
                position(BACK) tag("remove")
                    back(0.1)
                    cuboid(TRACKPAD_CHARGING_PORT + [0, 0.2, 0], rounding = PORT_ROUNDING_RADIUS, edges = "Y", anchor = BACK);

                // 5.  Profiling Wedge
                position(TOP) yrot(180) tag("remove")
                down(0.01)
                wedge(TRACKPAD+[0.1,0.1,-TRACKPAD_FRAME_FRONT_HEIGHT], anchor = BOT);
            }
            // Front keyboard clip
            position(BACK+TOP)
            xcyl(STRUT.x, d = CLIP_SIZE, rounding = CLIP_SIZE / 2, anchor = TOP);
        }
        children();
    }
}

// 6. Struts and Rear Fork Assembly
module struts(anchor = CENTER, spin=0, orient=UP) {
    attachable(anchor, spin, orient, size = [STRUT_SEPARATION + 1 * STRUT.x, STRUT.y, STRUT.z]){
        union() {
            xcopies(n = 2, spacing = STRUT_SEPARATION) {
                cuboid(STRUT, rounding=STRUT_ROUNDING, except=[FRONT, TOP]) {
                    rear_tine_and_clip();
                }
            }
            // Crossbrace between the two struts.        
            position(BOT) back(STRUT_CROSSBRACE_OFFSET)
                cuboid(STRUT_CROSSBRACE, rounding=STRUT_ROUNDING, except = [LEFT,RIGHT], anchor = BOT);
        }
        children();
    }
}

module rear_tine_and_clip(anchor = CENTER, spin = 0, orient = UP) {
    // Far rear tine + clip
    align(TOP,BACK)
    cuboid(STRUT_TINE_REAR, rounding=STRUT_ROUNDING, except=[BOT,FRONT])

    position(TOP+FRONT)
    cuboid([STRUT.x,CLIP_SIZE,CLIP_SIZE], except=[BACK], rounding=STRUT_ROUNDING, anchor=BACK+TOP);
}

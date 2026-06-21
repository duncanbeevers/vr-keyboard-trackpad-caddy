include <BOSL2/std.scad>
$VPD = 300;

/* [Trackpad Settings] */
TRACKPAD = [160,115,11];
TRACKPAD_CORNER_RADIUS = 10;
TRACKPAD_WALL_THICKNESS = 2;
TRACKPAD_FRAME_FRONT_HEIGHT = 5;
TRACKPAD_CHARGING_PORT = [10,TRACKPAD_WALL_THICKNESS,6];
TRACKPAD_POWER_SWITCH_PORT = [21,11,TRACKPAD.z / 1.5];
FOOTPAD_SUPPORT = [12,12,2];
PORT_ROUNDING_RADIUS = 2;

/* [Keyboard Strut settings] */
STRUT = [20,131,4];
STRUT_TINE_FRONT = [STRUT.x,5,5];
STRUT_TINE_REAR = [STRUT.x,5,11]; // 8mm keyboard rise + thin lip for clips
STRUT_ROUNDING = 1;
STRUT_BATTERY_CHANNEL_WIDTH = 25;
STRUT_SEPARATION = 70;
STRUT_CROSSBRACE = [STRUT_SEPARATION, 10, STRUT.z / 1.5]; // Extends into struts to avoid rounding issues.
STRUT_CROSSBRACE_OFFSET = 20;
CLIP_SIZE = 2;
DOVETAIL_OFFSET = (TRACKPAD.y + STRUT.y) / 2;

/* [Hidden] */

$fn = 72;

// Main
translate([0, DOVETAIL_OFFSET, 0])
partition([TRACKPAD.x, TRACKPAD.y + STRUT.y, STRUT_TINE_REAR.z + STRUT.z], spread = 20, cutpath = "flat")
translate([0, -DOVETAIL_OFFSET, 0])
frame()
    position(BACK+BOT) struts(anchor = FWD+BOT);

// Trackpad frame with port notches
module frame(anchor = CENTER, spin=0, orient=UP) {
    attachable(anchor, spin, orient, size = TRACKPAD) {
        union() {
            diff() {
                // 1. Trackpad Frame
                rect_tube(size=[TRACKPAD.x, TRACKPAD.y], h=TRACKPAD.z, wall=TRACKPAD_WALL_THICKNESS, rounding=TRACKPAD_CORNER_RADIUS, anchor = CENTER);

                // 2. Corner Supports
                grid_copies(n = [2,2], spacing = [TRACKPAD.x - FOOTPAD_SUPPORT.x, TRACKPAD.y - FOOTPAD_SUPPORT.y]) {
                    position(BOT)
                    cuboid(FOOTPAD_SUPPORT, rounding = PORT_ROUNDING_RADIUS, edges = "Z", anchor = BOT)
                        edge_mask([$col * 2 - 1, $row * 2 - 1, 0])
                            rounding_edge_mask(l=$parent_size.z+0.01, r=TRACKPAD_CORNER_RADIUS);      //edge mask has implied "remove" tag
                }
                // 3. Trackpad Power Switch Port    
                position(BACK+RIGHT+TOP) move([1,1,0]) tag("remove")
                    rounded_prism(rect([TRACKPAD_POWER_SWITCH_PORT.x, TRACKPAD_POWER_SWITCH_PORT.y]), height = TRACKPAD_POWER_SWITCH_PORT.z,
                        k = 0.93, joint_bot = PORT_ROUNDING_RADIUS, joint_top = -PORT_ROUNDING_RADIUS, joint_sides = 0.01, anchor = TOP+RIGHT+BACK);

                // 4. Trackpad Charging Port
                position(BACK) tag("remove")
                    back(0.1)
                    cuboid(TRACKPAD_CHARGING_PORT + [0,0.2,0], rounding = PORT_ROUNDING_RADIUS, edges = "Y", anchor = BACK);

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
                // Strut body
                cuboid(STRUT, rounding=STRUT_ROUNDING, except=[FRONT, TOP]) {
                    // Near tine
                    align(TOP,BACK) fwd(STRUT_BATTERY_CHANNEL_WIDTH)
                        cuboid(STRUT_TINE_FRONT, rounding=STRUT_ROUNDING, except=BOT);
                    // Far rear tine
                    align(TOP,BACK) 
                        cuboid(STRUT_TINE_REAR, rounding=STRUT_ROUNDING, except=[BOT,FRONT])
                        // Rear keyboard clips
                        align(FRONT,TOP)
                        #cuboid([STRUT.x,CLIP_SIZE,CLIP_SIZE], except=[BACK], rounding=STRUT_ROUNDING);
                    }
                    // Split strut in order to create two pieces which will dovetail
                    // Negative Dovetail
                    // Positive Dovetail
                    
                }
                // Crossbrace between the two struts.        
                position(BOT) back(STRUT_CROSSBRACE_OFFSET)
                    cuboid(STRUT_CROSSBRACE, rounding=STRUT_ROUNDING, except = [LEFT,RIGHT], anchor = BOT);
        }
        children();
    }
}

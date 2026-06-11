# LibFile: hinges.scad

Functions and modules for creating hinges and snap-locking hinged parts.

To use, add the following lines to the beginning of your file:

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>

## File Contents

1. [Section: Hinges](#section-hinges)
    - [`knuckle_hinge()`](#module-knuckle_hinge) – Creates a knuckle-hinge shape. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>
    - [`living_hinge_mask()`](#module-living_hinge_mask) – Creates a mask to make a folding "living" hinge. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

2. [Section: Snap Locks](#section-snap-locks)
    - [`apply_folding_hinges_and_snaps()`](#module-apply_folding_hinges_and_snaps) – Adds snap shapes and removes living hinges from a child shape. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>
    - [`snap_lock()`](#module-snap_lock) – Creates a snap-lock shape. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>
    - [`snap_socket()`](#module-snap_socket) – Creates a snap-lock socket shape. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>


## Section: Hinges


### Module: knuckle\_hinge()

**Synopsis:** Creates a knuckle-hinge shape. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

**Topics:** [Hinges](Topics#hinges), [Parts](Topics#parts)

**See Also:** [living\_hinge\_mask()](#module-living_hinge_mask), [snap\_lock()](#module-snap_lock), [snap\_socket()](#module-snap_socket)

**Usage:** 

- knuckle_hinge(length, offset, segs, [inner], [arm_height=], [arm_angle=], [fill=], [clear_top=], [gap=], [round_top=], [round_bot=], [knuckle_diam=], [pin_diam=], [pin_fn=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];

**Description:** 

Construct standard knuckle hinge in two parts using a hinge pin that must be separately supplied,
or a print-in-place knuckle hinge.  The default is configured to use a piece of 1.75 mm filament
as the hinge pin, but you can select any dimensions you like to use a screw or other available pin material.
The hinge appears with what is typically the mounting surface restong on the XY plane with the hinge rotational axis
parallel to the X axis.  The BOTTOM
of the hinge is its mount point, which, if clearance is not set, is in line with the hinge pin rotational center.
In this case the hinge pin hole is the CENTER of the hinge.
The offset is the distance the base (the mounting point) to the center
of the hinge pin.  The offset cannot be smaller than the knuckle diameter.
The hinge barrel is held by an angled support and vertical support.  The
length of the angled support is determined by its angle and the offset.  You specify the length
of the vertical support with the arm_height parameter.

A hinge requires clearance so its parts don't interfere.  If the hinge pin is exactly centered on
the top of your part, then the hinge may not close all the way due to interference at the edge.
A small clearance, specified with `clearance=`, move the hinge in the Y direction (which would be UP if
it were mounted on the side of a cube).  This shifts the rotation slightly and can ease the interference.
It should probably be equal to a layer thickness or two.  Note that clearance moves the rotational center
but the CENTER, BOTTOM and TOP anchors stay fixed, so if you give a nonzero clearance, the center of rotation
will be offset by the clearance from the center anchor.

If the hinge knuckle is
close to the hinged part then the mating part may interfere.  You can create clearance to address
this problem by increasing the offset to move the hinge knuckles farther away.  Another method is
to cut out a curved recess on the parts to allow space for the other hinges.  This is possible
using the `knuckle_clearance=` parameter, which specifies the extra space to cut away to leave
room for the hinge knuckles.  It must be positive for any space to be cut, and to use this option
you must make the hinge a child of some object and specify [`diff()`](attachments.scad#module-diff) for the parent object of
the hinge.

To create a print-in-place hinge set `in_place=true` to create a hinge with interlocking cones
instead of leaving a hole for an inserted pin.  In this case, `pin_diam` gives the diameter of
the base of the cones and defaults to 1 less than the knuckle diameter.  You can also set `in_place`
to a cone angle.  This is the angle of the bottom edge of the cone, measured from the vertical---the overhang
angle for printing.  A larger angle produces a pointier cone that is more difficult to print and has
a smaller clearance gap inside.

**Figure 1.1.1:** The basic hinge form appears on the left.  If fill is set to true the gap between the mount surface and hinge arm is filled as shown on the right.

<img align="left" alt="knuckle\_hinge() Figure 1.1.1" src="images/hinges/figure_1_1_1.png" width="480" height="360">

<br clear="all" />


As shown in the above figure, the fill option fills the gap between the hinge arm and the mount surface to make a stronger connection.  When the
arm height is set to zero, only a single segment connects the hinge barrel to the mount surface.

**Figure 1.1.2:** Zero arm height with 45 deg arm

<img align="left" alt="knuckle\_hinge() Figure 1.1.2" src="images/hinges/figure_1_1_2.png" width="480" height="360">

<br clear="all" />



**Figure 1.1.3:** Zero arm height with 90 deg arm.  The clear\_top parameter removes the hinge support material that is above the x axis

<img align="left" alt="knuckle\_hinge() Figure 1.1.3" src="images/hinges/figure_1_1_3.png" width="480" height="360">

<br clear="all" />

**Figure 1.1.4:** An excessively large clearance value raises up the hinge center.  Note that the hinge mounting remains bounded by the X axis, so when `fill=true` or `clear_top=true` this is different than simply raising up the entire hinge.

<img align="left" alt="knuckle\_hinge() Figure 1.1.4" src="images/hinges/figure_1_1_4.png" width="480" height="360">

<br clear="all" />


For 3D printability, you may prefer a teardrop shaped hole, which you can get with `teardrop=true`;
if necessary you can specify the teardrop direction to be UP, DOWN, FORWARD, or BACK.
(These directions assume that the base of the hinge is mounted on the back of something.)
Another option for printability is to use an octagonal hole, though it does seem more
difficult to size these for robust printability.  To get an octagonal hole set `pin_fn=8`.

**Figure 1.1.5:** Alternate hole shapes for improved 3D printabililty

<img align="left" alt="knuckle\_hinge() Figure 1.1.5" src="images/hinges/figure_1_1_5.png" width="480" height="360">

<br clear="all" />


The default pin hole size admits a piece of 1.75 mm filament.  If you prefer to use a machine
screw you can set the pin_diam to a screw specification like `"M3"` or "#6".  In this case,
a clearance hole is created through most of the hinge with a self-tap hole for the last segment.
If the last segment is very long you may shrink the self-tap portion using the tap_depth parameter.
The pin hole diameter is enlarged by the `2*$slop` for numerically specified holes.
Screw holes are made using [`screw_hole()`](screws.scad#module-screw_hole) which enlarges the hole by `4*$slop`.

Instead of a hinge pin you can set `in_place=true` to produce a print-in-place hinge that uses
cones to interlock the hinge segments.  The default cones are 45 degrees; you can set `in_place` to an
angle from the vertical to adjust the cone angle.  (This means larger angles are pointier, and also less likely to print successfully.)
Use `gap` to adjust the clearance in the hinge
to get something that separates after printing.  When you adjust the cone angle, higher angles result in a smaller
clearance where the cones meet for the same gap size, so you can somewhat adjust the tightness of the hinge
by changing the cone angle.  The default cone diameter, which is controlled by `pin_diam` is 1 unit smaller than the knuckle diameter, which should work well
for larger hinges, but for small hinges you may want to specify a larger `pin_diam`.

**Figure 1.1.6:** A print-in-place hinge with part of the hinge cut away so you can see the interlocking cones that hold it together:

<img align="left" alt="knuckle\_hinge() Figure 1.1.6" src="images/hinges/figure_1_1_6.png" width="240" height="180">

<br clear="all" />


To blend hinges better with a model you can round off the joint with the mounting surface using
the `round_top` and `round_bot` parameters, which specify the cut distance, the amount of material to add.
They make a continuous curvature "smooth" roundover with `k=0.8`.  See [smooth roundovers](rounding.scad#section-types-of-roundovers) for more
information.  If you specify too large of a roundover you will get an error that the rounding doesn't fit.

**Figure 1.1.7:** Top and bottom roundovers for smooth hinge attachment

<img align="left" alt="knuckle\_hinge() Figure 1.1.7" src="images/hinges/figure_1_1_7.png" width="480" height="360">

<br clear="all" />

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`length`             | total length of the entire hinge
`segs`               | number of hinge segments
`offset`             | horizontal offset of the hinge pin center from the mount point
`inner`              | set to true for the "inner" hinge.  Default: false

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`arm_height`         | vertical height of the arm that holds the hinge barrel.  Default: 0
`arm_angle`          | angle of the arm down from the vertical.  Default: 45
`fill`               | if true fill in space between arm and mount surface.  Default: true
`clear_top`          | if true remove any excess arm geometry that appears above the top of the mount surface.  Default: false
`gap`                | gap between hinge segments.  Default: 0.2
`round_top`          | rounding amount to add where top of hinge arm joins the mount surface.  Generally only useful when fill=false.  Default: 0
`round_bot`          | rounding amount to add where bottom of hinge arm joins the mount surface.  Default: 0
`knuckle_diam`       | diameter of hinge barrel.  Default: 4
`pin_diam`           | for regular hinges, diameter of hinge pin hole as a numerical dimension or as a screw specification.  For print-in-place hinges, the diameter of the base of the interlocking cones inside the hinge.  Default: 1.75 for regular hinges, 1 less than knuckle_diameter for print-in-place hinges.
`pin_fn`             | $fn value to use for the pin.
`teardrop`           | Set to true or UP/DOWN/FWD/BACK to specify teardrop shape for the pin hole.  Default: false
`screw_head`         | screw head to use for countersink
`screw_tolerance`    | screw hole tolerance.  Default: "close"
`tap_depth`          | Don't make the tapped part of the screw hole larger than this.
`in_place`           | If true create a print-in-place hinge with 45 deg angle interlocking cones.  If set to an angle, measures the angle from the vertical to the lower cone angle.  Default: false
`$slop`              | increases pin hole diameter
`clearance`          | raises pin hole to create clearance at the edge of the mounted surface.  Default: 0.15
`knuckle_clearance`  | clear space to create specified clearance for hinge knuckle of mating part.  Must use with [`diff()`](attachments.scad#module-diff).  Default: 0
`anchor`             | Translate so anchor point is at origin (0,0,0).  See [anchor](attachments.scad#subsection-anchor).  Default: `BOTTOM`
`spin`               | Rotate this many degrees around the Z axis after anchor.  See [spin](attachments.scad#subsection-spin).  Default: `0`
`orient`             | Vector to rotate top towards, after spin.  See [orient](attachments.scad#subsection-orient).  Default: `UP`

**Example 1:** Basic hinge, inner=false in front and inner=true in the back

<img align="left" alt="knuckle\_hinge() Example 1" src="images/hinges/knuckle_hinge.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    ydistribute(30){
      knuckle_hinge(length=35, segs=5, offset=3, arm_height=1);
      knuckle_hinge(length=35, segs=5, offset=3, arm_height=1,inner=true);
    }

**Example 2:** Basic hinge, mounted.  Odd segment count means the "outside" hinge is on the outside at both ends.

<img align="left" alt="knuckle\_hinge() Example 2" src="images/hinges/knuckle_hinge_2.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    cuboid([2,40,15])
      position(TOP+RIGHT) orient(anchor=RIGHT)
        knuckle_hinge(length=35, segs=9, offset=3, arm_height=1);

<br clear="all" /><br/>

**Example 3:** Corresponding inner hinge to go with previous example.  Note that the total number of hinge segments adds to the 9 specified.

<img align="left" alt="knuckle\_hinge() Example 3" src="images/hinges/knuckle_hinge_3.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    cuboid([2,40,15])
      position(TOP+RIGHT) orient(anchor=RIGHT)
        knuckle_hinge(length=35, segs=9, offset=3, arm_height=1, inner=true);

**Example 4:** This example shows how to position and orient the hinge onto the front of an object instead of the right side.

<img align="left" alt="knuckle\_hinge() Example 4" src="images/hinges/knuckle_hinge_4.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    cuboid([40,2,15])
      position(TOP+FRONT) orient(anchor=FWD)
        knuckle_hinge(length=35, segs=9, offset=3, arm_height=1);

<br clear="all" /><br/>

**Example 5:** Hinge with round\_bot set to create a smooth transition, but octagonal hinge pin holes for printing

<img align="left" alt="knuckle\_hinge() Example 5" src="images/hinges/knuckle_hinge_5.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    cuboid([2,40,15])
      position(TOP+RIGHT) orient(anchor=RIGHT)
        knuckle_hinge(length=35, segs=9, offset=3, arm_height=1,
              round_bot=1, pin_fn=8);

<br clear="all" /><br/>

**Example 6:** Hinge with no vertical arm, just angled arm

<img align="left" alt="knuckle\_hinge() Example 6" src="images/hinges/knuckle_hinge_6.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    cuboid([2,40,15])
      position(TOP+RIGHT) orient(anchor=RIGHT)
        knuckle_hinge(length=35, segs=9, offset=3, pin_fn=8);

<br clear="all" /><br/>

**Example 7:** Setting the arm\_angle to a large value like 90 produces a hinge that doesn't look great

<img align="left" alt="knuckle\_hinge() Example 7" src="images/hinges/knuckle_hinge_7.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    cuboid([2,40,15])
      position(TOP+RIGHT) orient(anchor=RIGHT)
        knuckle_hinge(length=35, segs=9, offset=3, arm_angle=90,
              arm_height=0, pin_fn=8);

<br clear="all" /><br/>

**Example 8:** The above hinge is improved with clear\_top, which allows nice attachment to a shape half the thickness of the hinge barrel

<img align="left" alt="knuckle\_hinge() Example 8" src="images/hinges/knuckle_hinge_8.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    cuboid([20,40,2])
      position(TOP+RIGHT) orient(anchor=RIGHT)
        knuckle_hinge(length=35, segs=9, offset=3, arm_height=0,
              arm_angle=90, pin_fn=8, clear_top=true);

<br clear="all" /><br/>

**Example 9:** Uneven hinge using seg\_ratio.  Here the inner hinge segments are 1/3 the outer, a rather extreme difference.  Note also that it's a little simpler to mount the inner hinge on the LEFT side of the top section to interface with the hinge mounted on the RIGHT.

<img align="left" alt="knuckle\_hinge() Example 9" src="images/hinges/knuckle_hinge_9.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    cuboid([2,40,15]){
      position(TOP+RIGHT) orient(anchor=RIGHT)
        knuckle_hinge(length=35, segs=9, offset=3, arm_height=1,
              seg_ratio=1/3);
      attach(TOP,TOP) color("green")
        cuboid([2,40,15],anchor=TOP)
          position(TOP+LEFT) orient(anchor=LEFT)
            knuckle_hinge(length=35, segs=9, offset=3, arm_height=1,
                  seg_ratio=1/3, inner=true);
     }

**Example 10:** A single hinge with an even number of segments will probably look strange, but they work together neatly in a pair.  This example also shows that the arm\_height can change between the inner and outer hinge parts and they will still interface properly.

<img align="left" alt="knuckle\_hinge() Example 10" src="images/hinges/knuckle_hinge_10.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    cuboid([2,40,15]){
      yflip_copy()
        position(TOP+RIGHT+FRONT) orient(anchor=RIGHT)
          knuckle_hinge(length=12, segs=2, offset=2, arm_height=2,
                anchor=BOT+LEFT);
      attach(TOP,TOP) color("green")
        cuboid([2,40,15],anchor=TOP)
          yflip_copy()
            position(TOP+LEFT+FRONT) orient(anchor=LEFT)
              knuckle_hinge(length=12, segs=2, offset=2, arm_height=0,
                    inner=true, anchor=BOT+RIGHT);
     }

**Example 11:** Hinge with self-tapping screw hole.  Note that last segment has smaller diameter for screw to bite, whereas other segments have clearance holes.

<img align="left" alt="knuckle\_hinge() Example 11" src="images/hinges/knuckle_hinge_11.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    bottom_half(z=.01)
      cuboid([2,40,15],anchor=TOP)
        position(TOP+RIGHT) orient(anchor=RIGHT)
          knuckle_hinge(length=35, segs=5, offset=5, knuckle_diam=9, pin_diam="#6", fill=false,inner=false, screw_head="flat");

**Example 12:** If you give a non-flat screw head then a counterbore for that head is generated.  If you don't want the counterbore, don't give a head type.  In this example, tap\_depth limits the narrower self-tap section of the hole.

<img align="left" alt="knuckle\_hinge() Example 12" src="images/hinges/knuckle_hinge_12.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    bottom_half(z=.01)
       cuboid([2,40,15],anchor=TOP)
         position(TOP+RIGHT) orient(anchor=RIGHT)
            knuckle_hinge(length=35, segs=3, offset=5, knuckle_diam=9, pin_diam="#6",
                  fill=false, inner=false, tap_depth=6, screw_head="socket");

**Example 13:** This hinge has a small offset, so the hinged parts may interfere.  To prevent this, use `knuckle_clearance`.  This example shows an excessive clearance value to make the effect obvious.  Note that you **must** use [`diff()`](attachments.scad#module-diff) when you set `knuckle_clearance`, and the hinge must be a child of the object it mounts to.  Otherwise the cylinders that are supposed to be subtracted will appear as extra objects.  This is an inner hinge, so it has clearance zones for the larger outer hinge that will mate with it.

<img align="left" alt="knuckle\_hinge() Example 13" src="images/hinges/knuckle_hinge_13.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    diff()
      cuboid([4,40,15])
        position(TOP+RIGHT) orient(anchor=RIGHT)
          knuckle_hinge(length=35, segs=5, offset=2, inner=true, knuckle_clearance=1);

**Example 14:** Oh no! Forgot to use [`diff()`](attachments.scad#module-diff) with knuckle\_clearance!

<img align="left" alt="knuckle\_hinge() Example 14" src="images/hinges/knuckle_hinge_14.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
      cuboid([4,40,15])
        position(TOP+RIGHT) orient(anchor=RIGHT)
          knuckle_hinge(length=35, segs=5, offset=2, inner=true, knuckle_clearance=1);

**Example 15:** If you want the hinge leaves to fold flat together, pick a hinge configuration that places the centerline of the hinge pin on the plane of the hinge leaf.  Hinges that fold entirely flat probably won't work, so we add some clearance between the leaves.

<img align="left" alt="knuckle\_hinge() Example 15" src="images/hinges/knuckle_hinge_15.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=32;
    thickness=2;
    clearance=0.2;
    zrot_copies([0,180])
      color(["green","gold"][$idx])
      diff()
        fwd(clearance/2)
          cuboid([20,thickness,7],anchor=BACK)
            down(thickness/3)
            position(TOP+BACK)
              knuckle_hinge(20, segs=5, offset=thickness+clearance,
                            inner=$idx==0, knuckle_clearance=clearance,
                            clearance=clearance/2, arm_angle=90,
                            knuckle_diam=2*thickness+clearance,
                            clear_top=true);

**Example 16:** Here's a print-in-place hinge positioned for printing.  The next three examples show some different ways to position a hinge like this.  In this case, we create the hinge leaf, put the hinge on it, put the second hinge leaf next to it, and put the hinge on that.  It would be hard to rotate this hinge.  This hinge works with a 0.2mm layer height on a Prusa MK3S.

<img align="left" alt="knuckle\_hinge() Example 16" src="images/hinges/knuckle_hinge_16.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=64;
    leaf_gap = 0.4;
    seg_gap = 0.2;
    module myhinge(inner)
       knuckle_hinge(length=25, segs=7, offset=3.1, inner=inner, in_place=true,
                     clearance=leaf_gap/2, round_bot=0.5, gap=seg_gap, seg_ratio=1/3);
    cuboid([20,25,2],rounding=7,edges=[LEFT+FWD,LEFT+BACK]){
      position(TOP+RIGHT) orient(UP,-90)
        myhinge(false);
      align(RIGHT) right(leaf_gap) cuboid([20,25,2],rounding=7,edges=[RIGHT+FWD,RIGHT+BACK])
        position(TOP+LEFT) orient(UP,90)
          myhinge(true);
    }

**Example 17:** A very small print-in-place hinge with a 2mm hinge barrel that printed successfully on a Prusa MK3S with 0.15 mm layer height.  The 0.15 clearance places the rotation axis above the hinge leaves which enables the hinge to close all the way.  This construction makes the hinge leaf a child of the hinge, which enables easy rotation of hinge leaf and anything connected to it.  We do have to adjust the rotation center for the clearance.  This construction also makes the leaves symmetrically so they can be made with identical code, instead of needing to round opposite ends.

<img align="left" alt="knuckle\_hinge() Example 17" src="images/hinges/knuckle_hinge_17.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn = 64;
    diam = 2;       // Hinge knuckle diameter
    seg_gap = 0.15; // Gap between hinge segments
    clear = 0.15;   // Clearance so hinge will close all the way
    ang=0;          // Hinge rotation angle
    module myhinge(inner)
       knuckle_hinge(length=25, segs=11,offset=1.2, inner=inner, clearance=clear, knuckle_diam=diam,
                     pin_diam=diam-0.2, arm_angle=28, gap=seg_gap, in_place=true, anchor=CTR,clip=2+clear)
          children();
    module leaf() cuboid([25,2,12],anchor=TOP+BACK,rounding=7,edges=[BOT+LEFT,BOT+RIGHT]);
    xrot(90){    // Rotate to printing orientation
      myhinge(true) position(BOT) leaf();
      color("lightblue")
        xrot(180-ang,cp=[0,clear,0])
        zrot(180,cp=[0,clear,0])
        myhinge(false) position(BOT) leaf();
    }

**Example 18:** Here is a print-in-place hinge where the hinge barrel matches the thickness of the leaves.  In this hinge we show another way to mate the parts where we [`attach()`](attachments.scad#module-attach) one hinge section to the other and the leaves are children of the hinges.  This hinge printed successfully (with ang=0) on a Prusa MK3S with a 0.2mm layer thickness.  This hinge is shown folded at an angle; for printing, set `ang=0`.

<img align="left" alt="knuckle\_hinge() Example 18" src="images/hinges/knuckle_hinge_18.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    $fn=64;
    thickness=4;
    seg_gap = 0.2;
    end_space = 0.6;
    ang=35;
    module myhinge(inner)
       knuckle_hinge(length=25, segs=13,offset=thickness/2+end_space, inner=inner, clearance=-thickness/2, knuckle_diam=thickness,
                     arm_angle=45, gap=seg_gap, in_place=true, clip=thickness/2)
                     children();
    module leaf() cuboid([25,thickness,25],anchor=TOP+BACK, rounding=7, edges=[BOT+LEFT,BOT+RIGHT]);
    xrot(90)
      myhinge(true){
        position(BOT) leaf();
        color("lightblue")
          up(end_space) attach(BOT,TOP,inside=true)
          tag("")  // cancel default "remove" tag
          xrot(-ang,cp=[0,-thickness/2,thickness/2]) myhinge(false)
            position(BOT) leaf();
      }

---

### Module: living\_hinge\_mask()

**Synopsis:** Creates a mask to make a folding "living" hinge. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

**Topics:** [Hinges](Topics#hinges), [Parts](Topics#parts)

**See Also:** [knuckle\_hinge()](#module-knuckle_hinge), [snap\_lock()](#module-snap_lock), [snap\_socket()](#module-snap_socket), [apply\_folding\_hinges\_and\_snaps()](#module-apply_folding_hinges_and_snaps)

**Usage:** 

- living_hinge_mask(l, thick, [layerheight=], [foldangle=], [hingegap=], [$slop=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];

**Description:** 

Creates a mask to be differenced away from a plate to create a "live" hinge, where a thin layer of plastic holds two parts together.
Center the mask at the bottom of the part you want to make a hinge in.
The mask will leave  hinge material `2*layerheight` thick on the bottom of the hinge.

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`l`                  | Length of the hinge in mm.
`thick`              | Thickness in mm of the material to make the hinge in.

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`layerheight`        | The expected printing layer height in mm.
`foldangle`          | The interior angle in degrees of the joint to be created with the hinge.  Default: 90
`hingegap`           | Size in mm of the gap at the bottom of the hinge, to make room for folding.
`$slop`              | Increase size of hinge gap by double this amount
`anchor`             | Translate so anchor point is at origin (0,0,0).  See [anchor](attachments.scad#subsection-anchor).  Default: `CENTER`
`spin`               | Rotate this many degrees around the Z axis.  See [spin](attachments.scad#subsection-spin).  Default: `0`
`orient`             | Vector to rotate top towards.  See [orient](attachments.scad#subsection-orient).  Default: `UP`

**Example 1:** 

<img align="left" alt="living\_hinge\_mask() Example 1" src="images/hinges/living_hinge_mask.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    living_hinge_mask(l=100, thick=3, foldangle=60);

<br clear="all" /><br/>

---

## Section: Snap Locks


### Module: apply\_folding\_hinges\_and\_snaps()

**Synopsis:** Adds snap shapes and removes living hinges from a child shape. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

**Topics:** [Hinges](Topics#hinges), [Parts](Topics#parts)

**See Also:** [knuckle\_hinge()](#module-knuckle_hinge), [living\_hinge\_mask()](#module-living_hinge_mask), [snap\_lock()](#module-snap_lock), [snap\_socket()](#module-snap_socket)

**Usage:** 

- apply_folding_hinges_and_snaps(thick, [foldangle=], [hinges=], [snaps=], [sockets=], [snaplen=], [snapdiam=], [hingegap=], [layerheight=], [$slop=]) CHILDREN;

**Description:** 

Adds snaplocks and create hinges in children at the given positions.

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`thick`              | Thickness in mm of the material to make the hinge in.
`foldangle`          | The interior angle in degrees of the joint to be created with the hinge.  Default: 90
`hinges`             | List of [LENGTH, POSITION, SPIN] for each hinge to difference from the children.
`snaps`              | List of [POSITION, SPIN] for each central snaplock to add to the children.
`sockets`            | List of [POSITION, SPIN] for each outer snaplock sockets to add to the children.
`snaplen`            | Length of locking snaps.
`snapdiam`           | Diameter/width of locking snaps.
`hingegap`           | Size in mm of the gap at the bottom of the hinge, to make room for folding.
`layerheight`        | The expected printing layer height in mm.

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`$slop`              | increase hinge gap by twice this amount

**Example 1:** 

<img align="left" alt="apply\_folding\_hinges\_and\_snaps() Example 1" src="images/hinges/apply_folding_hinges_and_snaps.png" width="480" height="360">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    size=100;
    apply_folding_hinges_and_snaps(
        thick=3, foldangle=acos(1/3),
        hinges=[
            for (a=[0,120,240], b=[-size/2,size/4]) each [
                [200, polar_to_xy(b,a), a+90]
            ]
        ],
        snaps=[
            for (a=[0,120,240]) each [
                [rot(a,p=[ size/4, 0        ]), a+90],
                [rot(a,p=[-size/2,-size/2.33]), a-90]
            ]
        ],
        sockets=[
            for (a=[0,120,240]) each [
                [rot(a,p=[ size/4, 0        ]), a+90],
                [rot(a,p=[-size/2, size/2.33]), a+90]
            ]
        ]
    ) {
        $fn=3;
        difference() {
            cylinder(r=size-1, h=3);
            down(0.01) cylinder(r=size/4.5, h=3.1, spin=180);
            down(0.01) for (a=[0:120:359.9]) zrot(a) right(size/2) cylinder(r=size/4.5, h=3.1);
        }
    }

---

### Module: snap\_lock()

**Synopsis:** Creates a snap-lock shape. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

**Topics:** [Hinges](Topics#hinges), [Parts](Topics#parts)

**See Also:** [knuckle\_hinge()](#module-knuckle_hinge), [living\_hinge\_mask()](#module-living_hinge_mask), [snap\_socket()](#module-snap_socket)

**Usage:** 

- snap_lock(thick, [snaplen=], [snapdiam=], [layerheight=], [foldangle=], [hingegap=], [$slop=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];

**Description:** 

Creates the central snaplock part.

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`thick`              | Thickness in mm of the material to make the hinge in.

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`snaplen`            | Length of locking snaps.
`snapdiam`           | Diameter/width of locking snaps.
`layerheight`        | The expected printing layer height in mm.
`foldangle`          | The interior angle in degrees of the joint to be created with the hinge.  Default: 90
`hingegap`           | Size in mm of the gap at the bottom of the hinge, to make room for folding.
`$slop`              | increase size of hinge gap by double this amount
`anchor`             | Translate so anchor point is at origin (0,0,0).  See [anchor](attachments.scad#subsection-anchor).  Default: `CENTER`
`spin`               | Rotate this many degrees around the Z axis.  See [spin](attachments.scad#subsection-spin).  Default: `0`
`orient`             | Vector to rotate top towards.  See [orient](attachments.scad#subsection-orient).  Default: `UP`

**Example 1:** 

<img align="left" alt="snap\_lock() Example 1" src="images/hinges/snap_lock.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    snap_lock(thick=3, foldangle=60);

<br clear="all" /><br/>

---

### Module: snap\_socket()

**Synopsis:** Creates a snap-lock socket shape. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

**Topics:** [Hinges](Topics#hinges), [Parts](Topics#parts)

**See Also:** [knuckle\_hinge()](#module-knuckle_hinge), [living\_hinge\_mask()](#module-living_hinge_mask), [snap\_lock()](#module-snap_lock)

**Usage:** 

- snap_socket(thick, [snaplen=], [snapdiam=], [layerheight=], [foldangle=], [hingegap=], [$slop=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];

**Description:** 

Creates the outside snaplock socketed part.

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`thick`              | Thickness in mm of the material to make the hinge in.

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`snaplen`            | Length of locking snaps.
`snapdiam`           | Diameter/width of locking snaps.
`layerheight`        | The expected printing layer height in mm.
`foldangle`          | The interior angle in degrees of the joint to be created with the hinge.  Default: 90
`hingegap`           | Size in mm of the gap at the bottom of the hinge, to make room for folding.
`$slop`              | Increase size of hinge gap by double this amount
`anchor`             | Translate so anchor point is at origin (0,0,0).  See [anchor](attachments.scad#subsection-anchor).  Default: `CENTER`
`spin`               | Rotate this many degrees around the Z axis.  See [spin](attachments.scad#subsection-spin).  Default: `0`
`orient`             | Vector to rotate top towards.  See [orient](attachments.scad#subsection-orient).  Default: `UP`

**Example 1:** 

<img align="left" alt="snap\_socket() Example 1" src="images/hinges/snap_socket.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/hinges.scad>
    snap_socket(thick=3, foldangle=60);

<br clear="all" /><br/>

---


# Attachments Overview

BOSL2 introduces the concept of "attachables."  You can do the following
things with attachable shapes:

* Control where the shape appears and how it is oriented by anchoring and specifying orientation and spin
* Position or attach shapes relative to parent objects
* Tag objects and then control boolean operations based on their tags.
* Change the color of objects so that child objects are different colors than their parents

The various attachment features may seem complex at first, but 
attachability is one of the most important features of the BOSL2
library.  It enables you to position objects relative to other objects
in your model instead of having to keep track of absolute positions.
It makes models simpler, more intuitive, and easier to maintain.

Almost all objects defined by BOSL2 are attachable.  In addition,
BOSL2 overrides the built-in definitions for `cube()`, `cylinder()`,
`sphere()`, `square()`, `circle()` and `text()` and makes them attachable as
well.  However, some basic OpenSCAD built-in definitions are not
attachable and will not work with the features described in this
tutorial.  The non-attachables are `polyhedron()`, `linear_extrude()`,
`rotate_extrude()`, `surface()`, `projection()` and `polygon()`.
Some of these have attachable alternatives: `vnf_polyhedron()`,
`linear_sweep()`, `rotate_sweep()`, and `region()`.  

[Next: Basic Positioning](Tutorial-Attachment-Basic-Positioning)


[Previous: Attachments Overview](Tutorial-Attachment-Overview)

# Basic Object Positioning: Anchor, Spin and Orient

When you create attachable objects using BOSL2 you have some 
options for controling how that object is positioned relative to the
origin and the coordinate axes.  The basic object positioning
parameters are optional named parameters supported by attachable
objects:

* anchor: controls which point on the object is positioned at the origin
* spin: rotates the object around the Z axis
* orient: points the top of the object in a chosen direction

## Anchoring
Anchoring allows you to align a specified part of an object or point
on an object with the origin.  The alignment point can be the center
of a side, the center of an edge, a corner, or some other
distinguished point on the object.  This is done by passing a vector
or text string into the `anchor=` argument.  For roughly cubical
or prismoidal shapes, that vector points in the general direction of the side, edge, or
corner that will be aligned to.  For example, a vector of [1,0,-1] refers to the lower-right
edge of the shape.  For this sort of shape, each vector component should be -1, 0, or 1:

```openscad
include <BOSL2/std.scad>
// Anchor at upper-front-left corner
cube([40,30,50], anchor=[-1,-1,1]);
```
![Figure 1](images/tutorials/Attachment-Basic-Positioning_1.png)

```openscad
include <BOSL2/std.scad>
// Anchor at upper-right edge
cube([40,30,50], anchor=[1,0,1]);
```
![Figure 2](images/tutorials/Attachment-Basic-Positioning_2.png)

```openscad
include <BOSL2/std.scad>
// Anchor at bottom face
cube([40,30,50], anchor=[0,0,-1]);
```
![Figure 3](images/tutorials/Attachment-Basic-Positioning_3.png)

Since manually written vectors are not very intuitive, BOSL2 defines some standard directional
vector constants that can be added together:

Constant | Direction | Value
-------- | --------- | -----------
`LEFT`   | X-        | `[-1, 0, 0]`
`RIGHT`  | X+        | `[ 1, 0, 0]`
`FRONT`/`FORWARD`/`FWD` | Y− | `[ 0, −1, 0]`
`BACK`   | Y+        | `[ 0, 1, 0]`
`BOTTOM`/`BOT`/`DOWN` | Z− (Y− in 2D) | `[ 0, 0, −1]` (`[0, −1]` in 2D.)
`TOP`/`UP` | Z+ (Y+ in 2D)      | `[ 0, 0, 1]` (`[0, 1]` in 2D.)
`CENTER`/`CTR` | Centered | `[ 0, 0, 0]`

If you want a vector pointing towards the bottom−left edge, just add the `BOTTOM` and `LEFT` vector
constants together like `BOTTOM + LEFT`.  This will result in a vector of `[−1,0,−1]`.  You can pass
that to the `anchor=` argument for a clearly understandable anchoring:  

```openscad
include <BOSL2/std.scad>
cube([40,30,50], anchor=BACK+TOP);
```
![Figure 4](images/tutorials/Attachment-Basic-Positioning_4.png)

```openscad
include <BOSL2/std.scad>
cube([40,30,50], anchor=FRONT);
```
![Figure 5](images/tutorials/Attachment-Basic-Positioning_5.png)

---

For cylindrical type attachables, the Z component of the anchor vector must be −1, 0, or 1, referring
to the bottom rim, the middle side, or the top rim of the cylindrical or conical shape.
The X and Y components can be any value, pointing towards the circular perimeter of the cone.
These combined let you point at any place on the bottom or top rims, or at an arbitrary
side wall.  When the Z component is zero you can omit it and pass just
an [X,Y] vector.  

```openscad
include <BOSL2/std.scad>
cylinder(r1=25, r2=15, h=60, anchor=TOP+LEFT);
```
![Figure 6](images/tutorials/Attachment-Basic-Positioning_6.png)

```openscad
include <BOSL2/std.scad>
cylinder(r1=25, r2=15, h=60, anchor=BOTTOM+FRONT);
```
![Figure 7](images/tutorials/Attachment-Basic-Positioning_7.png)

Here we convert a 30 deg angle into an anchor using [cylindrical_to_xyz()](https://github.com/BelfrySCAD/BOSL2/wiki/coords.scad#function-cylindrical_to_xyz)

```openscad
include <BOSL2/std.scad>
cylinder(r1=25, r2=15, h=60, anchor=cylindrical_to_xyz(1,30,1));
```
![Figure 8](images/tutorials/Attachment-Basic-Positioning_8.png)

Here we anchor using a 2D XY vector where the Z value is assumed to be
zero:

```openscad
include <BOSL2/std.scad>
cylinder(r=25, h=6, anchor=[-1,-2]);
```
![Figure 9](images/tutorials/Attachment-Basic-Positioning_9.png)

---

For Spherical type attachables, you can pass a vector that points at any arbitrary place on
the surface of the sphere:

```openscad
include <BOSL2/std.scad>
sphere(r=50, anchor=TOP);
```
![Figure 10](images/tutorials/Attachment-Basic-Positioning_10.png)

```openscad
include <BOSL2/std.scad>
sphere(r=50, anchor=TOP+FRONT);
```
![Figure 11](images/tutorials/Attachment-Basic-Positioning_11.png)

Here the [spherical_to_xyz()](https://github.com/BelfrySCAD/BOSL2/wiki/coords.scad#function-spherical_to_xyz) function converts spherical coordinates into
a vector you can use as an anchor:

```openscad
include <BOSL2/std.scad>
sphere(r=50, anchor=spherical_to_xyz(1,-30,60));
```
![Figure 12](images/tutorials/Attachment-Basic-Positioning_12.png)

---

Some attachable shapes may provide specific named anchors for shape-specific anchoring.  These
will be given as strings and will be specific to that type of
attachable.  When named anchors are supported, they are listed in a
"Named Anchors" section of the documentation for the module.  The
`teardrop()` attachable, for example, has a named anchor called "cap" and in 2D the
`star()` attachable has anchors labeled by tip number: 

```openscad
include <BOSL2/std.scad>
teardrop(d=100, l=20, anchor="cap");
```
![Figure 13](images/tutorials/Attachment-Basic-Positioning_13.png)

```openscad
include <BOSL2/std.scad>
star(n=7, od=30, id=20, anchor="tip2");
```
![Figure 14](images/tutorials/Attachment-Basic-Positioning_14.png)

---

Some shapes, for backwards compatibility reasons, can take a `center=` argument.  This just
overrides the `anchor=` argument.  A `center=true` argument is the same as `anchor=CENTER`.
A `center=false` argument chooses the anchor to match the behavior of
the builtin version:  for a cube it is the same as `anchor=[-1,-1,-1]` but for a
cylinder, it is the same as `anchor=BOTTOM`.

```openscad
include <BOSL2/std.scad>
cube([50,40,30],center=true);
```
![Figure 15](images/tutorials/Attachment-Basic-Positioning_15.png)

```openscad
include <BOSL2/std.scad>
cube([50,40,30],center=false);
```
![Figure 16](images/tutorials/Attachment-Basic-Positioning_16.png)

---

Most 2D shapes provided by BOSL2 are also anchorable.  The built-in `square()` and `circle()`
modules have been overridden to make them attachable..  The `anchor=` options for 2D
shapes treat 2D vectors as expected.  Special handling occurs with 3D
vectors:  if the Y coordinate is zero and the Z coordinate is nonzero,
then the Z coordinate is used to replace the Y coordinate.  This is
done so that you can use the TOP and BOTTOM names as anchor for 2D
shapes.  


```openscad
include <BOSL2/std.scad>
square([40,30], anchor=BACK+LEFT);
```
![Figure 17](images/tutorials/Attachment-Basic-Positioning_17.png)

```openscad
include <BOSL2/std.scad>
circle(d=50, anchor=BACK);
```
![Figure 18](images/tutorials/Attachment-Basic-Positioning_18.png)

```openscad
include <BOSL2/std.scad>
hexagon(d=50, anchor=LEFT);
```
![Figure 19](images/tutorials/Attachment-Basic-Positioning_19.png)

```openscad
include <BOSL2/std.scad>
pentagon(d=50, anchor=TOP);
```
![Figure 21](images/tutorials/Attachment-Basic-Positioning_21.png)


## Spin
You can spin attachable objects around the origin using the `spin=`
argument.  The spin applies **after** anchoring, so depending on how
you anchor an object, its spin may not be about its center.  This
means that spin can have an effect even on rotationally symmetric
objects like spheres and cylinders.  You specify the spin in degrees.
A positive number will result in a counter-clockwise spin around the Z
axis (as seen from above), and a negative number will make a clockwise
spin:

```openscad
include <BOSL2/std.scad>
cube([20,20,40], center=true, spin=45);
```
![Figure 22](images/tutorials/Attachment-Basic-Positioning_22.png)

This example shows a cylinder which has been anchored at its FRONT,
with a rotated copy in gray.  The rotation is performed around the
origin, but the cylinder is off the origin, so the rotation **does**
have an effect on the cylinder, even though the cylinder has
rotational symmetry.

```openscad
include <BOSL2/std.scad>
cylinder(h=40,d=20,anchor=FRONT+BOT);
%cylinder(h=40.2,d=20,anchor=FRONT+BOT,spin=40);
```
![Figure 23](images/tutorials/Attachment-Basic-Positioning_23.png)



You can also apply spin to 2D shapes from BOSL2, though only by scalar angle:

```openscad
include <BOSL2/std.scad>
square([40,30], spin=30);
```
![Figure 24](images/tutorials/Attachment-Basic-Positioning_24.png)

```openscad
include <BOSL2/std.scad>
ellipse(d=[40,30], spin=30);
```
![Figure 25](images/tutorials/Attachment-Basic-Positioning_25.png)


## Orientation
Another way to specify a rotation for an attachable shape, is to pass a 3D vector via the
`orient=` argument.  This lets you specify what direction to tilt the top of the shape towards.
For example, you can make a cone that is tilted up and to the right like this:

```openscad
include <BOSL2/std.scad>
cylinder(h=100, r1=50, r2=20, orient=UP+RIGHT);
```
![Figure 26](images/tutorials/Attachment-Basic-Positioning_26.png)

More precisely, the Z direction of the shape is rotated to align with
the vector you specify.  Two dimensional attachables, which have no Z vector,
do not accept the `orient=` argument.  


## Mixing Anchoring, Spin, and Orientation
When giving `anchor=`, `spin=`, and `orient=`, they are applied anchoring first, spin second,
then orient last.  For example, here's a cube:

```openscad
include <BOSL2/std.scad>
cube([20,20,50]);
```
![Figure 27](images/tutorials/Attachment-Basic-Positioning_27.png)

You can center it with an `anchor=CENTER` argument:

```openscad
include <BOSL2/std.scad>
cube([20,20,50], anchor=CENTER);
```
![Figure 28](images/tutorials/Attachment-Basic-Positioning_28.png)

Add a 45 degree spin:

```openscad
include <BOSL2/std.scad>
cube([20,20,50], anchor=CENTER, spin=45);
```
![Figure 29](images/tutorials/Attachment-Basic-Positioning_29.png)

Now tilt the top up and forward:

```openscad
include <BOSL2/std.scad>
cube([20,20,50], anchor=CENTER, spin=45, orient=UP+FWD);
```
![Figure 30](images/tutorials/Attachment-Basic-Positioning_30.png)

For 2D shapes, you can mix `anchor=` with `spin=`, but not with `orient=`.

```openscad
include <BOSL2/std.scad>
square([40,30], anchor=BACK+LEFT, spin=30);
```
![Figure 31](images/tutorials/Attachment-Basic-Positioning_31.png)

[Next: Relative Positioning of Children](Tutorial-Attachment-Relative-Positioning)
[Prev: Basic Positioning](Tutorial-Attachment-Basic-Positioning)

# Relative Positioning: Placing Children using position(), align(), and attach()

Relative positioning is one of the most useful and powerful features
in the BOSL2 library.  In BOSL2 you can make an object a child of
another object.  When you do this, the child object is positioned
relative to its parent.  The simplest result is that the child appears
so that its anchor point coincides with the center of the parent.

Three modules enable you to position the child relative to the parent
in more useful ways:

* position() places the child so its anchor point is positioned at a chosen anchor point on the parent. 
* align() can place the child on a face **without changing its orientation** so that the child is aligned with one of the edges or corners of that face
* attach() can places the child on a face like stacking blocks, so that the a designated face of the child mates with the chosen face on the parent.  It also has support for alignment to the edges and corners of the face.

Relative positioning means that since objects are positioned relative
to other objects, you do not need to keep track of absolute positions
and orientations of objects in your model.  This makes models simpler,
more intuitive, and easier to maintain.

[Next: Using position()](Tutorial-Attachment-Position)
[Previous: Relative Positioning of Children](Tutorial-Attachment-Relative-Positioning)

# Placing Children using position()

If you make an object a child of another object then the child object
is positioned relative to the parent.  By default, the child's anchor
point will be positioned at the center of the parent.  This tutorial
describes the `postion()` module, which places the child so its anchor
point is positioned at a chosen anchor point on the parent.  

## An Object as a Child of Another Object

When you make an object the child of another object the anchor point
of the child object is positioned at the center of the parent object.  
The default anchor for `cyl()` is CENTER, so in this case, the cylinder is centered on the cube's center

```openscad
include <BOSL2/std.scad>
up(13) cube(50)
    cyl(d=25,l=95);
```
![Figure 1](images/tutorials/Attachment-Position_1.png)

With `cylinder()` the default anchor is BOTTOM.  It's hard to tell,
but the cylinder's bottom is placed at the center of the cube.  

```openscad
include <BOSL2/std.scad>
cube(50)
    cylinder(d=25,h=75);
```
![Figure 2](images/tutorials/Attachment-Position_2.png)

If you explicitly anchor the child object then the anchor you choose will be aligned
with the center point of the parent object.  In this example the right
side of the cylinder is aligned with the center of the cube.  


```openscad
include <BOSL2/std.scad>
cube(50,anchor=FRONT)     
    cylinder(d=25,h=95,anchor=RIGHT);
```
![Figure 3](images/tutorials/Attachment-Position_3.png)

## Using position() 

The `position()` module enables you to specify where on the parent to
position the child object.  You give `position()` an anchor point on
the parent, and the child's anchor point is aligned with the specified
parent anchor point.  In this example the LEFT anchor of the cylinder is positioned on the
RIGHT anchor of the cube.  

```openscad
include <BOSL2/std.scad>
cube(50,anchor=FRONT)     
    position(RIGHT) cylinder(d=25,h=75,anchor=LEFT);
```
![Figure 4](images/tutorials/Attachment-Position_4.png)

Using this mechanism you can position objects relative to other
objects which are in turn positioned relative to other objects without
having to keep track of the transformation math.

```openscad
include <BOSL2/std.scad>
cube([50,50,30],center=true)
    position(TOP+RIGHT) cube([25,40,10], anchor=RIGHT+BOT)
       position(LEFT+FRONT+TOP) cube([12,12,8], anchor=LEFT+FRONT+BOT)
         cylinder(h=10,r=3);
```
![Figure 5](images/tutorials/Attachment-Position_5.png)

The positioning mechanism is not magical: it simply applies a
`translate()` operation to the child.  You can still apply your own
additional translations or other transformations if you wish.  For
example, you can position an object 5 units from the right edge:

```openscad
include<BOSL2/std.scad>
cube([50,50,20],center=true)
    position(TOP+RIGHT) left(5) cube([4,50,10], anchor=RIGHT+BOT);
```
![Figure 6](images/tutorials/Attachment-Position_6.png)

If you want to position two objects on a single parent you can
provide them as two children.  The two children area created
separately from each other according to whatever `position()`
parameters you specify:

```openscad
include<BOSL2/std.scad>
cuboid([50,50,20]){
    position(RIGHT) cube([12,12,5], anchor=LEFT);
    position(BACK+TOP) cyl(r=12,h=5, anchor=BOT);
}
```
![Figure 7](images/tutorials/Attachment-Position_7.png)

If for some reason you want to create multiple objects at the same position you can
list them under a single position statement:

```openscad
include<BOSL2/std.scad>
cuboid([25,25,20])
  color("lightblue")
    position(RIGHT+FWD+TOP) {
       cube([5,10,5],anchor=TOP+LEFT+FWD);
       cube([10,5,5],anchor=TOP+BACK+RIGHT);
    }
```
![Figure 8](images/tutorials/Attachment-Position_8.png)

If you want multiple **identical** children located at different
positions you can pass a list of anchor locations to `position()`:

```openscad
include<BOSL2/std.scad>
cuboid([50,50,20])
  color("lightblue")
    position([RIGHT+TOP,LEFT+TOP])
       cube(12,anchor=BOT);
```
![Figure 9](images/tutorials/Attachment-Position_9.png)

Note that for this to work, the anchors need to be the same for each
child.  It would not be possible, for example, to change the above
example so that the blue cubes are aligned flush with the sides of the
parent cube, because that requires a different anchor for each blue
cube.  

Positioning objects works the same way in 2D.

```openscad
include<BOSL2/std.scad>
square(10)
    position(RIGHT) square(3,anchor=LEFT);
```
![Figure 10](images/tutorials/Attachment-Position_10.png)

## Using position() with orient()

When positioning an object near an edge or corner you may wish to
orient the object relative to some face other than the TOP face that
meets at that edge or corner.  You can always apply `rot()` to 
change the orientation of the child object, but in order to do this,
you need to figure out the correct rotation.  The `orient()` module provides a
mechanism for re-orienting the child() that eases this burden: 
it can orient the child relative to the parent anchor directions.  This is different
than giving an `orient=` argument to the child, because that orients
relative to the parent's global coordinate system by just using the vector
directly, instead of orienting to the parent's anchor, which takes
account of face orientation.  A series of three
examples shows the different results.  In the first example, we use
only `position()`.  The child cube is erected pointing upwards, in the
Z direction.  In the second example we use `orient=RIGHT` in the child
and the result is that the child object points in the X+ direction,
without regard for the shape of the parent object.  In the final
example we apply `orient(RIGHT)` and the child is oriented
relative to the slanted right face of the parent using the parent
RIGHT anchor.   

```openscad
include<BOSL2/std.scad>
prismoid([50,50],[30,30],h=40)
  position(RIGHT+TOP)
     cube([15,15,25],anchor=RIGHT+BOT);
```
![Figure 11](images/tutorials/Attachment-Position_11.png)


```openscad
include<BOSL2/std.scad>
prismoid([50,50],[30,30],h=40)
  position(RIGHT+TOP)
     cube([15,15,25],orient=RIGHT,anchor=LEFT+BOT);
```
![Figure 12](images/tutorials/Attachment-Position_12.png)


```openscad
include<BOSL2/std.scad>
prismoid([50,50],[30,30],h=40)
  position(RIGHT+TOP)
     orient(RIGHT)
        cube([15,15,25],anchor=BACK+BOT);
```
![Figure 13](images/tutorials/Attachment-Position_13.png)

You may have noticed that the children in the above three examples
have different anchors.  Why is that?  The first and second examples
differ because anchoring up and anchoring to the right require
anchoring on opposite sides of the child.  But the third case differs
because the spin has changed.  The examples below show the same models
but with arrows replacing the child cube.  The red flags on the arrows
mark the zero spin direction.  Examine the red flags to see how the spin
changes.  The Y+ direction of the child will point towards that red
flag.  

```openscad
include<BOSL2/std.scad>
prismoid([50,50],[30,30],h=40)
  position(RIGHT+TOP)
     anchor_arrow(40);
```
![Figure 14](images/tutorials/Attachment-Position_14.png)

```openscad
include<BOSL2/std.scad>
prismoid([50,50],[30,30],h=40)
  position(RIGHT+TOP)
     anchor_arrow(40, orient=RIGHT);
```
![Figure 15](images/tutorials/Attachment-Position_15.png)

```openscad
include<BOSL2/std.scad>
prismoid([50,50],[30,30],h=40)
  position(RIGHT+TOP)
     orient(RIGHT)
        anchor_arrow(40);
```
![Figure 16](images/tutorials/Attachment-Position_16.png)

[Next: Using align()](Tutorial-Attachment-Align)
[Previous: Using position()](Tutorial-Attachment-Position)

# Aligning children with align()

You may have noticed that with position() and orient(), specifying the
child anchors to position objects flush with their parent can be
annoying, or sometimes even tricky.  You can simplify this task by
using the align() module.  This module positions children on faces
of a parent and aligns to edges or corners, while picking the correct anchor points on
the children so that the children line up correctly with the
parent. Like `position()`, align does not change the orientation of
the child object.  

In the simplest case, if you want to place a child on the RIGHT side
of its parent, you need to anchor the child to its LEFT anchor:

```openscad
include<BOSL2/std.scad>
cuboid([50,40,15])
    position(RIGHT)
        color("lightblue")cuboid(5,anchor=LEFT);
```
![Figure 1](images/tutorials/Attachment-Align_1.png)

When you use align() it automatically determines the correct anchor to
use for the child and this anchor overrides any anchor specified to
the child:  any anchor you specify for the child is ignored.

```openscad
include<BOSL2/std.scad>
cuboid([50,40,15])
    align(RIGHT)
        color("lightblue")cuboid(5);
```
![Figure 2](images/tutorials/Attachment-Align_2.png)

To place the child on top of the parent in the corner you can do use
align as shown below instead of specifying the RIGHT+FRONT+BOT anchor
with position(): 

```openscad
include<BOSL2/std.scad>
cuboid([50,40,15])
    align(TOP,RIGHT+FRONT)
        color("lightblue")prismoid([10,5],[7,4],height=4);
```
![Figure 3](images/tutorials/Attachment-Align_3.png)

Both position() and align() can accept a list of anchor locations and
makes several copies of the children, but
if you want the children positioned flush, each copy 
requires a different anchor, so it is impossible to do this with a
single call to position(), but easily done using align():

```openscad
include<BOSL2/std.scad>
cuboid([50,40,15])
    align(TOP,[RIGHT,LEFT])
        color("lightblue")prismoid([10,5],[7,4],height=4);
```
![Figure 4](images/tutorials/Attachment-Align_4.png)

If you want the children close to the edge but not actually flush you
can use the `inset=` parameter of align to achieve this:

```openscad
include<BOSL2/std.scad>
cuboid([50,40,15])
    align(TOP,[FWD,RIGHT,LEFT,BACK],inset=3)
        color("lightblue")prismoid([10,5],[7,4],height=4);
```
![Figure 5](images/tutorials/Attachment-Align_5.png)

If you spin the children then align will still do the right thing

```openscad
include<BOSL2/std.scad>
cuboid([50,40,15])
    align(TOP,[RIGHT,LEFT])
        color("lightblue")prismoid([10,5],[7,4],height=4,spin=90);
```
![Figure 6](images/tutorials/Attachment-Align_6.png)

If you orient the object DOWN it will be attached from its top anchor,
correctly aligned.  

```openscad
include<BOSL2/std.scad>
cuboid([50,40,15])
    align(TOP,RIGHT)
        color("lightblue")prismoid([10,5],[7,4],height=4,orient=DOWN);
```
![Figure 7](images/tutorials/Attachment-Align_7.png)

Note that align() never changes the orientation of the children.  If
you put the blue prismoid on the right side the anchors line up but
the edges of the child and parent don't.

```openscad
include<BOSL2/std.scad>
prismoid(50,30,25){
  align(RIGHT,TOP)
    color("lightblue")prismoid([10,5],[7,4],height=4);
}
```
![Figure 8](images/tutorials/Attachment-Align_8.png)

If you apply spin that is not a multiple of 90 degrees then alignment
will line up the corner

```openscad
include<BOSL2/std.scad>
cuboid([50,40,15])
    align(TOP,RIGHT)
        color("lightblue")cuboid(8,spin=33);
```
![Figure 9](images/tutorials/Attachment-Align_9.png)

You can also attach objects to a cylinder.  If you use the usual cubic
anchors then a cube will attach on a face as shown here:

```openscad
include<BOSL2/std.scad>
cyl(h=20,d=10,$fn=128)
  align(RIGHT,TOP)
    color("lightblue")cuboid(5);
```
![Figure 10](images/tutorials/Attachment-Align_10.png)

But with a cylinder you can choose an arbitrary horizontal angle for
the anchor.  If you do this, similar to the case of arbitrary spin,
the cube will attach on the nearest corner.

```openscad
include<BOSL2/std.scad>
cyl(h=20,d=10,$fn=128)
  align([1,.3],TOP)
    color("lightblue")cuboid(5);
```
![Figure 11](images/tutorials/Attachment-Align_11.png)

[Next: Using attach()](Tutorial-Attachment-Attach)
[Prev: Using align()](Tutorial-Attachment-Align)

# Attachment using attach()

The `attach()` module can stick the child object to the parent object
by matching a designated face on the child to a specified face on the
parent.  Unlike `position()` and `align()`, the `attach()` module may
change the orientation and spin of the child.

## The Parent Coordinate System

When you attach a child object, it appears on the parent relative to
the local coordinate system of the parent at the anchor. 
To understand what this means, imagine the perspective of an ant walking on a
sphere.  The meaning of UP varies depending on where on the sphere the
ant is standing.  If you **attach** a cylinder to the sphere then the cylinder will
be "up" from the ant's perspective.   The first example shows a
cylinder placed with `position()` so it points up in the global parent
coordinate system.  The second example shows how `attach()` points the
cylinder UP from the perspective of an ant standing at the anchor
point on the sphere.  

```openscad
include<BOSL2/std.scad>
sphere(40)
    position(RIGHT+TOP) cylinder(r=8,h=20);
```
![Figure 1](images/tutorials/Attachment-Attach_1.png)


```openscad
include<BOSL2/std.scad>
sphere(40)
    attach(RIGHT+TOP) cylinder(r=8,h=20);
```
![Figure 2](images/tutorials/Attachment-Attach_2.png)

In the example above, the cylinder's center point is attached to the
sphere, pointing "up" from the perspective of the sphere's surface.
For a sphere, a surface normal is defined everywhere that specifies
what "up" means.  But for other objects, it may not be so obvious.
Usually at edges and corners the direction is the average of the
direction of the faces that meet there.

It's obvious to the ant which direction is UP, and hence corresponds
to the Z axis, on the surface of the sphere she inhabits.  But in
order to define the ant's local coordinate system we also need to
decide where the X and Y directions are.  This is obvious an arbitrary
choice.  In BOSL2 this is called the "spin" direction for the anchor.  

When you specify an anchor for use with attachment you are actually
specifying both an anchor position but also an anchor direction (the Z
axis) and the anchor's spin so that you fully define the parent
coordinate systemer and a spin.  If you want to visualize this
direction you can use anchor arrows.


## Anchor Directions and Anchor Arrows

For the ant on the sphere it is obvious which direction is UP; that
direction corresponds to the Z+ axis.  The location of the X and Y
axes is less clear and in fact it may be arbitrary.  One way that is
useful to show the position and orientation of an anchor point is by
attaching an anchor arrow to that anchor.  As noted before, the small
red flag points in the direction of the anchor's Y+ axis when the spin
is zero.

```openscad
include <BOSL2/std.scad>
cube(18, center=true)
    attach(LEFT+TOP)
        anchor_arrow();
```
![Figure 3](images/tutorials/Attachment-Attach_3.png)

For large objects, you can change the size of the arrow with the `s=` argument.

```openscad
include <BOSL2/std.scad>
sphere(d=100)
    attach(LEFT+TOP)
        anchor_arrow(s=50);
```
![Figure 4](images/tutorials/Attachment-Attach_4.png)

To show all the standard cardinal anchor points, you can use the [show_anchors()](https://github.com/BelfrySCAD/BOSL2/wiki/attachments.scad#module-show_anchors) module.

```openscad
include <BOSL2/std.scad>
cube(20, center=true)
    show_anchors();
```
![Figure 5](images/tutorials/Attachment-Attach_5.png)

```openscad
include <BOSL2/std.scad>
cylinder(h=25, d=25, center=true)
    show_anchors();
```
![Figure 6](images/tutorials/Attachment-Attach_6.png)

```openscad
include <BOSL2/std.scad>
sphere(d=40)
    show_anchors();
```
![Figure 7](images/tutorials/Attachment-Attach_7.png)

For large objects, you can again change the size of the arrows with the `s=` argument.

```openscad
include <BOSL2/std.scad>
prismoid(150,60,100)
    show_anchors(s=45);
```
![Figure 8](images/tutorials/Attachment-Attach_8.png)


## Parent-Child Anchor Attachment (Double Argument Attachment)

The `attach()` module has two different modes of operation,
parent-child anchor attachment and parent anchor attachment.  These
are also called double argument attachment and single argument
attachment.  The parent-child anchor attachment, with two arguments,
is usually easier to use and is more powerful because it supports
alignment.  When just starting out with attachment, we recommend that
you focus on this form of attachment.  

When you use parent-child anchor attachment you give a
parent anchor and a child anchor.  Imagine pointing the anchor arrows
on the two objects directly at each other and pushing them together in
the direction of the arrows until they touch.  In many of the examples
below we show first the two objects with their anchor arrows and then
the result of the attach operation using those anchors.

```openscad
include <BOSL2/std.scad>
cube(50,anchor=BOT) attach(TOP,BOT) anchor_arrow(30);
right(60)cylinder(d1=30,d2=15,h=25) attach(BOT,BOT) anchor_arrow(30);
```
![Figure 9](images/tutorials/Attachment-Attach_9.png)

```openscad
include <BOSL2/std.scad>
cube(50,anchor=BOT)
  attach(TOP,BOT) cylinder(d1=30,d2=15,h=25);
```
![Figure 10](images/tutorials/Attachment-Attach_10.png)

This example produces the same result as using `align()`, but if the
parent anchor is not horizontal, then the child is reoriented:

```openscad
include <BOSL2/std.scad>
prismoid([50,50],[35,35],h=50,anchor=BOT) attach(RIGHT,BOT) anchor_arrow(30);
right(60)cylinder(d1=30,d2=15,h=25) attach(BOT,BOT) anchor_arrow(30);
```
![Figure 11](images/tutorials/Attachment-Attach_11.png)

```openscad
include <BOSL2/std.scad>
prismoid([50,50],[35,35],h=50,anchor=BOT)
  attach(RIGHT,BOT) cylinder(d1=30,d2=15,h=25);
```
![Figure 12](images/tutorials/Attachment-Attach_12.png)

In this case we attach the curved side of the cone to a cube by lining
up the anchor arrows:

```openscad
include <BOSL2/std.scad>
cube(50,center=true) attach(RIGHT,BOT) anchor_arrow(30);
right(80)cylinder(d1=30,d2=15,h=25) attach(LEFT,BOT) anchor_arrow(30);
```
![Figure 13](images/tutorials/Attachment-Attach_13.png)

```openscad
include <BOSL2/std.scad>
cube(50,center=true)
  attach(RIGHT,LEFT) cylinder(d1=30,d2=15,h=25);
```
![Figure 14](images/tutorials/Attachment-Attach_14.png)

Note that this form of attachent overrides any anchor or orientation
specified in the child: **with parent-child anchor attachment the
`anchor=` and `orient=` parameters to the child are ignored.**

When you specify attachment using a pair of anchors, the attached
child can spin around the parent anchor while still being attached at
the designated anchors: specifying the anchors leaves one unspecified
degree of freedom.  As noted earlier, this ambiguity is resolved by anchors having a
defined spin which specifies where the Y+ axis is located.
The way that BOSL2 positions objects can be understood by viewing the
anchor arrows as shown above, or you can remember these rules:
1. When attaching to the TOP or BOTTOM: the FRONT of the child points to the front if possible;  otherwise the TOP of the child points BACK.
2. When attaching to other faces, if possible the child's UP anchor will point UP; otherwise, the BACK of the child points up (so the FRONT is pointed down).  

To show how this works we use this prismoid where the blue arrow is
pointing to the front and the green arrow points up.  Also note that
the front left edge is the only right angle.  

```openscad
include <BOSL2/std.scad>
color_this("orange")
prismoid([8,8],[6,6],shift=-[1,1],h=8) {
     attach(TOP,BOT) anchor_arrow(color=[0,1,0],s=12);
     attach(FWD,BOT) anchor_arrow(s=12);     
}
```
![Figure 15](images/tutorials/Attachment-Attach_15.png)

If we attach this to the TOP by the LEFT side then we get the result
below.  Notice how the green UP arrow is pointing back.

```openscad
include <BOSL2/std.scad>
cube(30) attach(TOP,LEFT)
color_this("orange")
  prismoid([8,8],[6,6],shift=-[1,1],h=8) {
    attach(TOP,BOT) anchor_arrow(color=[0,1,0],s=12);
    attach(FWD,BOT) anchor_arrow(s=12);     
  }
```
![Figure 16](images/tutorials/Attachment-Attach_16.png)

If we attach to the RIGHT using the same LEFT side anchor on the
prismoid then we get the result below.  Note that the green UP anchor
is pointing UP, in accordance with rule 2 from above.  

```openscad
include <BOSL2/std.scad>
cube(30) attach(RIGHT,LEFT)
color_this("orange")
  prismoid([8,8],[6,6],shift=-[1,1],h=8) {
    attach(TOP,BOT) anchor_arrow(color=[0,1,0],s=12);
    attach(FWD,BOT) anchor_arrow(s=12);     
  }
```
![Figure 17](images/tutorials/Attachment-Attach_17.png)

The green UP arrow can always be arranged to point up unless we attach
either the top or bottom to one of the cube's vertical faces.  Here we
attach the bottom so you can still see both arrows.  The blue FRONT
arrow on the object is pointing down, as expected based on rule 2.  

```openscad
include <BOSL2/std.scad>
cube(30) attach(RIGHT,BOT)
color_this("orange")
  prismoid([8,8],[6,6],shift=-[1,1],h=8) {
    attach(TOP,BOT) anchor_arrow(color=[0,1,0],s=12);
    attach(FWD,BOT) anchor_arrow(s=12);     
  }
```
![Figure 18](images/tutorials/Attachment-Attach_18.png)

What do you do if the direction the child appears is not the direction
you need?  To address this issue `attach()` provides a `spin=`
parameter which spins the attached child around the axis defined by
the joined anchor vectors.  Here is the last example with a rotation
applied to bring the front anchor back to the front:

```openscad
include <BOSL2/std.scad>
cube(30) attach(RIGHT,BOT,spin=-90)
color_this("orange")
  prismoid([8,8],[6,6],shift=-[1,1],h=8) {
    attach(TOP,BOT) anchor_arrow(color=[0,1,0],s=12);
    attach(FWD,BOT) anchor_arrow(s=12);     
  }
```
![Figure 19](images/tutorials/Attachment-Attach_19.png)

Be aware that specifying `spin=` to `attach()` is not equivalent to
using the `spin=` argument to the child.  Unlike `orient=` and
`anchor=`, which are ignored, the child `spin=` argument is still
respected, but it may be difficult to figure out which axis it will
rotate on.  It is more intuitive to ignore the child spin parameter
and only use the spin parameter to `attach()`.  The spin must be
scalar but need not be a multiple of 90 degrees.

```openscad
include <BOSL2/std.scad>
cube(30) attach(RIGHT,BOT,spin=-37)
color_this("orange")
  prismoid([8,8],[6,6],shift=-[1,1],h=8) {
    attach(TOP,BOT) anchor_arrow(color=[0,1,0],s=12);
    attach(FWD,BOT) anchor_arrow(s=12);     
  }
```
![Figure 20](images/tutorials/Attachment-Attach_20.png)

By default, `attach()` places the child exactly flush with the surface
of the parent.  Sometimes it's useful to have the child overlap the
parent by translating it into the parent.  You can do this with the
`overlap=` argument to `attach()`.  A positive value will cause the
child to overlap the parent, and a negative value will move the child
away from the parent, leaving a small gap.  In the first example we use a very large value of
overlap so the cube is sunk deeply into the parent.  In the second
example a large negative overlap value raises the child high above the
parent.  

```openscad
include <BOSL2/std.scad>
cuboid(50)
    attach(TOP,BOT,overlap=15)
        color("green")cuboid(20);
```
![Figure 21](images/tutorials/Attachment-Attach_21.png)

```openscad
include <BOSL2/std.scad>
cube(50,center=true)
    attach(TOP,BOT,overlap=-20)
        cyl(d=20,h=20);
```
![Figure 22](images/tutorials/Attachment-Attach_22.png)

Another feature provided by the double argument form of `attach()` is
alignment, which works in a similar way to `align()`.  You can specify
`align=` to align the attached child to an edge or corner.  The
example below shows five different alignments.  

```openscad
include <BOSL2/std.scad>
module thing(){
  color_this("orange")
    prismoid([8,8],[6,6],shift=-[1,1],h=8) {
      attach(TOP,BOT) anchor_arrow(color=[0,1,0],s=12);
      attach(FWD,BOT) anchor_arrow(s=12);     
    }
}
prismoid([50,50],[35,35],h=25,anchor=BOT){
  attach(TOP,BOT,align=FRONT) thing();
  attach(RIGHT,BOT,align=BOT) thing();    
  attach(RIGHT,BACK,align=FRONT) thing();
  attach(FRONT,BACK,align=BOT,spin=45) thing();
  attach(TOP,RIGHT,align=RIGHT,spin=90) thing();
}
```
![Figure 23](images/tutorials/Attachment-Attach_23.png)

As with `align()` if you turn an object 90 degrees it can match up
with parallel edges, but if you turn it an arbitrary angle, a corner
of the child will contact the edge of the parent.  Also like align()
the anchor points of the parent and child are aligned but this does
not necessarily mean that edges line up neatly when the shapes have
varying angles.  This misalignment is visible in the object attached
at the RIGHT and aligned to the FRONT.

You may be wondering why all this fuss with align is necessary.
Couldn't you just attach an object at an anchor on an edge?  When you
do this, the object will be attached using the edge anchor, which is
not perpendicular to the faces of the object.  The example below shows
attachment to an edge anchor and also a corner anchor.  

```openscad
include <BOSL2/std.scad>
cube(30)
   color("orange"){
     attach(RIGHT+FRONT,BOT) 
        prismoid([8,8],[6,6],shift=-[1,1],h=8);
     attach(TOP+LEFT+FWD,BOT)
        prismoid([8,8],[6,6],shift=-[1,1],h=8);
   }
```
![Figure 24](images/tutorials/Attachment-Attach_24.png)

When using the `align` option to `attach()` you can also set `inset`,
which works the same way as the `inset` parameter to `align()`.  It
shifts the child away from the edge or edges where it is aligned by
the specified amount.  

```openscad
include <BOSL2/std.scad>
prismoid([50,50],[50,25],25){
  attach(FWD,BOT,align=TOP,inset=3) color("lavender")cuboid(5);
  attach(FWD,BOT,align=BOT+RIGHT,inset=3) color("purple")cuboid(5);
}
```
![Figure 25](images/tutorials/Attachment-Attach_25.png)

The last capability provided by `attach()` is to attach the child
**inside** the parent object.  This is useful if you want to subtract
the child from the parent.  Doing this requires using tagged
operations with `diff()` which is explained in more detail below. 
For the examples here, note that the `diff()` and `tag()` operations
that appear cause the child to be subtracted.  We return to the
example that started this section, with anchor arrows shown on the two
objects.  

```openscad
include <BOSL2/std.scad>
cube(50,anchor=BOT) attach(TOP) anchor_arrow(30);
right(60)cylinder(d1=30,d2=15,h=25) attach(TOP) anchor_arrow(30);
```
![Figure 26](images/tutorials/Attachment-Attach_26.png)

Inside attachment is activated using `inside=true` and it lines up the
anchor arrows so they point together the **same** direction instead of
opposite directions like regular outside attachment.  The result in
this case is appears below, where we have cut away the front half to
show the interior: 

```openscad
include <BOSL2/std.scad>
back_half(s=200)
diff()
cube(50,anchor=BOT)
  attach(TOP,TOP,inside=true)
    cylinder(d1=30,d2=15,h=25);
```
![Figure 27](images/tutorials/Attachment-Attach_27.png)

The top of the cavity has a thin layer on it, which occurs because the
two objects share a face in the difference.  To fix this you can use
the `shiftout` parameter to `attach()`.  In this case you could also
use a negative `overlay` value, but the `shiftout` parameter shifts
out in every direction that is needed, which may be three directions
if you align the child at a corner.  The above example looks like this
with with the shift added:

```openscad
include <BOSL2/std.scad>
back_half(s=200)
diff()
cube(50,anchor=BOT)
  attach(TOP,TOP,inside=true,shiftout=0.01)
    cylinder(d1=30,d2=15,h=25);
```
![Figure 28](images/tutorials/Attachment-Attach_28.png)

Here is an example of connecting the same object on the right, but
this time with the BOTTOM anchor.  Note how the BOTTOM anchor is
aligned to the RIGHT so it is parallel and pointing in the same
direction as the RIGHT anchor.  

```openscad
include <BOSL2/std.scad>
back_half(s=200)
diff()
cuboid(50)
  attach(RIGHT,BOT,inside=true,shiftout=0.01)
    cylinder(d1=30,d2=15,h=25);
```
![Figure 29](images/tutorials/Attachment-Attach_29.png)

Here is an example where alignment moves the object into the corner,
and we benefit from shiftout providing 3 dimensions of adjustment:

```openscad
include <BOSL2/std.scad>
diff()
cuboid(10)
  attach(TOP,TOP,align=RIGHT+FWD,inside=true,shiftout=.01)
    cuboid([2,5,9]);
```
![Figure 30](images/tutorials/Attachment-Attach_30.png)

As with `position()`, with any use of `attach()` you can still apply your own translations and
other transformations even after attaching an object.  However, the
order of operations now matters.  If you apply a translation outside
of the anchor then it acts in the parent's global coordinate system, so the
child moves up in this example, where the light gray shows the
untranslated object.  

```openscad
include <BOSL2/std.scad>
cuboid(50){
  %attach(RIGHT,BOT)
    cyl(d1=30,d2=15,h=25);
  up(13)
    color("green") attach(RIGHT,BOT)
      cyl(d1=30,d2=15,h=25);
}
```
![Figure 31](images/tutorials/Attachment-Attach_31.png)

On the other hand, if you put the translation between the attach and
the object in your code, then it will act in the local coordinate system of
the parent at the parent's anchor, so in the example below it moves to the right.  

```openscad
include <BOSL2/std.scad>
cuboid(50){
  %attach(RIGHT,BOT)
    cyl(d1=30,d2=15,h=25);
  color("green") attach(RIGHT,BOT)
    up(13)
      cyl(d1=30,d2=15,h=25);
}
```
![Figure 32](images/tutorials/Attachment-Attach_32.png)

Parent-child Anchor attachment with CENTER anchors can be surprising because the anchors
both point upwards, so in the example below, the child's CENTER anchor
points up, so it is inverted when it is attached to the parent cone.
Note that the anchors are CENTER anchors, so the bases of the anchors are
hidden in the middle of the objects.  

```openscad
include <BOSL2/std.scad>
cylinder(d1=30,d2=15,h=25) attach(CENTER) anchor_arrow(40);
right(40)cylinder(d1=30,d2=15,h=25) attach(CENTER) anchor_arrow(40);
```
![Figure 33](images/tutorials/Attachment-Attach_33.png)

```openscad
include <BOSL2/std.scad>
cylinder(d1=30,d2=15,h=25)
    attach(CENTER,CENTER)
        cylinder(d1=30,d2=15,h=25);
```
![Figure 34](images/tutorials/Attachment-Attach_34.png)

Is is also possible to attach to edges and corners of the parent
object.  The anchors for edges spin the child so its BACK direction is
aligned with the edge.  If the edge belongs to a top or bottom
horizontal face, then the BACK directions will point clockwise around
the face, as seen from outside the shape.  (This is the same direction
required for construction of valid faces in OpenSCAD.)  Otherwise, the
BACK direction will point upwards.

Examine the red flags below, where only edge anchors appear on a
prismoid.  The top face shows the red flags pointing clockwise.
The sloped side edges point along the edges, generally upward, and
the bottom ones appear to point counter-clockwise, but if we viewed
the shape from the bottom they would also appear clockwise.  

```openscad
include <BOSL2/std.scad>
prismoid([100,175],[55,88], h=55)
  for(i=[-1:1], j=[-1:1], k=[-1:1])
    let(anchor=[i,j,k])
       if (sum(v_abs(anchor))==2)
         attach(anchor,BOT)anchor_arrow(40);
```
![Figure 35](images/tutorials/Attachment-Attach_35.png)

In this example cylinders sink half-way into the top edges of the
prismoid:

```openscad
include <BOSL2/std.scad>
$fn=16;
r=6;
prismoid([100,175],[55,88], h=55){
   attach([TOP+RIGHT,TOP+LEFT],LEFT,overlap=r/2) cyl(r=r,l=88+2*r,rounding=r);
   attach([TOP+FWD,TOP+BACK],LEFT,overlap=r/2) cyl(r=r,l=55+2*r, rounding=r);   
}
```
![Figure 36](images/tutorials/Attachment-Attach_36.png)

This type of edge attachment is useful for attaching 3d edge masks to
edges:

```openscad
include <BOSL2/std.scad>
$fn=32;
diff()
cuboid(75)
   attach([FRONT+LEFT, FRONT+RIGHT, BACK+LEFT, BACK+RIGHT],
          FWD+LEFT,inside=true)
     rounding_edge_mask(l=76, r1=8,r2=28);
```
![Figure 37](images/tutorials/Attachment-Attach_37.png)

## Parent Anchor Attachment (Single Argument Attachment)

The second form of attachment is parent anchor attachment, which just
uses a single argument.  This form of attachment is less useful in
general and does not provide alignment.  When you give `attach()` a parent anchor but no child anchor it
orients the child according to the parent anchor direction but then
simply places the child based on its internally defined anchor at the
parent anchor position.  For most objects the default anchor is the
CENTER anchor, so objects will appear sunk half-way into the parent.

```openscad
include <BOSL2/std.scad>
cuboid(30)
    attach(TOP)
        color("green")cuboid(10);
```
![Figure 38](images/tutorials/Attachment-Attach_38.png)

Some objects such as `cylinder()`, `prismoid()`, and `anchor_arrow()` have default anchors on the bottom, so they will appear
on the surface.  For objects like this you can save a little bit of
typing by using parent anchor attachment.  But in the case of `cube()`
the anchor is not centered, so the result is:

```openscad
include <BOSL2/std.scad>
cube(30)
    attach(TOP)
        color("green")cube(10);
```
![Figure 39](images/tutorials/Attachment-Attach_39.png)

In order to make single argument attachment produce the results you
need you will probably need to change the child anchor.  Note that unlike
parent-child anchor attachment, **with parent anchor attachment the `anchor=` and `orient=` arguments
are respected.**  We could therefore place a cuboid like this:

```openscad
include <BOSL2/std.scad>
cuboid(30)
  attach(RIGHT)
      color("green")cuboid(10,anchor=BOT);
```
![Figure 40](images/tutorials/Attachment-Attach_40.png)

If you need to place a cuboid at the anchor point but need it anchored
relative to one of the bottom edge or corner anchors then you can do
that with parent anchor attachment:

```openscad
include <BOSL2/std.scad>
cuboid(30)
  attach(RIGHT)
      color("green")cuboid(10,anchor=BOT+FWD);
```
![Figure 41](images/tutorials/Attachment-Attach_41.png)

Another case where single argument attachment is useful is when the
child doesn't have proper attachment support.
If you use double argument attachment in such cases the results will
be incorrect because the child doesn't properly respond to the
internally propagated anchor directives.  With single argument
attachment, this is not a problem: the origin
of the child will be placed at the parent anchor point.  One module
without attachment support is `linear_extrude()`.  

```openscad
include <BOSL2/std.scad>
cuboid(20)
  attach(RIGHT)
     color("red")linear_extrude(height=2) star(n=7,ir=3,or=7);
```
![Figure 42](images/tutorials/Attachment-Attach_42.png)

As noted earlier, you can set `orient=` for children with parent
anchor attachment, though the behavior may not be intuitive because
the attachment process transforms the coordinate system and the
orientation is done in the attached coordinate system.  It may be
helpful to start with the object attached to TOP and recall the rules
from the previous section about how orientation works.  The same rules
apply here.  Note that the forward arrow is pointing down after
attaching the object on the RIGHT face.

```openscad
include <BOSL2/std.scad>
cuboid(20){
  attach(RIGHT)
     color_this("red")cuboid([2,4,8],orient=RIGHT,anchor=RIGHT)
        attach(FWD) anchor_arrow();
  attach(TOP)
     color_this("red")cuboid([2,4,8],orient=RIGHT,anchor=RIGHT)
            attach(FWD) anchor_arrow();
}
```
![Figure 43](images/tutorials/Attachment-Attach_43.png)



## Positioning and Attaching Multiple Children

You can attach or position more than one child at a time by enclosing them all in braces:

```openscad
include <BOSL2/std.scad>
cube(50, center=true) {
    attach(TOP) cylinder(d1=50,d2=20,h=20);
    position(RIGHT) cylinder(d1=50,d2=20,h=20);
}
```
![Figure 44](images/tutorials/Attachment-Attach_44.png)

If you want to attach the same shape to multiple places on the same parent, you can pass the
desired anchors as a list to the `attach()` or `position()` modules:

```openscad
include <BOSL2/std.scad>
cube(50, center=true)
    attach([RIGHT,FRONT],TOP) cylinder(d1=35,d2=20,h=25);
```
![Figure 45](images/tutorials/Attachment-Attach_45.png)

```openscad
include <BOSL2/std.scad>
cube(50, center=true)
    position([TOP,RIGHT,FRONT]) cylinder(d1=35,d2=20,h=25);
```
![Figure 46](images/tutorials/Attachment-Attach_46.png)


## Attaching 2D Children

You can use attachments in 2D as well.  As usual for the 2D case you
can use TOP and BOTTOM as alternative to BACK and FORWARD.  With
parent-child anchor attachment you cannot use the spin parameter to
`attach()` nor can you specify spin to the child.  Spinning the child
on the Z axis would rotate the anchor arrows out of alignment.  

```openscad
include <BOSL2/std.scad>
rect(50){
    attach(RIGHT,FRONT)
        color("red")trapezoid(w1=30,w2=0,h=30);
    attach(LEFT,FRONT,align=[FRONT,BACK],inset=3)
        color("green") trapezoid(w1=25, w2=0,h=30);
}
```
![Figure 47](images/tutorials/Attachment-Attach_47.png)

```openscad
include <BOSL2/std.scad>
diff()
circle(d=50){
    attach(TOP,BOT,overlap=5)
        trapezoid(w1=30,w2=0,h=30);
    attach(BOT,BOT,inside=true)
        tag("remove")
        trapezoid(w1=30,w2=0,h=30);
}        
```
![Figure 48](images/tutorials/Attachment-Attach_48.png)

[Next: Attachable Parts](Tutorial-Attachment-Parts)
[Prev: Using Color with Attachments](Tutorial-Attachment-Color)

# Tagged Operations

BOSL2 introduces the concept of tags.  Tags are names that can be given to attachables, so that
you can refer to them when performing `diff()`, `intersect()`, and `conv_hull()` operations.
Each object can have no more than one tag at a time.  The reason that
tagged operations are important is that they allow you to perform
operations on objects that are at different levels in the parent-child
hierarchy.  The most common example is to use `attach()` to create a
child but subtract it from the parent.

To tag an object preceed the object with the `tag()` module and give
it a name: `tag("my_cube") cube(10)`.  The tag will apply to the
object and all of its children until another tag module.  If you need
to remove a tag you can use `tag("")`.  If you need to tag just one
object and do not want to tag any of its descendents you can do this
using `tag_this(name) object();`


### `diff([remove], [keep])`
The `diff()` operator is used to difference away all shapes marked with the tag(s) given to
`remove`, from the other shapes.  

For example, to difference away a child cylinder from the middle of a parent cube, you can
do this:

```openscad
include <BOSL2/std.scad>
diff("hole")
cube(100, center=true)
    tag("hole")cylinder(h=101, d=50, center=true);
```
![Figure 1](images/tutorials/Attachment-Tags_1.png)

The `keep=` argument takes tags for shapes that you want to keep in the output.

```openscad
include <BOSL2/std.scad>
diff("dish", keep="antenna")
cube(100, center=true)
    attach([FRONT,TOP], overlap=33) {
        tag("dish") cylinder(h=33.1, d1=0, d2=95);
        tag("antenna") cylinder(h=33.1, d=10);
    }
```
![Figure 2](images/tutorials/Attachment-Tags_2.png)

Remember that tags applied with `tag()` are inherited by children.  In this case, we need to explicitly
untag the first cylinder (or change its tag to something else), or it
will inherit the "keep" tag and get kept.  

```openscad
include <BOSL2/std.scad>
diff("hole", "keep")
tag("keep")cube(100, center=true)
    attach([RIGHT,TOP]) {
        tag("") cylinder(d=95, h=5);
        tag("hole") cylinder(d=50, h=11, anchor=CTR);
    }
```
![Figure 3](images/tutorials/Attachment-Tags_3.png)

You can apply a tag that is not propagated to the children using
`tag_this()`.  The above example could then be redone:

```openscad
include <BOSL2/std.scad>
diff("hole")
cube(100, center=true)
    attach([FRONT,TOP], overlap=20)
        tag("hole") {
            cylinder(h=20.1, d1=0, d2=95);
            down(10) cylinder(h=30, d=30);
        }
```
![Figure 5](images/tutorials/Attachment-Tags_5.png)

Many of the modules that use tags have default values for their tags.  For diff the default
remove tag is "remove" and the default keep tag is "keep".  In this example we rely on the
default values:

```openscad
include <BOSL2/std.scad>
diff()
sphere(d=100) {
    tag("keep")xcyl(d=40, l=120);
    tag("remove")cuboid([40,120,100]);
}
```
![Figure 6](images/tutorials/Attachment-Tags_6.png)


The parent object can be differenced away from other shapes.  Tags are inherited by children,
though, so you will need to set the tags of the children as well as the parent.

```openscad
include <BOSL2/std.scad>
diff("hole")
tag("hole")cube([20,11,45], center=true)
    tag("body")cube([40,10,90], center=true);
```
![Figure 7](images/tutorials/Attachment-Tags_7.png)

Tags (and therefore tag-based operations like `diff()`) only work correctly with attachable
children.  However, a number of built-in modules for making shapes are *not* attachable.
Some notable non-attachable modules are `text()`, `linear_extrude()`, `rotate_extrude()`,
`polygon()`, `polyhedron()`, `import()`, `surface()`, `union()`, `difference()`,
`intersection()`, `offset()`, `hull()`, and `minkowski()`.

To allow you to use tags-based operations with non-attachable shapes, you can wrap them with the
`force_tag()` module to specify their tags.  For example:

```openscad
include <BOSL2/std.scad>
diff("hole")
cuboid(50)
  attach(TOP)
    force_tag("hole")
      rotate_extrude()
        right(15)
          square(10,center=true);
```
![Figure 8](images/tutorials/Attachment-Tags_8.png)

### `intersect([intersect], [keep])`

To perform an intersection of attachables, you can use the `intersect()` module.  This is
specifically intended to address the situation where you want intersections involving a parent
and a child, something that is impossible with the native `intersection()` module.  This module
treats the children in three groups: objects matching the `intersect` tags, objects matching
the tags listed in `keep` and the remaining objects that don't match any listed tags.  The
intersection is computed between the union of the `intersect` tagged objects and the union of
the objects that don't match any listed tags.  Finally the objects listed in `keep` are union
ed with the result.  

In this example the parent (untagged) is intersected with a conical
bounding shape, which is tagged with the intersect tag.

```openscad
include <BOSL2/std.scad>
intersect("bounds")
cube(100, center=true)
    tag("bounds") cylinder(h=100, d1=120, d2=95, center=true, $fn=72);
```
![Figure 9](images/tutorials/Attachment-Tags_9.png)

In this example the child objects are intersected with the bounding box parent.  

```openscad
include <BOSL2/std.scad>
intersect("pole cap")
cube(100, center=true)
    attach([TOP,RIGHT]) {
        tag("pole")cube([40,40,80],center=true);
        tag("cap")sphere(d=40*sqrt(2));
    }
```
![Figure 10](images/tutorials/Attachment-Tags_10.png)

The default `intersect` tag is "intersect" and the default `keep` tag is "keep".  Here is an
example where "keep" is used to keep the pole from being removed by the intersection. 

```openscad
include <BOSL2/std.scad>
intersect()
cube(100, center=true) {
    tag("intersect")cylinder(h=100, d1=120, d2=95, center=true, $fn=72);
    tag("keep")zrot(45) xcyl(h=140, d=20, $fn=36);
}
```
![Figure 11](images/tutorials/Attachment-Tags_11.png)

### `conv_hull([keep])`
You can use the `conv_hull()` module to hull shapes together.  Objects
marked with the keep tags are excluded from the hull and unioned into the final result.
The default keep tag is "keep".  


```openscad
include <BOSL2/std.scad>
conv_hull()
cube(50, center=true) {
    cyl(h=100, d=20);
    tag("keep")xcyl(h=100, d=20);
}
```
![Figure 12](images/tutorials/Attachment-Tags_12.png)

[Next: Edge Profiling with Attachment](Tutorial-Attachment-Edge-Profiling)
[Prev: Using attach()](Tutorial-Attachment-Attach)

# Attachable Parts

Some objects provide named attachable parts that you can select
instead of using the main geometry for the object.  One important kind
of attachable part is the inside of a tube.

Here is a tube with its anchors shown:

```openscad
include<BOSL2/std.scad>
tube(id=20,h=15,wall=3)
  show_anchors();
```
![Figure 1](images/tutorials/Attachment-Parts_1.png)

The anchors are all on the outside wall of the tube and give you no
method for placing a child **inside** the tube.  In order to attach
inside the tube, we select the "inside" part using the `attach_part()`
module.

```openscad
include<BOSL2/std.scad>
tube(id=20,h=15,wall=3)
  attach_part("inside")
    align(BACK,TOP)
      color("lightblue") cuboid(4);
```
![Figure 2](images/tutorials/Attachment-Parts_2.png)

Now when we align the cube to the BACK wall of the tube it appears on
the inside of the tube.  If you need to attach to both the inside and
outside you can place some attachments using `attach_part()` and some
with the standard attachment geometry on the outside like this:

```openscad
include<BOSL2/std.scad>
diff()
tube(id=20,h=15,wall=3){
  attach([1,-1/2],BOT)
    color("green")cyl(d=4,h=3,$fn=12);
  attach_part("inside"){
    attach(LEFT,BOT,align=TOP)
      color("lightblue")cuboid(4);
    attach(BACK,CTR,align=TOP,inside=true, inset=-0.1)
      cuboid(4);
  }
}
```
![Figure 3](images/tutorials/Attachment-Parts_3.png)

[Next: Using Color with Attachments](Tutorial-Attachment-Color)
[Prev: Edge Profiling with Attachment](Tutorial-Attachment-Edge-Profiling)

# Making Attachables

To make a shape attachable, you just need to wrap it with an `attachable()` module with a
basic description of the shape's geometry.  By default, the shape is expected to be centered
at the origin.  This fact is important, as this is how the
`attachable()` module knows the dimensions of your part: it assumes it
is symetric around the origin.  The `attachable()` module expects
exactly two children.  The first will bethe shape to make attachable,
and the second will be `children()`, literally.

### Pass-through Attachables
The simplest way to make your own attachable module is to simply pass
through to a pre-existing attachable submodule.  This could be
appropriate if you want to rename a module, or if the anchors of an
existing module are suited to (or good enough for) your object.  In
order for your attachable module to work properly you need to accept
the `anchor`, `spin` and `orient` parameters, give them suitable
defaults, and pass them to the attachable submodule.  Don't forget to
pass the children to the attachable submodule as well, or your new
module will ignore its children.  

```openscad
include <BOSL2/std.scad>
$fn=32;
module cutcube(anchor=CENTER,spin=0,orient=UP)
{
   tag_scope(){
     diff()
       cuboid(15, rounding=2, anchor=anchor,spin=spin,orient=orient){
         tag("remove")attach(TOP)cuboid(5);
         children();
       }
   }
}
diff()
cutcube()
  tag("remove")attach(RIGHT) cyl(d=2,h=8);
```
![Figure 1](images/tutorials/Attachment-Making_1.png)

### Prismoidal/Cuboidal Attachables
To make a cuboidal or prismoidal shape attachable, you use the `size`, `size2`, and `offset`
arguments of `attachable()`.

In the most basic form, where the shape is fully cuboid, with top and bottom of the same size,
and directly over one another, you can just use `size=`.

```openscad
include <BOSL2/std.scad>
module cubic_barbell(s=100, anchor=CENTER, spin=0, orient=UP) {
    attachable(anchor,spin,orient, size=[s*3,s,s]) {
        union() {
            xcopies(2*s) cube(s, center=true);
            xcyl(h=2*s, d=s/4);
        }
        children();
    }
}
cubic_barbell(100) show_anchors(60);
```
![Figure 2](images/tutorials/Attachment-Making_2.png)

When the shape is prismoidal, where the top is a different size from the bottom, you can use
the `size2=` argument as well. While `size=` takes all three axes sizes, the `size2=` argument
only takes the [X,Y] sizes of the top of the shape.

```openscad
include <BOSL2/std.scad>
module prismoidal(size=[100,100,100], scale=0.5, anchor=CENTER, spin=0, orient=UP) {
    attachable(anchor,spin,orient, size=size, size2=[size.x, size.y]*scale) {
        hull() {
            up(size.z/2-0.005)
                linear_extrude(height=0.01, center=true)
                    square([size.x,size.y]*scale, center=true);
            down(size.z/2-0.005)
                linear_extrude(height=0.01, center=true)
                    square([size.x,size.y], center=true);
        }
        children();
    }
}
prismoidal([100,60,30], scale=0.5) show_anchors(20);
```
![Figure 3](images/tutorials/Attachment-Making_3.png)

When the top of the prismoid can be shifted away from directly above the bottom, you can use
the `shift=` argument.  The `shift=` argument takes an [X,Y] vector of the offset of the center
of the top from the XY center of the bottom of the shape.

```openscad
include <BOSL2/std.scad>
module prismoidal(size=[100,100,100], scale=0.5, shift=[0,0], anchor=CENTER, spin=0, orient=UP) {
    attachable(anchor,spin,orient, size=size, size2=[size.x, size.y]*scale, shift=shift) {
        hull() {
            translate([shift.x, shift.y, size.z/2-0.005])
                linear_extrude(height=0.01, center=true)
                    square([size.x,size.y]*scale, center=true);
            down(size.z/2-0.005)
                linear_extrude(height=0.01, center=true)
                    square([size.x,size.y], center=true);
        }
        children();
    }
}
prismoidal([100,60,30], scale=0.5, shift=[-30,20]) show_anchors(20);
```
![Figure 4](images/tutorials/Attachment-Making_4.png)

In the case that the prismoid is not oriented vertically, (ie, where the `shift=` or `size2=`
arguments should refer to a plane other than XY) you can use the `axis=` argument.  This lets
you make prismoids naturally oriented forwards/backwards or sideways.

```openscad
include <BOSL2/std.scad>
module yprismoidal(
    size=[100,100,100], scale=0.5, shift=[0,0],
    anchor=CENTER, spin=0, orient=UP
) {
    attachable(
        anchor, spin, orient,
        size=size, size2=point2d(size)*scale,
        shift=shift, axis=BACK
    ) {
        xrot(-90) hull() {
            translate([shift.x, shift.y, size.z/2-0.005])
                linear_extrude(height=0.01, center=true)
                    square([size.x,size.y]*scale, center=true);
            down(size.z/2-0.005)
                linear_extrude(height=0.01, center=true)
                    square([size.x,size.y], center=true);
        }
        children();
    }
}
yprismoidal([100,60,30], scale=1.5, shift=[20,20]) show_anchors(20);
```
![Figure 5](images/tutorials/Attachment-Making_5.png)


### Cylindrical Attachables
To make a cylindrical shape attachable, you use the `l`, and `r`/`d`, args of `attachable()`.

```openscad
include <BOSL2/std.scad>
module twistar(l,r,d, anchor=CENTER, spin=0, orient=UP) {
    r = get_radius(r=r,d=d,dflt=1);
    attachable(anchor,spin,orient, r=r, l=l) {
        linear_extrude(height=l, twist=90, slices=20, center=true, convexity=4)
            star(n=20, r=r, ir=r*0.9);
        children();
    }
}
twistar(l=100, r=40) show_anchors(20);
```
![Figure 6](images/tutorials/Attachment-Making_6.png)

If the cylinder is elipsoidal in shape, you can pass the unequal X/Y sizes as a 2-item vector
to the `r=` or `d=` argument.

```openscad
include <BOSL2/std.scad>
module ovalstar(l,rx,ry, anchor=CENTER, spin=0, orient=UP) {
    attachable(anchor,spin,orient, r=[rx,ry], l=l) {
        linear_extrude(height=l, center=true, convexity=4)
            scale([1,ry/rx,1])
                star(n=20, r=rx, ir=rx*0.9);
        children();
    }
}
ovalstar(l=100, rx=50, ry=30) show_anchors(20);
```
![Figure 7](images/tutorials/Attachment-Making_7.png)

For cylindrical shapes that aren't oriented vertically, use the `axis=` argument.

```openscad
include <BOSL2/std.scad>
module ytwistar(l,r,d, anchor=CENTER, spin=0, orient=UP) {
    r = get_radius(r=r,d=d,dflt=1);
    attachable(anchor,spin,orient, r=r, l=l, axis=BACK) {
        xrot(-90)
            linear_extrude(height=l, twist=90, slices=20, center=true, convexity=4)
                star(n=20, r=r, ir=r*0.9);
        children();
    }
}
ytwistar(l=100, r=40) show_anchors(20);
```
![Figure 8](images/tutorials/Attachment-Making_8.png)

### Conical Attachables
To make a conical shape attachable, you use the `l`, `r1`/`d1`, and `r2`/`d2`, args of
`attachable()`.

```openscad
include <BOSL2/std.scad>
module twistar(l, r,r1,r2, d,d1,d2, anchor=CENTER, spin=0, orient=UP) {
    r1 = get_radius(r1=r1,r=r,d1=d1,d=d,dflt=1);
    r2 = get_radius(r1=r2,r=r,d1=d2,d=d,dflt=1);
    attachable(anchor,spin,orient, r1=r1, r2=r2, l=l) {
        linear_extrude(height=l, twist=90, scale=r2/r1, slices=20, center=true, convexity=4)
            star(n=20, r=r1, ir=r1*0.9);
        children();
    }
}
twistar(l=100, r1=40, r2=20) show_anchors(20);
```
![Figure 9](images/tutorials/Attachment-Making_9.png)

If the cone is ellipsoidal in shape, you can pass the unequal X/Y sizes as a 2-item vectors
to the `r1=`/`r2=` or `d1=`/`d2=` arguments.

```openscad
include <BOSL2/std.scad>
module ovalish(l,rx1,ry1,rx2,ry2, anchor=CENTER, spin=0, orient=UP) {
    attachable(anchor,spin,orient, r1=[rx1,ry1], r2=[rx2,ry2], l=l) {
        hull() {
            up(l/2-0.005)
                linear_extrude(height=0.01, center=true)
                    ellipse([rx2,ry2]);
            down(l/2-0.005)
                linear_extrude(height=0.01, center=true)
                    ellipse([rx1,ry1]);
        }
        children();
    }
}
ovalish(l=100, rx1=50, ry1=30, rx2=30, ry2=50) show_anchors(20);
```
![Figure 10](images/tutorials/Attachment-Making_10.png)

For conical shapes that are not oriented vertically, use the `axis=` argument to indicate the
direction of the primary shape axis:

```openscad
include <BOSL2/std.scad>
module ytwistar(l, r,r1,r2, d,d1,d2, anchor=CENTER, spin=0, orient=UP) {
    r1 = get_radius(r1=r1,r=r,d1=d1,d=d,dflt=1);
    r2 = get_radius(r1=r2,r=r,d1=d2,d=d,dflt=1);
    attachable(anchor,spin,orient, r1=r1, r2=r2, l=l, axis=BACK) {
        xrot(-90)
            linear_extrude(height=l, twist=90, scale=r2/r1, slices=20, center=true, convexity=4)
                star(n=20, r=r1, ir=r1*0.9);
        children();
    }
}
ytwistar(l=100, r1=40, r2=20) show_anchors(20);
```
![Figure 11](images/tutorials/Attachment-Making_11.png)

### Spherical Attachables
To make a spherical shape attachable, you use the `r`/`d` args of `attachable()`.

```openscad
include <BOSL2/std.scad>
module spikeball(r, d, anchor=CENTER, spin=0, orient=UP) {
    r = get_radius(r=r,d=d,dflt=1);
    attachable(anchor,spin,orient, r=r*1.1) {
        union() {
            sphere_copies(r=r, n=512, cone_ang=180) cylinder(r1=r/10, r2=0, h=r/10);
            sphere(r=r);
        }
        children();
    }
}
spikeball(r=50) show_anchors(20);
```
![Figure 12](images/tutorials/Attachment-Making_12.png)

If the shape is an ellipsoid, you can pass a 3-item vector of sizes to `r=` or `d=`.

```openscad
include <BOSL2/std.scad>
module spikeball(r, d, scale, anchor=CENTER, spin=0, orient=UP) {
    r = get_radius(r=r,d=d,dflt=1);
    attachable(anchor,spin,orient, r=r*1.1*scale) {
        union() {
            sphere_copies(r=r, n=512, scale=scale, cone_ang=180) cylinder(r1=r/10, r2=0, h=r/10);
            scale(scale) sphere(r=r);
        }
        children();
    }
}
spikeball(r=50, scale=[0.75,1,1.5]) show_anchors(20);
```
![Figure 13](images/tutorials/Attachment-Making_13.png)

### VNF Attachables
If the shape just doesn't fit into any of the above categories, and you constructed it as a
[VNF](vnf.scad), you can use the VNF itself to describe the geometry with the `vnf=` argument.

There are two variations to how anchoring can work for VNFs. When `extent=true`, (the default)
then a plane is projected out from the origin, perpendicularly in the direction of the anchor,
to the furthest distance that intersects with the VNF shape.  The anchor point is then the
center of the points that still intersect that plane.

```openscad
include <BOSL2/std.scad>
module stellate_cube(s=100, anchor=CENTER, spin=0, orient=UP) {
    s2 = 3 * s;
    verts = [
        [0,0,-s2*sqrt(2)/2],
        each down(s/2, p=path3d(square(s,center=true))),
        each zrot(45, p=path3d(square(s2,center=true))),
        each up(s/2, p=path3d(square(s,center=true))),
        [0,0,s2*sqrt(2)/2]
    ];
    faces = [
        [0,2,1], [0,3,2], [0,4,3], [0,1,4],
        [1,2,6], [1,6,9], [6,10,9], [2,10,6],
        [1,5,4], [1,9,5], [9,12,5], [5,12,4],
        [4,8,3], [4,12,8], [12,11,8], [11,3,8],
        [2,3,7], [3,11,7], [7,11,10], [2,7,10],
        [9,10,13], [10,11,13], [11,12,13], [12,9,13]
    ];
    vnf = [verts, faces];
    attachable(anchor,spin,orient, vnf=vnf) {
        vnf_polyhedron(vnf);
        children();
    }
}
stellate_cube(25) {
    attach(UP+RIGHT) {
        anchor_arrow(20);
        %cube([100,100,0.1],center=true);
    }
}
```
![Figure 14](images/tutorials/Attachment-Making_14.png)

When `extent=false`, then the anchor point will be the furthest intersection of the VNF with
the anchor ray from the origin. The orientation of the anchor point will be the normal of the
face at the intersection.  If the intersection is at an edge or corner, then the orientation
will bisect the angles between the faces.

```openscad
include <BOSL2/std.scad>
module stellate_cube(s=100, anchor=CENTER, spin=0, orient=UP) {
    s2 = 3 * s;
    verts = [
        [0,0,-s2*sqrt(2)/2],
        each down(s/2, p=path3d(square(s,center=true))),
        each zrot(45, p=path3d(square(s2,center=true))),
        each up(s/2, p=path3d(square(s,center=true))),
        [0,0,s2*sqrt(2)/2]
    ];
    faces = [
        [0,2,1], [0,3,2], [0,4,3], [0,1,4],
        [1,2,6], [1,6,9], [6,10,9], [2,10,6],
        [1,5,4], [1,9,5], [9,12,5], [5,12,4],
        [4,8,3], [4,12,8], [12,11,8], [11,3,8],
        [2,3,7], [3,11,7], [7,11,10], [2,7,10],
        [9,10,13], [10,11,13], [11,12,13], [12,9,13]
    ];
    vnf = [verts, faces];
    attachable(anchor,spin,orient, vnf=vnf, extent=false) {
        vnf_polyhedron(vnf);
        children();
    }
}
stellate_cube() show_anchors(50);
```
![Figure 15](images/tutorials/Attachment-Making_15.png)

```openscad
include <BOSL2/std.scad>
$fn=32;
R = difference(circle(10), right(2, circle(9)));
linear_sweep(R,height=10,atype="hull")
    attach(RIGHT) anchor_arrow();
```
![Figure 16](images/tutorials/Attachment-Making_16.png)


## Making Named Anchors
While vector anchors are often useful, sometimes there are logically extra attachment points that
aren't on the perimeter of the shape.  This is what named string anchors are for.  For example,
the `teardrop()` shape uses a cylindrical geometry for it's vector anchors, but it also provides
a named anchor "cap" that is at the tip of the hat of the teardrop shape.

Named anchors are passed as an array of `named_anchor()`s to the `anchors=` argument of `attachable()`.
The `named_anchor()` call takes a name string, a positional point, an orientation vector, and a spin.
The name is the name of the anchor.  The positional point is where the anchor point is at.  The
orientation vector is the direction that a child attached at that anchor point should be oriented.
The spin is the number of degrees that an attached child should be rotated counter-clockwise around
the orientation vector.  Spin is optional, and defaults to 0.

To make a simple attachable shape similar to a `teardrop()` that provides a "cap" anchor, you may
define it like this:

```openscad
include <BOSL2/std.scad>
module raindrop(r, thick, anchor=CENTER, spin=0, orient=UP) {
    anchors = [
        named_anchor("cap", [0,r/sin(45),0], BACK, 0)
    ];
    attachable(anchor,spin,orient, r=r, l=thick, anchors=anchors) {
        linear_extrude(height=thick, center=true) {
            circle(r=r);
            back(r*sin(45)) zrot(45) square(r, center=true);
        }
        children();
    }
}
raindrop(r=25, thick=20, anchor="cap");
```
![Figure 17](images/tutorials/Attachment-Making_17.png)

If you want multiple named anchors, just add them to the list of anchors:

```openscad
include <BOSL2/std.scad>
module raindrop(r, thick, anchor=CENTER, spin=0, orient=UP) {
    anchors = [
        named_anchor("captop", [0,r/sin(45), thick/2], BACK+UP,   0),
        named_anchor("cap",    [0,r/sin(45), 0      ], BACK,      0),
        named_anchor("capbot", [0,r/sin(45),-thick/2], BACK+DOWN, 0)
    ];
    attachable(anchor,spin,orient, r=r, l=thick, anchors=anchors) {
        linear_extrude(height=thick, center=true) {
            circle(r=r);
            back(r*sin(45)) zrot(45) square(r, center=true);
        }
        children();
    }
}
raindrop(r=15, thick=10) show_anchors();
```
![Figure 18](images/tutorials/Attachment-Making_18.png)

Sometimes the named anchor you want to add may be at a point that is reached through a complicated
set of translations and rotations.  One quick way to calculate that point is to reproduce those
transformations in a transformation matrix chain.  This is simplified by how you can use the
function forms of almost all the transformation modules to get the transformation matrices, and
chain them together with matrix multiplication.  For example, if you have:

```
scale([1.1, 1.2, 1.3]) xrot(15) zrot(25) right(20) sphere(d=1);
```

and you want to calculate the center point of the sphere, you can do it like:

```
sphere_pt = apply(
    scale([1.1, 1.2, 1.3]) * xrot(15) * zrot(25) * right(20),
    [0,0,0]
);
```


## Overriding Standard Anchors

Sometimes you may want to use the standard anchors but override some
of them.  Returning to the square barebell example above, the anchors
at the right and left sides are on the cubes at each end, but the
anchors at x=0 are in floating in space.  For prismoidal/cubic anchors
in 3D and trapezoidal/rectangular anchors in 2D we can override a single anchor by
specifying the override option and giving the anchor that is being
overridden, and then the replacement in the form
`[position, direction, spin]`.  Most often you will only want to
override the position.  If you omit the other list items then the
value drived from the standard anchor will be used. Below we override
position of the FWD anchor:

```openscad
include<BOSL2/std.scad>
module cubic_barbell(s=100, anchor=CENTER, spin=0, orient=UP) {
    override = [
                 [FWD,  [[0,-s/8,0]]]
               ];
    attachable(anchor,spin,orient, size=[s*3,s,s],override=override) {
        union() {
            xcopies(2*s) cube(s, center=true);
            xcyl(h=2*s, d=s/4);
        }
        children();
    }
}
cubic_barbell(100) show_anchors(60);
```
![Figure 19](images/tutorials/Attachment-Making_19.png)

Note how the FWD anchor is now rooted on the cylindrical portion.  If
you wanted to also change its direction and spin you could do it like
this:

```openscad
include<BOSL2/std.scad>
module cubic_barbell(s=100, anchor=CENTER, spin=0, orient=UP) {
    override = [
                 [FWD,  [[0,-s/8,0], FWD+LEFT, 225]]
               ];
    attachable(anchor,spin,orient, size=[s*3,s,s],override=override) {
        union() {
            xcopies(2*s) cube(s, center=true);
            xcyl(h=2*s, d=s/4);
        }
        children();
    }
}
cubic_barbell(100) show_anchors(60);
```
![Figure 20](images/tutorials/Attachment-Making_20.png)

In the above example we give three values for the override.  As
before, the first one places the anchor on the cylinder.  We have
added the second entry which points the anchor off to the left.
The third entry gives a spin override, whose effect is shown by the
position of the red flag on the arrow.  If you want to override all of
the x=0 anchors to be on the cylinder, with their standard directions,
you can do that by supplying a list: 

```openscad
include<BOSL2/std.scad>
module cubic_barbell(s=100, anchor=CENTER, spin=0, orient=UP) {
    override = [
                 for(j=[-1:1:1], k=[-1:1:1])
                   if ([j,k]!=[0,0]) [[0,j,k], [s/8*unit([0,j,k])]]
               ];
    attachable(anchor,spin,orient, size=[s*3,s,s],override=override) {
        union() {
            xcopies(2*s) cube(s, center=true);
            xcyl(h=2*s, d=s/4);
        }
        children();
    }
}
cubic_barbell(100) show_anchors(30);
```
![Figure 21](images/tutorials/Attachment-Making_21.png)

Now all of the anchors in the middle are all rooted to the cylinder.  Another
way to do the same thing is to use a function literal for override.
It will be called with the anchor as its argument and needs to return undef to just use
the default, or a `[position, direction, spin]` triple to override the
default.  As before, you can omit values to keep their default.
Here is the same example using a function literal for the override:

```openscad
include<BOSL2/std.scad>
module cubic_barbell(s=100, anchor=CENTER, spin=0, orient=UP) {
    override = function (anchor) 
          anchor.x!=0 || anchor==CTR ? undef  // Keep these
        : [s/8*unit(anchor)];
    attachable(anchor,spin,orient, size=[s*3,s,s],override=override) {
        union() {
            xcopies(2*s) cube(s, center=true);
            xcyl(h=2*s, d=s/4);
        }
        children();
    }
}
cubic_barbell(100) show_anchors(30);
```
![Figure 22](images/tutorials/Attachment-Making_22.png)

## Making Gometry With attach_geom()

Sometimes it may be advantageous to create the attachable geometry as
a data structure.  This can be particularly useful if you want to
implement anchor types with an object, because it allows for an easy
way to create different anchor options without having to repeat code.

Suppose we create a simple tetrahedron object:

```openscad
include<BOSL2/std.scad>
module tetrahedron(base, height, spin=0, anchor=FWD+LEFT+BOT, orient=UP)
{
   base_poly = path3d([[0,0],[0,base],[base,0]]);
   top = [0,0,height];
   vnf = vnf_vertex_array([base_poly, repeat(top,3)],col_wrap=true,cap1=true);
   attachable(anchor=anchor,orient=orient,spin=spin,vnf=vnf,cp="centroid"){
     vnf_polyhedron(vnf);
     children();
   }
}   
tetrahedron(20,18) show_anchors();
```
![Figure 23](images/tutorials/Attachment-Making_23.png)

For this module we have used VNF anchors, but this tetrahedron is the
corner of a cuboid, so maybe sometimes you prefer to use anchors
based on the corresponding cuboid (its bounding box).  You can create a module with bounding
box anchors like this, where we have explicitly centered the VNF
to make it work with the prismoid type anchoring:

```openscad
include<BOSL2/std.scad>
module tetrahedron(base, height, spin=0, anchor=FWD+LEFT+BOT, orient=UP)
{
   base_poly = path3d([[0,0],[0,base],[base,0]]);
   top = [0,0,height];
   vnf = move([-base/2,-base/2,-height/2],
              vnf_vertex_array([base_poly, repeat(top,3)],col_wrap=true,cap1=true));
   attachable(anchor=anchor,orient=orient,spin=spin,size=[base,base,height]){
     vnf_polyhedron(vnf);
     children();
   }
}   
tetrahedron(20,18) show_anchors();
```
![Figure 24](images/tutorials/Attachment-Making_24.png)

The arguments needed to attachable are different in this case.  If you
want to conditionally switch between these two modes of operation,
this presents a complication.  While it is possible to work around
this by conditionally setting parameters to `undef`, the resulting
code will be more complex and harder to read.  A better solution is to
compute the geometry conditionally.  Then the geometry can be passed
to `attachable()`.

```openscad
include<BOSL2/std.scad>
module tetrahedron(base, height, atype="vnf", spin=0, anchor=FWD+LEFT+BOT, orient=UP)
{
   assert(atype=="vnf" || atype=="box");
   base_poly = path3d([[0,0],[0,base],[base,0]]);
   top = [0,0,height];
   vnf = move([-base/2,-base/2,-height/2],
              vnf_vertex_array([base_poly, repeat(top,3)],col_wrap=true,cap1=true));
   geom = atype=="vnf" ? attach_geom(vnf=vnf,cp="centroid")
                       : attach_geom(size=[base,base,height]);
   attachable(anchor=anchor,orient=orient,spin=spin,geom=geom){
     vnf_polyhedron(vnf);
     children();
   }
}   
tetrahedron(20,18,atype="vnf")
  color("green")attach(TOP,BOT) cuboid(4);
right(25)
  tetrahedron(20,18,atype="box")
    color("lightblue")attach(TOP,BOT) cuboid(4);
```
![Figure 25](images/tutorials/Attachment-Making_25.png)

Here we have created an `atype` argument that accepts two attachment
types and we compute the geometry conditionally based on the atype
setting.  We can then invoke `attachable()` once with the `geom`
parameter to specify the geometry.  


## Creating Attachable Parts

If your object has multiple distinct parts you may wish to create
attachble parts for your object.  In the library, `tube()` create
an attachable part called "inside" that lets you attach to the inside
of the tube.

Below we create an example where an object is made from two
cylindrical parts, and we want to be able to attach to either
one.  In order to create attchable parts you must pass a list of the parts
to `attachable()`.  You create a part using the `define_part()`
function which requires the part's name and its geometry.  You can
optionally provide a transformation using the `T=` parameter and give
a flat with the `inside=` parameter.  

```openscad
include<BOSL2/std.scad>
module twocyl(d1, d2, sep, h, ang=20) 
{
   parts = [
             define_part("left", attach_geom(r=d1/2,h=h),
                                 T=left(sep/2)*yrot(-ang)),
             define_part("right", attach_geom(r=d2/2,h=h),
                                  T=right(sep/2)*yrot(ang)),
           ];
   attachable(size=[sep+d1/2+d2/2,max(d1,d2),h], parts=parts){
     union(){
         left(sep/2) yrot(-ang) cyl(d=d1,h=h);
         right(sep/2) yrot(ang) cyl(d=d2,h=h);
     }
     children();
   }  
}
twocyl(d1=10,d2=13,sep=20,h=10){
  attach_part("left") attach(FWD,BOT)
     color("lightblue") cuboid(3);
  attach_part("right") attach(RIGHT,BOT)
     color("green") cuboid(3);
}  
```
![Figure 26](images/tutorials/Attachment-Making_26.png)

In the above example we create a parts list containing two parts named
"left" and "right".  Each part has its own geometry corresponding to
the size of the cylinder, and it has a transformation specifying where
the cylinder is located relative to the part's overall geometry.

If you create an "inside" part for a tube, the inside object will
naturally have its anchors on the inner cylinder **pointing
outward**.  You can anchor on the inside by setting `inside=true` when
invoking `attach()` or `align()`, but another option is to set `inside=true`
with `define_part()`.  This marks the geometry as an inside geometry, which cause `align()` and
`attach()` to invert the meaning of the `inside` parameter so that
objects will attach on the inside by default.
[Prev: Tagged Operations with Attachments](Tutorial-Attachment-Tags)

# Using Attachment for Edge Profiling

You can use attachment in various ways to create edge profiles on
objects.  One method is to simply attach an edge mask to the edge of a
parent object while using `diff()` so that the mask creates the
desired edge profile.  Most objects set the `$edge_angle` and
`$edge_length` variables so make this easier to do.

Another way to apply edge treatments is to use some specialized
modules for applying masks.  Modules such as `edge_mask()` can for working with 3D masks,
which may potentially change across their length.  Modules like
`edge_profile()` can extrude a 2D profile along specified edges.  

## 3D Masking Attachments
To make it easier to mask away shapes from various edges of an attachable parent shape, there
are a few specialized alternatives to the `attach()` and `position()` modules.

### `edge_mask()`
If you have a 3D mask shape that you want to difference away from various edges, you can use
the `edge_mask()` module.  This module will take a vertically oriented shape, and will rotate
and move it such that the BACK, RIGHT (X+,Y+) side of the shape will be aligned with the given
edges.  The shape will be tagged as a "remove" so that you can use
`diff()` with its default "remove" tag.  For example,
here's a shape for rounding an edge:

```openscad
include <BOSL2/std.scad>
module round_edge(l,r) difference() {
    translate([-1,-1,-l/2])
        cube([r+1,r+1,l]);
    translate([r,r])
        cylinder(h=l+1,r=r,center=true, $fn=quantup(segs(r),4));
}
round_edge(l=30, r=19);
```
![Figure 1](images/tutorials/Attachment-Edge-Profiling_1.png)

You can use that mask to round various edges of a cube:

```openscad
include <BOSL2/std.scad>
module round_edge(l,r) difference() {
    translate([-1,-1,-l/2])
        cube([r+1,r+1,l]);
    translate([r,r])
        cylinder(h=l+1,r=r,center=true, $fn=quantup(segs(r),4));
}
diff()
cube([50,60,70],center=true)
    edge_mask([TOP,"Z"],except=[BACK,TOP+LEFT])
        round_edge(l=71,r=10);
```
![Figure 2](images/tutorials/Attachment-Edge-Profiling_2.png)

### `corner_mask()`
If you have a 3D mask shape that you want to difference away from various corners, you can use
the `corner_mask()` module.  This module will take a shape and rotate and move it such that the
BACK RIGHT TOP (X+,Y+,Z+) side of the shape will be aligned with the given corner.  The shape
will be tagged as a "remove" so that you can use `diff()` with its
default "remove" tag.  For example, here's a shape for
rounding a corner:

```openscad
include <BOSL2/std.scad>
module round_corner(r) difference() {
    translate(-[1,1,1])
        cube(r+1);
    translate([r,r,r])
        spheroid(r=r, style="aligned", $fn=quantup(segs(r),4));
}
round_corner(r=10);
```
![Figure 3](images/tutorials/Attachment-Edge-Profiling_3.png)

You can use that mask to round various corners of a cube:

```openscad
include <BOSL2/std.scad>
module round_corner(r) difference() {
    translate(-[1,1,1])
        cube(r+1);
    translate([r,r,r])
        spheroid(r=r, style="aligned", $fn=quantup(segs(r),4));
}
diff()
cube([50,60,70],center=true)
    corner_mask([TOP,FRONT],LEFT+FRONT+TOP)
        round_corner(r=10);
```
![Figure 4](images/tutorials/Attachment-Edge-Profiling_4.png)

### Mix and Match Masks
You can use `edge_mask()` and `corner_mask()` together as well:

```openscad
include <BOSL2/std.scad>
module round_corner(r) difference() {
    translate(-[1,1,1])
        cube(r+1);
    translate([r,r,r])
        spheroid(r=r, style="aligned", $fn=quantup(segs(r),4));
}
module round_edge(l,r) difference() {
    translate([-1,-1,-l/2])
        cube([r+1,r+1,l]);
    translate([r,r])
        cylinder(h=l+1,r=r,center=true, $fn=quantup(segs(r),4));
}
diff()
cube([50,60,70],center=true) {
    edge_mask("ALL") round_edge(l=71,r=10);
    corner_mask("ALL") round_corner(r=10);
}
```
![Figure 5](images/tutorials/Attachment-Edge-Profiling_5.png)

## 2D Profile Mask Attachments
While 3D mask shapes give you a great deal of control, you need to make sure they are correctly
sized, and you need to provide separate mask shapes for corners and edges.  Often, a single 2D
profile could be used to describe the edge mask shape (via `linear_extrude()`), and the corner
mask shape (via `rotate_extrude()`).  This is where `edge_profile()`, `corner_profile()`, and
`face_profile()` come in.

### `edge_profile()`
Using the `edge_profile()` module, you can provide a 2D profile shape and it will be linearly
extruded to a mask of the appropriate length for each given edge.  The resultant mask will be
tagged with "remove" so that you can difference it away with `diff()`
with the default "remove" tag.  The 2D profile is
assumed to be oriented with the BACK, RIGHT (X+,Y+) quadrant as the "cutter edge" that gets
re-oriented towards the edges of the parent shape.  A typical mask profile for chamfering an
edge may look like:

```openscad
include <BOSL2/std.scad>
mask2d_roundover(10);
```
![Figure 6](images/tutorials/Attachment-Edge-Profiling_6.png)

Using that mask profile, you can mask the edges of a cube like:

```openscad
include <BOSL2/std.scad>
diff()
cube([50,60,70],center=true)
   edge_profile("ALL")
       mask2d_roundover(10);
```
![Figure 7](images/tutorials/Attachment-Edge-Profiling_7.png)

### `corner_profile()`
You can use the same profile to make a rounded corner mask as well:

```openscad
include <BOSL2/std.scad>
diff()
cube([50,60,70],center=true)
   corner_profile("ALL", r=10)
       mask2d_roundover(10);
```
![Figure 8](images/tutorials/Attachment-Edge-Profiling_8.png)

### `face_profile()`
As a simple shortcut to apply a profile mask to all edges and corners of a face, you can use the
`face_profile()` module:

```openscad
include <BOSL2/std.scad>
diff()
cube([50,60,70],center=true)
   face_profile(TOP, r=10)
       mask2d_roundover(10);
```
![Figure 9](images/tutorials/Attachment-Edge-Profiling_9.png)

[Next: Making Attachable Objects](Tutorial-Attachment-Making)
[Prev: Attachable Parts](Tutorial-Attachment-Parts)

## Coloring Attachables
Usually, when coloring a shape with the `color()` module, the parent color overrides the colors of
all children.  This is often not what you want:

```openscad
include <BOSL2/std.scad>
$fn = 24;
color("red") spheroid(d=3) {
    attach(CENTER,BOT) color("white") cyl(h=10, d=1) {
        attach(TOP,BOT) color("green") cyl(h=5, d1=3, d2=0);
    }
}
```
![Figure 1](images/tutorials/Attachment-Color_1.png)

If you use the `recolor()` module, however, the child's color
overrides the color of the parent.  This is probably easier to understand by example:

```openscad
include <BOSL2/std.scad>
$fn = 24;
recolor("red") spheroid(d=3) {
    attach(CENTER,BOT) recolor("white") cyl(h=10, d=1) {
        attach(TOP,BOT) recolor("green") cyl(h=5, d1=3, d2=0);
    }
}
```
![Figure 2](images/tutorials/Attachment-Color_2.png)

Be aware that `recolor()` will only work if you avoid using the native
`color()` module.  Also note that `recolor()` still affects all its
children.  If you want to color an object without affecting the
children you can use `color_this()`.  See the difference below:

```openscad
include <BOSL2/std.scad>
$fn = 24;
recolor("red") spheroid(d=3) {
    attach(CENTER,BOT) recolor("white") cyl(h=10, d=1) {
        attach(TOP,BOT)  cyl(h=5, d1=3, d2=0);
    }
}
right(5)
recolor("red") spheroid(d=3) {
    attach(CENTER,BOT) color_this("white") cyl(h=10, d=1) {
        attach(TOP,BOT)  cyl(h=5, d1=3, d2=0);
    }
}
```
![Figure 3](images/tutorials/Attachment-Color_3.png)

Similar modules exist to provide access to the highlight and
background modifiers.   You can specify `highlight()` and then later
`highlight(false)` to control the use of the `#` modifier.  Similarly
you can use `ghost()` and `ghost(false)` to provide more control of
the `%` modifier.  And as with color, you can also use
`highlight_this()` and `ghost_this()` to affect just one child without
affecting its descendents.  

As with all of the attachable features, these color, highlight and ghost modules only work
on attachable objects, so they will have no effect on objects you
create using `linear_extrude()` or `rotate_extrude()`.  

[Next: Tagged Operations with Attachments](Tutorial-Attachment-Tags)

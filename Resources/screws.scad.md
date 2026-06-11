# LibFile: screws.scad

Functions and modules for creating metric (ISO) and English (UTS) standard screws and nuts.
Included is a function for calculating the standard dimensions of screws including the
tolerance values that are required to make screws mate properly when they are formed
precisely.  If you can fabricate objects accurately then the modeled screws will mate
with standard hardware without the need to introduce extra gaps for clearance.

To use, add the following lines to the beginning of your file:

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>

## File Contents

1. [Section: Screw and Nut Parameters](#section-screw-and-nut-parameters)
    1. [Subsection: Screw Naming](#subsection-screw-naming)
    2. [Subsection: Standard Screw Pitch](#subsection-standard-screw-pitch)
    3. [Subsection: Screw Heads](#subsection-screw-heads)
    4. [Subsection: Nuts](#subsection-nuts)
    5. [Subsection: Tolerance](#subsection-tolerance)
    6. [Subsection: screw\_info and nut\_info structures](#subsection-screw_info-and-nut_info-structures)
    

2. [Section: Making Screws](#section-making-screws)
    - [`screw()`](#module-screw) – Creates a standard screw with optional tolerances. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>
    - [`screw_hole()`](#module-screw_hole) – Creates a screw hole. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>
    - [`shoulder_screw()`](#module-shoulder_screw) – Creates a shoulder screw. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>
    - [`screw_head()`](#module-screw_head) – Creates a screw head. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

3. [Section: Nuts and nut traps](#section-nuts-and-nut-traps)
    - [`nut()`](#module-nut) – Creates a standard nut. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>
    - [`nut_trap_side()`](#module-nut_trap_side) – Creates a side nut trap mask. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>
    - [`nut_trap_inline()`](#module-nut_trap_inline) – Creates an inline nut trap mask. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

4. [Section: Screw and Nut Information](#section-screw-and-nut-information)
    - [`screw_info()`](#function-screw_info) – Returns the dimensions and other info for the given screw.
    - [`nut_info()`](#function-nut_info) – Returns the dimensions and other info for the given nut.
    - [`thread_specification()`](#function-thread_specification) – Returns the thread geometry for a given screw.


## Section: Screw and Nut Parameters

This modules in this file create standard ISO (metric) and UTS (English) threaded screws.
The [`screw()`](#module-screw) and [`nut()`](#module-nut) modules produce
screws and nuts that comply with the relevant ISO and ASME standards,
including tolerances for screw fit.  You can also create screws with
various head types and drive types that should match standard hardware.

## Subsection: Screw Naming

You can specify screws using a string that specifies the screw.
Metric or ISO screws are specified by a diameter in millimeters and a thread pitch in millimeters.  For example,
an M8x2 screw has a nominal diameter of 8 mm and a thread pitch of 2 mm.
The screw specification for these screws has the form: "M`<size>`x`<pitch>`,`<length>`,
so "M6x1,10" specifies a 6mm diameter screw with a thread pitch of 1mm and length of 10mm.
You can omit the pitch or length, e.g. "M6x1", or "M6,10", or just "M6".  If you omit the
length then you must provide the `length` parameter.  If you omit the pitch, the library
provides a standard pitch for the specified diameter.

Imperial or UTS screws are specified by a diameter and the number of threads per inch.
For large screws, the diameter is simply the nominal diameter in inches, so a 5/16-18 screw
has a nominal diameter of 5/16 inches and 18 threads per inch.  For diameters smaller than
1/4 inch, the screw diameter is given using a screw gauge, which can be from 0 up to 12.
A common smaller size is #8-32, an 8 gauge screw with 32 threads per inch.
For UTS screws the specification has the form `<size>`-`<threadcount>`,`<length>`, e.g.
"#8-32,1/2", or "1/4-20,1".  The units are in inches, including the length.  Size can be a
gauge number from 0 to 12 with or without a leading # to specify a screw gauge size, or any other
value to specify a diameter in inches, either as a float or a fraction, so "0.5-13" and
"1/2-13" are equivalent.  To force interpretation of the value as inches add '' (two
single-quotes) to the end, e.g. "1''-4" is a one inch screw and "1-80" is a very small
1-gauge screw.  The pitch is specified using a thread count, the number of threads per inch.
As with the ISO screws, you can omit the pitch or length and specify "#6-32", "#6,3/4", or simply #6.
As in the metric case, if you omit the length then you must provide the `length` parameter.  If you omit the pitch, the
library provides a standard pitch for the specified diameter.

## Subsection: Standard Screw Pitch

If you omit the pitch when specifying a screw or nut then the library supplies a standard screw pitch based
on the screw diameter as listed in ISO 724 or ASME B1.1.  For many diameters, multiple standard pitches exist.
The available thread pitch types are different for ISO and UTS:

| ISO      |    UTS   |
| -------- | -------- |
| "coarse" |  "coarse" or "UNC" |
| "fine"   |   "fine" or "UNF"  |
| "extrafine" or "extra fine" | "extrafine", "extra fine", or "UNEF"  |
| "superfine" or "super fine" |   |
| "none"   |  "none"  |

The default pitch selection is "coarse".  Note that this selection is case insensitive.
To set the pitch using these pitch strings you use the `thread=` argument to the modules.
You cannot incorporate a named pitch into the thread name.  The finer pitch categories
are defined only for larger screw diameters.  You can also use the `thread=` argument to
directly specify a pitch, so `thread=2` produces a thread pitch of 2mm.  Setting the
pitch to zero produces an unthreaded screws, the same as setting it to "none".  Specifying
a numeric value this way overrides a value given in the specification.  You can also set
`thread=true` or `thread=false` to turn threading on and off, with the same default coarse
threading when you set it to true.

## Subsection: Screw Heads

By default screws do not have heads.
You can request a screw head using `head=` parameter to specify the desired head type.  If you want the
head to have a recess for driving the screw you must also specify a drive type using `drive=`.
The table below lists the head options.  Only some combinations of head and drive
type are supported.  Different sized flat heads exist for the same screw type.
Sometimes this depends on the type of recess.  If you specify "flat" then the size will be chosen
appropriately for the recess you specify.

The `drive=` argument can be set to "none", "hex", "slot",
"phillips", "ph0" to "ph4" (for phillips of the specified size), "torx" or
"t<size>" (for Torx at a specified size, e.g. "t20").  If you have no head but still
give a drive type you will get a set screw.  The table below lists all of the head types and
shows which drive type is compatible with each head types.  Different head types work in ISO and UTS,
as marked in the first column.

|ISO|UTS|Head            | Drive  |
|---|---|--------------- | ----------------------------|
|X|X|"none"          | hex, torx, slot |
|X|X|"hex"           | *none*|
|X|X|"socket"        | hex, torx|
|X|X|"button"        | hex, torx|
|X|X|"flat"          | slot, phillips, hex, torx|
|X|X|"flat sharp"    | slot, phillips, hex, torx|
| |X|"flat small"    | slot, phillips|
| |X|"flat large"    | hex, torx |
| |X|"flat undercut" | slot, phillips |
| |X|"flat 82"       | slot, phillips |
| |X|"flat 100"      | slot, phillips |
| |X|"round"         | slot, phillips |
| |X|"fillister"     | slot, phillips |
|X|X|"pan"           | slot, phillips, torx (ISO only) |
|X| |"cheese"        | slot, phillips, torx |

The drive size is specified appropriately for the drive type: drive number for phillips or torx,
and recess width in mm or inches (as appropriate) for hex.  Drive size is determined automatically
from the screw size, but by passing the `drive_size=` argument you can override the default, or
in cases where no default exists you can specify it.  Flat head screws have variations such as 100 degree
angle for UTS, or undercut heads.  You can also request a "sharp" screw which will set the screw diameter
the theoretical maximum and produce sharp corners instead of a flat edge on the head.  For a flat head screw
the drive specification must start with "flat", but the flat head options
can be mixed in any order, for example, "flat sharp undercut" or "flat undercut sharp".

## Subsection: Nuts

Nuts come in standard sizes and BOSL2 has tables to produce sizes for both Imperial and metric nuts.
A nut for a given thread size is defined by its shape, width and thickness.  The shape is either "hex"
for hexagonal nuts or "square" for square nuts.  For hexagonal Imperial nuts, you can choose from thickness values
of "thin", "normal" or "thick", but the thin and thick nuts are defined only for thread sizes of 1/4 inch and above.

Metric nut standards are more complicated because ISO has a series of standards and DIN has a series of conflicting
standards.  Nuts from McMaster-Carr in the USA comply with DIN rather than ISO.  Furthermore, ISO does not appear
to specify dimensions for square nuts.  For metric nuts you can specify "thin", "normal" and "thick" and the
nut will be constructed to ISO standards (ISO 4035, ISO 4032, and ISO 4033 respectively).  The DIN standard for thin
nuts matches ISO, but the DIN normal thickness nuts are thinner than ISO nuts.  You can request DIN nuts
by specifying a thickness of "DIN" or "undersized".  If you request a square nut it necessariliy derives from DIN
instead of ISO.  For most nut sizes, the nut widths match between ISO and DIN, but they do differ for M10, M12, M14 and M22.

You can of course specify nuts by giving an explicit numerical width and thickness in millimeters.

## Subsection: Tolerance

Without tolerance requirements, screws would not fit together.  The screw standards specify a
nominal size, but the tolerance determines a range of allowed sizes based on that nominal size.
So for example, an M10 screw with the default tolerance has an outside (major) diameter between 9.74 mm and 9.97 mm.
The library will use the center point in the allowed range and create a screw with a diameter of 9.86 mm.
A M10 nut at the default tolerance has a major diameter (which is the inside diameter) between 10 mm and 10.4 mm.
Shrinking the major diameter of a screw makes the screw loose.  Shrinking the major diameter of a nut, on the other hand,
makes the hole smaller and hence makes the nut tighter.  For this reason, we need a difference tolerance
for a screw than for a nut.  Screw tolerances shrink the diameter to make the screw looser whereas nut tolerances
increase the diameter to make the nut looser.  Screws modeled using this library will have dimensions consistent with the
standards they are based on, so that they will interface properly if fabricated by an accurate method.  The ISO and UTS
systems use different tolerance designations.

For UTS screw threads the tolerance is one of "1A", "2A" or "3A", in
order of increasing tightness.  The default tolerance is "2A", which
is the general standard for manufactured bolts.

For UTS nut threads, the tolerance is one of "1B", "2B" or "3B", in
order of increasing tightness.  The default tolerance is "2B", which
is the general standard for manufactured nuts.

The ISO tolerances are more complicated.  For both screws and nuts the ISO tolerance has the form of a number
and letter.  The letter specifies the "fundamental deviation", also called the "tolerance position", the gap
from the nominal size.  The number specifies the allowed range (variability) of the thread heights.  For
screws, the letter must be "e", "f", "g", or "h", where "e" is the loosest and "h" means no gap.  The number
for a screw tolerance must be a value from 3-9 for crest diameter and one of 4, 6, or 8 for pitch diameter.
A tolerance "6g" specifies both pitch and crest diameter to be the same, but they can be different, with a
tolerance like "5g6g" specifies a pitch diameter tolerance of "5g" and a crest diameter tolerance of "6g".
Smaller numbers give a tighter tolerance.  The default ISO screw tolerance is "6g".

For ISO nuts the letters specifying the fundamental deviation are upper case and must be "G" or "H" where "G"
is loose and "H" means no gap. The number specifying the variability must range from 4-8.  An allowed (loose)
nut tolerance is "7G".  The default ISO tolerance is "6H".

Clearance holes have a different tolerance system, described in [`screw_hole()`](#module-screw_hole).

If you wish to create screws at the nominal size you can set the tolerance to 0 or "none".

## Subsection: screw\_info and nut\_info structures

When you make a screw or nut, information about the object such as the thread characteristics
head and drive size, or nut thickness are placed into a data structure.  The screw and nut
modules can accept screw names, as described above, or they can accept screw structures.
When you use a screw structure as a specification, computed values like head type and size and
driver characteristics are fixed and cannot be changed, but values that are not computed
like length can still be altered.  If you want to create an unusual part you can hand
generate the structure with your desired parameters to fill in values that would normally
be produced automatically from the standard tables.  So if your hardware is missing from the
tables, or is sized differently, you can still create the part.  For details on the
screw_info and nut_info structures, see [`screw_info()`](#function-screw_info) and [`nut_info()`](#function-nut_info).

All of the screw related modules set the variable `$screw_spec` to contain the specification
for their screw.  This means that child modules can make use of this variable to create
mating (or identical) parts.  Note that the `shaft_oversize` and `head_oversize` screw
info fields are only inherited into modules that are the same as the parent module.
This means that if you create an oversized screw hole and then make a screw as s child, the
child screw will **not** inherit the oversize parameters.  But a screw_hole will inherit
oversize parameters from a parent screw_hole.

## Section: Making Screws


### Module: screw()

**Synopsis:** Creates a standard screw with optional tolerances. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

**Topics:** [Threading](Topics#threading), [Screws](Topics#screws)

**See Also:** [screw\_hole()](#module-screw_hole), [shoulder\_screw()](#module-shoulder_screw)

**Usage:** 

- screw([spec], [head], [drive], [thread=], [drive_size=], [length=|l=], [thread_len=], [undersize=], [shaft_undersize=], [head_undersize=], [tolerance=], [blunt_start=], [details=], [anchor=], [atype=], [orient=], [spin=]) [ATTACHMENTS];

**Description:** 

Create a screw.  See [screw and nut parameters](#section-screw-and-nut-parameters) for details on
the parameters that define a screw.  The tolerance determines the dimensions of the screw based
on ISO and ASME standards.  Screws fabricated at those dimensions will mate properly with
standard hardware.  Note that the $slop argument does not affect the size of screws: it only
adjusts screw holes.  This will work fine if you are printing both parts, but if you need to mate
printed screws to metal parts you may need to adjust the size of the screws, which you can do
with the undersize arguments.

You can generate a screw specification from [`screw_info()`](#function-screw_info), possibly create a modified version
using [`struct_set()`](structs.scad#function-struct_set), and pass that in rather than giving the parameters.

Various anchor types refer to different parts of the screw, some of which are labeled below.  The
"screw" anchor type (the default) is simply the entire screw, so TOP and BOTTOM refer to the head
end and tip respectively, and CENTER is the midpoint of the whole screw, including the head.  The
"head" anchor refers to the head alone.  Both of these anchor types refer to the bounding
cylinder for the specified screw part, except for hex heads, which anchor to a hexagonal prism.

**Figure 2.1.1:** 

<img align="left" alt="screw() Figure 2.1.1" src="images/screws/figure_2_1_1.png" width="480" height="360">

<br clear="all" />

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`spec`               | screw specification, e.g. "M5x1" or "#8-32".  See [screw naming](#subsection-screw-naming).  This can also be a screw specification structure of the form produced by [`screw_info()`](#function-screw_info).
`head`               | head type.  See [screw heads](#subsection-screw-heads)  Default: none
`drive`              | drive type.  See [screw heads](#subsection-screw-heads) Default: none

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`length`             / `l`                  | length of screw (in mm)
`thread`             | thread type or specification. See [screw pitch](#subsection-standard-screw-pitch). Default: "coarse"
`drive_size`         | size of drive recess to override computed value
`thread_len`         | length of threaded portion of screw (in mm), for making partly threaded screws.  Default: fully threaded
`details`            | toggle some details in rendering.  Default: true
`tolerance`          | screw tolerance.  Determines actual screw thread geometry based on nominal sizing.  See [tolerance](#subsection-tolerance). Default is "2A" for UTS and "6g" for ISO.
`undersize`          | amount to decrease screw diameter, a scalar to apply to all parts, or a 2-vector to control shaft and head.  Replaces rather than adding to the head_oversize value in a screw specification.
`shaft_undersize`    | amount to decrease diameter of the shaft of screw; replaces rather than adding to the shaft_oversize value in a screw specification.
`head_undersize`     | amount to decrease the head diameter of the screw; replaces rather than adding to the head_oversize value in a screw specification.
`bevel1`             | bevel bottom end of screw.  Default: true
`bevel2`             | bevel top end of threaded section.  Default: true for fully threaded or unthreaded headless, false otherwise
`bevel`              | bevel both ends of the threaded section.
`blunt_start`        | if true and hole is threaded, create blunt start threads.  Default: true
`blunt_start1`       | if true and hole is threaded, create blunt start threads at bottom end.
`blunt_start2`       | if true and hole is threaded, create blunt start threads top end.
`atype`              | anchor type, one of "screw", "head", "shaft", "threads", "shank"
`anchor`             | Translate so anchor point on the shaft is at origin (0,0,0).  See [anchor](attachments.scad#subsection-anchor).  Default: `CENTER`
`spin`               | Rotate this many degrees around the Z axis after anchor.  See [spin](attachments.scad#subsection-spin).  Default: `0`
`orient`             | Vector to rotate top towards, after spin.  See [orient](attachments.scad#subsection-orient).  Default: `UP`

**Side Effects:** 

- `$screw_spec` is set to the spec specification structure.

**Anchor Types:** 

Anchor Type | What it is
----------- | ----------
screw | the entire screw (default)
head | screw head (invalid for headless screws)
shaft | screw shaft
shank | unthreaded section of shaft (invalid if screw is fully threaded)
threads | threaded section of screw

**Named Anchors:** 

Anchor Name | Position
----------- | --------
"top" | top of screw
"bot" | bottom of screw
"center" | center of screw
"head_top" | top of head (same as top for headless screws)
"head_bot" | bottom of head (same as top for headless screws)
"head_center" | center of head (same as top for headless screws)
"shaft_top" | top of shaft
"shaft_bot" | bottom of shaft
"shaft_center" | center of shaft
"shank_top" | top of shank (invalid if screw is fully threaded)
"shank_bot" | bottom of shank (invalid if screw is fully threaded)
"shank_center" | center of shank (invalid if screw is fully threaded)
"threads_top" | top of threaded portion of screw (invalid if thread_len=0)
"threads_bot" | bottom of threaded portion of screw (invalid if thread_len=0)
"threads_center" | center of threaded portion of screw (invalid if thread_len=0)

**Example 1:** Selected UTS (English) screws

<img align="left" alt="screw() Example 1" src="images/screws/screw.png" width="480" height="360">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    $fn=32;
    xdistribute(spacing=8){
      screw("#6", length=12);
      screw("#6-32", head="button", drive="torx",length=12);
      screw("#6-32,3/4", head="hex");
      screw("#6", thread="fine", head="fillister",length=12, drive="phillips");
      screw("#6", head="flat small",length=12,drive="slot");
      screw("#6-32", head="flat large", length=12, drive="torx");
      screw("#6-32", head="flat undercut",length=12);
      screw("#6-24", head="socket",length=12);          // Non-standard threading
      screw("#6-32", drive="hex", drive_size=1.5, length=12);
    }

**Example 2:** A few examples of ISO (metric) screws

<img align="left" alt="screw() Example 2" src="images/screws/screw_2.png" width="480" height="360">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    $fn=32;
    xdistribute(spacing=8){
      screw("M3", head="flat small",length=12);
      screw("M3", head="button",drive="torx",length=12);
      screw("M3", head="pan", drive="phillips",length=12);
      screw("M3x1", head="pan", drive="slot",length=12);   // Non-standard threading!
      screw("M3", head="flat large",length=12);
      screw("M3", thread="none", head="flat", drive="hex",length=12);  // No threads
      screw("M3", head="socket",length=12);
      screw("M5,18", head="hex");
    }

**Example 3:** Demonstration of all head types for UTS screws (using pitch zero for fast preview)

<img align="left" alt="screw() Example 3" src="images/screws/screw_3.png" width="480" height="360">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    xdistribute(spacing=15){
      ydistribute(spacing=15){
         screw("1/4", thread=0,length=8, anchor=TOP, head="none", drive="hex");
         screw("1/4", thread=0,length=8, anchor=TOP, head="none", drive="torx");
         screw("1/4", thread=0,length=8, anchor=TOP, head="none", drive="slot");
         screw("1/4", thread=0,length=8, anchor=TOP, head="none");
      }
      screw("1/4", thread=0, length=8, anchor=TOP, head="hex");
      ydistribute(spacing=15){
         screw("1/4", thread=0,length=8, anchor=TOP, head="socket", drive="hex");
         screw("1/4", thread=0,length=8, anchor=TOP, head="socket", drive="torx");
         screw("1/4", thread=0,length=8, anchor=TOP, head="socket");
      }
      ydistribute(spacing=15){
         screw("1/4", thread=0,length=8, anchor=TOP, head="socket ribbed", drive="hex",$fn=32);
         screw("1/4", thread=0,length=8, anchor=TOP, head="socket ribbed", drive="torx",$fn=32);
         screw("1/4", thread=0,length=8, anchor=TOP, head="socket ribbed",$fn=24);
      }
      ydistribute(spacing=15){
         screw("1/4", thread=0,length=8, anchor=TOP, head="button", drive="hex");
         screw("1/4", thread=0,length=8, anchor=TOP, head="button", drive="torx");
         screw("1/4", thread=0,length=8, anchor=TOP, head="button");
      }
      ydistribute(spacing=15){
         screw("1/4", thread=0,length=8, anchor=TOP, head="round", drive="slot");
         screw("1/4", thread=0,length=8, anchor=TOP, head="round", drive="phillips");
         screw("1/4", thread=0,length=8, anchor=TOP, head="round");
      }
      ydistribute(spacing=15){
         screw("1/4", thread=0,length=8, anchor=TOP, head="pan", drive="slot");
         screw("1/4", thread=0,length=8, anchor=TOP, head="pan", drive="phillips");
         screw("1/4", thread=0,length=8, anchor=TOP, head="pan");
      }
      ydistribute(spacing=15){
         screw("1/4", thread=0,length=8, anchor=TOP, head="fillister", drive="slot");
         screw("1/4", thread=0,length=8, anchor=TOP, head="fillister", drive="phillips");
         screw("1/4", thread=0,length=8, anchor=TOP, head="fillister");
      }
      ydistribute(spacing=15){
         screw("1/4", thread=0,length=8, anchor=TOP, head="flat", drive="slot");
         screw("1/4", thread=0,length=8, anchor=TOP, head="flat", drive="phillips");
         screw("1/4", thread=0,length=8, anchor=TOP, head="flat", drive="hex");
         screw("1/4", thread=0,length=8, anchor=TOP, head="flat", drive="torx");
         screw("1/4", thread=0,length=8, anchor=TOP, head="flat large");
         screw("1/4", thread=0,length=8, anchor=TOP, head="flat small");
      }
      ydistribute(spacing=15){
         screw("1/4", thread=0,length=8, anchor=TOP, head="flat undercut", drive="slot");
         screw("1/4", thread=0,length=8, anchor=TOP, head="flat undercut", drive="phillips");
         screw("1/4", thread=0,length=8, anchor=TOP, head="flat undercut");
      }
      ydistribute(spacing=15){
         screw("1/4", thread=0,length=8, anchor=TOP, head="flat 100", drive="slot");
         screw("1/4", thread=0,length=8, anchor=TOP, head="flat 100", drive="phillips");
         screw("1/4", thread=0,length=8, anchor=TOP, head="flat 100");
      }
    }

**Example 4:** Demonstration of all head types for metric screws without threading.

<img align="left" alt="screw() Example 4" src="images/screws/screw_4.png" width="480" height="360">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    xdistribute(spacing=15){
      ydistribute(spacing=15){
        screw("M6x0", length=8, anchor=TOP,  head="none", drive="hex");
        screw("M6x0", length=8, anchor=TOP,  head="none", drive="torx");
        screw("M6x0", length=8, anchor=TOP,  head="none", drive="slot");
        screw("M6x0", length=8, anchor=TOP);
      }
      screw("M6x0", length=8, anchor=TOP,  head="hex");
      ydistribute(spacing=15){
        screw("M6x0", length=8, anchor=TOP,  head="socket", drive="hex");
        screw("M6x0", length=8, anchor=TOP,  head="socket", drive="torx");
        screw("M6x0", length=8, anchor=TOP,  head="socket");
      }
      ydistribute(spacing=15){
        screw("M6x0", length=8, anchor=TOP,  head="socket ribbed", drive="hex", $fn=32);
        screw("M6x0", length=8, anchor=TOP,  head="socket ribbed", drive="torx", $fn=32);
        screw("M6x0", length=8, anchor=TOP,  head="socket ribbed", $fn=32);
      }
      ydistribute(spacing=15){
        screw("M6x0", length=8, anchor=TOP,  head="pan", drive="slot");
        screw("M6x0", length=8, anchor=TOP,  head="pan", drive="phillips");
        screw("M6x0", length=8, anchor=TOP,  head="pan", drive="torx");
        screw("M6x0", length=8, anchor=TOP,  head="pan");
        screw("M6x0", length=8, anchor=TOP,  head="pan flat");
      }
      ydistribute(spacing=15){
        screw("M6x0", length=8, anchor=TOP,  head="button", drive="hex");
        screw("M6x0", length=8, anchor=TOP,  head="button", drive="torx");
        screw("M6x0", length=8, anchor=TOP,  head="button");
      }
      ydistribute(spacing=15){
        screw("M6x0", length=8, anchor=TOP,  head="cheese", drive="slot");
        screw("M6x0", length=8, anchor=TOP,  head="cheese", drive="phillips");
        screw("M6x0", length=8, anchor=TOP,  head="cheese", drive="torx");
        screw("M6x0", length=8, anchor=TOP,  head="cheese");
      }
      ydistribute(spacing=15){
        screw("M6x0", length=8, anchor=TOP,  head="flat", drive="phillips");
        screw("M6x0", length=8, anchor=TOP,  head="flat", drive="slot");
        screw("M6x0", length=8, anchor=TOP,  head="flat", drive="hex");
        screw("M6x0", length=8, anchor=TOP,  head="flat", drive="torx");
        screw("M6x0", length=8, anchor=TOP,  head="flat small");
        screw("M6x0", length=8, anchor=TOP,  head="flat large");
      }
    }

**Example 5:** The three different English (UTS) screw tolerances (labeled on their heads)

<img align="left" alt="screw() Example 5" src="images/screws/screw_5.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    module label(val)
    {
      difference(){
         children();
         yflip()linear_extrude(height=.35) text(val,valign="center",halign="center",size=8);
      }
    }
    $fn=64;
    xdistribute(spacing=15){
      label("1") screw("1/4-20,5/8", head="hex",orient=DOWN,atype="head", anchor=TOP,tolerance="1A");  // Loose
      label("2") screw("1/4-20,5/8", head="hex",orient=DOWN,atype="head", anchor=TOP,tolerance="2A");  // Standard
      label("3") screw("1/4-20,5/8", head="hex",orient=DOWN,atype="head", anchor=TOP,tolerance="3A");  // Tight
    }

**Example 6:** This example shows the gap between nut and bolt at the loosest tolerance for UTS.  This gap is what enables the parts to mesh without binding and is part of the definition for standard metal hardware.  Note that this gap is part of the standard definition for the metal hardware, not the 3D printing adjustment provided by the $slop parameter.

<img align="left" alt="screw() Example 6" src="images/screws/screw_6.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    $fn=32;
    projection(cut=true)xrot(-90){
        screw("1/4-20,3/8", head="hex",orient=UP,anchor=BOTTOM,tolerance="1A");
        down(INCH*1/20*1.5) nut("1/4-20", thickness=8, nutwidth=0.5*INCH, tolerance="1B");
    }

**Example 7:** Here is a screw with nonstandard threading and a weird head size, which we create by modifying the screw structure:

<img align="left" alt="screw() Example 7" src="images/screws/screw_7.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    spec = screw_info("M6x2,12",head="socket");
    newspec = struct_set(spec,["head_size",20,"head_height",3]);
    screw(newspec);

<br clear="all" /><br/>

**Example 8:** A bizarre custom screw with nothing standard about it.  If your screw is very strange, consider setting tolerance to zero so you get exactly the screw you defined.  You'll need to create your own clearance between mating threads in this case.

<img align="left" alt="screw() Example 8" src="images/screws/screw_8.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    spec = [["system","ISO"],
            ["type","screw_info"],
            ["pitch", 2.3],
            ["head", "flat"],
            ["head_size", 20],
            ["head_size_sharp", 22],
            ["head_angle", 60],
            ["diameter",12],
            ["length",22]];
    screw(spec,tolerance=0);

<br clear="all" /><br/>

---

### Module: screw\_hole()

**Synopsis:** Creates a screw hole. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

**Topics:** [Threading](Topics#threading), [Screws](Topics#screws)

**See Also:** [screw()](#module-screw)

**Usage:** 

- screw_hole([spec], [head], [thread=], [length=|l=], [oversize=], [hole_oversize=], [teardrop=], [head_oversize], [tolerance=], [$slop=], [blunt_start=], [anchor=], [atype=], [orient=], [spin=]) [ATTACHMENTS];

**Description:** 

Create a screw hole mask.  See [screw and nut parameters](#section-screw-and-nut-parameters) for details on the parameters that define a screw.
The screw hole can be threaded to receive a screw or it can be an unthreaded clearance hole.
The tolerance determines the dimensions of the screw
based on ISO and ASME standards.  Screws fabricated at those dimensions will mate properly with standard hardware.
The $slop argument makes the hole larger by 4*$slop to account for printing overextrusion.  It defaults to 0.

You can generate a screw specification from [`screw_info()`](#function-screw_info), possibly create a modified version, and pass that in rather than giving the parameters.

The tolerance should be a nut tolerance for a threaded hole or a clearance hole tolerance for clearance holes.
For clearance holes, the UTS tolerances are "normal", "loose" and "close".  ASME also specifies the same naming for metric clearance holes.
However, ISO gives "fine", "medium" and "coarse" instead.  This function accepts all of these in either system.  It also takes "tight" to be equivalent to "close",
even though no standard suggests it, because it's a natural opposite of "loose".  The official tolerance designations for ISO are "H12" for "fine", "H13" for "medium"
and "H14" for "coarse".  These designations will also work, but only for metric holes.  You can also set tolerance to 0 or "none" to produce holes at the nominal size.

If you want to produce holes for tapping you can use a tolerance of "tap".  This produces a hole of the nominal screw diameter reduced by the thread pitch.  You may still
need to adjust $slop for best results.  Some people screw machine screws directly into plastic without tapping.  This works better with a somewhat larger hole, so
a tolerance of "self tap" produces such a hole.  Note that this tolerance also makes the default bevel2=true to bevel the top, which makes it much easier
to start the screw.  The "self tap" tolerance subtracts `0.72 * pitch` when pitch is below 1mm, `0.6 * pitch` when the pitch is over 1.5mm, and it interpolates between.
It was tested in PLA with a Prusa MK3S and $slop=0.05 and worked on UTS screws from #2 up to 1/2 inch.

The counterbore parameter adds a cylindrical clearance hole above the screw shaft.  For flat heads it extends above the flathead and for other screw types it
replaces the head with a cylinder large enough in diameter for the head to fit.  For a flat head you must specify the length of the counterbore.  For other heads you can
set counterbore to true and it will be sized to match the head height.  The counterbore will extend 0.01 above the TOP of the hole mask to ensure no
problems with differences.  Note that the counterbore defaults to true for non-flathead screws.  If you want the actual head shape to appear, set counterbore to zero.

For 3d printing circular holes can be problematic.  One solution is to use octagonal holes, setting $fn=8.  Another option is to use a teardrop hole, which
can be accomplished by setting `teardrop=true`.  The point of the teardrop will point in the Y direction (BACK) so you will need to ensure that you orient it
correctly in your final model.

Anchoring for screw_hole() is the same as anchoring for [`screw()`](#module-screw), with all the same anchor types and named anchors.  If you specify a counterbore it is treated as
the "head", or in the case of flat heads, it becomes part of the head.  If you make a teardrop hole the point is ignored for purposes of anchoring.

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`spec`               | screw specification, e.g. "M5x1" or "#8-32".  See [screw naming](#subsection-screw-naming).  This can also be a screw specification structure of the form produced by [`screw_info()`](#function-screw_info).
`head`               | head type.  See [screw heads](#subsection-screw-heads)  Default: none

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`thread`             | thread type or specification for threaded masks, true to make a threaded mask with the standard threads, or false to make an unthreaded mask.  See [screw pitch](#subsection-standard-screw-pitch). Default: false
`teardrop`           | If true, adds a teardrop profile to the hole for 3d printability of horizontal holes. If numeric, specifies the proportional extra distance of the teardrop flat top from the screw center, or set to "max" for a pointed teardrop. Default: false
`oversize`           | amount to increase diameter of the screw hole (hole and countersink).  A scalar or length 2 vector.  Default: use computed tolerance
`hole_oversize`      | amount to increase diameter of the hole.  Overrides the use of tolerance and replaces any settings given in the screw specification.
`head_oversize`      | amount to increase diameter of head.  Overrides the user of tolerance and replaces any settings given in the screw specification.
`length`             / `l`                  | length of screw (in mm)
`counterbore`        | set to length of counterbore, or true to make a counterbore equal to head height.  Default: false for flat heads and headless, true otherwise
`tolerance`          | threading or clearance hole tolerance.  For internal threads, detrmines actual thread geometry based on nominal sizing.  See [tolerance](#subsection-tolerance). Default is "2B" for UTS and 6H for ISO.  For clearance holes, determines how much clearance to add.  Default is "normal".
`bevel`              | if true create bevel at both ends of hole.  Default: see below
`bevel1`             | if true create bevel at bottom end of hole.  Default: false
`bevel2`             | if true create bevel at top end of hole.     Default: true when tolerance="self tap", false otherwise
`blunt_start`        | if true and hole is threaded, create blunt start threads.  Default: true
`blunt_start1`       | if true and hole is threaded, create blunt start threads at bottom end.
`blunt_start2`       | if true and hole is threaded, create blunt start threads top end.
`$slop`              | add extra gap to account for printer overextrusion.  Default: 0
`atype`              | anchor type, one of "screw", "head", "shaft", "threads", "shank"
`anchor`             | Translate so anchor point on the shaft is at origin (0,0,0).  See [anchor](attachments.scad#subsection-anchor).  Default: `CENTER`
`spin`               | Rotate this many degrees around the Z axis after anchor.  See [spin](attachments.scad#subsection-spin).  Default: `0`
`orient`             | Vector to rotate top towards, after spin.  See [orient](attachments.scad#subsection-orient).  Default: `UP`

**Side Effects:** 

- `$screw_spec` is set to the spec specification structure.

**Anchor Types:** 

Anchor Type | What it is
----------- | ----------
screw | the entire screw (default)
head | screw head (invalid for headless screws)
shaft | screw shaft
shank | unthreaded section of shaft (invalid if screw is fully threaded)
threads | threaded section of screw

**Named Anchors:** 

Anchor Name | Position
----------- | --------
"top" | top of screw
"bot" | bottom of screw
"center" | center of screw
"head_top" | top of head (invalid for headless screws)
"head_bot" | bottom of head (invalid for headless screws)
"head_center" | center of head (invalid for headless screws)
"shaft_top" | top of shaft
"shaft_bot" | bottom of shaft
"shaft_center" | center of shaft
"shank_top" | top of shank (invalid if screw is fully threaded)
"shank_bot" | bottom of shank (invalid if screw is fully threaded)
"shank_center" | center of shank (invalid if screw is fully threaded)
"threads_top" | top of threaded portion of screw (invalid if thread_len=0)
"threads_bot" | bottom of threaded portion of screw (invalid if thread_len=0)
"threads_center" | center of threaded portion of screw (invalid if thread_len=0)

**Example 1:** Counterbored clearance hole

<img align="left" alt="screw\_hole() Example 1" src="images/screws/screw_hole.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    diff()
      cuboid(20)
        attach(TOP)
          screw_hole("1/4-20,.5",head="socket",counterbore=5,anchor=TOP);

**Example 2:** Clearance hole for flathead

<img align="left" alt="screw\_hole() Example 2" src="images/screws/screw_hole_2.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    diff()
      cuboid(20)
        attach(TOP)
           screw_hole("1/4-20,.5",head="flat",counterbore=0,anchor=TOP);

**Example 3:** Threaded hole, with inward bevel at the base

<img align="left" alt="screw\_hole() Example 3" src="images/screws/screw_hole_3.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    bottom_half()
      diff()
        cuboid(20)
          attach(FRONT)
            screw_hole("M16,15",anchor=TOP,thread=true,bevel1="reverse");

---

### Module: shoulder\_screw()

**Synopsis:** Creates a shoulder screw. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

**Topics:** [Threading](Topics#threading), [Screws](Topics#screws)

**See Also:** [screw()](#module-screw), [screw\_hole()](#module-screw_hole)

**Usage:** 

- shoulder_screw(s, d, length, [head=], [thread_len=], [tolerance=], [head_size=], [drive=], [drive_size=], [thread=], [undersize=], [shaft_undersize=], [head_undersize=], [shoulder_undersize=],[atype=],[anchor=],[orient=],[spin=]) [ATTACHMENTS];

**Description:** 

Create a shoulder screw.  See [screw and nut parameters](#section-screw-and-nut-parameters) for details on the parameters that define a screw.
The tolerance determines the dimensions of the screw
based on ISO and ASME standards.  Screws fabricated at those dimensions will mate properly with standard hardware.
Note that the $slop argument does not affect the size of screws: it only adjusts screw holes.  This will work fine
if you are printing both parts, but if you need to mate printed screws to metal parts you may need to adjust the size
of the screws, which you can do with the undersize arguments.

Unlike a regular screw, a shoulder screw is based on its shoulder dimensions: diameter and length.  The ISO and ASME standards
specify for a given shoulder diameter the thread size and even the length of the threads.  Note that these standards specify only
a small range of sizes.  You can specify a shoulder screw by giving the system, either "ISO" or "UTS" and the shoulder diameter
and length, and shoulder_screw() will supply the other parameters.

Hardware sources like McMaster sell many screws that don't comply with the standards.  If you want to make such a screw then
you can specify parameters like thread_len, the length of the threaded portion below the shoulder, and you can choose a different head
type.  You will need to specify the size of the head, since it cannot be looked up in tables.  You can also
generate a screw specification from [`screw_info()`](#function-screw_info), possibly create a modified version using [`struct_set()`](structs.scad#function-struct_set), and pass that in rather than giving the parameters.

The anchors and anchor types are the same as for [`screw()`](#module-screw) except that there is an anchor type for the shoulder and an additional set of named anchors
refering to parts of the shoulder.

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`s`                  | screw system to use, case insensitive, either "ISO", "UTS", "english" or "metric", or a screw name or specification.  See [screw naming](#subsection-screw-naming).
`d`                  | nominal shoulder diameter in mm for ISO or inches for UTS
`length`             | length of the shoulder (in mm)

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`thread_len`         | length of threads
`tolerance`          | screw tolerance.  Determines actual screw thread geometry based on nominal sizing.  See [tolerance](#subsection-tolerance). Default is "2A" for UTS and "6g" for ISO.
`drive`              | drive type.  See [screw heads](#subsection-screw-heads) set to "none" for no drive.  Default: "hex"
`drive_size`         | size of the drive recess
`thread`             | thread type or specification. See [screw pitch](#subsection-standard-screw-pitch). Default: "coarse"
`spec`               | screw specification to define the thread size
`head_size`          | scalar or vector to give width or [width, height].  If you only give width, height is computed using a formula for socket heads.  For flat head screws the second value in the vector is the sharp size; if you don't give it then the sharp size will be 12% more than the given size

**Side Effects:** 

- `$screw_spec` is set to the spec specification structure.

**Anchor Types:** 

Anchor Type | What it is
----------- | ----------
screw | the entire screw (default)
head | screw head (invalid for headless screws)
shoulder | the shoulder
shaft | screw shaft
threads | threaded section of screw

**Named Anchors:** 

Anchor Name | Position
----------- | --------
"top" | top of screw
"bot" | bottom of screw
"center" | center of screw
"head_top" | top of head (invalid for headless screws)
"head_bot" | bottom of head (invalid for headless screws)
"head_center" | center of head (invalid for headless screws)
"shoulder_top" | top of shoulder
"shoulder_bot" | bottom of shoulder
"shoulder_center" | center of shoulder
"shaft_top" | top of shaft
"shaft_bot" | bottom of shaft
"shaft_center" | center of shaft
"threads_top" | top of threaded portion of screw (invalid if thread_len=0)
"threads_bot" | bottom of threaded portion of screw (invalid if thread_len=0)
"threads_center" | center of threaded portion of screw (invalid if thread_len=0)

**Example 1:** ISO shoulder screw

<img align="left" alt="shoulder\_screw() Example 1" src="images/screws/shoulder_screw.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    shoulder_screw("iso",10,length=20);

<br clear="all" /><br/>

**Example 2:** English shoulder screw

<img align="left" alt="shoulder\_screw() Example 2" src="images/screws/shoulder_screw_2.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    shoulder_screw("english",1/2,length=20);

<br clear="all" /><br/>

**Example 3:** Custom example.  You must specify thread\_len and head\_size when creating custom configurations.

<img align="left" alt="shoulder\_screw() Example 3" src="images/screws/shoulder_screw_3.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    shoulder_screw("M6", 9.3, length=17, thread_len=8, head_size=14);

**Example 4:** Another custom example:

<img align="left" alt="shoulder\_screw() Example 4" src="images/screws/shoulder_screw_4.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    shoulder_screw("M6", 9.3, length=17, thread_len=8, head_size=14, head="button", drive="torx");

**Example 5:** Threadless

<img align="left" alt="shoulder\_screw() Example 5" src="images/screws/shoulder_screw_5.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    shoulder_screw("iso",10,length=15,thread=0);

<br clear="all" /><br/>

**Example 6:** No drive recess

<img align="left" alt="shoulder\_screw() Example 6" src="images/screws/shoulder_screw_6.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    shoulder_screw("iso",10,length=15,drive="none");

<br clear="all" /><br/>

**Example 7:** Headless

<img align="left" alt="shoulder\_screw() Example 7" src="images/screws/shoulder_screw_7.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    shoulder_screw("iso", 16, length=20, head="none");

<br clear="all" /><br/>

**Example 8:** Changing head height

<img align="left" alt="shoulder\_screw() Example 8" src="images/screws/shoulder_screw_8.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    shoulder_screw("iso", 16, length=20, head_size=[24,5]);

<br clear="all" /><br/>

---

### Module: screw\_head()

**Synopsis:** Creates a screw head. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

**Topics:** [Threading](Topics#threading), [Screws](Topics#screws)

**See Also:** [screw()](#module-screw), [screw\_hole()](#module-screw_hole)

**Usage:** 

- screw_head(screw_info, [details],[counterbore],[flat_height],[teardrop],[internal])

**Description:** 

Draws the screw head described by the data structure `screw_info`, which
should have the fields produced by [`screw_info()`](#function-screw_info).  See that function for
details on the fields.  Standard orientation is with the head centered at (0,0)
and oriented in the +z direction.  Flat heads appear below the xy plane.
Other heads appear sitting on the xy plane.

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`screw_info`         | structure produced by [`screw_info()`](#function-screw_info)

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`details`            | true for more detailed model.  Default: false
`counterbore`        | counterbore height.  Default: no counterbore
`flat_height`        | height of flat head (required for flat heads)
`teardrop`           | if true make flatheads and counterbores teardrop shaped with the flat 5% away from the edge of the screw.  If numeric, specify the fraction of extra to add.  Set to "max" for a pointed teardrop.  Default: false
`slop`               | enlarge diameter by this extra amount (beyond that specified in the screw specification).  Default: 0

---

## Section: Nuts and nut traps


### Module: nut()

**Synopsis:** Creates a standard nut. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

**Topics:** [Threading](Topics#threading), [Screws](Topics#screws)

**See Also:** [screw()](#module-screw), [screw\_hole()](#module-screw_hole)

**Usage:** 

- nut([spec], [shape], [thickness], [nutwidth], [thread=], [tolerance=], [hole_oversize=], [bevel=], [$slop=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];

**Description:** 

Generates a hexagonal or square nut.  See [screw and nut parameters](#section-screw-and-nut-parameters) for details on the parameters that define a nut.
As with screws, you can give the specification in `spec` and then omit the name.  The diameter is the flat-to-flat
size of the nut produced.  The thickness can be "thin", "normal" or "thick" to choose standard nut dimensions.  For metric
nuts you can also use thickness values of "DIN" or "undersized".  The nut's shape is hexagonal by default; set shape to "square" for
a square nut.

By default all nuts have the internal holes beveled and hex nuts have their corners beveled.  Square nuts get no outside bevel by default.
ASME specifies that small square nuts should not be beveled, and many square nuts are beveled only on one side.   The bevel angle, specified with bevang,
gives the angle for the bevel.  The default of 15 is shallow and may not be printable.  Internal hole are beveled at 45 deg by the depth of one thread.

The tolerance determines the actual thread sizing based on the nominal size in accordance with standards.
The $slop parameter determines extra gaps left to account for printing overextrusion.  It defaults to 0.

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`spec`               | nut specification, e.g. "M5x1" or "#8-32".  See [screw naming](#subsection-screw-naming).  This can also be a nut or screw specification structure of the form produced by [`nut_info()`](#function-nut_info) or [`screw_info()`](#function-screw_info).
`shape`              | "hex" or "square" to specify nut shape.  Default: "hex"
`thickness`          | "thin", "normal", "thick", or a thickness in mm.  See [nuts](#subsection-nuts).  Default: "normal"

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`nutwidth`           | width of nut (overrides table values)
`thread`             | thread type or specification. See [screw pitch](#subsection-standard-screw-pitch). Default: "coarse"
`hole_oversize`      | amount to increase hole diameter.  Default: 0
`bevel`              | if true, bevel the outside of the nut.  Default: true for hex nuts, false for square nuts
`bevel1`             | if true, bevel the outside of the nut bottom.
`bevel2`             | if true, bevel the outside of the nut top.
`bevang`             | set the angle for the outside nut bevel.  Default: 15
`ibevel`             | if true, bevel the inside (the hole).   Default: true
`ibevel1`            | if true bevel the inside, bottom end.
`ibevel2`            | if true bevel the inside, top end.
`blunt_start`        | If true apply truncated blunt start threads at both ends.  Default: true
`blunt_start1`       | If true apply truncated blunt start threads bottom end.
`blunt_start2`       | If true apply truncated blunt start threads top end.
`tolerance`          | nut tolerance.  Determines actual nut thread geometry based on nominal sizing.  See [tolerance](#subsection-tolerance). Default is "2B" for UTS and "6H" for ISO.
`$slop`              | extra space left to account for printing over-extrusion.  Default: 0
`anchor`             | Translate so anchor point is at origin (0,0,0).  See [anchor](attachments.scad#subsection-anchor).  Default: `CENTER`
`spin`               | Rotate this many degrees around the Z axis after anchor.  See [spin](attachments.scad#subsection-spin).  Default: `0`
`orient`             | Vector to rotate top towards, after spin.  See [orient](attachments.scad#subsection-orient).  Default: `UP`

**Side Effects:** 

- `$screw_spec` is set to the spec specification structure.

**Example 1:** All the UTS nuts at one size.  Note that square nuts come in only one thickness.

<img align="left" alt="nut() Example 1" src="images/screws/nut.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    xdistribute(spacing=0.75*INCH){
        nut("3/8",thickness="thin");
        nut("3/8",thickness="normal");
        nut("3/8",thickness="thick");
        nut("3/8",shape="square");
    }

<br clear="all" /><br/>

**Example 2:** All the ISO (and DIN) nuts at one size.  Note that M10 is one of the four cases where the DIN nut width is larger.

<img align="left" alt="nut() Example 2" src="images/screws/nut_2.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    ydistribute(spacing=30){
       xdistribute(spacing=22){
          nut("M10", thickness="thin");
          nut("M10",thickness="undersized");
          nut("M10",thickness="normal");
          nut("M10",thickness="thick");
       }
       xdistribute(spacing=25){
          nut("M10", shape="square", thickness="thin");
          nut("M10", shape="square", thickness="normal");
       }
    }

<br clear="all" /><br/>

**Example 3:** The three different UTS nut tolerances (thickner than normal nuts)

<img align="left" alt="nut() Example 3" src="images/screws/nut_3.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    module mark(number)
    {
      difference(){
         children();
         ycopies(n=number, spacing=1.5)right(.25*INCH-2)up(8-.35)cyl(d=1, h=1);
      }
    }
    $fn=64;
    xdistribute(spacing=17){
      mark(1) nut("1/4-20", thickness=8, nutwidth=0.5*INCH,tolerance="1B");
      mark(2) nut("1/4-20", thickness=8, nutwidth=0.5*INCH,tolerance="2B");
      mark(3) nut("1/4-20", thickness=8, nutwidth=0.5*INCH,tolerance="3B");
    }

**Example 4:** Threadless nut

<img align="left" alt="nut() Example 4" src="images/screws/nut_4.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    nut("#8", thread="none");

<br clear="all" /><br/>

---

### Module: nut\_trap\_side()

**Synopsis:** Creates a side nut trap mask. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

**Topics:** [Threading](Topics#threading), [Screws](Topics#screws)

**See Also:** [screw()](#module-screw), [screw\_hole()](#module-screw_hole)

**Usage:** 

- nut_trap_side(trap_width, [spec], [shape], [thickness], [nutwidth=], [poke_len=], [poke_diam=], [$slop=], [anchor=], [orient=], [spin=]) [ATTACHMENTS];

**Description:** 

Create a nut trap that extends sideways, so the nut slides in perpendicular to the screw axis.
The CENTER anchor is the center of the screw hole location in the trap.  The trap width is
measured from the screw hole center point.  You can optionally create a poke hole to use for
removing the nut by specifying a poke_len value that determines the length of the poke hole, measured
from the screw center.  The diameter of the poke hole defaults to the thickness of the nut.  The nut dimensions
will be increased by `2*$slop` to allow adjusting the fit of the trap for your printer.
The trap will have a default tag of "remove" if no other tag is in force.

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`trap_width`         | width of nut trap, measured from screw center, must be larger than half the nut width  (If spec is omitted this argument must be given by name.)
`spec`               | nut specification, e.g. "M5" or "#8".  See [screw naming](#subsection-screw-naming).  This can also be a screw or nut specification structure of the form produced by [`nut_info()`](#function-nut_info) or [`screw_info()`](#function-screw_info).
`shape`              | "hex" or "square" to specify the shape of the nut.   Default: "hex"
`thickness`          | "thin", "normal", or "thick".  "DIN" or "undersized" for metric nuts.  See [nuts](#subsection-nuts). Default: "normal"

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`nutwidth`           | width of the nut.  Default: determined from tables
`poke_len`           | length of poke hole.  Default: no poke hole
`poke_diam`          | diameter of poke hole.  Default: nut thickness
`$slop`              | extra space left to account for printing over-extrusion.  Default: 0
`anchor`             | Translate so anchor point is at origin (0,0,0).  See [anchor](attachments.scad#subsection-anchor).  Default: `BOTTOM`
`spin`               | Rotate this many degrees around the Z axis after anchor.  See [spin](attachments.scad#subsection-spin).  Default: `0`
`orient`             | Vector to rotate top towards, after spin.  See [orient](attachments.scad#subsection-orient).  Default: `UP`

**Side Effects:** 

- `$screw_spec` is set to the spec specification structure.

**Example 1:** Basic trap.  Note that screw center is at the origin and the width is measured from the origin.

<img align="left" alt="nut\_trap\_side() Example 1" src="images/screws/nut_trap_side.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    nut_trap_side(10, "#8");

<br clear="all" /><br/>

**Example 2:** Trap with poke hole for removing nut.  The poke hole length is also measured from the screw center at the origin

<img align="left" alt="nut\_trap\_side() Example 2" src="images/screws/nut_trap_side_2.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    $fn=16;
    nut_trap_side(10, "#8", poke_len=10);

<br clear="all" /><br/>

**Example 3:** Trap for square nut

<img align="left" alt="nut\_trap\_side() Example 3" src="images/screws/nut_trap_side_3.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    $fn=16;
    nut_trap_side(10, "#8", shape="square", poke_len=10);

<br clear="all" /><br/>

**Example 4:** Trap with looser fit

<img align="left" alt="nut\_trap\_side() Example 4" src="images/screws/nut_trap_side_4.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    nut_trap_side(10, "#8", $slop=0.1);

<br clear="all" /><br/>

**Example 5:** Trap placed at the bottom of a screw hole

<img align="left" alt="nut\_trap\_side() Example 5" src="images/screws/nut_trap_side_5.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    $fn=24;
    screw_hole("#8,1")
      position(BOT) nut_trap_side(10,poke_len=8);

<br clear="all" /><br/>

**Example 6:** Trap placed at the bottom of a screw hole 2mm extra screw hole below the trap

<img align="left" alt="nut\_trap\_side() Example 6" src="images/screws/nut_trap_side_6.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    $fn=24;
    screw_hole("#8,1")
      up(2) position(BOT) nut_trap_side(trap_width=10,poke_len=8);

<br clear="all" /><br/>

**Example 7:** Hole-trap assembly removed from an object

<img align="left" alt="nut\_trap\_side() Example 7" src="images/screws/nut_trap_side_7.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    $fn=24;
    back_half()
    diff()
    cuboid(30)
       position(TOP)screw_hole("#8,1",anchor=TOP)
         position(BOT) nut_trap_side(trap_width=16);

<br clear="all" /><br/>

**Example 8:** Hole-trap assembly where we position the trap relative to a feature on the model and then position the screw hole through the trap as a child to the trap.

<img align="left" alt="nut\_trap\_side() Example 8" src="images/screws/nut_trap_side_8.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    diff()
     cuboid([30,30,20])
       position(RIGHT)cuboid([4,20,3],anchor=LEFT)
         right(1)position(TOP+LEFT)nut_trap_side(15, "#8",anchor=BOT+RIGHT)
           screw_hole(length=20,anchor=BOT);

---

### Module: nut\_trap\_inline()

**Synopsis:** Creates an inline nut trap mask. <sup title="Can return geometry.">[<abbr>Geom</abbr>]</sup>

**Topics:** [Threading](Topics#threading), [Screws](Topics#screws)

**See Also:** [screw()](#module-screw), [screw\_hole()](#module-screw_hole)

**Usage:** 

- nut_trap_inline(length|l|heigth|h, [spec], [shape], [$slop=], [anchor=], [orient=], [spin=]) [ATTACHMENTS];

**Description:** 

Create a nut trap that extends along the axis of the screw.  The nut width
will be increased by `2*$slop` to allow adjusting the fit of the trap for your printer.
If no tag is present the trap will be tagged with "remove".  Note that you can omit the specification
and it will be inherited from a parent screw_hole to provide the screw size.  It's also possible to
do this backwards, to declare a trap at a screw size and make a child screw hole, which will inherit
the screw dimensions.

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`length`             / `l`                  / `height`             / `h`                  | length/height of nut trap
`spec`               | nut specification, e.g. "M5" or "#8".  See [screw naming](#subsection-screw-naming).  This can also be a screw or nut specification structure of the form produced by [`nut_info()`](#function-nut_info) or [`screw_info()`](#function-screw_info).
`shape`              | "hex" or "square to determine type of nut.  Default: "hex"

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`$slop`              | extra space left to account for printing over-extrusion.  Default: 0
`anchor`             | Translate so anchor point is at origin (0,0,0).  See [anchor](attachments.scad#subsection-anchor).  Default: `TOP`
`spin`               | Rotate this many degrees around the Z axis after anchor.  See [spin](attachments.scad#subsection-spin).  Default: `0`
`orient`             | Vector to rotate top towards, after spin.  See [orient](attachments.scad#subsection-orient).  Default: `UP`

**Side Effects:** 

- `$screw_spec` is set to the spec specification structure.

**Example 1:** Basic trap

<img align="left" alt="nut\_trap\_inline() Example 1" src="images/screws/nut_trap_inline.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    nut_trap_inline(10, "#8");

<br clear="all" /><br/>

**Example 2:** Basic trap with allowance for a looser fit

<img align="left" alt="nut\_trap\_inline() Example 2" src="images/screws/nut_trap_inline_2.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    nut_trap_inline(10, "#8", $slop=.1);

<br clear="all" /><br/>

**Example 3:** Square trap (just a cube, but hopefully just the right size)

<img align="left" alt="nut\_trap\_inline() Example 3" src="images/screws/nut_trap_inline_3.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    nut_trap_inline(10, "#8", shape="square");

<br clear="all" /><br/>

**Example 4:** Attached to a screw hole

<img align="left" alt="nut\_trap\_inline() Example 4" src="images/screws/nut_trap_inline_4.png" width="320" height="240">

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    screw_hole("#8,1",head="socket",counterbore=true, $fn=32)
      position(BOT) nut_trap_inline(10);

<br clear="all" /><br/>

**Example 5:** Nut trap with child screw hole

<img align="left" alt="nut\_trap\_inline() Example 5" src="images/screws/nut_trap_inline_5.png" width="320" height="240">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    nut_trap_inline(10, "#8")
      position(TOP)screw_hole(length=10,anchor=BOT,head="flat",$fn=32);

**Example 6:** a pipe clamp

<img align="left" alt="nut\_trap\_inline() Example 6" src="images/screws/nut_trap_inline_6.png" width="480" height="360">

<br clear="all" />

    include <BOSL2/std.scad>
    include <BOSL2/screws.scad>
    $fa=5;$fs=0.5;
    bardiam = 32;
    bandwidth = 10;
    thickness = 3;
    back_half()
    diff()
      tube(id=bardiam, wall = thickness, h=bandwidth, orient=BACK)
        left(thickness/2) position(RIGHT) cube([bandwidth, bandwidth, 14], anchor = LEFT, orient=FWD)
        {
           screw_hole("#4",length=12, head="socket",counterbore=6,anchor=CENTER)
              position(BOT) nut_trap_inline(l=6,anchor=BOT);
           tag("remove")right(1)position(RIGHT)cube([11+thickness, 11, 2], anchor = RIGHT);
        }

---

## Section: Screw and Nut Information


### Function: screw\_info()

**Synopsis:** Returns the dimensions and other info for the given screw.

**Topics:** [Threading](Topics#threading), [Screws](Topics#screws)

**See Also:** [screw()](#module-screw), [screw\_hole()](#module-screw_hole)

**Usage:** 

- info = screw_info(name, [head], [drive], [thread=], [drive_size=], [oversize=], [head_oversize=])

**Description:** 

Look up screw characteristics for the specified screw type.
See [screw and nut parameters](#section-screw-and-nut-parameters) for details on the parameters that define a screw.

The `oversize=` parameter adds the specified amount to the screw and head diameter to make an
oversized screw.  Does not affect length, thread pitch or head height.

Note that flat head screws are defined by two different diameters, the theoretical maximum diameter, "head_size_sharp"
and the actual diameter, "head_size".  The screw form is defined using the theoretical maximum, which gives
sharp circular edge at the top of the screw.  Real screws have a flat chamfer around the edge.

**Figure 4.1.1:** Flat head screw geometry

<img align="left" alt="screw\_info() Figure 4.1.1" src="images/screws/figure_4_1_1.png" width="480" height="360">

<br clear="all" />


The output is a [struct](structs.scad) with the following fields:

Field              | What it is
------------------ | ---------------
"type"           | Always set to "screw_info"
"system"         | Either `"UTS"` or `"ISO"` (used for correct tolerance computation).
"origin"         | Module that generated the structure
"name"           | Screw name used to make the structure
"diameter"       | The nominal diameter of the screw shaft in mm.
"pitch"          | The thread pitch in mm.  (0 for no threads)
"head"           | The type of head (a string)
"head_size"      | Size of the head (usually diameter) in mm.
"head_size_sharp"| Theoretical head diameter for a flat head screw if it is made with sharp edges (or for countersinks)
"head_angle"     | Countersink angle for flat heads.
"head_height"    | Height of the head beyond the screw's nominal length.  The screw's total length is "length" + "head_height".  For flat heads "head_height" is zero, because they do not extend the screw.
"drive"          | The drive type (`"phillips"`, `"torx"`, `"slot"`, `"hex"`, `"none"`)
"drive_size"     | The drive size, either a drive number (phillips, torx) or a dimension in mm (hex, slot).
"drive_depth"    | Depth of the drive recess.
"length"         | Length of the screw in mm measured in the customary fashion.  For flat head screws the total length and for other screws, the length from the bottom of the head to the screw tip.
"thread_len"     | Length of threaded portion of screw in mm
"shaft_oversize"| Amount to oversize the threads
"head_oversize"   | Amount to oversize the head

If you want to define a custom drive for a screw you will need to provide the drive size and drive depth.

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`name`               | screw specification, e.g. "M5x1" or "#8-32".  See [screw naming](#subsection-screw-naming).
`head`               | head type.  See [screw heads](#subsection-screw-heads)  Default: none
`drive`              | drive type.  See [screw heads](#subsection-screw-heads) Default: none

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`thread`             | thread type or specification. See [screw pitch](#subsection-standard-screw-pitch). Default: "coarse"
`drive_size`         | size of drive recess to override computed value
`shaft_oversize`     | amount to increase screw diameter for clearance holes.  Default: 0
`head_oversize`      | amount to increase head diameter for countersink holes.  Default: 0

---

### Function: nut\_info()

**Synopsis:** Returns the dimensions and other info for the given nut.

**Topics:** [Threading](Topics#threading), [Screws](Topics#screws)

**See Also:** [screw()](#module-screw), [screw\_hole()](#module-screw_hole)

**Usage:** 

- nut_spec = nut_info(name, [shape], [thickness=], [thread=], [width=], [hole_oversize=]);

**Description:** 

Produces a nut specification structure that describes a nut.  You can specify the width
and thickness numerically, or you can let the width be calculated automatically from
the thread specification.  The thickness can be "normal" (the default) or "thin" or "thick".
Note that square nuts are only available in "normal" thickness, and "thin" and "thick" nuts
are only available for 1/4 inch and above.

The output is a [struct](structs.scad) with the following fields:

Field              | What it is
------------------ | ---------------
"type"           | Always set to "nut_info"
"system"         | Either `"UTS"` or `"ISO"` (used for correct tolerance computation).
"origin"         | Module that created the structure
"name"           | Name used to specify threading, such as "M6" or "#8"
"diameter"       | The nominal diameter of the screw hole in mm.
"pitch"          | The thread pitch in mm.  (0 for no threads)
"shape"          | Shape of the nut, either "hex" or "square"
"width"          | Flat to flat width of the nut
"thickness"      | Thickness of the nut
"shaft_oversize" | amount to oversize the threads (not including $slop)

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`name`               | screw name, e.g. "M5x1" or "#8-32".  See [screw naming](#subsection-screw-naming).
`shape`              | shape of the nut, either "hex" or "square".  Default: "hex"

<abbr title="These args must be used by name, ie: name=value">By&nbsp;Name</abbr> | What it does
-------------------- | ------------
`thread`             | thread type or specification. See [screw pitch](#subsection-standard-screw-pitch). Default: "coarse"
`thickness`          | thickness of the nut (in mm) or one of "thin", "normal", or "thick".  Default: "normal"
`width`              | width of nut in mm.  Default: computed from thread specification
`hole_oversize`      | amount ot increase diameter of hole in nut.  Default: 0

---

### Function: thread\_specification()

**Synopsis:** Returns the thread geometry for a given screw.

**Topics:** [Threading](Topics#threading), [Screws](Topics#screws)

**See Also:** [screw()](#module-screw), [screw\_hole()](#module-screw_hole)

**Usage:** 

- thread_specification(screw_spec, [tolerance], [internal])

**Description:** 

Determines actual thread geometry for a given screw with specified tolerance and nominal size.  See [tolerance](#subsection-tolerance) for
information on tolerances.  If tolerance is omitted the default is used.  If tolerance
is "none" or 0 then return the nominal thread geometry.  When `internal=true` the nut tolerance is used.

The return value is a structure with the following fields:
- pitch: the thread pitch
- d_major: major diameter range
- d_pitch: pitch diameter range
- d_minor: minor diameter range
- basic: vector `[minor, pitch, major]` of the nominal or "basic" diameters for the threads

**Arguments:** 

<abbr title="These args can be used by position or by name.">By&nbsp;Position</abbr> | What it does
-------------------- | ------------
`screw_spec`         | screw specification structure
`tolerance`          | thread geometry tolerance.  Default: For ISO, "6g" for screws, "6H" for internal threading (nuts).  For UTS, "2A" for screws, "2B" for internal threading (nuts).
`internal`           | true for internal threads.  Default: false

---


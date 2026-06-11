# The Belfry OpenScad Library, v2. (BOSL2) Cheat Sheet

## LibFile: constants.scad

### Section: General Constants

Constants: [`$slop`](constants.scad#constant-slop) [`INCH`](constants.scad#constant-inch) [`IDENT`](constants.scad#constant-ident)
><code>slop = [get\_slop](constants.scad#function-get_slop)();</code>  


### Section: Directional Vectors

Constants: [`LEFT`](constants.scad#constant-left) [`RIGHT`](constants.scad#constant-right) [`FRONT`](constants.scad#constant-front) [`FWD`](constants.scad#constant-front) [`FORWARD`](constants.scad#constant-front) [`BACK`](constants.scad#constant-back) [`BOTTOM`](constants.scad#constant-bottom) [`BOT`](constants.scad#constant-bottom) [`DOWN`](constants.scad#constant-bottom) [`TOP`](constants.scad#constant-top) [`UP`](constants.scad#constant-top) [`CENTER`](constants.scad#constant-center) [`CTR`](constants.scad#constant-center) [`CENTRE`](constants.scad#constant-center)
><code>[EDGE](constants.scad#function-edge)(i)</code>  &nbsp; &nbsp; <code>[EDGE](constants.scad#function-edge)(direction,i)</code>  

><code>[FACE](constants.scad#function-face)(i)</code>  


### Section: Line specifiers

Constants: [`SEGMENT`](constants.scad#constant-segment) [`RAY`](constants.scad#constant-ray) [`LINE`](constants.scad#constant-line)

## LibFile: transforms.scad

### Section: Translations

><code>[move](transforms.scad#functionmodule-move)(v) CHILDREN;</code>  &nbsp; &nbsp; <code>pts = [move](transforms.scad#functionmodule-move)(v, p);</code>  &nbsp; &nbsp; <code>pts = [move](transforms.scad#functionmodule-move)(STRING, p);</code>  &nbsp; &nbsp; <code>mat = [move](transforms.scad#functionmodule-move)(v);</code>  

><code>[left](transforms.scad#functionmodule-left)(x) CHILDREN;</code>  &nbsp; &nbsp; <code>pts = [left](transforms.scad#functionmodule-left)(x, p);</code>  &nbsp; &nbsp; <code>mat = [left](transforms.scad#functionmodule-left)(x);</code>  

><code>[right](transforms.scad#functionmodule-right)(x) CHILDREN;</code>  &nbsp; &nbsp; <code>pts = [right](transforms.scad#functionmodule-right)(x, p);</code>  &nbsp; &nbsp; <code>mat = [right](transforms.scad#functionmodule-right)(x);</code>  

><code>[fwd](transforms.scad#functionmodule-fwd)(y) CHILDREN;</code>  &nbsp; &nbsp; <code>pts = [fwd](transforms.scad#functionmodule-fwd)(y, p);</code>  &nbsp; &nbsp; <code>mat = [fwd](transforms.scad#functionmodule-fwd)(y);</code>  

><code>[back](transforms.scad#functionmodule-back)(y) CHILDREN;</code>  &nbsp; &nbsp; <code>pts = [back](transforms.scad#functionmodule-back)(y, p);</code>  &nbsp; &nbsp; <code>mat = [back](transforms.scad#functionmodule-back)(y);</code>  

><code>[down](transforms.scad#functionmodule-down)(z) CHILDREN;</code>  &nbsp; &nbsp; <code>pts = [down](transforms.scad#functionmodule-down)(z, p);</code>  &nbsp; &nbsp; <code>mat = [down](transforms.scad#functionmodule-down)(z);</code>  

><code>[up](transforms.scad#functionmodule-up)(z) CHILDREN;</code>  &nbsp; &nbsp; <code>pts = [up](transforms.scad#functionmodule-up)(z, p);</code>  &nbsp; &nbsp; <code>mat = [up](transforms.scad#functionmodule-up)(z);</code>  


### Section: Rotations

><code>[rot](transforms.scad#functionmodule-rot)(a, [cp=], [reverse=]) CHILDREN;</code>  
><code>[rot](transforms.scad#functionmodule-rot)([X,Y,Z], [cp=], [reverse=]) CHILDREN;</code>  &nbsp; &nbsp; <code>[rot](transforms.scad#functionmodule-rot)(a, v, [cp=], [reverse=]) CHILDREN;</code>  
><code>[rot](transforms.scad#functionmodule-rot)(from=, to=, [a=], [reverse=]) CHILDREN;</code>  &nbsp; &nbsp; <code>pts = [rot](transforms.scad#functionmodule-rot)(a, p=, [cp=], [reverse=]);</code>  
><code>pts = [rot](transforms.scad#functionmodule-rot)([X,Y,Z], p=, [cp=], [reverse=]);</code>  
><code>pts = [rot](transforms.scad#functionmodule-rot)(a, v, p=, [cp=], [reverse=]);</code>  
><code>pts = [rot](transforms.scad#functionmodule-rot)([a], from=, to=, p=, [reverse=]);</code>  &nbsp; &nbsp; <code>M = [rot](transforms.scad#functionmodule-rot)(a, [cp=], [reverse=]);</code>  
><code>M = [rot](transforms.scad#functionmodule-rot)([X,Y,Z], [cp=], [reverse=]);</code>  &nbsp; &nbsp; <code>M = [rot](transforms.scad#functionmodule-rot)(a, v, [cp=], [reverse=]);</code>  
><code>M = [rot](transforms.scad#functionmodule-rot)(from=, to=, [a=], [reverse=]);</code>  

><code>[xrot](transforms.scad#functionmodule-xrot)(a, [cp=]) CHILDREN;</code>  &nbsp; &nbsp; <code>rotated = [xrot](transforms.scad#functionmodule-xrot)(a, p, [cp=]);</code>  &nbsp; &nbsp; <code>mat = [xrot](transforms.scad#functionmodule-xrot)(a, [cp=]);</code>  

><code>[yrot](transforms.scad#functionmodule-yrot)(a, [cp=]) CHILDREN;</code>  &nbsp; &nbsp; <code>rotated = [yrot](transforms.scad#functionmodule-yrot)(a, p, [cp=]);</code>  &nbsp; &nbsp; <code>mat = [yrot](transforms.scad#functionmodule-yrot)(a, [cp=]);</code>  

><code>[zrot](transforms.scad#functionmodule-zrot)(a, [cp=]) CHILDREN;</code>  &nbsp; &nbsp; <code>rotated = [zrot](transforms.scad#functionmodule-zrot)(a, p, [cp=]);</code>  &nbsp; &nbsp; <code>mat = [zrot](transforms.scad#functionmodule-zrot)(a, [cp=]);</code>  

><code>[tilt](transforms.scad#functionmodule-tilt)(to, [reverse=], [cp=]) CHILDREN;</code>  &nbsp; &nbsp; <code>pts = [tilt](transforms.scad#functionmodule-tilt)(to, p, [reverse=], [cp=]);</code>  
><code>M = [tilt](transforms.scad#functionmodule-tilt)(to, [reverse=], [cp=]);</code>  


### Section: Scaling

><code>[scale](transforms.scad#functionmodule-scale)(SCALAR) CHILDREN;</code>  &nbsp; &nbsp; <code>[scale](transforms.scad#functionmodule-scale)([X,Y,Z]) CHILDREN;</code>  &nbsp; &nbsp; <code>[scale](transforms.scad#functionmodule-scale)(v, cp=) CHILDREN;</code>  
><code>[scale](transforms.scad#functionmodule-scale)(v, dir=, [cp=]) CHILDREN;</code>  &nbsp; &nbsp; <code>pts = [scale](transforms.scad#functionmodule-scale)(v, p, [cp=], [dir=]);</code>  
><code>mat = [scale](transforms.scad#functionmodule-scale)(v, [cp=], [dir=]);</code>  

><code>[xscale](transforms.scad#functionmodule-xscale)(x, [cp=]) CHILDREN;</code>  &nbsp; &nbsp; <code>scaled = [xscale](transforms.scad#functionmodule-xscale)(x, p, [cp=]);</code>  &nbsp; &nbsp; <code>mat = [xscale](transforms.scad#functionmodule-xscale)(x, [cp=]);</code>  

><code>[yscale](transforms.scad#functionmodule-yscale)(y, [cp=]) CHILDREN;</code>  &nbsp; &nbsp; <code>scaled = [yscale](transforms.scad#functionmodule-yscale)(y, p, [cp=]);</code>  &nbsp; &nbsp; <code>mat = [yscale](transforms.scad#functionmodule-yscale)(y, [cp=]);</code>  

><code>[zscale](transforms.scad#functionmodule-zscale)(z, [cp=]) CHILDREN;</code>  &nbsp; &nbsp; <code>scaled = [zscale](transforms.scad#functionmodule-zscale)(z, p, [cp=]);</code>  &nbsp; &nbsp; <code>mat = [zscale](transforms.scad#functionmodule-zscale)(z, [cp=]);</code>  


### Section: Reflection (Mirroring)

><code>[mirror](transforms.scad#functionmodule-mirror)(v) CHILDREN;</code>  &nbsp; &nbsp; <code>pt = [mirror](transforms.scad#functionmodule-mirror)(v, p);</code>  &nbsp; &nbsp; <code>mat = [mirror](transforms.scad#functionmodule-mirror)(v);</code>  

><code>[xflip](transforms.scad#functionmodule-xflip)([x=]) CHILDREN;</code>  &nbsp; &nbsp; <code>pt = [xflip](transforms.scad#functionmodule-xflip)(p, [x]);</code>  &nbsp; &nbsp; <code>mat = [xflip](transforms.scad#functionmodule-xflip)([x=]);</code>  

><code>[yflip](transforms.scad#functionmodule-yflip)([y=]) CHILDREN;</code>  &nbsp; &nbsp; <code>pt = [yflip](transforms.scad#functionmodule-yflip)(p, [y]);</code>  &nbsp; &nbsp; <code>mat = [yflip](transforms.scad#functionmodule-yflip)([y=]);</code>  

><code>[zflip](transforms.scad#functionmodule-zflip)([z=]) CHILDREN;</code>  &nbsp; &nbsp; <code>pt = [zflip](transforms.scad#functionmodule-zflip)(p, [z]);</code>  &nbsp; &nbsp; <code>mat = [zflip](transforms.scad#functionmodule-zflip)([z=]);</code>  


### Section: Other Transformations

><code>[frame\_map](transforms.scad#functionmodule-frame_map)(v1, v2, v3, [reverse=]) CHILDREN;</code>  
><code>transformed = [frame\_map](transforms.scad#functionmodule-frame_map)(v1, v2, v3, p=points, [reverse=]);</code>  
><code>map = [frame\_map](transforms.scad#functionmodule-frame_map)(v1, v2, v3, [reverse=]);</code>  
><code>map = [frame\_map](transforms.scad#functionmodule-frame_map)(x=VECTOR1, y=VECTOR2, [reverse=]);</code>  
><code>map = [frame\_map](transforms.scad#functionmodule-frame_map)(x=VECTOR1, z=VECTOR2, [reverse=]);</code>  
><code>map = [frame\_map](transforms.scad#functionmodule-frame_map)(y=VECTOR1, z=VECTOR2, [reverse=]);</code>  

><code>[skew](transforms.scad#functionmodule-skew)([sxy=]|[axy=], [sxz=]|[axz=], [syx=]|[ayx=], [syz=]|[ayz=], [szx=]|[azx=], [szy=]|[azy=]) CHILDREN;</code>  
><code>pts = [skew](transforms.scad#functionmodule-skew)(p, [sxy=]|[axy=], [sxz=]|[axz=], [syx=]|[ayx=], [syz=]|[ayz=], [szx=]|[azx=], [szy=]|[azy=]);</code>  
><code>mat = [skew](transforms.scad#functionmodule-skew)([sxy=]|[axy=], [sxz=]|[axz=], [syx=]|[ayx=], [syz=]|[ayz=], [szx=]|[azx=], [szy=]|[azy=]);</code>  


### Section: Applying transformation matrices to data

><code>pts = [apply](transforms.scad#function-apply)(transform, points);</code>  


## LibFile: attachments.scad

### Section: Attachment Positioning

><code>PARENT() [position](attachments.scad#module-position)(at) CHILDREN;</code>  

><code>PARENT() [orient](attachments.scad#module-orient)(anchor, [spin]) CHILDREN;</code>  

><code>PARENT() [align](attachments.scad#module-align)(anchor, [[align](attachments.scad#module-align)], [inside=], [inset=], [shiftout=], [overlap=]) CHILDREN;</code>  

><code>PARENT() [attach](attachments.scad#module-attach)(parent, child, [align=], [spin=], [overlap=], [inside=], [inset=], [shiftout=]) CHILDREN;</code>  
><code>PARENT() [attach](attachments.scad#module-attach)(parent, [overlap=], [spin=]) CHILDREN;</code>  

><code>PARENT() [attach\_part](attachments.scad#module-attach_part)(name, [ind]) CHILDREN;</code>  


### Section: Tagging

><code>PARENT() [tag](attachments.scad#module-tag)([tag](attachments.scad#module-tag)) CHILDREN;</code>  

><code>PARENT() tag(tag) CHILDREN;</code>  

><code>PARENT() [force\_tag](attachments.scad#module-force_tag)([tag]) CHILDREN;</code>  

><code>PARENT() [default\_tag](attachments.scad#module-default_tag)(tag, [do\_tag]) CHILDREN;</code>  

><code>[tag\_scope](attachments.scad#module-tag_scope)([scope]) CHILDREN;</code>  


### Section: Tagged Operations with Attachable Objects

><code>[diff](attachments.scad#module-diff)([remove], [keep]) PARENT() CHILDREN;</code>  

><code>[tag\_diff](attachments.scad#module-tag_diff)([tag], [remove], [keep]) PARENT() CHILDREN;</code>  

><code>[intersect](attachments.scad#module-intersect)([[intersect](attachments.scad#module-intersect)], [keep]) PARENT() CHILDREN;</code>  

><code>[tag\_intersect](attachments.scad#module-tag_intersect)([tag], [intersect], [keep]) PARENT() CHILDREN;</code>  

><code>[conv\_hull](attachments.scad#module-conv_hull)([keep]) CHILDREN;</code>  

><code>[tag\_conv\_hull](attachments.scad#module-tag_conv_hull)([tag], [keep]) CHILDREN;</code>  

><code>[hide](attachments.scad#module-hide)(tags) CHILDREN;</code>  

><code>[hide\_this](attachments.scad#module-hide_this)() CHILDREN;</code>  

><code>[show\_only](attachments.scad#module-show_only)(tags) CHILDREN;</code>  

><code>[show\_int](attachments.scad#module-show_int)(tags) CHILDREN;</code>  


### Section: Making your objects attachable

><code>[attachable](attachments.scad#module-attachable)(anchor, spin, two\_d=true, size=, [size2=], [shift=], [override=], ...) {OBJECT; children();}</code>  
><code>[attachable](attachments.scad#module-attachable)(anchor, spin, two\_d=true, r=|d=, ...) {OBJECT; children();}</code>  
><code>[attachable](attachments.scad#module-attachable)(anchor, spin, two\_d=true, path=, [extent=], ...) {OBJECT; children();}</code>  
><code>[attachable](attachments.scad#module-attachable)(anchor, spin, two\_d=true, region=, [extent=], ...) {OBJECT; children();}</code>  
><code>[attachable](attachments.scad#module-attachable)(anchor, spin, [orient], size=, [size2=], [shift=], [override=],  ...) {OBJECT; children();}</code>  
><code>[attachable](attachments.scad#module-attachable)(anchor, spin, [orient], r=|d=, l=, [axis=], ...) {OBJECT; children();}</code>  
><code>[attachable](attachments.scad#module-attachable)(anchor, spin, [orient], r1=|d1=, r2=|d2=, l=, [axis=], ...) {OBJECT; children();}</code>  
><code>[attachable](attachments.scad#module-attachable)(anchor, spin, [orient], r=|d=, ...) {OBJECT; children();}</code>  
><code>[attachable](attachments.scad#module-attachable)(anchor, spin, path=, l=|h=, [extent=], ...) {OBJECT; children();}</code>  
><code>[attachable](attachments.scad#module-attachable)(anchor, spin, region=, l=|h=, [extent=], ...) {OBJECT; children();}</code>  
><code>[attachable](attachments.scad#module-attachable)(anchor, spin, [orient], vnf=, [extent=], ...) {OBJECT; children();}</code>  
><code>[attachable](attachments.scad#module-attachable)(anchor, spin, [orient], geom=) {OBJECT; children();}</code>  

><code>mat = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], two\_d=true, size=, [size2=], [shift=], ...);</code>  
><code>pts = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], two\_d=true, size=, [size2=], [shift=], p=, ...);</code>  
><code>mat = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], two\_d=true, r=|d=, ...);</code>  
><code>pts = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], two\_d=true, r=|d=, p=, ...);</code>  
><code>mat = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], two\_d=true, path=, [extent=], ...);</code>  
><code>pts = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], two\_d=true, path=, [extent=], p=, ...);</code>  
><code>mat = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], two\_d=true, region=, [extent=], ...);</code>  
><code>pts = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], two\_d=true, region=, [extent=], p=, ...);</code>  
><code>mat = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], size=, [size2=], [shift=], ...);</code>  
><code>vnf = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], size=, [size2=], [shift=], p=, ...);</code>  
><code>mat = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], r=|d=, l=, [axis=], ...);</code>  
><code>vnf = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], r=|d=, l=, [axis=], p=, ...);</code>  
><code>mat = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], r1=|d1=, r2=|d2=, l=, [axis=], ...);</code>  
><code>vnf = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], r1=|d1=, r2=|d2=, l=, [axis=], p=, ...);</code>  
><code>mat = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], r|d=, ...);</code>  
><code>vnf = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], r|d=, p=, ...);</code>  
><code>mat = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], path=, l=|h=, [extent=], ...);</code>  
><code>vnf = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], path=, l=|h=, [extent=], p=, ...);</code>  
><code>mat = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], region=, l=|h=, [extent=], ...);</code>  
><code>vnf = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], region=, l=|h=, [extent=], p=, ...);</code>  
><code>mat = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], vnf, [extent], ...);</code>  
><code>vnf = [reorient](attachments.scad#function-reorient)(anchor, spin, [orient], vnf, [extent], p=, ...);</code>  

><code>a = [named\_anchor](attachments.scad#function-named_anchor)(name, pos, [orient], [spin]);</code>  
><code>a = [named\_anchor](attachments.scad#function-named_anchor)(name, [pos], rot=, [flip=]);</code>  

><code>[change\_anchors](attachments.scad#module-change_anchors)([named],[alias=],[remove=]) PARENT() CHILDREN;</code>  

><code>geom = [attach\_geom](attachments.scad#function-attach_geom)(...);</code>  
><code>geom = [attach\_geom](attachments.scad#function-attach_geom)(two\_d=true, size=, [size2=], [shift=], ...);</code>  
><code>geom = [attach\_geom](attachments.scad#function-attach_geom)(two\_d=true, r=|d=, ...);</code>  
><code>geom = [attach\_geom](attachments.scad#function-attach_geom)(two\_d=true, region=, [extent=], ...);</code>  
><code>geom = [attach\_geom](attachments.scad#function-attach_geom)(size=, [size2=], [shift=], ...);</code>  
><code>geom = [attach\_geom](attachments.scad#function-attach_geom)(r=|d=, l=|h=, [axis=], ...);</code>  
><code>geom = [attach\_geom](attachments.scad#function-attach_geom)(r1|d1=, r2=|d2=, l=, [axis=], ...);</code>  
><code>geom = [attach\_geom](attachments.scad#function-attach_geom)(r=|d=, ...);</code>  
><code>geom = [attach\_geom](attachments.scad#function-attach_geom)(region=, l=|h=, [extent=], [shift=], [scale=], [twist=], ...);</code>  
><code>geom = [attach\_geom](attachments.scad#function-attach_geom)(vnf=, [extent=], ...);</code>  

><code>part = [define\_part](attachments.scad#function-define_part)(name, geom, [inside=], [T=]);</code>  


### Section: Visualizing Anchors

><code>PARENT() [show\_anchors](attachments.scad#module-show_anchors)([s], [std=], [custom=]);</code>  

><code>[anchor\_arrow](attachments.scad#module-anchor_arrow)([s], [color], [flag], [anchor=], [orient=], [spin=]) [ATTACHMENTS];</code>  

><code>[anchor\_arrow2d](attachments.scad#module-anchor_arrow2d)([s], [color]);</code>  

><code>[expose\_anchors](attachments.scad#module-expose_anchors)(opacity) {child1() show\_anchors(); child2() show\_anchors(); ...}</code>  

><code>[show\_transform\_list](attachments.scad#module-show_transform_list)(tlist, [s]);</code>  &nbsp; &nbsp; <code>[show\_transform\_list](attachments.scad#module-show_transform_list)(tlist) CHILDREN;</code>  

><code>[generic\_airplane](attachments.scad#module-generic_airplane)([s]);</code>  

><code>[frame\_ref](attachments.scad#module-frame_ref)(s, opacity);</code>  


### Section: Attachable Descriptions for Operating on Attachables or Restoring a Previous State

><code>PARENT() let( desc = [parent](attachments.scad#function-parent)() ) CHILDREN;</code>  &nbsp; &nbsp; <code>PARENT() { desc=[parent](attachments.scad#function-parent)(); CHILDREN; }</code>  

><code>PARENT() let( desc = [parent\_part](attachments.scad#function-parent_part)(name, [ind]) ) CHILDREN;</code>  
><code>PARENT() { desc=[parent\_part](attachments.scad#function-parent_part)(name, [ind]); CHILDREN; }</code>  

><code>[restore](attachments.scad#module-restore)([desc]) CHILDREN;</code>  

><code>point = [desc\_point](attachments.scad#function-desc_point)(desc,[p],[anchor]);</code>  

><code>dir = desc\_anchor(desc,[dir], [anchor]);</code>  

><code>dist = [desc\_dist](attachments.scad#function-desc_dist)(desc1,anchor1,desc2,anchor2);</code>  
><code>dest = [desc\_dist](attachments.scad#function-desc_dist)(desc1=, desc2=, [anchor1=], [anchor2=]);</code>  

><code>new\_desc = [transform\_desc](attachments.scad#function-transform_desc)(T, desc);</code>  

><code>[desc\_copies](attachments.scad#module-desc_copies)(transforms) CHILDREN;</code>  

><code>bool = [is\_description](attachments.scad#function-is_description)(desc);</code>  


## LibFile: shapes2d.scad

### Section: 2D Primitives

><code>[square](shapes2d.scad#functionmodule-square)(size, [center], ...);</code>  
><code>[square](shapes2d.scad#functionmodule-square)(size, [center], ...) [ATTACHMENTS];</code>  &nbsp; &nbsp; <code>path = [square](shapes2d.scad#functionmodule-square)(size, [center], ...);</code>  

><code>[rect](shapes2d.scad#functionmodule-rect)(size, [rounding], [chamfer], ...) [ATTACHMENTS];</code>  
><code>path = [rect](shapes2d.scad#functionmodule-rect)(size, [rounding], [chamfer], ...);</code>  

><code>[circle](shapes2d.scad#functionmodule-circle)(r|d=, ...) [ATTACHMENTS];</code>  &nbsp; &nbsp; <code>[circle](shapes2d.scad#functionmodule-circle)(points=) [ATTACHMENTS];</code>  
><code>[circle](shapes2d.scad#functionmodule-circle)(r|d=, corner=) [ATTACHMENTS];</code>  &nbsp; &nbsp; <code>path = [circle](shapes2d.scad#functionmodule-circle)(r|d=, ...);</code>  
><code>path = [circle](shapes2d.scad#functionmodule-circle)(points=);</code>  &nbsp; &nbsp; <code>path = [circle](shapes2d.scad#functionmodule-circle)(r|d=, corner=);</code>  

><code>[ellipse](shapes2d.scad#functionmodule-ellipse)(r|d=, [realign=], [circum=], [uniform=], ...) [ATTACHMENTS];</code>  
><code>path = [ellipse](shapes2d.scad#functionmodule-ellipse)(r|d=, [realign=], [circum=], [uniform=], ...);</code>  


### Section: Polygons

><code>[regular\_ngon](shapes2d.scad#functionmodule-regular_ngon)(n, r|d=|or=|od=, [realign=]) [ATTACHMENTS];</code>  
><code>[regular\_ngon](shapes2d.scad#functionmodule-regular_ngon)(n, ir=|id=, [realign=]) [ATTACHMENTS];</code>  
><code>[regular\_ngon](shapes2d.scad#functionmodule-regular_ngon)(n, side=, [realign=]) [ATTACHMENTS];</code>  

><code>[pentagon](shapes2d.scad#functionmodule-pentagon)(or|od=, [realign=], [align\_tip=|align\_side=]) [ATTACHMENTS];</code>  
><code>[pentagon](shapes2d.scad#functionmodule-pentagon)(ir=|id=, [realign=], [align\_tip=|align\_side=]) [ATTACHMENTS];</code>  
><code>[pentagon](shapes2d.scad#functionmodule-pentagon)(side=, [realign=], [align\_tip=|align\_side=]) [ATTACHMENTS];</code>  
><code>path = [pentagon](shapes2d.scad#functionmodule-pentagon)(...);</code>  

><code>[hexagon](shapes2d.scad#functionmodule-hexagon)(r/or, [realign=], &lt;align\_tip=|align\_side=&gt;, [rounding=], ...) [ATTACHMENTS];</code>  
><code>[hexagon](shapes2d.scad#functionmodule-hexagon)(d=/od=, ...) [ATTACHMENTS];</code>  &nbsp; &nbsp; <code>[hexagon](shapes2d.scad#functionmodule-hexagon)(ir=/id=, ...) [ATTACHMENTS];</code>  
><code>[hexagon](shapes2d.scad#functionmodule-hexagon)(side=, ...) [ATTACHMENTS];</code>  &nbsp; &nbsp; <code>path = [hexagon](shapes2d.scad#functionmodule-hexagon)(...);</code>  

><code>[octagon](shapes2d.scad#functionmodule-octagon)(r/or, [realign=], [align\_tip=|align\_side=], [rounding=], ...) [ATTACHMENTS];</code>  
><code>[octagon](shapes2d.scad#functionmodule-octagon)(d=/od=, ...) [ATTACHMENTS];</code>  &nbsp; &nbsp; <code>[octagon](shapes2d.scad#functionmodule-octagon)(ir=/id=, ...) [ATTACHMENTS];</code>  
><code>[octagon](shapes2d.scad#functionmodule-octagon)(side=, ...) [ATTACHMENTS];</code>  &nbsp; &nbsp; <code>path = [octagon](shapes2d.scad#functionmodule-octagon)(...);</code>  

><code>[right\_triangle](shapes2d.scad#functionmodule-right_triangle)(size, [center], ...) [ATTACHMENTS];</code>  
><code>path = [right\_triangle](shapes2d.scad#functionmodule-right_triangle)(size, [center], ...);</code>  

><code>[trapezoid](shapes2d.scad#functionmodule-trapezoid)(h, w1, w2, [shift=], [rounding=], [chamfer=], [flip=], ...) [ATTACHMENTS];</code>  
><code>[trapezoid](shapes2d.scad#functionmodule-trapezoid)(h, w1, ang=, [rounding=], [chamfer=], [flip=], ...) [ATTACHMENTS];</code>  
><code>[trapezoid](shapes2d.scad#functionmodule-trapezoid)(h, w2=, ang=, [rounding=], [chamfer=], [flip=], ...) [ATTACHMENTS];</code>  
><code>[trapezoid](shapes2d.scad#functionmodule-trapezoid)(w1=, w2=, ang=, [rounding=], [chamfer=], [flip=], ...) [ATTACHMENTS];</code>  
><code>path = [trapezoid](shapes2d.scad#functionmodule-trapezoid)(...);</code>  

><code>[star](shapes2d.scad#functionmodule-star)(n, r/or, ir, [realign=], [align\_tip=], [align\_pit=], ...) [ATTACHMENTS];</code>  
><code>[star](shapes2d.scad#functionmodule-star)(n, r/or, step=, ...) [ATTACHMENTS];</code>  
><code>path = [star](shapes2d.scad#functionmodule-star)(n, r/or, ir, [realign=], [align\_tip=], [align\_pit=], ...);</code>  
><code>path = [star](shapes2d.scad#functionmodule-star)(n, r/or, step=, ...);</code>  

><code>[jittered\_poly](shapes2d.scad#module-jittered_poly)(path, [dist]);</code>  


### Section: Curved 2D Shapes

><code>[teardrop2d](shapes2d.scad#functionmodule-teardrop2d)(r/d=, [ang], [cap\_h], [circum=], [realign=], [bot\_corner=]) [ATTACHMENTS];</code>  
><code>path = [teardrop2d](shapes2d.scad#functionmodule-teardrop2d)(r|d=, [ang], [cap\_h], [circum=], [realign=], [bot\_corner=]);</code>  

><code>[egg](shapes2d.scad#functionmodule-egg)(length, r1|d1=, r2|d2=, R|D=) [ATTACHMENTS];</code>  
><code>path = [egg](shapes2d.scad#functionmodule-egg)(length, r1|d1=, r2|d2=, R|D=);</code>  

><code>region=[ring](shapes2d.scad#functionmodule-ring)(n, r1=|d1=, r2=|d2=, [full=], [angle=], [start=]);</code>  
><code>region=[ring](shapes2d.scad#functionmodule-ring)(n, [ring](shapes2d.scad#functionmodule-ring)\_width, r=|d=, [full=], [angle=], [start=]);</code>  
><code>region=[ring](shapes2d.scad#functionmodule-ring)(n, [[ring](shapes2d.scad#functionmodule-ring)\_width], [r=,d=], points=[P0,P1,P2], [full=]);</code>  
><code>region=[ring](shapes2d.scad#functionmodule-ring)(n, corner=[P0,P1,P2], r1=|d1=, r2=|d2=, [full=]);</code>  
><code>region=[ring](shapes2d.scad#functionmodule-ring)(n, [[ring](shapes2d.scad#functionmodule-ring)\_width], [r=|d=], width=, thickness=, [full=]);</code>  
><code>[ring](shapes2d.scad#functionmodule-ring)(...) [ATTACHMENTS];</code>  

><code>[glued\_circles](shapes2d.scad#functionmodule-glued_circles)(r/d=, [spread], [r1=/d1=], [r2=/d2=], [tangent=], [bulge=], [width=], [blendR=/blendD=], anchor=, spin=) [ATTACHMENTS];</code>  
><code>path = [glued\_circles](shapes2d.scad#functionmodule-glued_circles)(r/d=, [spread], [r1=/d1=], [r2=/d2=], [tangent=], [bulge=], [width=], [blendR=/blendD=], anchor=, spin=) [ATTACHMENTS];</code>  

><code>[squircle](shapes2d.scad#functionmodule-squircle)(size, [squareness], [style=]) [ATTACHMENTS];</code>  
><code>path = [squircle](shapes2d.scad#functionmodule-squircle)(size, [squareness], [style=]);</code>  

><code>[keyhole](shapes2d.scad#functionmodule-keyhole)(l/length=, r1/d1=, r2/d2=, [shoulder\_r=], ...) [ATTACHMENTS];</code>  
><code>path = [keyhole](shapes2d.scad#functionmodule-keyhole)(l/length=, r1/d1=, r2/d2=, [shoulder\_r=], ...);</code>  

><code>[reuleaux\_polygon](shapes2d.scad#functionmodule-reuleaux_polygon)(n, r|d=, ...) [ATTACHMENTS];</code>  
><code>path = [reuleaux\_polygon](shapes2d.scad#functionmodule-reuleaux_polygon)(n, r|d=, ...);</code>  

><code>[supershape](shapes2d.scad#functionmodule-supershape)([step],[n=], [m1=], [m2=], [n1=], [n2=], [n3=], [a=], [b=], [r=/d=]) [ATTACHMENTS];</code>  
><code>path = [supershape](shapes2d.scad#functionmodule-supershape)([step], [n=], [m1=], [m2=], [n1=], [n2=], [n3=], [a=], [b=], [r=/d=]);</code>  


### Section: Text

><code>[text](shapes2d.scad#module-text)([text](shapes2d.scad#module-text), [size], [font], ...);</code>  


### Section: Rounding 2D shapes

><code>[round2d](shapes2d.scad#module-round2d)(r) [ATTACHMENTS];</code>  &nbsp; &nbsp; <code>[round2d](shapes2d.scad#module-round2d)(or=) [ATTACHMENTS];</code>  &nbsp; &nbsp; <code>[round2d](shapes2d.scad#module-round2d)(ir=) [ATTACHMENTS];</code>  
><code>[round2d](shapes2d.scad#module-round2d)(or=, ir=) [ATTACHMENTS];</code>  

><code>[shell2d](shapes2d.scad#module-shell2d)(thickness, [or], [ir])</code>  


## LibFile: shapes3d.scad

### Section: Cuboids, Prismoids and Pyramids

><code>[cube](shapes3d.scad#functionmodule-cube)(size, [center]);</code>  
><code>[cube](shapes3d.scad#functionmodule-cube)(size, [center|anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  
><code>vnf = [cube](shapes3d.scad#functionmodule-cube)(size, ...);</code>  

><code>[cuboid](shapes3d.scad#module-cuboid)(size, [anchor=], [spin=], [orient=]);</code>  &nbsp; &nbsp; <code>[cuboid](shapes3d.scad#module-cuboid)(size, p1=, ...);</code>  
><code>[cuboid](shapes3d.scad#module-cuboid)(p1=, p2=, ...);</code>  
><code>[cuboid](shapes3d.scad#module-cuboid)(size, [chamfer=], [edges=], [except=], [trimcorners=], ...);</code>  
><code>[cuboid](shapes3d.scad#module-cuboid)(size, [rounding=], [teardrop=], [edges=], [except=], [trimcorners=], ...);</code>  
><code>[cuboid](shapes3d.scad#module-cuboid)(...) ATTACHMENTS;</code>  

><code>[prismoid](shapes3d.scad#functionmodule-prismoid)(size1, size2, [h|l|height|length], [shift], [xang=], [yang=], ...) [ATTACHMENTS];</code>  
><code>[prismoid](shapes3d.scad#functionmodule-prismoid)(size1, size2, h|l|height|length, [chamfer=], [rounding=]...) [ATTACHMENTS];</code>  
><code>[prismoid](shapes3d.scad#functionmodule-prismoid)(size1, size2, h|l|height|length, [chamfer1=], [chamfer2=], [rounding1=], [rounding2=], ...) [ATTACHMENTS];</code>  
><code>vnf = [prismoid](shapes3d.scad#functionmodule-prismoid)(...);</code>  

><code>[regular\_prism](shapes3d.scad#functionmodule-regular_prism)(n, h|l=|height=|length=, r, [center=|anchor=], [realign=]) [ATTACHMENTS];</code>  
><code>[regular\_prism](shapes3d.scad#functionmodule-regular_prism)(n, h|l=|height=|length=, d=|id=|od=|ir=|or=|side=, ...) [ATTACHMENTS];</code>  
><code>[regular\_prism](shapes3d.scad#functionmodule-regular_prism)(n, h|l=|height=|length=, r1=|d1=|id1=|od1=|ir1=|or1=|side1=,r2=|d2=|id2=|od2=|ir2=|or2=|side2=, ...) [ATTACHMENTS];</code>  
><code>[regular\_prism](shapes3d.scad#functionmodule-regular_prism)(n, h, r, chamfer=, [chamfang=], [from\_end=], ...);</code>  
><code>[regular\_prism](shapes3d.scad#functionmodule-regular_prism)(n, h, r, chamfer1=, [chamfang1=], [from\_end=], ...);</code>  
><code>[regular\_prism](shapes3d.scad#functionmodule-regular_prism)(n, h, r, chamfer2=, [chamfang2=], [from\_end=], ...);</code>  
><code>[regular\_prism](shapes3d.scad#functionmodule-regular_prism)(n, h, r, chamfer1=, chamfer2=, [chamfang1=], [chamfang2=], [from\_end=], ...);</code>  
><code>[regular\_prism](shapes3d.scad#functionmodule-regular_prism)(n, h, r, rounding=, ...);</code>  &nbsp; &nbsp; <code>[regular\_prism](shapes3d.scad#functionmodule-regular_prism)(n, h, r, rounding1=, ...);</code>  
><code>[regular\_prism](shapes3d.scad#functionmodule-regular_prism)(n, h, r, rounding2=, ...);</code>  
><code>[regular\_prism](shapes3d.scad#functionmodule-regular_prism)(n, h, r, rounding1=, rounding2=, ...);</code>  
><code>[regular\_prism](shapes3d.scad#functionmodule-regular_prism)(n, h, r, texture=, [tex\_size=]|[tex\_reps=], [tex\_depth=], [tex\_rot=], [tex\_samples=], [style=], [tex\_inset=], ...);</code>  
><code>vnf = rounded\_prism(...);</code>  

><code>[textured\_tile](shapes3d.scad#functionmodule-textured_tile)(texture, [size], [w1=], [w2=], [ang=], [shift=], [h=/height=/thickness=], [atype=], [diff=], [tex\_extra=], [tex\_skip=], ...) [ATTACHMENTS];</code>  
><code>vnf = [textured\_tile](shapes3d.scad#functionmodule-textured_tile)(texture, [size], [w1=], [w2=], [ang=], [shift=], [h=/height=/thickness=], [atype=], [tex\_extra=], [tex\_skip=], ...);</code>  

><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size, isize, [center|anchor=], [shift]);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size, wall=, [center=|anchor=]);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, isize=, wall=, [center=|anchor=]);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size1=, size2=, wall=, ...);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, isize1=, isize2=, wall=, ...);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size1=, size2=, isize1=, isize2=, ...);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size, isize, chamfer=, ...);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size, isize, chamfer1=, chamfer2= ...);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size, isize, ichamfer=, ...);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size, isize, ichamfer1=, ichamfer2= ...);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size, isize, chamfer=, ichamfer=, ...);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size, isize, rounding=, ...);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size, isize, rounding1=, rounding2= ...);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size, isize, irounding=, ...);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size, isize, irounding1=, irounding2= ...);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(h, size, isize, rounding=, irounding=, ...);</code>  
><code>[rect\_tube](shapes3d.scad#module-rect_tube)(...) ATTACHMENTS;</code>  

><code>[wedge](shapes3d.scad#functionmodule-wedge)(size, [center|anchor=], ...) [ATTACHMENTS];</code>  
><code>vnf = [wedge](shapes3d.scad#functionmodule-wedge)(size, [center|anchor=], ...);</code>  

><code>[octahedron](shapes3d.scad#functionmodule-octahedron)(size, ...) [ATTACHMENTS];</code>  &nbsp; &nbsp; <code>vnf = [octahedron](shapes3d.scad#functionmodule-octahedron)(size, ...);</code>  


### Section: Cylinders

><code>[cylinder](shapes3d.scad#functionmodule-cylinder)(h, r=/d=, [center=]);</code>  &nbsp; &nbsp; <code>[cylinder](shapes3d.scad#functionmodule-cylinder)(h, r1/d1=, r2/d2=, [center=]);</code>  
><code>[cylinder](shapes3d.scad#functionmodule-cylinder)(h, r=/d=, [center=|anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  
><code>[cylinder](shapes3d.scad#functionmodule-cylinder)(h, r1/d1=, r2/d2=, [center=|anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  
><code>vnf = [cylinder](shapes3d.scad#functionmodule-cylinder)(h, r=/d=, ...);</code>  &nbsp; &nbsp; <code>vnf = [cylinder](shapes3d.scad#functionmodule-cylinder)(h, r1/d1=, r2/d2=, ...);</code>  

><code>[cyl](shapes3d.scad#functionmodule-cyl)(l|h|length|height, r, [r2], [center|anchor=], [circum=], [realign=]) [ATTACHMENTS];</code>  
><code>[cyl](shapes3d.scad#functionmodule-cyl)(l|h|length|height, d=, ...) [ATTACHMENTS];</code>  
><code>[cyl](shapes3d.scad#functionmodule-cyl)(l|h|length|height, r1=|d1=, r2=|d2=, ...) [ATTACHMENTS];</code>  
><code>[cyl](shapes3d.scad#functionmodule-cyl)(..., chamfer=, [chamfang=], [from\_end=], ...);</code>  
><code>[cyl](shapes3d.scad#functionmodule-cyl)(..., [chamfer1=], [chamfer2=], [chamfang1=], [chamfang2=], [from\_end=], ...);</code>  
><code>[cyl](shapes3d.scad#functionmodule-cyl)(..., rounding=, [teardrop=], [clip\_angle=], ...);</code>  
><code>[cyl](shapes3d.scad#functionmodule-cyl)(..., [rounding1=], [rounding2=], [teardrop=], [clip\_angle=], ...);</code>  
><code>[cyl](shapes3d.scad#functionmodule-cyl)(..., texture=, [tex\_size=]|[tex\_reps=], [tex\_depth=], [tex\_rot=], [tex\_samples=], [style=], [tex\_taper=], [tex\_inset=], ...);</code>  
><code>vnf = [cyl](shapes3d.scad#functionmodule-cyl)(...);</code>  

><code>[xcyl](shapes3d.scad#functionmodule-xcyl)(l|h|length|height, r|d=, [anchor=], ...) [ATTACHMENTS];</code>  
><code>[xcyl](shapes3d.scad#functionmodule-xcyl)(l|h|length|height, r1=|d1=, r2=|d2=, [anchor=], ...) [ATTACHMENTS];</code>  

><code>[ycyl](shapes3d.scad#functionmodule-ycyl)(l|h|length|height, r|d=, [anchor=], ...) [ATTACHMENTS];</code>  
><code>[ycyl](shapes3d.scad#functionmodule-ycyl)(l|h|length|height, r1=|d1=, r2=|d2=, [anchor=], ...) [ATTACHMENTS];</code>  

><code>[zcyl](shapes3d.scad#module-zcyl)(l|h|length|height, r|d=, [anchor=], ...) [ATTACHMENTS];</code>  
><code>[zcyl](shapes3d.scad#module-zcyl)(l|h|length|height, r1=|d1=, r2=|d2=, [anchor=], ...) [ATTACHMENTS];</code>  

><code>[tube](shapes3d.scad#module-tube)(h|l, or, ir, [center|anchor=], [realign=], [spin=],[orient=]) [ATTACHMENTS];</code>  
><code>[tube](shapes3d.scad#module-tube)(h|l, od=, id=, ...)  [ATTACHMENTS];</code>  
><code>[tube](shapes3d.scad#module-tube)(h|l, or|od=|ir=|id=, wall=, ...) [ATTACHMENTS];</code>  
><code>[tube](shapes3d.scad#module-tube)(h|l, ir1=|id1=, ir2=|id2=, or1=|od1=, or2=|od2=, ...) [ATTACHMENTS];</code>  
><code>[tube](shapes3d.scad#module-tube)(h|l, or1=|od1=, or2=|od2=, wall=, ...) [ATTACHMENTS];</code>  
><code>[tube](shapes3d.scad#module-tube)(..., [rounding=], [irounding=], [orounding=], [rounding1=], [rounding2=], [irounding1=], [irounding2=], [orounding1=], [orounding2=], [teardrop=], [clip\_angle=]);</code>  
><code>[tube](shapes3d.scad#module-tube)(..., [chamfer=], [ichamfer=], [ochamfer=], [chamfer1=], [chamfer2=], [ichamfer1=], [ichamfer2=], [ochamfer1=], [ochamfer2=]);</code>  

><code>[pie\_slice](shapes3d.scad#functionmodule-pie_slice)(l|h=|height=|length=, r, ang, [center]);</code>  
><code>[pie\_slice](shapes3d.scad#functionmodule-pie_slice)(l|h=|height=|length=, d=, ang=, ...);</code>  
><code>[pie\_slice](shapes3d.scad#functionmodule-pie_slice)(l|h=|height=|length=, r1=|d1=, r2=|d2=, ang=, ...);</code>  
><code>vnf = [pie\_slice](shapes3d.scad#functionmodule-pie_slice)(l|h=|height=|length=, r, ang, [center]);</code>  
><code>vnf = [pie\_slice](shapes3d.scad#functionmodule-pie_slice)(l|h=|height=|length=, d=, ang=, ...);</code>  
><code>vnf = [pie\_slice](shapes3d.scad#functionmodule-pie_slice)(l|h=|height=|length=, r1=|d1=, r2=|d2=, ang=, ...);</code>  
><code>[pie\_slice](shapes3d.scad#functionmodule-pie_slice)(l|h, r, ang, ...) ATTACHMENTS;</code>  


### Section: Other Round Objects

><code>[sphere](shapes3d.scad#functionmodule-sphere)(r|d=);</code>  
><code>[sphere](shapes3d.scad#functionmodule-sphere)(r|d=, [anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  
><code>vnf = [sphere](shapes3d.scad#functionmodule-sphere)(r|d=, [anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  

><code>[spheroid](shapes3d.scad#functionmodule-spheroid)(r|d, [circum], [style]) [ATTACHMENTS];</code>  
><code>vnf = [spheroid](shapes3d.scad#functionmodule-spheroid)(r|d, [circum], [style]);</code>  

><code>[torus](shapes3d.scad#functionmodule-torus)(r\_maj|d\_maj, r\_min|d\_min, [center], ...) [ATTACHMENTS];</code>  
><code>[torus](shapes3d.scad#functionmodule-torus)(or|od, ir|id, ...) [ATTACHMENTS];</code>  
><code>[torus](shapes3d.scad#functionmodule-torus)(r\_maj|d\_maj, or|od, ...) [ATTACHMENTS];</code>  
><code>[torus](shapes3d.scad#functionmodule-torus)(r\_maj|d\_maj, ir|id, ...) [ATTACHMENTS];</code>  
><code>[torus](shapes3d.scad#functionmodule-torus)(r\_min|d\_min, or|od, ...) [ATTACHMENTS];</code>  
><code>[torus](shapes3d.scad#functionmodule-torus)(r\_min|d\_min, ir|id, ...) [ATTACHMENTS];</code>  
><code>vnf = [torus](shapes3d.scad#functionmodule-torus)(r\_maj|d\_maj, r\_min|d\_min, [center], ...);</code>  
><code>vnf = [torus](shapes3d.scad#functionmodule-torus)(or|od, ir|id, ...);</code>  &nbsp; &nbsp; <code>vnf = [torus](shapes3d.scad#functionmodule-torus)(r\_maj|d\_maj, or|od, ...);</code>  
><code>vnf = [torus](shapes3d.scad#functionmodule-torus)(r\_maj|d\_maj, ir|id, ...);</code>  &nbsp; &nbsp; <code>vnf = [torus](shapes3d.scad#functionmodule-torus)(r\_min|d\_min, or|od, ...);</code>  
><code>vnf = [torus](shapes3d.scad#functionmodule-torus)(r\_min|d\_min, ir|id, ...);</code>  

><code>[teardrop](shapes3d.scad#functionmodule-teardrop)(h|l=|length=|height=, r, [ang], [cap\_h], [chamfer=], [bot\_corner=], ...) [ATTACHMENTS];</code>  
><code>[teardrop](shapes3d.scad#functionmodule-teardrop)(h|l=|length=|height=, d=, [ang=], [cap\_h=], [chamfer=], [bot\_corner=], ...) [ATTACHMENTS];</code>  
><code>[teardrop](shapes3d.scad#functionmodule-teardrop)(h|l=|height=|length=, r1=, r2=, [ang=], [cap\_h1=], [cap\_h2=], [bot\_corner1=], [bot\_corner2=], ...)  [ATTACHMENTS];</code>  
><code>[teardrop](shapes3d.scad#functionmodule-teardrop)(h|l=|height=|length=, d1=, d2=, [ang=], [cap\_h1=], [cap\_h2=], [bot\_corner1=], [bot\_corner2=], ...)  [ATTACHMENTS];</code>  
><code>vnf = [teardrop](shapes3d.scad#functionmodule-teardrop)(h|l=|height=|length=, r|d=, [ang=], [cap\_h=], ...);</code>  
><code>vnf = [teardrop](shapes3d.scad#functionmodule-teardrop)(h|l=|height=|length=, r1=|d1=, r2=|d2=, [ang=], [cap\_h=], ...);</code>  
><code>vnf = [teardrop](shapes3d.scad#functionmodule-teardrop)(h|l=|height=|length=, r1=|d1=, r2=|d2=, [ang=], [cap\_h1=], [cap\_h2=], ...);</code>  

><code>[onion](shapes3d.scad#functionmodule-onion)(r|d=, [ang=], [cap\_h=], [circum=], [realign=], ...) [ATTACHMENTS];</code>  
><code>vnf = [onion](shapes3d.scad#functionmodule-onion)(r|d=, [ang=], [cap\_h=], [circum=], [realign=], ...);</code>  


### Section: Text

><code>[text3d](shapes3d.scad#module-text3d)(text, [h], [size], [font], [language=], [script=], [direction=], [atype=], [anchor=], [spin=], [orient=]);</code>  

><code>[path\_text](shapes3d.scad#module-path_text)(path, text, [size], [thickness], [font], [lettersize=], [offset=], [reverse=], [normal=], [top=], [textmetrics=], [kern=])</code>  


### Section: Miscellaneous

><code>[fillet](shapes3d.scad#module-fillet)(l|h=|length=|height=, r|d=, [ang=], [excess=], [rounding=|chamfer=]) [ATTACHMENTS];</code>  
><code>[fillet](shapes3d.scad#module-fillet)(l|h=|length=|height=, r1=|d1=, r2=|d2=, [ang=], [excess=], [rounding=|chamfer=]) [ATTACHMENTS];</code>  

><code>[plot3d](shapes3d.scad#functionmodule-plot3d)(f, x, y, [zclip=], [zspan=], [base=], [convexity=], [style=]) [ATTACHMENTS];</code>  
><code>vnf = [plot3d](shapes3d.scad#functionmodule-plot3d)(f, x, y, [zclip=], [zspan=], [base=], [style=]);</code>  

><code>[plot\_revolution](shapes3d.scad#functionmodule-plot_revolution)(f, angle, z, [r=/d=] [r1=/d1], [r2=/d2=], [rclip=], [rspan=], [horiz=], [style=], [convexity=], ...) [ATTACHMENTS];</code>  
><code>[plot\_revolution](shapes3d.scad#functionmodule-plot_revolution)(f, arclength=, z=, [r=/d=] [r1=/d1], [r2=/d2=], [rclip=], [rspan=], [horiz=], [style=], [convexity=], ...) [ATTACHMENTS];</code>  
><code>[plot\_revolution](shapes3d.scad#functionmodule-plot_revolution)(f, [angle], [arclength=], path=, [rclip=], [rspan=], [horiz=], [style=], [convexity=], ...) [ATTACHMENTS];</code>  
><code>vnf = [plot\_revolution](shapes3d.scad#functionmodule-plot_revolution)(...);</code>  

><code>[ruler](shapes3d.scad#module-ruler)(length, width, [thickness=], [depth=], [labels=], [pipscale=], [maxscale=], [colors=], [alpha=], [unit=], [inch=]) [ATTACHMENTS];</code>  


## LibFile: masks.scad

### Section: 2D Masking Shapes

><code>[mask2d\_roundover](masks.scad#functionmodule-mask2d_roundover)(r|d=|h=|height=|cut=|joint=, [inset], [mask\_angle], [excess], [flat\_top=], [quarter\_round=], [clip\_angle=]) [ATTACHMENTS];</code>  
><code>path = [mask2d\_roundover](masks.scad#functionmodule-mask2d_roundover)(r|d=|h=|height=|cut=|joint=, [inset], [mask\_angle], [excess], [flat\_top=], [quarter\_round=], [clip\_angle=]);</code>  

><code>[mask2d\_smooth](masks.scad#functionmodule-mask2d_smooth)([mask\_angle], [cut=], [joint=], [inset=], [excess=], [flat\_top=], [anchor=], [spin=]) [ATTACHMENTS];</code>  
><code>path = [mask2d\_smooth](masks.scad#functionmodule-mask2d_smooth)([mask\_angle], [cut=], [joint=], [inset=], [excess=], [flat\_top=], [anchor=], [spin=]);</code>  

><code>[mask2d\_teardrop](masks.scad#functionmodule-mask2d_teardrop)(r|d=, [angle], [inset] [mask\_angle], [excess], [cut=], [joint=], [h=|height=]) [ATTACHMENTS];</code>  
><code>path = [mask2d\_teardrop](masks.scad#functionmodule-mask2d_teardrop)(r|d=, [angle], [inset], [mask\_angle], [excess], [cut=], [joint=], [h=|height=]);</code>  

><code>[mask2d\_cove](masks.scad#functionmodule-mask2d_cove)(r|d=|h=|height=, [inset], [mask\_angle], [excess], [bulge=], [flat\_top=], [quarter\_round=]) [ATTACHMENTS];</code>  
><code>path = [mask2d\_cove](masks.scad#functionmodule-mask2d_cove)(r|d=|h=, [inset], [mask\_angle], [excess], [bulge=], [flat\_top=]);</code>  

><code>[mask2d\_chamfer](masks.scad#functionmodule-mask2d_chamfer)(edge, [angle], [inset], [excess]) [ATTACHMENTS];</code>  
><code>[mask2d\_chamfer](masks.scad#functionmodule-mask2d_chamfer)(y=, [angle=], [inset=], [excess=]) [ATTACHMENTS];</code>  
><code>[mask2d\_chamfer](masks.scad#functionmodule-mask2d_chamfer)(x=, [angle=], [inset=], [excess=]) [ATTACHMENTS];</code>  
><code>path = [mask2d\_chamfer](masks.scad#functionmodule-mask2d_chamfer)(edge, [angle], [inset], [excess]);</code>  
><code>path = [mask2d\_chamfer](masks.scad#functionmodule-mask2d_chamfer)(y=, [angle=], [inset=], [excess=]);</code>  
><code>path = [mask2d\_chamfer](masks.scad#functionmodule-mask2d_chamfer)(x=, [angle=], [inset=], [excess=]);</code>  

><code>[mask2d\_rabbet](masks.scad#functionmodule-mask2d_rabbet)(size, [mask\_angle], [excess]) [ATTACHMENTS];</code>  
><code>path = [mask2d\_rabbet](masks.scad#functionmodule-mask2d_rabbet)(size, [mask\_angle], [excess]);</code>  

><code>[mask2d\_dovetail](masks.scad#functionmodule-mask2d_dovetail)(edge, angle, [inset], [shelf], [excess], ...) [ATTACHMENTS];</code>  
><code>[mask2d\_dovetail](masks.scad#functionmodule-mask2d_dovetail)(width=, angle=, [inset=], [shelf=], [excess=], ...) [ATTACHMENTS];</code>  
><code>[mask2d\_dovetail](masks.scad#functionmodule-mask2d_dovetail)(height=, angle=, [inset=], [shelf=], [excess=], ...) [ATTACHMENTS];</code>  
><code>[mask2d\_dovetail](masks.scad#functionmodule-mask2d_dovetail)(width=, height=, [inset=], [shelf=], [excess=], ...) [ATTACHMENTS];</code>  
><code>path = [mask2d\_dovetail](masks.scad#functionmodule-mask2d_dovetail)(edge, [angle], [inset], [shelf], [excess]);</code>  

><code>[mask2d\_ogee](masks.scad#functionmodule-mask2d_ogee)(pattern, [excess], ...) [ATTACHMENTS];</code>  
><code>path = [mask2d\_ogee](masks.scad#functionmodule-mask2d_ogee)(pattern, [excess], ...);</code>  


### Section: Modules for Applying 2D Masks

><code>PARENT() [face\_profile](masks.scad#module-face_profile)(faces, r|d=, [convexity=]) CHILDREN;</code>  

><code>PARENT() [edge\_profile](masks.scad#module-edge_profile)([edges], [except], [convexity]) CHILDREN;</code>  

><code>PARENT() edge\_profile([edges], [except], [convexity=], [flip=], [corner\_type=]) CHILDREN;</code>  

><code>PARENT() [corner\_profile](masks.scad#module-corner_profile)([corners], [except], [r=|d=], [convexity=]) CHILDREN;</code>  


### Section: 3D Edge Masks

><code>[chamfer\_edge\_mask](masks.scad#module-chamfer_edge_mask)(l|h=|length=|height=, chamfer, [excess]) [ATTACHMENTS];</code>  

><code>[rounding\_edge\_mask](masks.scad#module-rounding_edge_mask)(l|h=|length=|height=, r|d=, [ang], [excess=], [rounding=|chamfer=], ) [ATTACHMENTS];</code>  
><code>[rounding\_edge\_mask](masks.scad#module-rounding_edge_mask)(l|h=|length=|height=, r1=|d1=, r2=|d2=, [ang=], [excess=], [rounding=|chamfer=]) [ATTACHMENTS];</code>  

><code>[teardrop\_edge\_mask](masks.scad#module-teardrop_edge_mask)(l|h=|length=|height=, r|d=, [angle], [excess], [anchor], [spin], [orient]) [ATTACHMENTS];</code>  

><code>[polygon\_edge\_mask](masks.scad#module-polygon_edge_mask)(mask, l|h=|length=|height=, [scale=]) [ATTACHMENTS];</code>  


### Section: 3D Masks for 90° Corners

><code>[chamfer\_corner\_mask](masks.scad#module-chamfer_corner_mask)(chamfer) [ATTACHMENTS];</code>  

><code>[rounding\_corner\_mask](masks.scad#module-rounding_corner_mask)(r|d, [ang], [excess=], [style=]) [ATTACHMENTS];</code>  

><code>[teardrop\_corner\_mask](masks.scad#module-teardrop_corner_mask)(r|d=, [angle], [excess], [anchor], [spin], [orient]) [ATTACHMENTS];</code>  


### Section: 3D Cylinder End Masks

><code>[chamfer\_cylinder\_mask](masks.scad#module-chamfer_cylinder_mask)(r|d=, chamfer, [ang], [from\_end]) [ATTACHMENTS];</code>  

><code>[rounding\_cylinder\_mask](masks.scad#module-rounding_cylinder_mask)(r|d=, rounding);</code>  


### Section: 3D Cylindrical Hole Masks

><code>[rounding\_hole\_mask](masks.scad#module-rounding_hole_mask)(r|d, rounding, [excess]) [ATTACHMENTS];</code>  


### Section: Modules for Applying 3D Masks

><code>PARENT() [face\_mask](masks.scad#module-face_mask)(faces) CHILDREN;</code>  

><code>PARENT() [edge\_mask](masks.scad#module-edge_mask)([edges], [except]) CHILDREN;</code>  

><code>PARENT() [corner\_mask](masks.scad#module-corner_mask)([corners], [except]) CHILDREN;</code>  


## LibFile: drawing.scad

### Section: Line Drawing

><code>[stroke](drawing.scad#module-stroke)(path, [width], [closed], [endcaps], [endcap\_width], [endcap\_length], [endcap\_extent], [trim]);</code>  
><code>[stroke](drawing.scad#module-stroke)(path, [width], [closed], [endcap1], [endcap2], [endcap\_width1], [endcap\_width2], [endcap\_length1], [endcap\_length2], [endcap\_extent1], [endcap\_extent2], [trim1], [trim2]);</code>  

><code>[dashed\_stroke](drawing.scad#functionmodule-dashed_stroke)(path, dashpat, [width=], [closed=]);</code>  
><code>dashes = [dashed\_stroke](drawing.scad#functionmodule-dashed_stroke)(path, dashpat, [closed=]);</code>  


### Section: Computing paths

><code>path=[arc](drawing.scad#functionmodule-arc)(n, r|d=, angle);</code>  &nbsp; &nbsp; <code>path=[arc](drawing.scad#functionmodule-arc)(n, r|d=, angle=[START,END]);</code>  
><code>path=[arc](drawing.scad#functionmodule-arc)(n, r|d=, start=, angle=);</code>  &nbsp; &nbsp; <code>path=[arc](drawing.scad#functionmodule-arc)(n, width=, thickness=);</code>  
><code>path=[arc](drawing.scad#functionmodule-arc)(n, cp=, points=[P0,P1], [long=], [cw=], [ccw=]);</code>  
><code>path=[arc](drawing.scad#functionmodule-arc)(n, points=[P0,P1,P2]);</code>  &nbsp; &nbsp; <code>path=[arc](drawing.scad#functionmodule-arc)(n, corner=[P0,P1,P2], r=);</code>  
><code>path=[arc](drawing.scad#functionmodule-arc)(wedge=true,[rounding=],...)</code>  &nbsp; &nbsp; <code>[arc](drawing.scad#functionmodule-arc)(...) [ATTACHMENTS];</code>  

><code>path = [catenary](drawing.scad#function-catenary)(width, droop=|angle=, n=);</code>  

><code>path = [helix](drawing.scad#function-helix)(l|h, [turns=], [angle=], r=|r1=|r2=, d=|d1=|d2=);</code>  

><code>path = [turtle](drawing.scad#function-turtle)(commands, [state], [full\_state=], [repeat=])</code>  


### Section: Debugging polygons

><code>[debug\_polygon](drawing.scad#module-debug_polygon)(points, paths, [vertices=], [edges=], [convexity=], [size=]);</code>  


## LibFile: distributors.scad

### Section: Translating copies of all the children

><code>[move\_copies](distributors.scad#functionmodule-move_copies)(a) CHILDREN;</code>  &nbsp; &nbsp; <code>copies = [move\_copies](distributors.scad#functionmodule-move_copies)(a, p=);</code>  &nbsp; &nbsp; <code>mats = [move\_copies](distributors.scad#functionmodule-move_copies)(a);</code>  

><code>[xcopies](distributors.scad#functionmodule-xcopies)(spacing, [n], [sp=]) CHILDREN;</code>  &nbsp; &nbsp; <code>[xcopies](distributors.scad#functionmodule-xcopies)(l=, [n=], [sp=]) CHILDREN;</code>  
><code>[xcopies](distributors.scad#functionmodule-xcopies)(LIST) CHILDREN;</code>  
><code>copies = [xcopies](distributors.scad#functionmodule-xcopies)(spacing, [n], [sp=], p=);</code>  &nbsp; &nbsp; <code>copies = [xcopies](distributors.scad#functionmodule-xcopies)(l=, [n=], [sp=], p=);</code>  
><code>copies = [xcopies](distributors.scad#functionmodule-xcopies)(LIST, p=);</code>  &nbsp; &nbsp; <code>mats = [xcopies](distributors.scad#functionmodule-xcopies)(spacing, [n], [sp=]);</code>  
><code>mats = [xcopies](distributors.scad#functionmodule-xcopies)(l=, [n=], [sp=]);</code>  &nbsp; &nbsp; <code>mats = [xcopies](distributors.scad#functionmodule-xcopies)(LIST);</code>  

><code>[ycopies](distributors.scad#functionmodule-ycopies)(spacing, [n], [sp=]) CHILDREN;</code>  &nbsp; &nbsp; <code>[ycopies](distributors.scad#functionmodule-ycopies)(l=, [n=], [sp=]) CHILDREN;</code>  
><code>[ycopies](distributors.scad#functionmodule-ycopies)(LIST) CHILDREN;</code>  
><code>copies = [ycopies](distributors.scad#functionmodule-ycopies)(spacing, [n], [sp=], p=);</code>  &nbsp; &nbsp; <code>copies = [ycopies](distributors.scad#functionmodule-ycopies)(l=, [n=], [sp=], p=);</code>  
><code>copies = [ycopies](distributors.scad#functionmodule-ycopies)(LIST, p=);</code>  &nbsp; &nbsp; <code>mats = [ycopies](distributors.scad#functionmodule-ycopies)(spacing, [n], [sp=]);</code>  
><code>mats = [ycopies](distributors.scad#functionmodule-ycopies)(l=, [n=], [sp=]);</code>  &nbsp; &nbsp; <code>mats = [ycopies](distributors.scad#functionmodule-ycopies)(LIST);</code>  

><code>[zcopies](distributors.scad#functionmodule-zcopies)(spacing, [n], [sp=]) CHILDREN;</code>  &nbsp; &nbsp; <code>[zcopies](distributors.scad#functionmodule-zcopies)(l=, [n=], [sp=]) CHILDREN;</code>  
><code>[zcopies](distributors.scad#functionmodule-zcopies)(LIST) CHILDREN;</code>  
><code>copies = [zcopies](distributors.scad#functionmodule-zcopies)(spacing, [n], [sp=], p=);</code>  &nbsp; &nbsp; <code>copies = [zcopies](distributors.scad#functionmodule-zcopies)(l=, [n=], [sp=], p=);</code>  
><code>copies = [zcopies](distributors.scad#functionmodule-zcopies)(LIST, p=);</code>  &nbsp; &nbsp; <code>mats = [zcopies](distributors.scad#functionmodule-zcopies)(spacing, [n], [sp=]);</code>  
><code>mats = [zcopies](distributors.scad#functionmodule-zcopies)(l=, [n=], [sp=]);</code>  &nbsp; &nbsp; <code>mats = [zcopies](distributors.scad#functionmodule-zcopies)(LIST);</code>  

><code>[line\_copies](distributors.scad#functionmodule-line_copies)(spacing, [n], [p1=]) CHILDREN;</code>  
><code>[line\_copies](distributors.scad#functionmodule-line_copies)(spacing, [l=], [p1=]) CHILDREN;</code>  
><code>[line\_copies](distributors.scad#functionmodule-line_copies)([n=], [l=], [p1=]) CHILDREN;</code>  
><code>[line\_copies](distributors.scad#functionmodule-line_copies)([n=], [p1=], [p2=]) CHILDREN;</code>  
><code>[line\_copies](distributors.scad#functionmodule-line_copies)([spacing], [p1=], [p2=]) CHILDREN;</code>  
><code>copies = [line\_copies](distributors.scad#functionmodule-line_copies)([spacing], [n], [p1=], p=);</code>  
><code>copies = [line\_copies](distributors.scad#functionmodule-line_copies)([spacing], [l=], [p1=], p=);</code>  
><code>copies = [line\_copies](distributors.scad#functionmodule-line_copies)([n=], [l=], [p1=], p=);</code>  
><code>copies = [line\_copies](distributors.scad#functionmodule-line_copies)([n=], [p1=], [p2=], p=);</code>  
><code>copies = [line\_copies](distributors.scad#functionmodule-line_copies)([spacing], [p1=], [p2=], p=);</code>  
><code>mats = [line\_copies](distributors.scad#functionmodule-line_copies)([spacing], [n], [p1=]);</code>  
><code>mats = [line\_copies](distributors.scad#functionmodule-line_copies)([spacing], [l=], [p1=]);</code>  
><code>mats = [line\_copies](distributors.scad#functionmodule-line_copies)([n=], [l=], [p1=]);</code>  &nbsp; &nbsp; <code>mats = [line\_copies](distributors.scad#functionmodule-line_copies)([n=], [p1=], [p2=]);</code>  
><code>mats = [line\_copies](distributors.scad#functionmodule-line_copies)([spacing], [p1=], [p2=]);</code>  

><code>[grid\_copies](distributors.scad#functionmodule-grid_copies)(spacing, size=, [stagger=], [scale=], [inside=], [axes=]) CHILDREN;</code>  
><code>[grid\_copies](distributors.scad#functionmodule-grid_copies)(n=, size=, [stagger=], [scale=], [inside=], [axes=]) CHILDREN;</code>  
><code>[grid\_copies](distributors.scad#functionmodule-grid_copies)(spacing, [n], [stagger=], [scale=], [inside=], [axes=]) CHILDREN;</code>  
><code>[grid\_copies](distributors.scad#functionmodule-grid_copies)(n=, inside=, [stagger], [scale], [axes=]) CHILDREN;</code>  
><code>copies = [grid\_copies](distributors.scad#functionmodule-grid_copies)(spacing, size=, [stagger=], [scale=], [inside=], [axes=], p=);</code>  
><code>copies = [grid\_copies](distributors.scad#functionmodule-grid_copies)(n=, size=, [stagger=], [scale=], [inside=], [axes=], p=);</code>  
><code>copies = [grid\_copies](distributors.scad#functionmodule-grid_copies)(spacing, [n], [stagger=], [scale=], [inside=], [axes=], p=);</code>  
><code>copies = [grid\_copies](distributors.scad#functionmodule-grid_copies)(n=, inside=, [stagger], [scale], [axes=], p=);</code>  
><code>mats = [grid\_copies](distributors.scad#functionmodule-grid_copies)(spacing, size=, [stagger=], [scale=], [inside=], [axes=]);</code>  
><code>mats = [grid\_copies](distributors.scad#functionmodule-grid_copies)(n=, size=, [stagger=], [scale=], [inside=], [axes=]);</code>  
><code>mats = [grid\_copies](distributors.scad#functionmodule-grid_copies)(spacing, [n], [stagger=], [scale=], [inside=], [axes=]);</code>  
><code>mats = [grid\_copies](distributors.scad#functionmodule-grid_copies)(n=, inside=, [stagger], [scale], [axes=]);</code>  


### Section: Rotating copies of all children

><code>[rot\_copies](distributors.scad#functionmodule-rot_copies)(rots, [cp=], [sa=], [delta=], [subrot=]) CHILDREN;</code>  
><code>[rot\_copies](distributors.scad#functionmodule-rot_copies)(rots, v, [cp=], [sa=], [delta=], [subrot=]) CHILDREN;</code>  
><code>[rot\_copies](distributors.scad#functionmodule-rot_copies)(n=, [v=], [cp=], [sa=], [delta=], [subrot=]) CHILDREN;</code>  
><code>copies = [rot\_copies](distributors.scad#functionmodule-rot_copies)(rots, [cp=], [sa=], [delta=], [subrot=], p=);</code>  
><code>copies = [rot\_copies](distributors.scad#functionmodule-rot_copies)(rots, v, [cp=], [sa=], [delta=], [subrot=], p=);</code>  
><code>copies = [rot\_copies](distributors.scad#functionmodule-rot_copies)(n=, [v=], [cp=], [sa=], [delta=], [subrot=], p=);</code>  
><code>mats = [rot\_copies](distributors.scad#functionmodule-rot_copies)(rots, [cp=], [sa=], [delta=], [subrot=]);</code>  
><code>mats = [rot\_copies](distributors.scad#functionmodule-rot_copies)(rots, v, [cp=], [sa=], [delta=], [subrot=]);</code>  
><code>mats = [rot\_copies](distributors.scad#functionmodule-rot_copies)(n=, [v=], [cp=], [sa=], [delta=], [subrot=]);</code>  

><code>[xrot\_copies](distributors.scad#functionmodule-xrot_copies)(rots, [cp], [r=|d=], [sa=], [subrot=]) CHILDREN;</code>  
><code>[xrot\_copies](distributors.scad#functionmodule-xrot_copies)(n=, [cp=], [r=|d=], [sa=], [subrot=]) CHILDREN;</code>  
><code>copies = [xrot\_copies](distributors.scad#functionmodule-xrot_copies)(rots, [cp], [r=|d=], [sa=], [subrot=], p=);</code>  
><code>copies = [xrot\_copies](distributors.scad#functionmodule-xrot_copies)(n=, [cp=], [r=|d=], [sa=], [subrot=], p=);</code>  
><code>mats = [xrot\_copies](distributors.scad#functionmodule-xrot_copies)(rots, [cp], [r=|d=], [sa=], [subrot=]);</code>  
><code>mats = [xrot\_copies](distributors.scad#functionmodule-xrot_copies)(n=, [cp=], [r=|d=], [sa=], [subrot=]);</code>  

><code>[yrot\_copies](distributors.scad#functionmodule-yrot_copies)(rots, [cp], [r=|d=], [sa=], [subrot=]) CHILDREN;</code>  
><code>[yrot\_copies](distributors.scad#functionmodule-yrot_copies)(n=, [cp=], [r=|d=], [sa=], [subrot=]) CHILDREN;</code>  
><code>copies = [yrot\_copies](distributors.scad#functionmodule-yrot_copies)(rots, [cp], [r=|d=], [sa=], [subrot=], p=);</code>  
><code>copies = [yrot\_copies](distributors.scad#functionmodule-yrot_copies)(n=, [cp=], [r=|d=], [sa=], [subrot=], p=);</code>  
><code>mats = [yrot\_copies](distributors.scad#functionmodule-yrot_copies)(rots, [cp], [r=|d=], [sa=], [subrot=]);</code>  
><code>mats = [yrot\_copies](distributors.scad#functionmodule-yrot_copies)(n=, [cp=], [r=|d=], [sa=], [subrot=]);</code>  

><code>[zrot\_copies](distributors.scad#functionmodule-zrot_copies)(rots, [cp], [r=|d=], [sa=], [subrot=]) CHILDREN;</code>  
><code>[zrot\_copies](distributors.scad#functionmodule-zrot_copies)(n=, [cp=], [r=|d=], [sa=], [subrot=]) CHILDREN;</code>  
><code>copies = [zrot\_copies](distributors.scad#functionmodule-zrot_copies)(rots, [cp], [r=|d=], [sa=], [subrot=], p=);</code>  
><code>copies = [zrot\_copies](distributors.scad#functionmodule-zrot_copies)(n=, [cp=], [r=|d=], [sa=], [subrot=], p=);</code>  
><code>mats = [zrot\_copies](distributors.scad#functionmodule-zrot_copies)(rots, [cp], [r=|d=], [sa=], [subrot=]);</code>  
><code>mats = [zrot\_copies](distributors.scad#functionmodule-zrot_copies)(n=, [cp=], [r=|d=], [sa=], [subrot=]);</code>  

><code>[arc\_copies](distributors.scad#functionmodule-arc_copies)(n, r|d=, [sa=], [ea=], [rot=]) CHILDREN;</code>  
><code>[arc\_copies](distributors.scad#functionmodule-arc_copies)(n, rx=|dx=, ry=|dy=, [sa=], [ea=], [rot=]) CHILDREN;</code>  
><code>copies = [arc\_copies](distributors.scad#functionmodule-arc_copies)(n, r|d=, [sa=], [ea=], [rot=], p=);</code>  
><code>copies = [arc\_copies](distributors.scad#functionmodule-arc_copies)(n, rx=|dx=, ry=|dy=, [sa=], [ea=], [rot=], p=);</code>  
><code>mats = [arc\_copies](distributors.scad#functionmodule-arc_copies)(n, r|d=, [sa=], [ea=], [rot=]);</code>  
><code>mats = [arc\_copies](distributors.scad#functionmodule-arc_copies)(n, rx=|dx=, ry=|dy=, [sa=], [ea=], [rot=]);</code>  

><code>[sphere\_copies](distributors.scad#functionmodule-sphere_copies)(n, r|d=, [cone\_ang=], [scale=], [perp=]) CHILDREN;</code>  
><code>copies = [sphere\_copies](distributors.scad#functionmodule-sphere_copies)(n, r|d=, [cone\_ang=], [scale=], [perp=], p=);</code>  
><code>mats = [sphere\_copies](distributors.scad#functionmodule-sphere_copies)(n, r|d=, [cone\_ang=], [scale=], [perp=]);</code>  


### Section: Placing copies of all children on a path

><code>[path\_copies](distributors.scad#functionmodule-path_copies)(path, [n], [spacing], [sp], [rotate\_children], [closed=]) CHILDREN;</code>  
><code>[path\_copies](distributors.scad#functionmodule-path_copies)(path, dist=, [rotate\_children=], [closed=]) CHILDREN;</code>  
><code>copies = [path\_copies](distributors.scad#functionmodule-path_copies)(path, [n], [spacing], [sp], [rotate\_children], [closed=], p=);</code>  
><code>copies = [path\_copies](distributors.scad#functionmodule-path_copies)(path, dist=, [rotate\_children=], [closed=], p=);</code>  
><code>mats = [path\_copies](distributors.scad#functionmodule-path_copies)(path, [n], [spacing], [sp], [rotate\_children], [closed=]);</code>  
><code>mats = [path\_copies](distributors.scad#functionmodule-path_copies)(path, dist=, [rotate\_children=], [closed=]);</code>  


### Section: Making a copy of all children with reflection

><code>[xflip\_copy](distributors.scad#functionmodule-xflip_copy)([offset], [x]) CHILDREN;</code>  &nbsp; &nbsp; <code>copies = [xflip\_copy](distributors.scad#functionmodule-xflip_copy)([offset], [x], p=);</code>  
><code>mats = [xflip\_copy](distributors.scad#functionmodule-xflip_copy)([offset], [x]);</code>  

><code>[yflip\_copy](distributors.scad#functionmodule-yflip_copy)([offset], [y]) CHILDREN;</code>  &nbsp; &nbsp; <code>copies = [yflip\_copy](distributors.scad#functionmodule-yflip_copy)([offset], [y], p=);</code>  
><code>mats = [yflip\_copy](distributors.scad#functionmodule-yflip_copy)([offset], [y]);</code>  

><code>[zflip\_copy](distributors.scad#functionmodule-zflip_copy)([offset], [z]) CHILDREN;</code>  &nbsp; &nbsp; <code>copies = [zflip\_copy](distributors.scad#functionmodule-zflip_copy)([offset], [z], p=);</code>  
><code>mats = [zflip\_copy](distributors.scad#functionmodule-zflip_copy)([offset], [z]);</code>  

><code>[mirror\_copy](distributors.scad#functionmodule-mirror_copy)(v, [cp], [offset]) CHILDREN;</code>  
><code>copies = [mirror\_copy](distributors.scad#functionmodule-mirror_copy)(v, [cp], [offset], p=);</code>  
><code>mats = [mirror\_copy](distributors.scad#functionmodule-mirror_copy)(v, [cp], [offset]);</code>  


### Section: Distributing children individually along a line

><code>[xdistribute](distributors.scad#module-xdistribute)(spacing, [sizes]) CHILDREN;</code>  &nbsp; &nbsp; <code>[xdistribute](distributors.scad#module-xdistribute)(l=, [sizes=]) CHILDREN;</code>  

><code>[ydistribute](distributors.scad#module-ydistribute)(spacing, [sizes]) CHILDREN;</code>  &nbsp; &nbsp; <code>[ydistribute](distributors.scad#module-ydistribute)(l=, [sizes=]) CHILDREN;</code>  

><code>[zdistribute](distributors.scad#module-zdistribute)(spacing, [sizes]) CHILDREN;</code>  &nbsp; &nbsp; <code>[zdistribute](distributors.scad#module-zdistribute)(l=, [sizes=]) CHILDREN;</code>  

><code>[distribute](distributors.scad#module-distribute)(spacing, sizes, dir) CHILDREN;</code>  
><code>[distribute](distributors.scad#module-distribute)(l=, [sizes=], [dir=]) CHILDREN;</code>  


## LibFile: color.scad

### Section: Coloring Objects

><code>[recolor](color.scad#module-recolor)([c]) CHILDREN;</code>  

><code>[color\_this](color.scad#module-color_this)([c]) CHILDREN;</code>  

><code>[rainbow](color.scad#module-rainbow)(list,[stride],[maxhues],[shuffle],[seed]) CHILDREN;</code>  

><code>[color\_overlaps](color.scad#module-color_overlaps)([color]) CHILDREN;</code>  


### Section: Setting Object Modifiers

><code>[highlight](color.scad#module-highlight)([[highlight](color.scad#module-highlight)]) CHILDREN;</code>  

><code>[highlight\_this](color.scad#module-highlight_this)() CHILDREN;</code>  

><code>[ghost](color.scad#module-ghost)([[ghost](color.scad#module-ghost)]) CHILDREN;</code>  

><code>[ghost\_this](color.scad#module-ghost_this)() CHILDREN;</code>  


### Section: Colorspace Conversion

><code>[hsl](color.scad#functionmodule-hsl)(h,[s],[l],[a]) CHILDREN;</code>  &nbsp; &nbsp; <code>rgb = [hsl](color.scad#functionmodule-hsl)(h,[s],[l],[a]);</code>  

><code>[hsv](color.scad#functionmodule-hsv)(h,[s],[v],[a]) CHILDREN;</code>  &nbsp; &nbsp; <code>rgb = [hsv](color.scad#functionmodule-hsv)(h,[s],[v],[a]);</code>  


## LibFile: partitions.scad

### Section: Planar Cutting

><code>[half\_of](partitions.scad#functionmodule-half_of)(v, [cp], [s], [planar]) CHILDREN;</code>  &nbsp; &nbsp; <code>result = [half\_of](partitions.scad#functionmodule-half_of)(p,v,[cp]);</code>  

><code>[left\_half](partitions.scad#functionmodule-left_half)([s], [x]) CHILDREN;</code>  
><code>[left\_half](partitions.scad#functionmodule-left_half)(planar=true, [s], [x]) CHILDREN;</code>  &nbsp; &nbsp; <code>result = [left\_half](partitions.scad#functionmodule-left_half)(p, [x]);</code>  

><code>[right\_half](partitions.scad#functionmodule-right_half)([s=], [x=]) CHILDREN;</code>  
><code>[right\_half](partitions.scad#functionmodule-right_half)(planar=true, [s=], [x=]) CHILDREN;</code>  &nbsp; &nbsp; <code>result = [right\_half](partitions.scad#functionmodule-right_half)(p, [x=]);</code>  

><code>[front\_half](partitions.scad#functionmodule-front_half)([s], [y]) CHILDREN;</code>  
><code>[front\_half](partitions.scad#functionmodule-front_half)(planar=true, [s], [y]) CHILDREN;</code>  &nbsp; &nbsp; <code>result = [front\_half](partitions.scad#functionmodule-front_half)(p, [y]);</code>  

><code>[back\_half](partitions.scad#functionmodule-back_half)([s], [y]) CHILDREN;</code>  
><code>[back\_half](partitions.scad#functionmodule-back_half)(planar=true, [s], [y]) CHILDREN;</code>  &nbsp; &nbsp; <code>result = [back\_half](partitions.scad#functionmodule-back_half)(p, [y]);</code>  

><code>[bottom\_half](partitions.scad#functionmodule-bottom_half)([s], [z]) CHILDREN;</code>  &nbsp; &nbsp; <code>result = [bottom\_half](partitions.scad#functionmodule-bottom_half)(p, [z]);</code>  

><code>[top\_half](partitions.scad#functionmodule-top_half)([s], [z]) CHILDREN;</code>  &nbsp; &nbsp; <code>result = [top\_half](partitions.scad#functionmodule-top_half)(p, [z]);</code>  


### Section: Partioning into Interlocking Pieces

><code>[partition\_mask](partitions.scad#module-partition_mask)(l, w, h, [cutsize], [cutpath], [gap], [inverse], [$slop=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  

><code>[partition\_cut\_mask](partitions.scad#module-partition_cut_mask)(l, [cutsize], [cutpath], [gap], [inverse], [$slop=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  

><code>[partition](partitions.scad#module-partition)(size, [spread], [cutsize], [cutpath], [gap], [spin], [$slop=]) CHILDREN;</code>  

><code>path = [partition\_path](partitions.scad#module-partition_path)(pathdesc, [repeat=], [y=], [altpath=], [seglen=], [segwidth=]);</code>  


## LibFile: miscellaneous.scad

### Section: Extrusion

><code>[extrude\_from\_to](miscellaneous.scad#module-extrude_from_to)(pt1, pt2, [convexity=], [twist=], [scale=], [slices=]) 2D-CHILDREN;</code>  

><code>[path\_extrude2d](miscellaneous.scad#module-path_extrude2d)(path, [caps=], [closed=], [s=], [convexity=]) 2D-CHILDREN;</code>  

><code>[path\_extrude](miscellaneous.scad#module-path_extrude)(path, [convexity], [clipsize]) 2D-CHILDREN;</code>  

><code>[cylindrical\_extrude](miscellaneous.scad#module-cylindrical_extrude)(ir|id=, or|od=, [size=], [convexity=], [spin=], [orient=]) 2D-CHILDREN;</code>  


### Section: Bounding Box

><code>[bounding\_box](miscellaneous.scad#module-bounding_box)([excess],[planar]) CHILDREN;</code>  


### Section: Hull Based Modules

><code>[chain\_hull](miscellaneous.scad#module-chain_hull)() CHILDREN;</code>  


### Section: Minkowski and 3D Offset

><code>[minkowski\_difference](miscellaneous.scad#module-minkowski_difference)() { BASE; DIFF1; DIFF2; ... }</code>  

><code>[offset3d](miscellaneous.scad#module-offset3d)(r, [size], [convexity]) CHILDREN;</code>  

><code>[round3d](miscellaneous.scad#module-round3d)(r) CHILDREN;</code>  &nbsp; &nbsp; <code>[round3d](miscellaneous.scad#module-round3d)(or) CHILDREN;</code>  &nbsp; &nbsp; <code>[round3d](miscellaneous.scad#module-round3d)(ir) CHILDREN;</code>  
><code>[round3d](miscellaneous.scad#module-round3d)(or, ir) CHILDREN;</code>  


## LibFile: paths.scad

### Section: Utility Functions

><code>[is\_path](paths.scad#function-is_path)(list, [dim], [fast])</code>  

><code>bool = [is\_1region](paths.scad#function-is_1region)(path, [name])</code>  

><code>outpath = [force\_path](paths.scad#function-force_path)(path, [name])</code>  

><code>newpath = [path\_merge\_collinear](paths.scad#function-path_merge_collinear)(path, [eps]);</code>  

><code>ind = path\_merge\_collinear(path, [eps]);</code>  


### Section: Path length calculation

><code>[path\_length](paths.scad#function-path_length)(path,[closed])</code>  

><code>[path\_segment\_lengths](paths.scad#function-path_segment_lengths)(path,[closed])</code>  

><code>fracs = [path\_length\_fractions](paths.scad#function-path_length_fractions)(path, [closed]);</code>  


### Section: Resampling - changing the number of points in a path

><code>newpath = [subdivide\_path](paths.scad#function-subdivide_path)(path, n|refine=|maxlen=, [method=], [closed=], [exact=]);</code>  

><code>newpath = [resample\_path](paths.scad#function-resample_path)(path, n|spacing=, [closed=]);</code>  

><code>newpath = [simplify\_path](paths.scad#function-simplify_path)(path, maxerr, [closed=]);</code>  


### Section: Path Geometry

><code>bool = [is\_path\_simple](paths.scad#function-is_path_simple)(path, [closed], [eps]);</code>  

><code>index\_pt = [path\_closest\_point](paths.scad#function-path_closest_point)(path, pt);</code>  

><code>tangs = [path\_tangents](paths.scad#function-path_tangents)(path, [closed], [uniform]);</code>  

><code>norms = [path\_normals](paths.scad#function-path_normals)(path, [tangents], [closed]);</code>  

><code>curvs = [path\_curvature](paths.scad#function-path_curvature)(path, [closed]);</code>  

><code>torsions = [path\_torsion](paths.scad#function-path_torsion)(path, [closed]);</code>  

><code>normals = [surface\_normals](paths.scad#function-surface_normals)(surf, [col\_wrap=], [row\_wrap=]);</code>  


### Section: Breaking paths up into subpaths

><code>path\_list = [path\_cut](paths.scad#function-path_cut)(path, cutdist, [closed]);</code>  

><code>cuts = [path\_cut\_points](paths.scad#function-path_cut_points)(path, cutdist, [closed=], [direction=]);</code>  

><code>paths = [split\_path\_at\_self\_crossings](paths.scad#function-split_path_at_self_crossings)(path, [closed], [eps]);</code>  

><code>splitpolys = [polygon\_parts](paths.scad#function-polygon_parts)(poly, [nonzero], [eps]);</code>  


## LibFile: regions.scad

### Section: Regions

><code>bool = [is\_region](regions.scad#function-is_region)(x);</code>  

><code>bool = [is\_valid\_region](regions.scad#function-is_valid_region)(region, [eps]);</code>  

><code>bool = [is\_region\_simple](regions.scad#function-is_region_simple)(region, [eps]);</code>  

><code>region = [make\_region](regions.scad#function-make_region)(polys, [nonzero], [eps]);</code>  

><code>region = [force\_region](regions.scad#function-force_region)(poly)</code>  


### Section: Turning a region into geometry

><code>[region](regions.scad#module-region)(r, [anchor], [spin=], [cp=], [atype=]) [ATTACHMENTS];</code>  

><code>[debug\_region](regions.scad#module-debug_region)(region, [vertices=], [edges=], [convexity=], [size=]);</code>  


### Section: Geometrical calculations with regions

><code>check = [point\_in\_region](regions.scad#function-point_in_region)(point, region, [eps]);</code>  

><code>area = [region\_area](regions.scad#function-region_area)(region);</code>  

><code>b = [are\_regions\_equal](regions.scad#function-are_regions_equal)(region1, region2, [either\_winding])</code>  


### Section: Breaking up regions into subregions

><code>split\_region = [split\_region\_at\_region\_crossings](regions.scad#function-split_region_at_region_crossings)(region1, region2, [closed1], [closed2], [eps])</code>  

><code>rgns = [region\_parts](regions.scad#function-region_parts)(region);</code>  


### Section: Offset and 2D Boolean Set Operations

><code>[offset](regions.scad#function-offset)path = [offset](regions.scad#function-offset)(path, [r=|delta=], [chamfer=], [closed=], [check\_valid=], [quality=], [error=], [same\_length=])</code>  
><code>path\_faces = [offset](regions.scad#function-offset)(path, return\_faces=true, [r=|delta=], [chamfer=], [closed=], [check\_valid=], [quality=], [error=], [firstface\_index=], [flip\_faces=])</code>  

><code>[union](regions.scad#functionmodule-union)() CHILDREN;</code>  &nbsp; &nbsp; <code>region = [union](regions.scad#functionmodule-union)(regions);</code>  &nbsp; &nbsp; <code>region = [union](regions.scad#functionmodule-union)(REGION1,REGION2);</code>  
><code>region = [union](regions.scad#functionmodule-union)(REGION1,REGION2,REGION3);</code>  

><code>[difference](regions.scad#functionmodule-difference)() CHILDREN;</code>  &nbsp; &nbsp; <code>region = [difference](regions.scad#functionmodule-difference)(regions);</code>  
><code>region = [difference](regions.scad#functionmodule-difference)(REGION1,REGION2);</code>  
><code>region = [difference](regions.scad#functionmodule-difference)(REGION1,REGION2,REGION3);</code>  

><code>[intersection](regions.scad#functionmodule-intersection)() CHILDREN;</code>  &nbsp; &nbsp; <code>region = [intersection](regions.scad#functionmodule-intersection)(regions);</code>  
><code>region = [intersection](regions.scad#functionmodule-intersection)(REGION1,REGION2);</code>  
><code>region = [intersection](regions.scad#functionmodule-intersection)(REGION1,REGION2,REGION3);</code>  

><code>[exclusive\_or](regions.scad#functionmodule-exclusive_or)() CHILDREN;</code>  &nbsp; &nbsp; <code>region = [exclusive\_or](regions.scad#functionmodule-exclusive_or)(regions);</code>  
><code>region = [exclusive\_or](regions.scad#functionmodule-exclusive_or)(REGION1,REGION2);</code>  
><code>region = [exclusive\_or](regions.scad#functionmodule-exclusive_or)(REGION1,REGION2,REGION3);</code>  

><code>path = [hull\_region](regions.scad#functionmodule-hull_region)(region);</code>  &nbsp; &nbsp; <code>[hull\_region](regions.scad#functionmodule-hull_region)(region);</code>  

><code>[fill](regions.scad#function-fill)ed = [fill](regions.scad#function-fill)(region);</code>  


## LibFile: skin.scad

### Section: Skin and sweep

><code>[skin](skin.scad#functionmodule-skin)(profiles, slices, [z=], [refine=], [method=], [sampling=], [caps=], [closed=], [style=], [convexity=], [anchor=],[cp=],[spin=],[orient=],[atype=]) [ATTACHMENTS];</code>  
><code>vnf = [skin](skin.scad#functionmodule-skin)(profiles, slices, [z=], [refine=], [method=], [sampling=], [caps=], [closed=], [style=], [anchor=],[cp=],[spin=],[orient=],[atype=]);</code>  

><code>[linear\_sweep](skin.scad#functionmodule-linear_sweep)(region, [height], [center=], [slices=], [twist=], [scale=], [style=], [caps=], [convexity=]) [ATTACHMENTS];</code>  
><code>[linear\_sweep](skin.scad#functionmodule-linear_sweep)(region, [height], [center=], texture=, [tex\_size=]|[tex\_reps=], [tex\_depth=], [style=], [tex\_samples=], ...) [ATTACHMENTS];</code>  
><code>vnf = [linear\_sweep](skin.scad#functionmodule-linear_sweep)(region, [height], [center=], [slices=], [twist=], [scale=], [style=], [caps=]);</code>  
><code>vnf = [linear\_sweep](skin.scad#functionmodule-linear_sweep)(region, [height], [center=], texture=, [tex\_size=]|[tex\_reps=], [tex\_depth=], [style=], [tex\_samples=], ...);</code>  

><code>vnf = [rotate\_sweep](skin.scad#functionmodule-rotate_sweep)(shape, [angle], ...);</code>  
><code>[rotate\_sweep](skin.scad#functionmodule-rotate_sweep)(shape, [angle], ...) [ATTACHMENTS];</code>  
><code>[rotate\_sweep](skin.scad#functionmodule-rotate_sweep)(shape, texture=, [tex\_size=]|[tex\_reps=], [tex\_depth=], [tex\_samples=], [tex\_rot=], [tex\_inset=], ...) [ATTACHMENTS];</code>  

><code>[spiral\_sweep](skin.scad#functionmodule-spiral_sweep)(poly, h, r|d=, turns, [taper=], [center=], [taper1=], [taper2=], [internal=], ...)[ATTACHMENTS];</code>  
><code>[spiral\_sweep](skin.scad#functionmodule-spiral_sweep)(poly, h, r1=|d1=, r2=|d2=, turns, [taper=], [center=], [taper1=], [taper2=], [internal=], ...)[ATTACHMENTS];</code>  
><code>vnf = [spiral\_sweep](skin.scad#functionmodule-spiral_sweep)(poly, h, r|d=, turns, ...);</code>  
><code>vnf = [spiral\_sweep](skin.scad#functionmodule-spiral_sweep)(poly, h, r1=|d1=, r1=|d2=, turns, ...);</code>  

><code>[path\_sweep](skin.scad#functionmodule-path_sweep)(shape, path, [method], [normal=], [closed=], [twist=], [twist\_by\_length=], [symmetry=], [scale=], [scale\_by\_length=], [last\_normal=], [tangent=], [uniform=], [relaxed=], [caps=], [style=], [convexity=], [anchor=], [cp=], [spin=], [orient=], [atype=]) [ATTACHMENTS];</code>  
><code>vnf = [path\_sweep](skin.scad#functionmodule-path_sweep)(shape, path, [method], [normal=], [closed=], [twist=], [twist\_by\_length=], [symmetry=], [scale=], [scale\_by\_length=], [last\_normal=], [tangent=], [uniform=], [relaxed=], [caps=], [style=], [transforms=], [anchor=], [cp=], [spin=], [orient=], [atype=]);</code>  

><code>[path\_sweep2d](skin.scad#functionmodule-path_sweep2d)(shape, path, [closed], [caps], [quality], [style], [convexity=], [anchor=], [spin=], [orient=], [atype=], [cp=]) [ATTACHMENTS];</code>  
><code>vnf = [path\_sweep2d](skin.scad#functionmodule-path_sweep2d)(shape, path, [closed], [caps], [quality], [style], [anchor=], [spin=], [orient=], [atype=], [cp=]);</code>  

><code>[sweep](skin.scad#functionmodule-sweep)(shape, transforms, [closed], [caps], [style], [convexity=], [anchor=], [spin=], [orient=], [atype=]) [ATTACHMENTS];</code>  
><code>vnf = [sweep](skin.scad#functionmodule-sweep)(shape, transforms, [closed], [caps], [style], [anchor=], [spin=], [orient=], [atype=]);</code>  


### Section: Attaching children to sweeps

><code>path\_sweep(...) { [sweep\_attach](skin.scad#module-sweep_attach)(parent, [child], [frac], [idx=], [len=], [spin=], [overlap=], [atype=]) CHILDREN; }</code>  
><code>sweep(...) { [sweep\_attach](skin.scad#module-sweep_attach)(parent, [child], [frac], [idx=], [len=], [spin=], [overlap=], [atype=]) CHILDREN; }</code>  


### Section: Functions for resampling and slicing profile lists

><code>newprof = [subdivide\_and\_slice](skin.scad#function-subdivide_and_slice)(profiles, slices, [numpoints], [method], [closed]);</code>  

><code>profs = [slice\_profiles](skin.scad#function-slice_profiles)(profiles, slices, [closed]);</code>  

><code>rlist = [rot\_resample](skin.scad#function-rot_resample)(rotlist, n, [method=], [twist=], [scale=], [smoothlen=], [long=], [turns=], [closed=])</code>  

><code>newpoly = [associate\_vertices](skin.scad#function-associate_vertices)(polygons, split);</code>  


### Section: Texturing

><code>tx = [texture](skin.scad#function-texture)(tex, [n=], [inset=], [gap=], [roughness=]);</code>  


## LibFile: vnf.scad

### Section: Creating Polyhedrons with VNF Structures

><code>vnf = [vnf\_vertex\_array](vnf.scad#functionmodule-vnf_vertex_array)(points, [caps=], [cap1=], [cap2=], [style=], [reverse=], [col\_wrap=], [row\_wrap=], [triangulate=]);</code>  
><code>[vnf\_vertex\_array](vnf.scad#functionmodule-vnf_vertex_array)(points, [caps=], [cap1=], [cap2=], [style=], [reverse=], [col\_wrap=], [row\_wrap=], [triangulate=],...) [ATTACHMENTS];</code>  

><code>vnf = [vnf\_tri\_array](vnf.scad#functionmodule-vnf_tri_array)(points, [caps=], [cap1=], [cap2=], [reverse=], [col\_wrap=], [row\_wrap=], [limit\_bunching=])</code>  
><code>[vnf\_tri\_array](vnf.scad#functionmodule-vnf_tri_array)(points, [caps=], [cap1=], [cap2=], [reverse=], [col\_wrap=], [row\_wrap=], [limit\_bunching=],...) [ATTACHMENTS];</code>  

><code>vnf = [vnf\_join](vnf.scad#function-vnf_join)([VNF, VNF, VNF, ...]);</code>  

><code>vnf = [vnf\_from\_polygons](vnf.scad#function-vnf_from_polygons)(polygons, [eps]);</code>  

><code>vnf = [vnf\_from\_region](vnf.scad#function-vnf_from_region)(region, [transform], [reverse]);</code>  


### Section: VNF Testing and Access

><code>bool = [is\_vnf](vnf.scad#function-is_vnf)(x);</code>  


### Section: Altering the VNF Internals

><code>rvnf = [vnf\_reverse\_faces](vnf.scad#function-vnf_reverse_faces)(vnf);</code>  

><code>vnf2 = [vnf\_quantize](vnf.scad#function-vnf_quantize)(vnf,[q]);</code>  

><code>new\_vnf = [vnf\_merge\_points](vnf.scad#function-vnf_merge_points)(vnf, [eps]);</code>  

><code>clean\_vnf = [vnf\_drop\_unused\_points](vnf.scad#function-vnf_drop_unused_points)(vnf);</code>  

><code>vnf2 = [vnf\_triangulate](vnf.scad#function-vnf_triangulate)(vnf);</code>  

><code>newvnf = [vnf\_unify\_faces](vnf.scad#function-vnf_unify_faces)(vnf);</code>  

><code>sliced = [vnf\_slice](vnf.scad#function-vnf_slice)(vnf, dir, cuts);</code>  


### Section: Turning a VNF into geometry

><code>[vnf\_polyhedron](vnf.scad#module-vnf_polyhedron)(vnf) [ATTACHMENTS];</code>  
><code>[vnf\_polyhedron](vnf.scad#module-vnf_polyhedron)([VNF, VNF, VNF, ...]) [ATTACHMENTS];</code>  

><code>[vnf\_wireframe](vnf.scad#module-vnf_wireframe)(vnf, [width]);</code>  


### Section: Operations on VNFs

><code>vol = [vnf\_volume](vnf.scad#function-vnf_volume)(vnf);</code>  

><code>area = [vnf\_area](vnf.scad#function-vnf_area)(vnf);</code>  

><code>min\_max = [vnf\_bounds](vnf.scad#function-vnf_bounds)(vnf, [fast]);</code>  

><code>region = [projection](vnf.scad#function-projection)(vnf, [cut], [z]);</code>  

><code>newvnf = [vnf\_halfspace](vnf.scad#function-vnf_halfspace)(plane, vnf, [closed], [boundary]);</code>  

><code>bentvnf = [vnf\_bend](vnf.scad#function-vnf_bend)(vnf,r|d=,[axis=]);</code>  

><code>[vnf\_hull](vnf.scad#functionmodule-vnf_hull) = hull\_vnf(vnf);</code>  &nbsp; &nbsp; <code>[vnf\_hull](vnf.scad#functionmodule-vnf_hull)(vnf,[fast]);</code>  

><code>boundary = [vnf\_boundary](vnf.scad#function-vnf_boundary)(vnf, [merge=], [idx=]);</code>  

><code>newvnf = vnf(vnf, delta, [merge=]);</code>  

><code>newvnf = [vnf\_sheet](vnf.scad#function-vnf_sheet)(vnf, delta, [style=], [merge=]);</code>  


### Section: Debugging Polyhedrons

><code>[debug\_vnf](vnf.scad#module-debug_vnf)(vnfs, [faces=], [vertices=], [opacity=], [size=], [convexity=], [filter=]);</code>  

><code>[vnf\_validate](vnf.scad#module-vnf_validate)(vnf, [size], [show\_warns=], [check\_isects=], [big\_face=], [opacity=], [adjacent=], [label\_verts=], [label\_faces=], [wireframe=]);</code>  


## LibFile: beziers.scad

### Section: Bezier Curves

><code>pt = [bezier\_points](beziers.scad#function-bezier_points)(bezier, u);</code>  &nbsp; &nbsp; <code>ptlist = [bezier\_points](beziers.scad#function-bezier_points)(bezier, RANGE);</code>  
><code>ptlist = [bezier\_points](beziers.scad#function-bezier_points)(bezier, LIST);</code>  

><code>path = [bezier\_curve](beziers.scad#function-bezier_curve)(bezier, [splinesteps], [endpoint]);</code>  

><code>deriv = [bezier\_derivative](beziers.scad#function-bezier_derivative)(bezier, u, [order]);</code>  
><code>derivs = [bezier\_derivative](beziers.scad#function-bezier_derivative)(bezier, LIST, [order]);</code>  
><code>derivs = [bezier\_derivative](beziers.scad#function-bezier_derivative)(bezier, RANGE, [order]);</code>  

><code>tanvec = [bezier\_tangent](beziers.scad#function-bezier_tangent)(bezier, u);</code>  &nbsp; &nbsp; <code>tanvecs = [bezier\_tangent](beziers.scad#function-bezier_tangent)(bezier, LIST);</code>  
><code>tanvecs = [bezier\_tangent](beziers.scad#function-bezier_tangent)(bezier, RANGE);</code>  

><code>crv = [bezier\_curvature](beziers.scad#function-bezier_curvature)(curve, u);</code>  &nbsp; &nbsp; <code>crvlist = [bezier\_curvature](beziers.scad#function-bezier_curvature)(curve, LIST);</code>  
><code>crvlist = [bezier\_curvature](beziers.scad#function-bezier_curvature)(curve, RANGE);</code>  

><code>u = [bezier\_closest\_point](beziers.scad#function-bezier_closest_point)(bezier, pt, [max\_err]);</code>  

><code>pathlen = [bezier\_length](beziers.scad#function-bezier_length)(bezier, [start\_u], [end\_u], [max\_deflect]);</code>  

><code>u = [bezier\_line\_intersection](beziers.scad#function-bezier_line_intersection)(bezier, line);</code>  


### Section: Bezier Path Functions

><code>pt = [bezpath\_points](beziers.scad#function-bezpath_points)(bezpath, curveind, u, [N]);</code>  
><code>ptlist = [bezpath\_points](beziers.scad#function-bezpath_points)(bezpath, curveind, LIST, [N]);</code>  
><code>path = [bezpath\_points](beziers.scad#function-bezpath_points)(bezpath, curveind, RANGE, [N]);</code>  

><code>path = [bezpath\_curve](beziers.scad#function-bezpath_curve)(bezpath, [splinesteps], [N], [endpoint], [order=])</code>  

><code>res = [bezpath\_closest\_point](beziers.scad#function-bezpath_closest_point)(bezpath, pt, [N], [max\_err]);</code>  

><code>plen = [bezpath\_length](beziers.scad#function-bezpath_length)(path, [N], [max\_deflect]);</code>  

><code>bezpath = [path\_to\_bezpath](beziers.scad#function-path_to_bezpath)(path, [closed], [tangents], [uniform], [size=]|[relsize=]);</code>  

><code>bezpath = [bezpath\_close\_to\_axis](beziers.scad#function-bezpath_close_to_axis)(bezpath, [axis], [N]);</code>  

><code>bezpath = [bezpath\_offset](beziers.scad#function-bezpath_offset)(offset, bezier, [N]);</code>  


### Section: Cubic Bezier Path Construction

><code>pts = [bez\_begin](beziers.scad#function-bez_begin)(pt, a, r, [p=]);</code>  &nbsp; &nbsp; <code>pts = [bez\_begin](beziers.scad#function-bez_begin)(pt, VECTOR, [r], [p=]);</code>  

><code>pts = [bez\_tang](beziers.scad#function-bez_tang)(pt, a, r1, r2, [p=]);</code>  
><code>pts = [bez\_tang](beziers.scad#function-bez_tang)(pt, VECTOR, [r1], [r2], [p=]);</code>  

><code>pts = [bez\_joint](beziers.scad#function-bez_joint)(pt, a1, a2, r1, r2, [p1=], [p2=]);</code>  
><code>pts = [bez\_joint](beziers.scad#function-bez_joint)(pt, VEC1, VEC2, [r1=], [r2=], [p1=], [p2=]);</code>  

><code>pts = [bez\_end](beziers.scad#function-bez_end)(pt, a, r, [p=]);</code>  &nbsp; &nbsp; <code>pts = [bez\_end](beziers.scad#function-bez_end)(pt, VECTOR, [r], [p=]);</code>  


### Section: Bezier Surfaces

><code>bool = [is\_bezier\_patch](beziers.scad#function-is_bezier_patch)(x);</code>  

><code>patch = [bezier\_patch\_flat](beziers.scad#function-bezier_patch_flat)(size, [N=], [spin=], [orient=], [trans=]);</code>  

><code>rpatch = [bezier\_patch\_reverse](beziers.scad#function-bezier_patch_reverse)(patch);</code>  

><code>pt = [bezier\_patch\_points](beziers.scad#function-bezier_patch_points)(patch, u, v);</code>  
><code>ptgrid = [bezier\_patch\_points](beziers.scad#function-bezier_patch_points)(patch, LIST, LIST);</code>  
><code>ptgrid = [bezier\_patch\_points](beziers.scad#function-bezier_patch_points)(patch, RANGE, RANGE);</code>  

><code>vnf = [bezier\_vnf](beziers.scad#function-bezier_vnf)(patches, [splinesteps], [style]);</code>  

><code>vnf = [bezier\_vnf\_degenerate\_patch](beziers.scad#function-bezier_vnf_degenerate_patch)(patch, [splinesteps], [reverse]);</code>  
><code>vnf\_edges = [bezier\_vnf\_degenerate\_patch](beziers.scad#function-bezier_vnf_degenerate_patch)(patch, [splinesteps], [reverse], return\_edges=true);</code>  

><code>n = [bezier\_patch\_normals](beziers.scad#function-bezier_patch_normals)(patch, u, v);</code>  
><code>ngrid = [bezier\_patch\_normals](beziers.scad#function-bezier_patch_normals)(patch, LIST, LIST);</code>  
><code>ngrid = [bezier\_patch\_normals](beziers.scad#function-bezier_patch_normals)(patch, RANGE, RANGE);</code>  

><code>vnf = [bezier\_sheet](beziers.scad#function-bezier_sheet)(patch, delta, [splinesteps=], [style=]);</code>  

><code>[bezier\_sweep](beziers.scad#functionmodule-bezier_sweep)(shape, bezier, [splinesteps], [method], [endpoint=], [normal=], [closed=], [twist=], [twist\_by\_length=], [symmetry=], [scale=], [scale\_by\_length=], [last\_normal=], [caps=], [style=], [convexity=], [anchor=], [cp=], [spin=], [orient=], [atype=]) [ATTACHMENTS];</code>  
><code>vnf = path\_sweep(shape, bezier, [splinesteps], [method], [endpoint=], [normal=], [closed=], [twist=], [twist\_by\_length=], [symmetry=], [scale=], [scale\_by\_length=], [last\_normal=], [caps=], [style=], [transforms=], [anchor=], [cp=], [spin=], [orient=], [atype=]);</code>  

><code>bezier\_sweep(shape, bezier, [splinesteps], [method], [endpoint=], [normal=], [closed=], [twist=], [twist\_by\_length=], [symmetry=], [scale=], [scale\_by\_length=], [last\_normal=], [caps=], [style=], [convexity=], [anchor=], [cp=], [spin=], [orient=], [atype=]) [ATTACHMENTS];</code>  
><code>vnf = path\_sweep(shape, bezier, [splinesteps], [method], [endpoint=], [normal=], [closed=], [twist=], [twist\_by\_length=], [symmetry=], [scale=], [scale\_by\_length=], [last\_normal=], [caps=], [style=], [transforms=], [anchor=], [cp=], [spin=], [orient=], [atype=]);</code>  


### Section: Debugging Beziers

><code>[debug\_bezier](beziers.scad#module-debug_bezier)(bez, [size], [N=]);</code>  

><code>[debug\_bezier\_patches](beziers.scad#module-debug_bezier_patches)(patches, [size=], [splinesteps=], [showcps=], [showdots=], [showpatch=], [convexity=], [style=]);</code>  


## LibFile: nurbs.scad

### Section: NURBS Curves

><code>pts = [nurbs\_curve](nurbs.scad#function-nurbs_curve)(control, degree, splinesteps, [mult=], [weights=], [type=], [knots=]);</code>  
><code>pts = [nurbs\_curve](nurbs.scad#function-nurbs_curve)(control, degree, u=, [mult=], [weights=], [type=], [knots=]);</code>  

><code>[debug\_nurbs](nurbs.scad#module-debug_nurbs)(control, degree, [width], [splinesteps=], [type=], [mult=], [knots=], [size=], [show\_weights=], [show\_knots=], [show\_idx=]);</code>  

><code>nurbs\_param = [nurbs\_interp](nurbs.scad#function-nurbs_interp)(points, degree, [method=], [closed=], [start\_deriv=], [end\_deriv=], [curvature=], [start\_curvature=], [end\_curvature=], [corners=], [deriv=], [extra\_pts=], [smooth=]);</code>  

><code>[debug\_nurbs\_interp](nurbs.scad#module-debug_nurbs_interp)(points, degree, [splinesteps=], [method=], [closed=], [deriv=], [start\_deriv=], [end\_deriv=], [curvature=], [start\_curvature=], [end\_curvature=], [corners=], [extra\_pts=], [smooth=], [width=], [size=], [data\_size=], [data\_index=], [show\_control=], [control\_index=], [show\_knots=], [show\_deriv=], [show\_curvature=]);</code>  

><code>result = [nurbs\_elevate\_degree](nurbs.scad#function-nurbs_elevate_degree)(control, degree, [knots=], [mult=], [type=], [times=], [weights=]);</code>  
><code>result = [nurbs\_elevate\_degree](nurbs.scad#function-nurbs_elevate_degree)(nurbs\_param\_list, [times=]);</code>  


### Section: NURBS Surfaces

><code>bool = [is\_nurbs\_patch](nurbs.scad#function-is_nurbs_patch)(x);</code>  

><code>pointgrid = [nurbs\_patch\_points](nurbs.scad#function-nurbs_patch_points)(patch, degree, [splinesteps], [u=], [v=], [weights=], [type=], [mult=], [knots=]);</code>  

><code>vnf = [nurbs\_vnf](nurbs.scad#functionmodule-nurbs_vnf)(patch, degree, [splinesteps], [mult=], [knots=], [weights=], [type=], [style=], [reverse=], [triangulate=], [caps=], [caps1=], [caps2=]);</code>  
><code>[nurbs\_vnf](nurbs.scad#functionmodule-nurbs_vnf)(patch, degree, [splinesteps], [mult=], [knots=], [weights=], [type=], [style=], [reverse=], [triangulate=], [caps=], [caps1=], [caps2=], [convexity=],[atype=],[cp=], [cp=], [atype=], ...) CHILDREN;</code>  

><code>nurbs\_param = [nurbs\_interp\_surface](nurbs.scad#functionmodule-nurbs_interp_surface)(points, degree, [method=], [row\_wrap=], [col\_wrap=], [normal1=], [normal2=], [flat\_edges=], [flat\_end1=], [flat\_end2=], [row\_edges=], [col\_edges=], [extra\_pts=], [smooth=], [first\_row\_deriv=], [last\_row\_deriv=], [first\_col\_deriv=], [last\_col\_deriv=]);</code>  
><code>[nurbs\_interp\_surface](nurbs.scad#functionmodule-nurbs_interp_surface)(points, degree, [splinesteps=], [row\_wrap=], [col\_wrap=], [method=], [extra\_pts=], [smooth=], ...) CHILDREN;</code>  


## LibFile: rounding.scad

### Section: Rounding Paths

><code>rounded\_path = [round\_corners](rounding.scad#function-round_corners)(path, [method], [radius=], [cut=], [joint=], [closed=], [verbose=]);</code>  

><code>smoothed = [smooth\_path](rounding.scad#function-smooth_path)(path, [tangents], [size=|relsize=], [method="edges"], [splinesteps=], [closed=], [uniform=]);</code>  
><code>smoothed = [smooth\_path](rounding.scad#function-smooth_path)(path, [size=|relsize=], method="corners", [splinesteps=], [closed=]);</code>  

><code>joined\_path = [path\_join](rounding.scad#function-path_join)(paths, [joint], [k=], [relocate=], [closed=]);</code>  

><code>[offset\_stroke](rounding.scad#functionmodule-offset_stroke)(path, [width], [rounded=], [chamfer=], [start=], [end=], [check\_valid=], [quality=], [closed=],...) [ATTACHMENTS];</code>  
><code>path = [offset\_stroke](rounding.scad#functionmodule-offset_stroke)(path, [width], closed=false, [rounded=], [chamfer=], [start=], [end=], [check\_valid=], [quality=],...);</code>  
><code>region = [offset\_stroke](rounding.scad#functionmodule-offset_stroke)(path, [width], closed=true, [rounded=], [chamfer=], [start=], [end=], [check\_valid=], [quality=],...);</code>  


### Section: Three-Dimensional Rounding

><code>[offset\_sweep](rounding.scad#functionmodule-offset_sweep)(path, [height|length=|h=|l=], [bottom], [top], [offset=], [convexity=],...) [ATTACHMENTS];</code>  
><code>vnf = [offset\_sweep](rounding.scad#functionmodule-offset_sweep)(path, [height|length=|h=|l=], [bottom], [top], [offset=], ...);</code>  

><code>[convex\_offset\_extrude](rounding.scad#module-convex_offset_extrude)(height, [bottom], [top], ...) 2D-CHILDREN;</code>  

><code>[rounded\_prism](rounding.scad#functionmodule-rounded_prism)(bottom, [top], [height=|h=|length=|l=], [joint\_top=], [joint\_bot=], [joint\_sides=], [k=], [k\_top=], [k\_bot=], [k\_sides=], [splinesteps=], [debug=], [convexity=],...) [ATTACHMENTS];</code>  
><code>vnf = [rounded\_prism](rounding.scad#functionmodule-rounded_prism)(bottom, [top], [height=|h=|length=|l=], [joint\_top=], [joint\_bot=], [joint\_sides=], [k=], [k\_top=], [k\_bot=], [k\_sides=], [splinesteps=], [debug=]);</code>  

><code>[bent\_cutout\_mask](rounding.scad#module-bent_cutout_mask)(r|radius, thickness, path);</code>  

><code>[join\_prism](rounding.scad#functionmodule-join_prism)(polygon, base, length=|height=|l=|h=, fillet=, [base\_T=], [scale=], [prism\_end\_T=], [short=], ...) [ATTACHMENTS];</code>  
><code>[join\_prism](rounding.scad#functionmodule-join_prism)(polygon, base, aux=, fillet=, [base\_T=], [aux\_T=], [scale=], [prism\_end\_T=], [short=], ...) [ATTACHMENTS];</code>  
><code>vnf = [join\_prism](rounding.scad#functionmodule-join_prism)( ... );</code>  

><code>[prism\_connector](rounding.scad#module-prism_connector)(profile, desc1, anchor1, desc2, anchor2, [fillet=], [fillet1=], [fillet2=], [spin\_align=], [scale=], [shift1=], [shift2]=, [shift=], [n=], [n1=], [n2=], [k=], [k1=], [k2=], [uniform=], [uniform1=], [uniform2=], [overlap=], [overlap1=], [overlap2=], [smooth\_normals=], [smooth\_normals=], [smooth\_normals1]=, [smooth\_normals2=], [debug=], [debug\_pos=]);</code>  

><code>PARENT() [attach\_prism](rounding.scad#module-attach_prism)(profile, anchor, [fillet], [rounding], [l=/h=/length=/height=], [endpoint=], [T=], [shift=], [scale=], [inside=], [n=], [n\_base=], [n\_end=], [k=], [k\_base=], [k\_end=], [overlap=], [uniform=], [smooth\_normals=], [edge\_r=], [edge\_joint=], [edge\_k=], [debug=] ) CHILDREN;</code>  


## LibFile: turtle3d.scad

### Section: Functions

><code>path = [turtle3d](turtle3d.scad#function-turtle3d)(commands, [state=], [repeat=]);</code>  
><code>mats = [turtle3d](turtle3d.scad#function-turtle3d)(commands, transforms=true, [state=], [repeat=]);</code>  
><code>state = [turtle3d](turtle3d.scad#function-turtle3d)(commands, full\_state=true, [state=], [repeat=]);</code>  


## LibFile: isosurface.scad

### Section: Metaballs

><code>[metaballs](isosurface.scad#functionmodule-metaballs)(spec, bounding\_box, voxel\_size, [isovalue=], [closed=], [exact\_bounds=], [convexity=], [show\_stats=], [show\_box=], [debug=] ...) [ATTACHMENTS];</code>  
><code>vnf = [metaballs](isosurface.scad#functionmodule-metaballs)(spec, bounding\_box, voxel\_size, [isovalue=], [closed=], [exact\_bounds=], [convexity=], [show\_stats=]);</code>  

><code>[metaballs2d](isosurface.scad#functionmodule-metaballs2d)(spec, bounding\_box, pixel\_size, [isovalue=], [use\_centers=], [smoothing=], [exact\_bounds=], [show\_stats=], [show\_box=], [debug=] ...) [ATTACHMENTS];</code>  
><code>region = [metaballs2d](isosurface.scad#functionmodule-metaballs2d)(spec, bounding\_box, pixel\_size, [isovalue=], [closed=], [use\_centers=], [smoothing=], [exact\_bounds=], [show\_stats=]);</code>  


### Section: Isosurfaces (3D) and contours (2D)

><code>[isosurface](isosurface.scad#functionmodule-isosurface)(f, isovalue, bounding\_box, voxel\_size, [voxel\_count=], [reverse=], [closed=], [exact\_bounds=], [show\_stats=], ...) [ATTACHMENTS];</code>  
><code>vnf = [isosurface](isosurface.scad#functionmodule-isosurface)(f, isovalue, bounding\_box, voxel\_size, [voxel\_count=], [reverse=], [closed=], [exact\_bounds=], [show\_stats=]);</code>  

><code>[contour](isosurface.scad#functionmodule-contour)(f, isovalue, bounding\_box, pixel\_size, [pixel\_count=], [use\_centers=], [smoothing=], [exact\_bounds=], [show\_stats=], [show\_box=], ...) [ATTACHMENTS];</code>  
><code>region = [contour](isosurface.scad#functionmodule-contour)(f, isovalue, bounding\_box, pixel\_size, [pixel\_count=], [pc\_centers=], [smoothing=], [closed=], [show\_stats=]);</code>  


## LibFile: math.scad

### Section: Math Constants

Constants: [`PHI`](math.scad#constant-phi) [`EPSILON`](math.scad#constant-epsilon) [`INF`](math.scad#constant-inf) [`NAN`](math.scad#constant-nan)

### Section: Interpolation and Counting

><code>list = [count](math.scad#function-count)(n, [s], [step], [reverse]);</code>  

><code>x = [lerp](math.scad#function-lerp)(a, b, u);</code>  &nbsp; &nbsp; <code>l = [lerp](math.scad#function-lerp)(a, b, LIST);</code>  

><code>x = [lerpn](math.scad#function-lerpn)(a, b, n);</code>  &nbsp; &nbsp; <code>x = [lerpn](math.scad#function-lerpn)(a, b, n, [endpoint]);</code>  

><code>x = [bilerp](math.scad#function-bilerp)(pts, x, y);</code>  

><code>interp\_vector = [slerp](math.scad#function-slerp)(v1, v2, u);</code>  

><code>vec\_list = [slerpn](math.scad#function-slerpn)(v1, v2, n);</code>  
><code>vec\_list = [slerpn](math.scad#function-slerpn)(v1, v2, n, [endpoint]);</code>  


### Section: Miscellaneous Functions

><code>x2 = [sqr](math.scad#function-sqr)(x);</code>  

><code>val = [log2](math.scad#function-log2)(x);</code>  

><code>l = [hypot](math.scad#function-hypot)(x, y, [z]);</code>  

><code>x = [factorial](math.scad#function-factorial)(n, [d]);</code>  

><code>x = [binomial](math.scad#function-binomial)(n);</code>  

><code>x = [binomial\_coefficient](math.scad#function-binomial_coefficient)(n, k);</code>  

><code>x = [gcd](math.scad#function-gcd)(a,b)</code>  

><code>div = [lcm](math.scad#function-lcm)(a, b);</code>  &nbsp; &nbsp; <code>divs = [lcm](math.scad#function-lcm)(list);</code>  


### Section: Hyperbolic Trigonometry

><code>a = [sinh](math.scad#function-sinh)(x);</code>  

><code>a = [cosh](math.scad#function-cosh)(x);</code>  

><code>a = [tanh](math.scad#function-tanh)(x);</code>  

><code>a = [asinh](math.scad#function-asinh)(x);</code>  

><code>a = [acosh](math.scad#function-acosh)(x);</code>  

><code>a = [atanh](math.scad#function-atanh)(x);</code>  


### Section: Quantization

><code>num = [quant](math.scad#function-quant)(x, y);</code>  

><code>num = [quantdn](math.scad#function-quantdn)(x, y);</code>  

><code>num = [quantup](math.scad#function-quantup)(x, y);</code>  


### Section: Constraints and Modulos

><code>vals = [constrain](math.scad#function-constrain)(v, minval, maxval);</code>  

><code>mod = [posmod](math.scad#function-posmod)(x, m)</code>  

><code>ang = [modang](math.scad#function-modang)(x);</code>  

><code>half\_ang = [mean\_angle](math.scad#function-mean_angle)(angle1,angle2);</code>  

><code>a = [fit\_to\_range](math.scad#function-fit_to_range)(M, minval, maxval);</code>  


### Section: Operations on Lists (Sums, Mean, Products)

><code>x = [sum](math.scad#function-sum)(v, [dflt]);</code>  

><code>x = [mean](math.scad#function-mean)(v);</code>  

><code>middle = [median](math.scad#function-median)(v)</code>  

><code>delts = [deltas](math.scad#function-deltas)(v,[wrap]);</code>  

><code>sums = [cumsum](math.scad#function-cumsum)(v);</code>  

><code>x = [product](math.scad#function-product)(v);</code>  

><code>prod\_list = [cumprod](math.scad#function-cumprod)(list, [right]);</code>  

><code>x = [convolve](math.scad#function-convolve)(p,q);</code>  

><code>[sum\_of\_sines](math.scad#function-sum_of_sines)(a,sines)</code>  


### Section: Random Number Generation

><code>[rand\_int](math.scad#function-rand_int)(minval, maxval, n, [seed]);</code>  

><code>points = [random\_points](math.scad#function-random_points)(n, dim, [scale], [seed]);</code>  

><code>arr = [gaussian\_rands](math.scad#function-gaussian_rands)([n],[mean], [cov], [seed]);</code>  

><code>arr = [exponential\_rands](math.scad#function-exponential_rands)([n], [lambda], [seed])</code>  

><code>points = [spherical\_random\_points](math.scad#function-spherical_random_points)([n], [radius], [seed]);</code>  

><code>points = [random\_polygon](math.scad#function-random_polygon)([n], [size], [angle\_sep], [seed]);</code>  


### Section: Calculus

><code>x = [deriv](math.scad#function-deriv)(data, [h], [closed])</code>  

><code>x = [deriv2](math.scad#function-deriv2)(data, [h], [closed])</code>  

><code>x = [deriv3](math.scad#function-deriv3)(data, [h], [closed])</code>  


### Section: Complex Numbers

><code>z = [complex](math.scad#function-complex)(list)</code>  

><code>c = [c\_mul](math.scad#function-c_mul)(z1,z2)</code>  

><code>x = [c\_div](math.scad#function-c_div)(z1,z2)</code>  

><code>w = [c\_conj](math.scad#function-c_conj)(z)</code>  

><code>x = [c\_real](math.scad#function-c_real)(z)</code>  

><code>x = [c\_imag](math.scad#function-c_imag)(z)</code>  

><code>I = [c\_ident](math.scad#function-c_ident)(n)</code>  

><code>n = [c\_norm](math.scad#function-c_norm)(z)</code>  


### Section: Polynomials

><code>roots = [quadratic\_roots](math.scad#function-quadratic_roots)(a, b, c, [real])</code>  

><code>x = [polynomial](math.scad#function-polynomial)(p, z)</code>  

><code>x = polymult(p,q)</code>  &nbsp; &nbsp; <code>x = polymult([p1,p2,p3,...])</code>  

><code>[quotient,remainder] = [poly\_div](math.scad#function-poly_div)(n,d)</code>  

><code>sum = [poly\_add](math.scad#function-poly_add)(p,q)</code>  

><code>roots = [poly\_roots](math.scad#function-poly_roots)(p, [tol]);</code>  

><code>roots = [real\_roots](math.scad#function-real_roots)(p, [eps], [tol])</code>  


### Section: Operations on Functions

><code>x = [root\_find](math.scad#function-root_find)(f, x0, x1, [tol])</code>  


## LibFile: linalg.scad

### Section: Matrix testing and display

><code>test = [is\_matrix](linalg.scad#function-is_matrix)(A, [m], [n], [square])</code>  

><code>b = [is\_matrix\_symmetric](linalg.scad#function-is_matrix_symmetric)(A, [eps])</code>  

><code>b = [is\_rotation](linalg.scad#function-is_rotation)(A, [dim], [centered])</code>  

><code>[echo\_matrix](linalg.scad#functionmodule-echo_matrix)(M, [description], [sig], [sep], [eps]);</code>  
><code>dummy = [echo\_matrix](linalg.scad#functionmodule-echo_matrix)(M, [description], [sig], [sep], [eps]),</code>  


### Section: Matrix indexing

><code>list = [column](linalg.scad#function-column)(M, i);</code>  

><code>mat = [submatrix](linalg.scad#function-submatrix)(M, idx1, idx2);</code>  


### Section: Matrix construction and modification

><code>mat = [ident](linalg.scad#function-ident)(n);</code>  

><code>mat = [diagonal\_matrix](linalg.scad#function-diagonal_matrix)(diag, [offdiag]);</code>  

><code>M = [transpose](linalg.scad#function-transpose)(M, [reverse]);</code>  

><code>M = [swap\_columns](linalg.scad#function-swap_columns)(M, i, j);</code>  

><code>x = [outer\_product](linalg.scad#function-outer_product)(u,v);</code>  &nbsp; &nbsp; <code>M = [outer\_product](linalg.scad#function-outer_product)(u,v);</code>  

><code>mat = [submatrix\_set](linalg.scad#function-submatrix_set)(M, A, [m], [n]);</code>  

><code>A = [hstack](linalg.scad#function-hstack)(M1, M2)</code>  &nbsp; &nbsp; <code>A = [hstack](linalg.scad#function-hstack)(M1, M2, M3)</code>  &nbsp; &nbsp; <code>A = [hstack](linalg.scad#function-hstack)([M1, M2, M3, ...])</code>  

><code>bmat = [block\_matrix](linalg.scad#function-block_matrix)([[M11, M12,...],[M21, M22,...], ... ]);</code>  


### Section: Solving Linear Equations and Matrix Factorizations

><code>solv = [linear\_solve](linalg.scad#function-linear_solve)(A,b,[pivot])</code>  

><code>x = [linear\_solve3](linalg.scad#function-linear_solve3)(A,b)</code>  

><code>mat = [matrix\_inverse](linalg.scad#function-matrix_inverse)(A)</code>  

><code>B = [rot\_inverse](linalg.scad#function-rot_inverse)(A)</code>  

><code>x = [null\_space](linalg.scad#function-null_space)(A)</code>  

><code>qr = [qr\_factor](linalg.scad#function-qr_factor)(A,[pivot]);</code>  

><code>lt\_u\_p = [lu\_factor](linalg.scad#function-lu_factor)(A);</code>  

><code>x = [back\_substitute](linalg.scad#function-back_substitute)(R, b, [transpose]);</code>  

><code>L = [cholesky](linalg.scad#function-cholesky)(A);</code>  


### Section: Matrix Properties: Determinants, Norm, Trace

><code>d = [det2](linalg.scad#function-det2)(M);</code>  

><code>d = [det3](linalg.scad#function-det3)(M);</code>  

><code>d = [det4](linalg.scad#function-det4)(M);</code>  

><code>d = [determinant](linalg.scad#function-determinant)(M);</code>  

><code>[norm\_fro](linalg.scad#function-norm_fro)(A)</code>  

><code>[matrix\_trace](linalg.scad#function-matrix_trace)(M)</code>  


## LibFile: vectors.scad

### Section: Vector Testing

><code>bool = [is\_vector](vectors.scad#function-is_vector)(v, [length], [zero=], [all\_nonzero=], [eps=]);</code>  


### Section: Scalar operations on vectors

><code>v\_new = [add\_scalar](vectors.scad#function-add_scalar)(v, s);</code>  

><code>v3 = [v\_mul](vectors.scad#function-v_mul)(v1, v2);</code>  

><code>v3 = [v\_div](vectors.scad#function-v_div)(v1, v2);</code>  

><code>v2 = [v\_abs](vectors.scad#function-v_abs)(v);</code>  

><code>v2 = [v\_ceil](vectors.scad#function-v_ceil)(v);</code>  

><code>v2 = [v\_floor](vectors.scad#function-v_floor)(v);</code>  

><code>v2 = [v\_round](vectors.scad#function-v_round)(v);</code>  

><code>v2 = [v\_lookup](vectors.scad#function-v_lookup)(x, v);</code>  


### Section: Vector Properties

><code>v = [unit](vectors.scad#function-unit)(v, [error]);</code>  

><code>theta = [v\_theta](vectors.scad#function-v_theta)([X,Y]);</code>  

><code>ang = [vector\_angle](vectors.scad#function-vector_angle)(v1,v2);</code>  &nbsp; &nbsp; <code>ang = [vector\_angle](vectors.scad#function-vector_angle)([v1,v2]);</code>  
><code>ang = [vector\_angle](vectors.scad#function-vector_angle)(PT1,PT2,PT3);</code>  &nbsp; &nbsp; <code>ang = [vector\_angle](vectors.scad#function-vector_angle)([PT1,PT2,PT3]);</code>  

><code>axis = [vector\_axis](vectors.scad#function-vector_axis)(v1,v2);</code>  &nbsp; &nbsp; <code>axis = [vector\_axis](vectors.scad#function-vector_axis)([v1,v2]);</code>  
><code>axis = [vector\_axis](vectors.scad#function-vector_axis)(PT1,PT2,PT3);</code>  &nbsp; &nbsp; <code>axis = [vector\_axis](vectors.scad#function-vector_axis)([PT1,PT2,PT3]);</code>  

><code>newv = [vector\_bisect](vectors.scad#function-vector_bisect)(v1,v2);</code>  

><code>perp = [vector\_perp](vectors.scad#function-vector_perp)(v,w);</code>  


### Section: Vector Searching

><code>index = [closest\_point](vectors.scad#function-closest_point)(pt, points);</code>  

><code>index = [furthest\_point](vectors.scad#function-furthest_point)(pt, points);</code>  

><code>indices = [vector\_search](vectors.scad#function-vector_search)(query, r, target);</code>  

><code>tree = [vector\_search\_tree](vectors.scad#function-vector_search_tree)(points,leafsize);</code>  

><code>indices = [vector\_nearest](vectors.scad#function-vector_nearest)(query, k, target);</code>  


### Section: Bounds

><code>pt\_pair = [pointlist\_bounds](vectors.scad#function-pointlist_bounds)(pts);</code>  

><code>new\_pts = [fit\_to\_box](vectors.scad#function-fit_to_box)(pts, [x=], [y=], [z=]);</code>  
><code>new\_vnf = [fit\_to\_box](vectors.scad#function-fit_to_box)(vnf, [x=], [y=], [z=]);</code>  


## LibFile: coords.scad

### Section: Coordinate Manipulation

><code>pt = [point2d](coords.scad#function-point2d)(p, [fill]);</code>  

><code>pts = [path2d](coords.scad#function-path2d)(points);</code>  

><code>pt = [point3d](coords.scad#function-point3d)(p, [fill]);</code>  

><code>pts = [path3d](coords.scad#function-path3d)(points, [fill]);</code>  

><code>pt = [point4d](coords.scad#function-point4d)(p, [fill]);</code>  

><code>pt = [path4d](coords.scad#function-path4d)(points, [fill]);</code>  


### Section: Coordinate Systems

><code>pt = [polar\_to\_xy](coords.scad#function-polar_to_xy)(r, theta);</code>  &nbsp; &nbsp; <code>pt = [polar\_to\_xy](coords.scad#function-polar_to_xy)([R, THETA]);</code>  
><code>pts = [polar\_to\_xy](coords.scad#function-polar_to_xy)([[R,THETA], [R,THETA], ...]);</code>  

><code>r\_theta = [xy\_to\_polar](coords.scad#function-xy_to_polar)(x,y);</code>  &nbsp; &nbsp; <code>r\_theta = [xy\_to\_polar](coords.scad#function-xy_to_polar)([X,Y]);</code>  
><code>r\_thetas = [xy\_to\_polar](coords.scad#function-xy_to_polar)([[X,Y], [X,Y], ...]);</code>  

><code>xy = [project\_plane](coords.scad#function-project_plane)(plane, p);</code>  &nbsp; &nbsp; <code>M = [project\_plane](coords.scad#function-project_plane)(plane)</code>  

><code>xyz = [lift\_plane](coords.scad#function-lift_plane)(plane, p);</code>  &nbsp; &nbsp; <code>M =  [lift\_plane](coords.scad#function-lift_plane)(plane);</code>  

><code>pt = [cylindrical\_to\_xyz](coords.scad#function-cylindrical_to_xyz)(r, theta, z);</code>  
><code>pt = [cylindrical\_to\_xyz](coords.scad#function-cylindrical_to_xyz)([RADIUS,THETA,Z]);</code>  
><code>pts = [cylindrical\_to\_xyz](coords.scad#function-cylindrical_to_xyz)([[RADIUS,THETA,Z], [RADIUS,THETA,Z], ...]);</code>  

><code>rtz = [xyz\_to\_cylindrical](coords.scad#function-xyz_to_cylindrical)(x,y,z);</code>  &nbsp; &nbsp; <code>rtz = [xyz\_to\_cylindrical](coords.scad#function-xyz_to_cylindrical)([X,Y,Z]);</code>  
><code>rtzs = [xyz\_to\_cylindrical](coords.scad#function-xyz_to_cylindrical)([[X,Y,Z], [X,Y,Z], ...]);</code>  

><code>pt = [spherical\_to\_xyz](coords.scad#function-spherical_to_xyz)(r, theta, phi);</code>  
><code>pt = [spherical\_to\_xyz](coords.scad#function-spherical_to_xyz)([RADIUS,THETA,PHI]);</code>  
><code>pts = [spherical\_to\_xyz](coords.scad#function-spherical_to_xyz)([[RADIUS,THETA,PHI], [RADIUS,THETA,PHI], ...]);</code>  

><code>r\_theta\_phi = [xyz\_to\_spherical](coords.scad#function-xyz_to_spherical)(x,y,z)</code>  &nbsp; &nbsp; <code>r\_theta\_phi = [xyz\_to\_spherical](coords.scad#function-xyz_to_spherical)([X,Y,Z])</code>  
><code>r\_theta\_phis = [xyz\_to\_spherical](coords.scad#function-xyz_to_spherical)([[X,Y,Z], [X,Y,Z], ...])</code>  

><code>pt = [altaz\_to\_xyz](coords.scad#function-altaz_to_xyz)(alt, az, r);</code>  &nbsp; &nbsp; <code>pt = [altaz\_to\_xyz](coords.scad#function-altaz_to_xyz)([ALT,AZ,R]);</code>  
><code>pts = [altaz\_to\_xyz](coords.scad#function-altaz_to_xyz)([[ALT,AZ,R], [ALT,AZ,R], ...]);</code>  

><code>alt\_az\_r = [xyz\_to\_altaz](coords.scad#function-xyz_to_altaz)(x,y,z);</code>  &nbsp; &nbsp; <code>alt\_az\_r = [xyz\_to\_altaz](coords.scad#function-xyz_to_altaz)([X,Y,Z]);</code>  
><code>alt\_az\_rs = [xyz\_to\_altaz](coords.scad#function-xyz_to_altaz)([[X,Y,Z], [X,Y,Z], ...]);</code>  


## LibFile: geometry.scad

### Section: Lines, Rays, and Segments

><code>pt = [is\_point\_on\_line](geometry.scad#function-is_point_on_line)(point, line, [bounded], [eps]);</code>  

><code>bool = [is\_collinear](geometry.scad#function-is_collinear)(a, [b, c], [eps]);</code>  

><code>dist = [point\_line\_distance](geometry.scad#function-point_line_distance)(pt, line, [bounded]);</code>  

><code>dist = [segment\_distance](geometry.scad#function-segment_distance)(seg1, seg2, [eps]);</code>  

><code>vec = [line\_normal](geometry.scad#function-line_normal)([P1,P2])</code>  &nbsp; &nbsp; <code>vec = [line\_normal](geometry.scad#function-line_normal)(p1,p2)</code>  

><code>pt = [line\_intersection](geometry.scad#function-line_intersection)(line1, line2, [bounded1], [bounded2], [bounded=], [eps=]);</code>  

><code>pt = [line\_closest\_point](geometry.scad#function-line_closest_point)(line, pt, [bounded]);</code>  

><code>line = [line\_from\_points](geometry.scad#function-line_from_points)(points, [check\_collinear], [eps]);</code>  


### Section: Planes

><code>bool = [is\_coplanar](geometry.scad#function-is_coplanar)(points,[eps]);</code>  

><code>plane = [plane3pt](geometry.scad#function-plane3pt)(p1, p2, p3);</code>  &nbsp; &nbsp; <code>plane = [plane3pt](geometry.scad#function-plane3pt)([p1, p2, p3]);</code>  

><code>plane = [plane3pt\_indexed](geometry.scad#function-plane3pt_indexed)(points, i1, i2, i3);</code>  

><code>plane = [plane\_from\_normal](geometry.scad#function-plane_from_normal)(normal, [pt])</code>  

><code>plane = [plane\_from\_points](geometry.scad#function-plane_from_points)(points, [check\_coplanar], [eps]);</code>  

><code>plane = [plane\_from\_polygon](geometry.scad#function-plane_from_polygon)(points, [check\_coplanar], [eps]);</code>  

><code>vec = [plane\_normal](geometry.scad#function-plane_normal)(plane);</code>  

><code>d = [plane\_offset](geometry.scad#function-plane_offset)(plane);</code>  

><code>pt = [plane\_line\_intersection](geometry.scad#function-plane_line_intersection)(plane, line, [bounded], [eps]);</code>  

><code>line = [plane\_intersection](geometry.scad#function-plane_intersection)(plane1, plane2)</code>  
><code>pt = [plane\_intersection](geometry.scad#function-plane_intersection)(plane1, plane2, plane3)</code>  

><code>angle = [plane\_line\_angle](geometry.scad#function-plane_line_angle)(plane,line);</code>  

><code>pts = [plane\_closest\_point](geometry.scad#function-plane_closest_point)(plane, points);</code>  

><code>dist = [point\_plane\_distance](geometry.scad#function-point_plane_distance)(plane, point)</code>  

><code>bool = [are\_points\_on\_plane](geometry.scad#function-are_points_on_plane)(points, plane, [eps]);</code>  

><code>[show\_plane](geometry.scad#module-show_plane)(plane, size, [offset]) [ATTACHMENTS];</code>  


### Section: Circle Calculations

><code>pts = [circle\_line\_intersection](geometry.scad#function-circle_line_intersection)(r|d=, cp, line, [bounded], [eps=]);</code>  

><code>pts = [circle\_circle\_intersection](geometry.scad#function-circle_circle_intersection)(r1|d1=, cp1, r2|d2=, cp2, [eps]);</code>  

><code>circ = [circle\_2tangents](geometry.scad#function-circle_2tangents)(r|d=, pt1, pt2, pt3, [tangents=]);</code>  
><code>circ = [circle\_2tangents](geometry.scad#function-circle_2tangents)(r|d=, [PT1, PT2, PT3], [tangents=]);</code>  

><code>circ = [circle\_3points](geometry.scad#function-circle_3points)(pt1, pt2, pt3);</code>  &nbsp; &nbsp; <code>circ = [circle\_3points](geometry.scad#function-circle_3points)([PT1, PT2, PT3]);</code>  

><code>tangents = [circle\_point\_tangents](geometry.scad#function-circle_point_tangents)(r|d=, cp, pt);</code>  

><code>segs = [circle\_circle\_tangents](geometry.scad#function-circle_circle_tangents)(r1|d1=, cp1, r2|d2=, cp2);</code>  


### Section: Sphere Calculations

><code>isect = [sphere\_line\_intersection](geometry.scad#function-sphere_line_intersection)(r|d=, cp, line, [bounded], [eps=]);</code>  


### Section: Polygons

><code>area = [polygon\_area](geometry.scad#function-polygon_area)(poly, [signed]);</code>  

><code>c = [centroid](geometry.scad#function-centroid)(object, [eps]);</code>  

><code>vec = [polygon\_normal](geometry.scad#function-polygon_normal)(poly);</code>  

><code>bool = [point\_in\_polygon](geometry.scad#function-point_in_polygon)(point, poly, [nonzero], [eps])</code>  

><code>pt\_or\_segments = [polygon\_line\_intersection](geometry.scad#function-polygon_line_intersection)(poly, line, [bounded], [nonzero], [eps]);</code>  

><code>triangles = [polygon\_triangulate](geometry.scad#function-polygon_triangulate)(poly, [ind], [error], [eps])</code>  

><code>bool = [is\_polygon\_clockwise](geometry.scad#function-is_polygon_clockwise)(poly);</code>  

><code>newpoly = [clockwise\_polygon](geometry.scad#function-clockwise_polygon)(poly);</code>  

><code>newpoly = [ccw\_polygon](geometry.scad#function-ccw_polygon)(poly);</code>  

><code>newpoly = [reverse\_polygon](geometry.scad#function-reverse_polygon)(poly)</code>  

><code>newpoly = [reindex\_polygon](geometry.scad#function-reindex_polygon)(reference, poly);</code>  

><code>newpoly = [align\_polygon](geometry.scad#function-align_polygon)(reference, poly, [angles], [cp], [tran], [return\_ind]);</code>  

><code>bool = [are\_polygons\_equal](geometry.scad#function-are_polygons_equal)(poly1, poly2, [eps])</code>  


### Section: Convex Hull

><code>face\_list\_or\_index\_list = [hull](geometry.scad#function-hull)(points);</code>  

><code>[hull\_points](geometry.scad#module-hull_points)(points, [fast]);</code>  

><code>index\_list = [hull2d\_path](geometry.scad#function-hull2d_path)(points,all)</code>  

><code>faces = [hull3d\_faces](geometry.scad#function-hull3d_faces)(points)</code>  


### Section: Convex Sets

><code>bool = [is\_polygon\_convex](geometry.scad#function-is_polygon_convex)(poly, [eps]);</code>  

><code>dist = [convex\_distance](geometry.scad#function-convex_distance)(points1, points2,eps);</code>  

><code>bool = [convex\_collision](geometry.scad#function-convex_collision)(points1, points2, [eps]);</code>  


### Section: Rotation Decoding

><code>info = [rot\_decode](geometry.scad#function-rot_decode)(rotation,[long]); // Returns: [angle,axis,cp,translation]</code>  


## LibFile: trigonometry.scad

### Section: General Triangle Functions

><code>C = [law\_of\_cosines](trigonometry.scad#function-law_of_cosines)(a, b, c);</code>  &nbsp; &nbsp; <code>c = [law\_of\_cosines](trigonometry.scad#function-law_of_cosines)(a, b, C=);</code>  

><code>B = [law\_of\_sines](trigonometry.scad#function-law_of_sines)(a, A, b);</code>  &nbsp; &nbsp; <code>b = [law\_of\_sines](trigonometry.scad#function-law_of_sines)(a, A, B=);</code>  


### Section: Right Triangle Functions

><code>adj = [hyp\_opp\_to\_adj](trigonometry.scad#function-hyp_opp_to_adj)(hyp,opp);</code>  

><code>adj = [opp\_hyp\_to\_adj](trigonometry.scad#function-opp_hyp_to_adj)(opp,hyp);</code>  

><code>adj = [hyp\_ang\_to\_adj](trigonometry.scad#function-hyp_ang_to_adj)(hyp,ang);</code>  

><code>adj = [ang\_hyp\_to\_adj](trigonometry.scad#function-ang_hyp_to_adj)(ang,hyp);</code>  

><code>adj = [opp\_ang\_to\_adj](trigonometry.scad#function-opp_ang_to_adj)(opp,ang);</code>  

><code>adj = [ang\_opp\_to\_adj](trigonometry.scad#function-ang_opp_to_adj)(ang,opp);</code>  

><code>opp = [hyp\_adj\_to\_opp](trigonometry.scad#function-hyp_adj_to_opp)(hyp,adj);</code>  

><code>opp = [adj\_hyp\_to\_opp](trigonometry.scad#function-adj_hyp_to_opp)(adj,hyp);</code>  

><code>opp = [hyp\_ang\_to\_opp](trigonometry.scad#function-hyp_ang_to_opp)(hyp,ang);</code>  

><code>opp = [ang\_hyp\_to\_opp](trigonometry.scad#function-ang_hyp_to_opp)(ang,hyp);</code>  

><code>opp = [adj\_ang\_to\_opp](trigonometry.scad#function-adj_ang_to_opp)(adj,ang);</code>  

><code>opp = [ang\_adj\_to\_opp](trigonometry.scad#function-ang_adj_to_opp)(ang,adj);</code>  

><code>hyp = [adj\_opp\_to\_hyp](trigonometry.scad#function-adj_opp_to_hyp)(adj,opp);</code>  

><code>hyp = [opp\_adj\_to\_hyp](trigonometry.scad#function-opp_adj_to_hyp)(opp,adj);</code>  

><code>hyp = [adj\_ang\_to\_hyp](trigonometry.scad#function-adj_ang_to_hyp)(adj,ang);</code>  

><code>hyp = [ang\_adj\_to\_hyp](trigonometry.scad#function-ang_adj_to_hyp)(ang,adj);</code>  

><code>hyp = [opp\_ang\_to\_hyp](trigonometry.scad#function-opp_ang_to_hyp)(opp,ang);</code>  

><code>hyp = [ang\_opp\_to\_hyp](trigonometry.scad#function-ang_opp_to_hyp)(ang,opp);</code>  

><code>ang = [hyp\_adj\_to\_ang](trigonometry.scad#function-hyp_adj_to_ang)(hyp,adj);</code>  

><code>ang = [adj\_hyp\_to\_ang](trigonometry.scad#function-adj_hyp_to_ang)(adj,hyp);</code>  

><code>ang = [hyp\_opp\_to\_ang](trigonometry.scad#function-hyp_opp_to_ang)(hyp,opp);</code>  

><code>ang = [opp\_hyp\_to\_ang](trigonometry.scad#function-opp_hyp_to_ang)(opp,hyp);</code>  

><code>ang = [adj\_opp\_to\_ang](trigonometry.scad#function-adj_opp_to_ang)(adj,opp);</code>  

><code>ang = [opp\_adj\_to\_ang](trigonometry.scad#function-opp_adj_to_ang)(opp,adj);</code>  


## LibFile: version.scad

### Section: BOSL Library Version Functions

><code>ver = [bosl\_version](version.scad#function-bosl_version)();</code>  

><code>ver = [bosl\_version\_num](version.scad#function-bosl_version_num)();</code>  

><code>ver = [bosl\_version\_str](version.scad#function-bosl_version_str)();</code>  

><code>[bosl\_required](version.scad#module-bosl_required)(version);</code>  


### Section: Generic Version Functions

><code>ver = [version\_to\_list](version.scad#function-version_to_list)(x);</code>  

><code>str = [version\_to\_str](version.scad#function-version_to_str)(version);</code>  

><code>str = [version\_to\_num](version.scad#function-version_to_num)(version);</code>  

><code>cmp = [version\_cmp](version.scad#function-version_cmp)(a,b);</code>  


## LibFile: comparisons.scad

### Section: List comparison operations

><code>test = [approx](comparisons.scad#function-approx)(a, b, [eps])</code>  

><code>x = [all\_zero](comparisons.scad#function-all_zero)(x, [eps]);</code>  

><code>test = [all\_nonzero](comparisons.scad#function-all_nonzero)(x, [eps]);</code>  

><code>test = [all\_positive](comparisons.scad#function-all_positive)(x,[eps]);</code>  

><code>test = [all\_negative](comparisons.scad#function-all_negative)(x, [eps]);</code>  

><code>[all\_nonpositive](comparisons.scad#function-all_nonpositive)(x, [eps]);</code>  

><code>[all\_nonnegative](comparisons.scad#function-all_nonnegative)(x, [eps]);</code>  

><code>b = [all\_equal](comparisons.scad#function-all_equal)(vec, [eps]);</code>  

><code>[are\_ends\_equal](comparisons.scad#function-are_ends_equal)(list, [eps]);</code>  

><code>bool = [is\_increasing](comparisons.scad#function-is_increasing)(list, [strict]);</code>  

><code>bool = [is\_decreasing](comparisons.scad#function-is_decreasing)(list, [strict]);</code>  

><code>test = [compare\_vals](comparisons.scad#function-compare_vals)(a, b);</code>  

><code>test = [compare\_lists](comparisons.scad#function-compare_lists)(a, b)</code>  


### Section: Finding the index of the minimum or maximum of a list

><code>idx = [min\_index](comparisons.scad#function-min_index)(vals);</code>  &nbsp; &nbsp; <code>idxlist = [min\_index](comparisons.scad#function-min_index)(vals, all=true);</code>  

><code>idx = [max\_index](comparisons.scad#function-max_index)(vals);</code>  &nbsp; &nbsp; <code>idxlist = [max\_index](comparisons.scad#function-max_index)(vals, all=true);</code>  


### Section: Dealing with duplicate list entries

><code>idx = [find\_approx](comparisons.scad#function-find_approx)(val, list, [start=], [eps=]);</code>  
><code>indices = [find\_approx](comparisons.scad#function-find_approx)(val, list, all=true, [start=], [eps=]);</code>  

><code>list = [deduplicate](comparisons.scad#function-deduplicate)(list, [closed], [eps]);</code>  

><code>new\_idxs = [deduplicate\_indexed](comparisons.scad#function-deduplicate_indexed)(list, indices, [closed], [eps]);</code>  

><code>[list\_wrap](comparisons.scad#function-list_wrap)(path, [eps]);</code>  

><code>[list\_unwrap](comparisons.scad#function-list_unwrap)(list, [eps]);</code>  

><code>ulist = [unique](comparisons.scad#function-unique)(list);</code>  

><code>sorted\_counts = [unique\_count](comparisons.scad#function-unique_count)(list);</code>  

><code>ulist = [unique\_approx](comparisons.scad#function-unique_approx)(data, [eps]);</code>  

><code>ulist = unique\_approx(data, [eps]);</code>  


### Section: Sorting

><code>slist = [sort](comparisons.scad#function-sort)(list, [idx]);</code>  

><code>idxlist = [sortidx](comparisons.scad#function-sortidx)(list, [idx]);</code>  

><code>ulist = [group\_sort](comparisons.scad#function-group_sort)(list,[idx]);</code>  

><code>groupings = [group\_data](comparisons.scad#function-group_data)(groups, values);</code>  

><code>small = [list\_smallest](comparisons.scad#function-list_smallest)(list, k)</code>  

><code>big = list\_biggest(list, k)</code>  


## LibFile: lists.scad

### Section: List Query Operations

><code>bool = [is\_homogeneous](lists.scad#function-is_homogeneous)(list, [depth]);</code>  

><code>llen = [min\_length](lists.scad#function-min_length)(list);</code>  

><code>llen = [max\_length](lists.scad#function-max_length)(list);</code>  

><code>dims = [list\_shape](lists.scad#function-list_shape)(v, [depth]);</code>  

><code>bool = [in\_list](lists.scad#function-in_list)(val, list, [idx]);</code>  


### Section: List Indexing

><code>item = [select](lists.scad#function-select)(list, start);</code>  &nbsp; &nbsp; <code>item = [select](lists.scad#function-select)(list, [s:d:e]);</code>  
><code>item = [select](lists.scad#function-select)(list, [i0,i1...,ik]);</code>  &nbsp; &nbsp; <code>list = [select](lists.scad#function-select)(list, start, end);</code>  

><code>list = [slice](lists.scad#function-slice)(list, s, e);</code>  

><code>item = [last](lists.scad#function-last)(list);</code>  

><code>list = [list\_head](lists.scad#function-list_head)(list, [to]);</code>  

><code>list = [list\_tail](lists.scad#function-list_tail)(list, [from]);</code>  

><code>sublist = [bselect](lists.scad#function-bselect)(list, index);</code>  


### Section: List Construction

><code>list = [repeat](lists.scad#function-repeat)(val, n);</code>  

><code>arr = [list\_bset](lists.scad#function-list_bset)(indexset, valuelist, [dflt]);</code>  

><code>[list](lists.scad#function-list) = [list](lists.scad#function-list)(l)</code>  

><code>list = [force\_list](lists.scad#function-force_list)(value, [n], [fill]);</code>  


### Section: List Modification

><code>rlist = [reverse](lists.scad#function-reverse)(list);</code>  

><code>rlist = [list\_rotate](lists.scad#function-list_rotate)(list, [n]);</code>  

><code>[shuffle](lists.scad#function-shuffle)d = [shuffle](lists.scad#function-shuffle)(list, [seed]);</code>  

><code>newlist = [repeat\_entries](lists.scad#function-repeat_entries)(list, N, [exact]);</code>  

><code>newlist = [list\_pad](lists.scad#function-list_pad)(list, minlen, [fill]);</code>  

><code>list = [list\_set](lists.scad#function-list_set)(list, indices, values, [dflt], [minlen]);</code>  

><code>list = [list\_swap](lists.scad#function-list_swap)(list, i, j);</code>  

><code>list = [list\_insert](lists.scad#function-list_insert)(list, indices, values);</code>  

><code>list = [list\_remove](lists.scad#function-list_remove)(list, ind);</code>  

><code>list = [list\_remove\_values](lists.scad#function-list_remove_values)(list, values, [all]);</code>  


### Section: List Iteration Index Helper

><code>range = [idx](lists.scad#function-idx)(list, [s=], [e=], [step=]);</code>  
><code>for(i=[idx](lists.scad#function-idx)(list, [s=], [e=], [step=])) ...</code>  


### Section: Lists of Subsets

><code>p = [pair](lists.scad#function-pair)(list, [wrap]);</code>  
><code>for (p = [pair](lists.scad#function-pair)(list, [wrap])) ...  // On each iteration, p contains a list of two adjacent items.</code>  

><code>list = [triplet](lists.scad#function-triplet)(list, [wrap]);</code>  &nbsp; &nbsp; <code>for (t = [triplet](lists.scad#function-triplet)(list, [wrap])) ...</code>  

><code>list = [combinations](lists.scad#function-combinations)(l, [n]);</code>  

><code>list = [permutations](lists.scad#function-permutations)(l, [n]);</code>  


### Section: Changing List Structure

><code>groups = [list\_to\_matrix](lists.scad#function-list_to_matrix)(v, cnt, [dflt]);</code>  

><code>list = [flatten](lists.scad#function-flatten)(l);</code>  

><code>list = [full\_flatten](lists.scad#function-full_flatten)(l);</code>  


### Section: Set Manipulation

><code>s = [set\_union](lists.scad#function-set_union)(a, b, [get\_indices]);</code>  

><code>s = [set\_difference](lists.scad#function-set_difference)(a, b);</code>  

><code>s = [set\_intersection](lists.scad#function-set_intersection)(a, b);</code>  


## LibFile: utility.scad

### Section: Type Checking

><code>typ = [typeof](utility.scad#function-typeof)(x);</code>  

><code>bool = [is\_type](utility.scad#function-is_type)(x, types);</code>  

><code>bool = [is\_def](utility.scad#function-is_def)(x);</code>  

><code>bool = [is\_str](utility.scad#function-is_str)(x);</code>  

><code>bool = [is\_int](utility.scad#function-is_int)(n);</code>  &nbsp; &nbsp; <code>bool = [is\_int](utility.scad#function-is_int)eger(n);</code>  

><code>bool = [all\_integer](utility.scad#function-all_integer)(x);</code>  

><code>bool = [is\_nan](utility.scad#function-is_nan)(x);</code>  

><code>bool = [is\_finite](utility.scad#function-is_finite)(x);</code>  

><code>bool = [is\_range](utility.scad#function-is_range)(x);</code>  

><code>bool = [valid\_range](utility.scad#function-valid_range)(x);</code>  

><code>bool = [is\_func](utility.scad#function-is_func)(x);</code>  

><code>bool = [is\_consistent](utility.scad#function-is_consistent)(list, [pattern]);</code>  

><code>bool = [same\_shape](utility.scad#function-same_shape)(a,b);</code>  

><code>check = [is\_bool\_list](utility.scad#function-is_bool_list)(list,[length])</code>  


### Section: Boolean list testing

><code>bool = [any](utility.scad#function-any)(l);</code>  
><code>bool = [any](utility.scad#function-any)(l, func);   // Requires OpenSCAD 2021.01 or later.</code>  

><code>bool = [all](utility.scad#function-all)(l);</code>  
><code>bool = [all](utility.scad#function-all)(l, func);   // Requires OpenSCAD 2021.01 or later.</code>  

><code>seq = [num\_true](utility.scad#function-num_true)(l);</code>  
><code>seq = [num\_true](utility.scad#function-num_true)(l, func);  // Requires OpenSCAD 2021.01 or later.</code>  


### Section: Handling `undef`s.

><code>val = [default](utility.scad#function-default)(val, dflt);</code>  

><code>val = [first\_defined](utility.scad#function-first_defined)(v, [recursive]);</code>  

><code>val = [one\_defined](utility.scad#function-one_defined)(vals, names, [dflt])</code>  

><code>cnt = [num\_defined](utility.scad#function-num_defined)(v);</code>  

><code>bool = [any\_defined](utility.scad#function-any_defined)(v, [recursive]);</code>  

><code>bool = [all\_defined](utility.scad#function-all_defined)(v, [recursive]);</code>  


### Section: Undef Safe Arithmetic

><code>x = [u\_add](utility.scad#function-u_add)(a, b);</code>  

><code>x = [u\_sub](utility.scad#function-u_sub)(a, b);</code>  

><code>x = [u\_mul](utility.scad#function-u_mul)(a, b);</code>  

><code>x = [u\_div](utility.scad#function-u_div)(a, b);</code>  


### Section: Processing Arguments to Functions and Modules

><code>anchr = [get\_anchor](utility.scad#function-get_anchor)(anchor,center,[uncentered],[dflt]);</code>  

><code>r = [get\_radius](utility.scad#function-get_radius)([r1=], [r2=], [r=], [d1=], [d2=], [d=], [dflt=]);</code>  

><code>vec = [scalar\_vec3](utility.scad#function-scalar_vec3)(v, [dflt]);</code>  

><code>sides = [segs](utility.scad#function-segs)(r, [angle]);</code>  

><code>[no\_children](utility.scad#module-no_children)($children);</code>  

><code>[req\_children](utility.scad#module-req_children)($children);</code>  

><code>dummy = [no\_function](utility.scad#function-no_function)(name)</code>  

><code>[no\_module](utility.scad#module-no_module)();</code>  

><code>[deprecate](utility.scad#module-deprecate)(new\_name);</code>  

><code>[echo\_viewport](utility.scad#module-echo_viewport)();</code>  


### Section: Testing Helpers

><code>[assert\_approx](utility.scad#module-assert_approx)(got, expected, [info]);</code>  

><code>[assert\_equal](utility.scad#module-assert_equal)(got, expected, [info]);</code>  

><code>[shape\_compare](utility.scad#module-shape_compare)([eps]) {TEST\_SHAPE; EXPECTED\_SHAPE;}</code>  


### Section: C-Style For Loop Helpers

><code>bool = [looping](utility.scad#function-looping)(state);</code>  

><code>state = [loop\_while](utility.scad#function-loop_while)(state, continue);</code>  

><code>bool = [loop\_done](utility.scad#function-loop_done)(state);</code>  


## LibFile: strings.scad

### Section: Extracting substrings

><code>newstr = [substr](strings.scad#function-substr)(str, [pos], [len]);</code>  

><code>newstr = [suffix](strings.scad#function-suffix)(str,len);</code>  


### Section: String Searching

><code>ind = [str\_find](strings.scad#function-str_find)(str,pattern,[last=],[all=],[start=]);</code>  

><code>bool = [starts\_with](strings.scad#function-starts_with)(str,pattern);</code>  

><code>bool = [ends\_with](strings.scad#function-ends_with)(str,pattern);</code>  

><code>string\_list = [str\_split](strings.scad#function-str_split)(str, sep, [keep\_nulls]);</code>  


### Section: String modification

><code>str = [str\_join](strings.scad#function-str_join)(list, [sep]);</code>  

><code>str = [str\_strip](strings.scad#function-str_strip)(s,c,[start],[end]);</code>  

><code>padded = [str\_pad](strings.scad#function-str_pad)(str, length, char, [left]);</code>  

><code>newstr = [str\_replace\_char](strings.scad#function-str_replace_char)(str, char, replace);</code>  

><code>newstr = [downcase](strings.scad#function-downcase)(str);</code>  

><code>newstr = [upcase](strings.scad#function-upcase)(str);</code>  


### Section: Random strings

><code>str = [rand\_str](strings.scad#function-rand_str)(n, [charset], [seed]);</code>  


### Section: Parsing strings into numbers

><code>num = [parse\_int](strings.scad#function-parse_int)(str, [base])</code>  

><code>num = [parse\_float](strings.scad#function-parse_float)(str);</code>  

><code>num = [parse\_frac](strings.scad#function-parse_frac)(str,[mixed=],[improper=],[signed=]);</code>  

><code>num = [parse\_num](strings.scad#function-parse_num)(str);</code>  


### Section: Formatting numbers into strings

><code>str = [format\_int](strings.scad#function-format_int)(i, [mindigits]);</code>  

><code>s = [format\_fixed](strings.scad#function-format_fixed)(f, [digits]);</code>  

><code>str = [format\_float](strings.scad#function-format_float)(f,[sig]);</code>  

><code>s = [format](strings.scad#function-format)(fmt, vals);</code>  


### Section: Checking character class

><code>x = [is\_lower](strings.scad#function-is_lower)(s);</code>  

><code>x = [is\_upper](strings.scad#function-is_upper)(s);</code>  

><code>x = [is\_digit](strings.scad#function-is_digit)(s);</code>  

><code>x = [is\_hexdigit](strings.scad#function-is_hexdigit)(s);</code>  

><code>x = [is\_letter](strings.scad#function-is_letter)(s);</code>  


## LibFile: structs.scad

### Section: struct operations

><code>struct2 = [struct\_set](structs.scad#function-struct_set)(struct, key, value, [grow=]);</code>  
><code>struct2 = [struct\_set](structs.scad#function-struct_set)(struct, [key1, value1, key2, value2, ...], [grow=]);</code>  

><code>struct2 = [struct\_remove](structs.scad#function-struct_remove)(struct, key);</code>  

><code>val = [struct\_val](structs.scad#function-struct_val)(struct, key, default);</code>  

><code>keys = [struct\_keys](structs.scad#function-struct_keys)(struct);</code>  

><code>[echo\_struct](structs.scad#functionmodule-echo_struct)(struct, [name]);</code>  &nbsp; &nbsp; <code>foo = [echo\_struct](structs.scad#functionmodule-echo_struct)(struct, [name]);</code>  

><code>bool = [is\_struct](structs.scad#function-is_struct)(struct);</code>  


## LibFile: fnliterals.scad

### Section: Function Literal Algorithms

><code>lst = [map](fnliterals.scad#function-map)(func, list);</code>  &nbsp; &nbsp; <code>lst = [map](fnliterals.scad#function-map)(function (x) x+1, list);</code>  

><code>lst = [filter](fnliterals.scad#function-filter)(func, list);</code>  &nbsp; &nbsp; <code>lst = [filter](fnliterals.scad#function-filter)(function (x) x&gt;1, list);</code>  

><code>res = [reduce](fnliterals.scad#function-reduce)(func, list, [init]);</code>  
><code>res = [reduce](fnliterals.scad#function-reduce)(function (a,b) a+b, list, &lt;init=);</code>  

><code>res = [accumulate](fnliterals.scad#function-accumulate)(func, list, [init]);</code>  
><code>res = [accumulate](fnliterals.scad#function-accumulate)(function (a,b) a+b, list, [init=]);</code>  

><code>x = [while](fnliterals.scad#function-while)(init, cond, func);</code>  

><code>x = [for\_n](fnliterals.scad#function-for_n)(n, init, func);</code>  

><code>indices = [find\_all](fnliterals.scad#function-find_all)(func, list);</code>  
><code>indices = [find\_all](fnliterals.scad#function-find_all)(function (x) x&gt;1, list);</code>  

><code>idx = [find\_first](fnliterals.scad#function-find_first)(func, list, [start=]);</code>  

><code>idx = [binsearch](fnliterals.scad#function-binsearch)(key,list, [cmp]);</code>  

><code>hx = [simple\_hash](fnliterals.scad#function-simple_hash)(x);</code>  

><code>hm = [hashmap](fnliterals.scad#function-hashmap)([hashsize=]);</code>  
><code>hm = [hashmap](fnliterals.scad#function-hashmap)(items=KEYVAL\_LIST, [hashsize=]);</code>  &nbsp; &nbsp; <code>hm2 = hm(key, val);</code>  
><code>hm2 = hm(additems=KEYVAL\_LIST);</code>  &nbsp; &nbsp; <code>hm2 = hm(del=KEY);</code>  &nbsp; &nbsp; <code>x = hm(key);</code>  
><code>for (kv=hm()) let(k=kv[0], v=kv[1]) ...</code>  


### Section: Function Meta-Generators

><code>fn = [f\_1arg](fnliterals.scad#function-f_1arg)(func);</code>  

><code>fn = [f\_2arg](fnliterals.scad#function-f_2arg)(target\_func);</code>  

><code>fn = [f\_2arg\_simple](fnliterals.scad#function-f_2arg_simple)(target\_func);</code>  

><code>fn = [f\_3arg](fnliterals.scad#function-f_3arg)(target\_func);</code>  

><code>newfunc = [ival](fnliterals.scad#function-ival)(func);</code>  

><code>newfunc = [xval](fnliterals.scad#function-xval)(func);</code>  


### Section: Comparator Generators

><code>fn = [f\_cmp](fnliterals.scad#function-f_cmp)();</code>  &nbsp; &nbsp; <code>fn = [f\_cmp](fnliterals.scad#function-f_cmp)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_cmp](fnliterals.scad#function-f_cmp)(a,b);</code>  

><code>fn = [f\_gt](fnliterals.scad#function-f_gt)();</code>  &nbsp; &nbsp; <code>fn = [f\_gt](fnliterals.scad#function-f_gt)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_gt](fnliterals.scad#function-f_gt)(a,b);</code>  

><code>fn = [f\_lt](fnliterals.scad#function-f_lt)();</code>  &nbsp; &nbsp; <code>fn = [f\_lt](fnliterals.scad#function-f_lt)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_lt](fnliterals.scad#function-f_lt)(a,b);</code>  

><code>fn = [f\_gte](fnliterals.scad#function-f_gte)();</code>  &nbsp; &nbsp; <code>fn = [f\_gte](fnliterals.scad#function-f_gte)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_gte](fnliterals.scad#function-f_gte)(a,b);</code>  

><code>fn = [f\_lte](fnliterals.scad#function-f_lte)();</code>  &nbsp; &nbsp; <code>fn = [f\_lte](fnliterals.scad#function-f_lte)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_lte](fnliterals.scad#function-f_lte)(a,b);</code>  

><code>fn = [f\_eq](fnliterals.scad#function-f_eq)();</code>  &nbsp; &nbsp; <code>fn = [f\_eq](fnliterals.scad#function-f_eq)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_eq](fnliterals.scad#function-f_eq)(a,b);</code>  

><code>fn = [f\_neq](fnliterals.scad#function-f_neq)();</code>  &nbsp; &nbsp; <code>fn = [f\_neq](fnliterals.scad#function-f_neq)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_neq](fnliterals.scad#function-f_neq)(a,b);</code>  

><code>fn = [f\_approx](fnliterals.scad#function-f_approx)();</code>  &nbsp; &nbsp; <code>fn = [f\_approx](fnliterals.scad#function-f_approx)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_approx](fnliterals.scad#function-f_approx)(a,b);</code>  

><code>fn = [f\_napprox](fnliterals.scad#function-f_napprox)();</code>  &nbsp; &nbsp; <code>fn = [f\_napprox](fnliterals.scad#function-f_napprox)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_napprox](fnliterals.scad#function-f_napprox)(a,b);</code>  


### Section: Logic Operators

><code>fn = [f\_or](fnliterals.scad#function-f_or)();</code>  &nbsp; &nbsp; <code>fn = [f\_or](fnliterals.scad#function-f_or)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_or](fnliterals.scad#function-f_or)(b=);</code>  &nbsp; &nbsp; <code>fn = [f\_or](fnliterals.scad#function-f_or)(a=,b=);</code>  

><code>fn = [f\_and](fnliterals.scad#function-f_and)();</code>  &nbsp; &nbsp; <code>fn = [f\_and](fnliterals.scad#function-f_and)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_and](fnliterals.scad#function-f_and)(b=);</code>  &nbsp; &nbsp; <code>fn = [f\_and](fnliterals.scad#function-f_and)(a=,b=);</code>  

><code>fn = [f\_nor](fnliterals.scad#function-f_nor)();</code>  &nbsp; &nbsp; <code>fn = [f\_nor](fnliterals.scad#function-f_nor)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_nor](fnliterals.scad#function-f_nor)(b=);</code>  &nbsp; &nbsp; <code>fn = [f\_nor](fnliterals.scad#function-f_nor)(a=,b=);</code>  

><code>fn = [f\_nand](fnliterals.scad#function-f_nand)();</code>  &nbsp; &nbsp; <code>fn = [f\_nand](fnliterals.scad#function-f_nand)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_nand](fnliterals.scad#function-f_nand)(b=);</code>  &nbsp; &nbsp; <code>fn = [f\_nand](fnliterals.scad#function-f_nand)(a=,b=);</code>  

><code>fn = [f\_xor](fnliterals.scad#function-f_xor)();</code>  &nbsp; &nbsp; <code>fn = [f\_xor](fnliterals.scad#function-f_xor)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_xor](fnliterals.scad#function-f_xor)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_xor](fnliterals.scad#function-f_xor)(a=,b=);</code>  

><code>fn = [f\_not](fnliterals.scad#function-f_not)();</code>  &nbsp; &nbsp; <code>fn = [f\_not](fnliterals.scad#function-f_not)(a);</code>  

><code>fn = [f\_even](fnliterals.scad#function-f_even)();</code>  &nbsp; &nbsp; <code>fn = [f\_even](fnliterals.scad#function-f_even)(a);</code>  

><code>fn = [f\_odd](fnliterals.scad#function-f_odd)();</code>  &nbsp; &nbsp; <code>fn = [f\_odd](fnliterals.scad#function-f_odd)(a);</code>  


### Section: Math Operators

><code>fn = [f\_add](fnliterals.scad#function-f_add)();</code>  &nbsp; &nbsp; <code>fn = [f\_add](fnliterals.scad#function-f_add)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_add](fnliterals.scad#function-f_add)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_add](fnliterals.scad#function-f_add)(a=,b=);</code>  

><code>fn = [f\_sub](fnliterals.scad#function-f_sub)();</code>  &nbsp; &nbsp; <code>fn = [f\_sub](fnliterals.scad#function-f_sub)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_sub](fnliterals.scad#function-f_sub)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_sub](fnliterals.scad#function-f_sub)(a=,b=);</code>  

><code>fn = [f\_mul](fnliterals.scad#function-f_mul)();</code>  &nbsp; &nbsp; <code>fn = [f\_mul](fnliterals.scad#function-f_mul)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_mul](fnliterals.scad#function-f_mul)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_mul](fnliterals.scad#function-f_mul)(a=,b=);</code>  

><code>fn = [f\_div](fnliterals.scad#function-f_div)();</code>  &nbsp; &nbsp; <code>fn = [f\_div](fnliterals.scad#function-f_div)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_div](fnliterals.scad#function-f_div)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_div](fnliterals.scad#function-f_div)(a=,b=);</code>  

><code>fn = [f\_mod](fnliterals.scad#function-f_mod)();</code>  &nbsp; &nbsp; <code>fn = [f\_mod](fnliterals.scad#function-f_mod)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_mod](fnliterals.scad#function-f_mod)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_mod](fnliterals.scad#function-f_mod)(a=,b=);</code>  

><code>fn = [f\_pow](fnliterals.scad#function-f_pow)();</code>  &nbsp; &nbsp; <code>fn = [f\_pow](fnliterals.scad#function-f_pow)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_pow](fnliterals.scad#function-f_pow)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_pow](fnliterals.scad#function-f_pow)(a=,b=);</code>  

><code>fn = [f\_neg](fnliterals.scad#function-f_neg)();</code>  &nbsp; &nbsp; <code>fn = [f\_neg](fnliterals.scad#function-f_neg)(a);</code>  


### Section: Min/Max Operators

><code>fn = [f\_min](fnliterals.scad#function-f_min)();</code>  &nbsp; &nbsp; <code>fn = [f\_min](fnliterals.scad#function-f_min)(a);</code>  

><code>fn = [f\_max](fnliterals.scad#function-f_max)();</code>  &nbsp; &nbsp; <code>fn = [f\_max](fnliterals.scad#function-f_max)(a);</code>  

><code>fn = [f\_min2](fnliterals.scad#function-f_min2)();</code>  &nbsp; &nbsp; <code>fn = [f\_min2](fnliterals.scad#function-f_min2)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_min2](fnliterals.scad#function-f_min2)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_min2](fnliterals.scad#function-f_min2)(a=,b=);</code>  

><code>fn = [f\_max2](fnliterals.scad#function-f_max2)();</code>  &nbsp; &nbsp; <code>fn = [f\_max2](fnliterals.scad#function-f_max2)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_max2](fnliterals.scad#function-f_max2)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_max2](fnliterals.scad#function-f_max2)(a=,b=);</code>  

><code>fn = [f\_min3](fnliterals.scad#function-f_min3)();</code>  &nbsp; &nbsp; <code>fn = [f\_min3](fnliterals.scad#function-f_min3)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_min3](fnliterals.scad#function-f_min3)(b=);</code>  &nbsp; &nbsp; <code>fn = [f\_min3](fnliterals.scad#function-f_min3)(c=);</code>  
><code>fn = [f\_min3](fnliterals.scad#function-f_min3)(a=,b=);</code>  &nbsp; &nbsp; <code>fn = [f\_min3](fnliterals.scad#function-f_min3)(b=,c=);</code>  &nbsp; &nbsp; <code>fn = [f\_min3](fnliterals.scad#function-f_min3)(a=,c=);</code>  &nbsp; &nbsp; <code>fn = [f\_min3](fnliterals.scad#function-f_min3)(a=,b=,c=);</code>  

><code>fn = [f\_max3](fnliterals.scad#function-f_max3)();</code>  &nbsp; &nbsp; <code>fn = [f\_max3](fnliterals.scad#function-f_max3)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_max3](fnliterals.scad#function-f_max3)(b=);</code>  &nbsp; &nbsp; <code>fn = [f\_max3](fnliterals.scad#function-f_max3)(c=);</code>  
><code>fn = [f\_max3](fnliterals.scad#function-f_max3)(a=,b=);</code>  &nbsp; &nbsp; <code>fn = [f\_max3](fnliterals.scad#function-f_max3)(b=,c=);</code>  &nbsp; &nbsp; <code>fn = [f\_max3](fnliterals.scad#function-f_max3)(a=,c=);</code>  &nbsp; &nbsp; <code>fn = [f\_max3](fnliterals.scad#function-f_max3)(a=,b=,c=);</code>  


### Section: Trigonometry Operators

><code>fn = [f\_sin](fnliterals.scad#function-f_sin)();</code>  &nbsp; &nbsp; <code>fn = [f\_sin](fnliterals.scad#function-f_sin)(a);</code>  

><code>fn = [f\_cos](fnliterals.scad#function-f_cos)();</code>  &nbsp; &nbsp; <code>fn = [f\_cos](fnliterals.scad#function-f_cos)(a);</code>  

><code>fn = [f\_tan](fnliterals.scad#function-f_tan)();</code>  &nbsp; &nbsp; <code>fn = [f\_tan](fnliterals.scad#function-f_tan)(a);</code>  

><code>fn = [f\_asin](fnliterals.scad#function-f_asin)();</code>  &nbsp; &nbsp; <code>fn = [f\_asin](fnliterals.scad#function-f_asin)(a);</code>  

><code>fn = [f\_acos](fnliterals.scad#function-f_acos)();</code>  &nbsp; &nbsp; <code>fn = [f\_acos](fnliterals.scad#function-f_acos)(a);</code>  

><code>fn = [f\_atan](fnliterals.scad#function-f_atan)();</code>  &nbsp; &nbsp; <code>fn = [f\_atan](fnliterals.scad#function-f_atan)(a);</code>  

><code>fn = [f\_atan2](fnliterals.scad#function-f_atan2)();</code>  &nbsp; &nbsp; <code>fn = [f\_atan2](fnliterals.scad#function-f_atan2)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_atan2](fnliterals.scad#function-f_atan2)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_atan2](fnliterals.scad#function-f_atan2)(a=,b=);</code>  


### Section: String Operators

><code>fn = [f\_len](fnliterals.scad#function-f_len)();</code>  &nbsp; &nbsp; <code>fn = [f\_len](fnliterals.scad#function-f_len)(a);</code>  

><code>fn = [f\_chr](fnliterals.scad#function-f_chr)();</code>  &nbsp; &nbsp; <code>fn = [f\_chr](fnliterals.scad#function-f_chr)(a);</code>  

><code>fn = [f\_ord](fnliterals.scad#function-f_ord)();</code>  &nbsp; &nbsp; <code>fn = [f\_ord](fnliterals.scad#function-f_ord)(a);</code>  

><code>fn = [f\_str](fnliterals.scad#function-f_str)();</code>  &nbsp; &nbsp; <code>fn = [f\_str](fnliterals.scad#function-f_str)(a);</code>  

><code>fn = [f\_str2](fnliterals.scad#function-f_str2)();</code>  &nbsp; &nbsp; <code>fn = [f\_str2](fnliterals.scad#function-f_str2)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_str2](fnliterals.scad#function-f_str2)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_str2](fnliterals.scad#function-f_str2)(a=,b=);</code>  

><code>fn = [f\_str3](fnliterals.scad#function-f_str3)();</code>  &nbsp; &nbsp; <code>fn = [f\_str3](fnliterals.scad#function-f_str3)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_str3](fnliterals.scad#function-f_str3)(b=);</code>  &nbsp; &nbsp; <code>fn = [f\_str3](fnliterals.scad#function-f_str3)(c=);</code>  
><code>fn = [f\_str3](fnliterals.scad#function-f_str3)(a=,b=);</code>  &nbsp; &nbsp; <code>fn = [f\_str3](fnliterals.scad#function-f_str3)(b=,c=);</code>  &nbsp; &nbsp; <code>fn = [f\_str3](fnliterals.scad#function-f_str3)(a=,c=);</code>  &nbsp; &nbsp; <code>fn = [f\_str3](fnliterals.scad#function-f_str3)(a=,b=,c=);</code>  


### Section: Miscellaneous Operators

><code>fn = [f\_floor](fnliterals.scad#function-f_floor)();</code>  &nbsp; &nbsp; <code>fn = [f\_floor](fnliterals.scad#function-f_floor)(a);</code>  

><code>fn = [f\_round](fnliterals.scad#function-f_round)();</code>  &nbsp; &nbsp; <code>fn = [f\_round](fnliterals.scad#function-f_round)(a);</code>  

><code>fn = [f\_ceil](fnliterals.scad#function-f_ceil)();</code>  &nbsp; &nbsp; <code>fn = [f\_ceil](fnliterals.scad#function-f_ceil)(a);</code>  

><code>fn = [f\_abs](fnliterals.scad#function-f_abs)();</code>  &nbsp; &nbsp; <code>fn = [f\_abs](fnliterals.scad#function-f_abs)(a);</code>  

><code>fn = [f\_sign](fnliterals.scad#function-f_sign)();</code>  &nbsp; &nbsp; <code>fn = [f\_sign](fnliterals.scad#function-f_sign)(a);</code>  

><code>fn = [f\_ln](fnliterals.scad#function-f_ln)();</code>  &nbsp; &nbsp; <code>fn = [f\_ln](fnliterals.scad#function-f_ln)(a);</code>  

><code>fn = [f\_log](fnliterals.scad#function-f_log)();</code>  &nbsp; &nbsp; <code>fn = [f\_log](fnliterals.scad#function-f_log)(a);</code>  

><code>fn = [f\_exp](fnliterals.scad#function-f_exp)();</code>  &nbsp; &nbsp; <code>fn = [f\_exp](fnliterals.scad#function-f_exp)(a);</code>  

><code>fn = [f\_sqr](fnliterals.scad#function-f_sqr)();</code>  &nbsp; &nbsp; <code>fn = [f\_sqr](fnliterals.scad#function-f_sqr)(a);</code>  

><code>fn = [f\_sqrt](fnliterals.scad#function-f_sqrt)();</code>  &nbsp; &nbsp; <code>fn = [f\_sqrt](fnliterals.scad#function-f_sqrt)(a);</code>  

><code>fn = [f\_norm](fnliterals.scad#function-f_norm)();</code>  &nbsp; &nbsp; <code>fn = [f\_norm](fnliterals.scad#function-f_norm)(a);</code>  

><code>fn = [f\_cross](fnliterals.scad#function-f_cross)();</code>  &nbsp; &nbsp; <code>fn = [f\_cross](fnliterals.scad#function-f_cross)(a=);</code>  &nbsp; &nbsp; <code>fn = [f\_cross](fnliterals.scad#function-f_cross)(b);</code>  &nbsp; &nbsp; <code>fn = [f\_cross](fnliterals.scad#function-f_cross)(a=,b=);</code>  


### Section: Type Queries

><code>fn = [f\_is\_def](fnliterals.scad#function-f_is_def)();</code>  

><code>fn = [f\_is\_undef](fnliterals.scad#function-f_is_undef)();</code>  

><code>fn = [f\_is\_bool](fnliterals.scad#function-f_is_bool)();</code>  

><code>fn = [f\_is\_num](fnliterals.scad#function-f_is_num)();</code>  

><code>fn = [f\_is\_int](fnliterals.scad#function-f_is_int)();</code>  

><code>fn = [f\_is\_nan](fnliterals.scad#function-f_is_nan)();</code>  

><code>fn = [f\_is\_finite](fnliterals.scad#function-f_is_finite)();</code>  

><code>fn = [f\_is\_string](fnliterals.scad#function-f_is_string)();</code>  

><code>fn = [f\_is\_list](fnliterals.scad#function-f_is_list)();</code>  

><code>fn = [f\_is\_range](fnliterals.scad#function-f_is_range)();</code>  

><code>fn = [f\_is\_function](fnliterals.scad#function-f_is_function)();</code>  

><code>fn = [f\_is\_vector](fnliterals.scad#function-f_is_vector)();</code>  

><code>fn = [f\_is\_path](fnliterals.scad#function-f_is_path)();</code>  

><code>fn = [f\_is\_region](fnliterals.scad#function-f_is_region)();</code>  

><code>fn = [f\_is\_vnf](fnliterals.scad#function-f_is_vnf)();</code>  

><code>fn = [f\_is\_bezier\_patch](fnliterals.scad#function-f_is_bezier_patch)();</code>  


## LibFile: threading.scad

### Section: Standard (UTS/ISO) Threading

><code>[threaded\_rod](threading.scad#module-threaded_rod)(d, l|length, pitch, [internal=], ...) [ATTACHMENTS];</code>  

><code>[threaded\_nut](threading.scad#module-threaded_nut)(nutwidth, id, h|height|thickness, pitch,...) [ATTACHMENTS];</code>  


### Section: Trapezoidal Threading

><code>[trapezoidal\_threaded\_rod](threading.scad#module-trapezoidal_threaded_rod)(d, l|length, pitch, [thread\_angle=|flank\_angle=], [thread\_depth=], [internal=], ...) [ATTACHMENTS];</code>  

><code>[trapezoidal\_threaded\_nut](threading.scad#module-trapezoidal_threaded_nut)(nutwidth, id, h|height|thickness, pitch, [thread\_angle=|flank\_angle=], [thread\_depth], ...) [ATTACHMENTS];</code>  

><code>[acme\_threaded\_rod](threading.scad#module-acme_threaded_rod)(d, l|length, tpi|pitch=, [internal=], ...) [ATTACHMENTS];</code>  

><code>[acme\_threaded\_nut](threading.scad#module-acme_threaded_nut)(nutwidth, id, h|height|thickness, tpi|pitch=, [shape=], ...) [ATTACHMENTS];</code>  


### Section: Pipe Threading

><code>[npt\_threaded\_rod](threading.scad#module-npt_threaded_rod)(size, [internal=], ...) [ATTACHMENTS];</code>  

><code>[bspp\_threaded\_rod](threading.scad#module-bspp_threaded_rod)(size, [internal=], ...) [ATTACHMENTS];</code>  


### Section: Buttress Threading

><code>[buttress\_threaded\_rod](threading.scad#module-buttress_threaded_rod)(d, l|length, pitch, [internal=], ...) [ATTACHMENTS];</code>  

><code>[buttress\_threaded\_nut](threading.scad#module-buttress_threaded_nut)(nutwidth, id, h|height|thickness, pitch, ...) [ATTACHMENTS];</code>  


### Section: Square Threading

><code>[square\_threaded\_rod](threading.scad#module-square_threaded_rod)(d, l|length, pitch, [internal=], ...) [ATTACHMENTS];</code>  

><code>[square\_threaded\_nut](threading.scad#module-square_threaded_nut)(nutwidth, id, h|height|thickness, pitch, ...) [ATTACHMENTS];</code>  


### Section: Ball Screws

><code>[ball\_screw\_rod](threading.scad#module-ball_screw_rod)(d, l|length, pitch, [ball\_diam], [ball\_arc], [internal=], ...) [ATTACHMENTS];</code>  


### Section: Generic Threading

><code>[generic\_threaded\_rod](threading.scad#module-generic_threaded_rod)(d, l|length, pitch, profile, [internal=], ...) [ATTACHMENTS];</code>  

><code>[generic\_threaded\_nut](threading.scad#module-generic_threaded_nut)(nutwidth, id, h|height|thickness, pitch, profile, [$slop], ...) [ATTACHMENTS];</code>  

><code>[thread\_helix](threading.scad#module-thread_helix)(d, pitch, turns=, [thread\_depth=], [thread\_angle=|flank\_angle=], [profile=], [starts=], [internal=], ...) {ATTACHMENTS};</code>  
><code>[thread\_helix](threading.scad#module-thread_helix)(d1=,d2=, pitch=, turns=, [thread\_depth=], [thread\_angle=|flank\_angle=], [profile=], [starts=], [internal=], ...) {ATTACHMENTS};</code>  


## LibFile: screws.scad

### Section: Making Screws

><code>[screw](screws.scad#module-screw)([spec], [head], [drive], [thread=], [drive\_size=], [length=|l=], [thread\_len=], [undersize=], [shaft\_undersize=], [head\_undersize=], [tolerance=], [blunt\_start=], [details=], [anchor=], [atype=], [orient=], [spin=]) [ATTACHMENTS];</code>  

><code>[screw\_hole](screws.scad#module-screw_hole)([spec], [head], [thread=], [length=|l=], [oversize=], [hole\_oversize=], [teardrop=], [head\_oversize], [tolerance=], [$slop=], [blunt\_start=], [anchor=], [atype=], [orient=], [spin=]) [ATTACHMENTS];</code>  

><code>[shoulder\_screw](screws.scad#module-shoulder_screw)(s, d, length, [head=], [thread\_len=], [tolerance=], [head\_size=], [drive=], [drive\_size=], [thread=], [undersize=], [shaft\_undersize=], [head\_undersize=], [shoulder\_undersize=],[atype=],[anchor=],[orient=],[spin=]) [ATTACHMENTS];</code>  

><code>[screw\_head](screws.scad#module-screw_head)(screw\_info, [details],[counterbore],[flat\_height],[teardrop],[internal])</code>  


### Section: Nuts and nut traps

><code>[nut](screws.scad#module-nut)([spec], [shape], [thickness], [[nut](screws.scad#module-nut)width], [thread=], [tolerance=], [hole\_oversize=], [bevel=], [$slop=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  

><code>[nut\_trap\_side](screws.scad#module-nut_trap_side)(trap\_width, [spec], [shape], [thickness], [nutwidth=], [poke\_len=], [poke\_diam=], [$slop=], [anchor=], [orient=], [spin=]) [ATTACHMENTS];</code>  

><code>[nut\_trap\_inline](screws.scad#module-nut_trap_inline)(length|l|heigth|h, [spec], [shape], [$slop=], [anchor=], [orient=], [spin=]) [ATTACHMENTS];</code>  


### Section: Screw and Nut Information

><code>info = [screw\_info](screws.scad#function-screw_info)(name, [head], [drive], [thread=], [drive\_size=], [oversize=], [head\_oversize=])</code>  

><code>nut\_spec = [nut\_info](screws.scad#function-nut_info)(name, [shape], [thickness=], [thread=], [width=], [hole\_oversize=]);</code>  

><code>[thread\_specification](screws.scad#function-thread_specification)(screw\_spec, [tolerance], [internal])</code>  


## LibFile: screw\_drive.scad

### Section: Phillips Drive

><code>[phillips\_mask](screw_drive.scad#module-phillips_mask)(size) [ATTACHMENTS];</code>  

><code>depth = [phillips\_depth](screw_drive.scad#function-phillips_depth)(size, d);</code>  

><code>diam = [phillips\_diam](screw_drive.scad#function-phillips_diam)(size, depth);</code>  


### Section: Hex drive

><code>[hex\_drive\_mask](screw_drive.scad#module-hex_drive_mask)(size, length, [anchor], [spin], [orient], [$slop]) [ATTACHMENTS];</code>  


### Section: Torx Drive

><code>[torx\_mask](screw_drive.scad#module-torx_mask)(size, l, [center]) [ATTACHMENTS];</code>  

><code>[torx\_mask2d](screw_drive.scad#module-torx_mask2d)(size);</code>  

><code>info = [torx\_info](screw_drive.scad#function-torx_info)(size);</code>  

><code>diam = [torx\_diam](screw_drive.scad#function-torx_diam)(size);</code>  

><code>depth = [torx\_depth](screw_drive.scad#function-torx_depth)(size);</code>  


### Section: Robertson/Square Drives

><code>[robertson\_mask](screw_drive.scad#module-robertson_mask)(size, [extra], [ang], [$slop=]);</code>  


## LibFile: bottlecaps.scad

### Section: PCO-1810 Bottle Threading

><code>[pco1810\_neck](bottlecaps.scad#module-pco1810_neck)([wall]) [ATTACHMENTS];</code>  

><code>[pco1810\_cap](bottlecaps.scad#module-pco1810_cap)([h], [r|d], [wall], [texture]) [ATTACHMENTS];</code>  


### Section: PCO-1881 Bottle Threading

><code>[pco1881\_neck](bottlecaps.scad#module-pco1881_neck)([wall]) [ATTACHMENTS];</code>  

><code>[pco1881\_cap](bottlecaps.scad#module-pco1881_cap)(wall, [texture]) [ATTACHMENTS];</code>  


### Section: Generic Bottle Connectors

><code>[generic\_bottle\_neck](bottlecaps.scad#module-generic_bottle_neck)([wall], ...) [ATTACHMENTS];</code>  

><code>[generic\_bottle\_cap](bottlecaps.scad#module-generic_bottle_cap)(wall, [texture], ...) [ATTACHMENTS];</code>  

><code>[bottle\_adapter\_neck\_to\_cap](bottlecaps.scad#module-bottle_adapter_neck_to_cap)(wall, [texture], ...) [ATTACHMENTS];</code>  

><code>[bottle\_adapter\_cap\_to\_cap](bottlecaps.scad#module-bottle_adapter_cap_to_cap)(wall, [texture]) [ATTACHMENTS];</code>  

><code>[bottle\_adapter\_neck\_to\_neck](bottlecaps.scad#module-bottle_adapter_neck_to_neck)(...) [ATTACHMENTS];</code>  


### Section: SPI Bottle Threading

><code>[sp\_neck](bottlecaps.scad#module-sp_neck)(diam, type, wall|id=, [style=], [bead=]) [ATTACHMENTS];</code>  

><code>[sp\_cap](bottlecaps.scad#module-sp_cap)(diam, type, wall, [style=], [top\_adj=], [bot\_adj=], [texture=], [$slop]) [ATTACHMENTS];</code>  

><code>true\_diam = [sp\_diameter](bottlecaps.scad#function-sp_diameter)(diam,type)</code>  


## LibFile: ball\_bearings.scad

### Section: Ball Bearing Models

><code>[ball\_bearing](ball_bearings.scad#module-ball_bearing)(trade\_size, [id=], [od=], [width=], [shield=], [flange=], [fd=], [fw=], [rounding=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  


### Section: Ball Bearing Info

><code>info = [ball\_bearing\_info](ball_bearings.scad#function-ball_bearing_info)(trade\_size);</code>  


## LibFile: cubetruss.scad

### Section: Cube Trusses

><code>[cubetruss](cubetruss.scad#module-cubetruss)(extents, [clips=], [bracing=], [size=], [strut=], [clipthick=], ...) [ATTACHMENTS];</code>  

><code>[cubetruss\_corner](cubetruss.scad#module-cubetruss_corner)(h, extents, [bracing=], [size=], [strut=], [clipthick=]);</code>  

><code>[cubetruss\_support](cubetruss.scad#module-cubetruss_support)([size=], [strut=], [extents=]) [ATTACHMENTS];</code>  


### Section: Cubetruss Support

><code>[cubetruss\_foot](cubetruss.scad#module-cubetruss_foot)(w, [size=], [strut=], [clipthick=]) [ATTACHMENTS];</code>  

><code>[cubetruss\_joiner](cubetruss.scad#module-cubetruss_joiner)([w=], [vert=], [size=], [strut=], [clipthick=]) [ATTACHMENTS];</code>  

><code>[cubetruss\_uclip](cubetruss.scad#module-cubetruss_uclip)(dual, [size=], [strut=], [clipthick=]) [ATTACHMENTS];</code>  


### Section: Cubetruss Primitives

><code>[cubetruss\_segment](cubetruss.scad#module-cubetruss_segment)([size=], [strut=], [bracing=]);</code>  

><code>[cubetruss\_clip](cubetruss.scad#module-cubetruss_clip)(extents, [size=], [strut=], [clipthick=]) [ATTACHMENTS];</code>  

><code>length = [cubetruss\_dist](cubetruss.scad#function-cubetruss_dist)(cubes, [gaps], [size=], [strut=]);</code>  


## LibFile: gears.scad

### Section: Gears

><code>[spur\_gear](gears.scad#functionmodule-spur_gear)(circ\_pitch, teeth, [thickness], [helical=], [pressure\_angle=], [profile\_shift=], [backlash=], [shaft\_diam=], [hide=], [clearance=], [slices=], [internal=], [herringbone=]) [ATTACHMENTS];</code>  
><code>[spur\_gear](gears.scad#functionmodule-spur_gear)(mod=|diam\_pitch=, teeth=, [thickness=], ...) [ATTACHMENTS];</code>  
><code>vnf = [spur\_gear](gears.scad#functionmodule-spur_gear)(circ\_pitch, teeth, [thickness], ...);</code>  
><code>vnf = [spur\_gear](gears.scad#functionmodule-spur_gear)(mod=|diam\_pitch=, teeth=, [thickness=], ...);</code>  

><code>[spur\_gear2d](gears.scad#functionmodule-spur_gear2d)(circ\_pitch, teeth, [pressure\_angle=], [profile\_shift=], [shorten=], [hide=], [shaft\_diam=], [clearance=], [backlash=], [internal=]) [ATTACHMENTS];</code>  
><code>[spur\_gear2d](gears.scad#functionmodule-spur_gear2d)(mod=|diam\_pitch=, teeth=, [pressure\_angle=], [profile\_shift=], [shorten=], [hide=], [shaft\_diam=], [clearance=], [backlash=], [internal=]) [ATTACHMENTS];</code>  
><code>rgn = [spur\_gear2d](gears.scad#functionmodule-spur_gear2d)(circ\_pitch, teeth, [pressure\_angle=], [profile\_shift=], [shorten=], [hide=], [shaft\_diam=], [clearance=], [backlash=], [internal=]);</code>  
><code>rgn = [spur\_gear2d](gears.scad#functionmodule-spur_gear2d)(mod=, teeth=, [pressure\_angle=], [profile\_shift=], [shorten=], [hide=], [shaft\_diam=], [clearance=], [backlash=], [internal=]);</code>  

><code>[ring\_gear](gears.scad#module-ring_gear)(circ\_pitch, teeth, thickness, [backing|od=|or=|width=], [pressure\_angle=], [helical=], [herringbone=], [profile\_shift=], [clearance=], [backlash=]) [ATTACHMENTS];</code>  
><code>[ring\_gear](gears.scad#module-ring_gear)(mod=, teeth=, thickness=, [backing=|od=|or=|width=], [pressure\_angle=], [helical=], [herringbone=], [profile\_shift=], [clearance=], [backlash=]) [ATTACHMENTS];</code>  
><code>[ring\_gear](gears.scad#module-ring_gear)(diam\_pitch=, teeth=, thickness=, [backing=|od=|or=|width=], [pressure\_angle=], [helical=], [herringbone=], [profile\_shift=], [clearance=], [backlash=]) [ATTACHMENTS];</code>  

><code>[ring\_gear2d](gears.scad#module-ring_gear2d)(circ\_pitch, teeth, [backing|od=|or=|width=], [pressure\_angle=], [helical=], [profile\_shift=], [clearance=], [backlash=]) [ATTACHMENTS];</code>  
><code>[ring\_gear2d](gears.scad#module-ring_gear2d)(mod=, teeth=, [backing=|od=|or=|width=], [pressure\_angle=], [helical=], [profile\_shift=], [clearance=], [backlash=]) [ATTACHMENTS];</code>  
><code>[ring\_gear2d](gears.scad#module-ring_gear2d)(diam\_pitch=, teeth=, [backing=|od=|or=|width=], [pressure\_angle=], [helical=], [profile\_shift=], [clearance=], [backlash=]) [ATTACHMENTS];</code>  

><code>[rack](gears.scad#functionmodule-rack)(pitch, teeth, thickness, [base|bottom=|width=], [helical=], [pressure\_angle=], [backlash=], [clearance=]) [ATTACHMENTS];</code>  
><code>[rack](gears.scad#functionmodule-rack)(mod=, teeth=, thickness=, [base=|bottom=|width=], [helical=], [pressure\_angle=], [backlash]=, [clearance=]) [ATTACHMENTS];</code>  
><code>vnf = [rack](gears.scad#functionmodule-rack)(pitch, teeth, thickness, [base|bottom=|width=], [helical=], [pressure\_angle=], [backlash=], [clearance=]);</code>  
><code>vnf = [rack](gears.scad#functionmodule-rack)(mod=, teeth=, thickness=, [base=|bottom=|width=], [helical=], [pressure\_angle=], [backlash=], [clearance=]);</code>  

><code>[rack2d](gears.scad#functionmodule-rack2d)(pitch, teeth, [base|bottom=|width=], [pressure\_angle=], [backlash=], [clearance=]) [ATTACHMENTS];</code>  
><code>[rack2d](gears.scad#functionmodule-rack2d)(mod=, teeth=, [base=|bottom=|width=], [pressure\_angle=], [backlash=], [clearance=]) [ATTACHMENTS];</code>  
><code>path = [rack2d](gears.scad#functionmodule-rack2d)(pitch, teeth, [base|bottom=|width=], [pressure\_angle=], [backlash=], [clearance=]);</code>  
><code>path = [rack2d](gears.scad#functionmodule-rack2d)(mod=, teeth=, [base=|bottom=|width=], [pressure\_angle=], [backlash=], [clearance=]);</code>  

><code>[crown\_gear](gears.scad#functionmodule-crown_gear)(circ\_pitch, teeth, backing, face\_width, [pressure\_angle=], [clearance=], [backlash=], [profile\_shift=], [slices=]);</code>  
><code>[crown\_gear](gears.scad#functionmodule-crown_gear)(diam\_pitch=, teeth=, backing=, face\_width=, [pressure\_angle=], [clearance=], [backlash=], [profile\_shift=], [slices=]);</code>  
><code>[crown\_gear](gears.scad#functionmodule-crown_gear)(mod=, teeth=, backing=, face\_width=, [pressure\_angle=], [clearance=], [backlash=], [profile\_shift=], [slices=]);</code>  
><code>vnf = [crown\_gear](gears.scad#functionmodule-crown_gear)(circ\_pitch, teeth, backing, face\_width, [pressure\_angle=], [clearance=], [backlash=], [profile\_shift=], [slices=]);</code>  
><code>vnf = [crown\_gear](gears.scad#functionmodule-crown_gear)(diam\_pitch=, teeth=, backing=, face\_width=, [pressure\_angle=], [clearance=], [backlash=], [profile\_shift=], [slices=]);</code>  
><code>vnf = [crown\_gear](gears.scad#functionmodule-crown_gear)(mod=, teeth=, backing=, face\_width=, [pressure\_angle=], [clearance=], [backlash=], [profile\_shift=], [slices=]);</code>  

><code>gear\_dist(mod=|diam\_pitch=|circ\_pitch=, teeth, mate\_teeth, [shaft\_angle], [shaft\_diam], [face\_width=], [hide=], [spiral=], [cutter\_radius=], [right\_handed=], [pressure\_angle=], [backing=|thickness=|bottom=], [cone\_backing=], [backlash=], [slices=], [internal=], [gear\_spin=], ...) [ATTACHMENTS];</code>  
><code>vnf = gear\_dist(mod=|diam\_pitch=|circ\_pitch=, teeth, mate\_teeth, [shaft\_angle], [face\_width=], [hide=], [spiral=], [cutter\_radius=], [right\_handed=], [pressure\_angle=], , [backing=|thickness=|bottom=], [cone\_backing=], [backlash=], [slices=], [internal=], [gear\_spin=], ...);</code>  

><code>[worm](gears.scad#functionmodule-worm)(circ\_pitch, d, l, [starts=], [left\_handed=], [pressure\_angle=], [backlash=], [clearance=]);</code>  
><code>[worm](gears.scad#functionmodule-worm)(mod=, d=, l=, [starts=], [left\_handed=], [pressure\_angle=], [backlash=], [clearance=]);</code>  
><code>vnf = [worm](gears.scad#functionmodule-worm)(circ\_pitch, d, l, [starts=], [left\_handed=], [pressure\_angle=], [backlash=], [clearance=]);</code>  
><code>vnf = [worm](gears.scad#functionmodule-worm)(mod=, d=, l=, [starts=], [left\_handed=], [pressure\_angle=], [backlash=], [clearance=]);</code>  

><code>[enveloping\_worm](gears.scad#functionmodule-enveloping_worm)(circ\_pitch, mate\_teeth, d, [left\_handed=], [starts=], [arc=], [pressure\_angle=]);</code>  
><code>[enveloping\_worm](gears.scad#functionmodule-enveloping_worm)(mod=, mate\_teeth=, d=, [left\_handed=], [starts=], [arc=], [pressure\_angle=]);</code>  
><code>[enveloping\_worm](gears.scad#functionmodule-enveloping_worm)(diam\_pitch=, mate\_teeth=, d=, [left\_handed=], [starts=], [arc=], [pressure\_angle=]);</code>  
><code>vnf = [enveloping\_worm](gears.scad#functionmodule-enveloping_worm)(circ\_pitch, mate\_teeth, d, [left\_handed=], [starts=], [arc=], [pressure\_angle=]);</code>  
><code>vnf = [enveloping\_worm](gears.scad#functionmodule-enveloping_worm)(mod=, mate\_teeth=, d=, [left\_handed=], [starts=], [arc=], [pressure\_angle=]);</code>  
><code>vnf = [enveloping\_worm](gears.scad#functionmodule-enveloping_worm)(diam\_pitch=, mate\_teeth=, d=, [left\_handed=], [starts=], [arc=], [pressure\_angle=]);</code>  

><code>[worm\_gear](gears.scad#functionmodule-worm_gear)(circ\_pitch, teeth, worm\_diam, [worm\_starts=], [worm\_arc=], [crowning=], [left\_handed=], [pressure\_angle=], [backlash=], [clearance=], [slices=], [shaft\_diam=]) [ATTACHMENTS];</code>  
><code>[worm\_gear](gears.scad#functionmodule-worm_gear)(mod=, teeth=, worm\_diam=, [worm\_starts=], [worm\_arc=], [crowning=], [left\_handed=], [pressure\_angle=], [backlash=], [clearance=], [slices=], [shaft\_diam=]) [ATTACHMENTS];</code>  
><code>vnf = [worm\_gear](gears.scad#functionmodule-worm_gear)(circ\_pitch, teeth, worm\_diam, [worm\_starts=], [worm\_arc=], [crowning=], [left\_handed=], [pressure\_angle=], [backlash=], [clearance=], [slices=]);</code>  
><code>vnf = [worm\_gear](gears.scad#functionmodule-worm_gear)(mod=, teeth=, worm\_diam=, [worm\_starts=], [worm\_arc=], [crowning=], [left\_handed=], [pressure\_angle=], [backlash=], [clearance=], [slices=]);</code>  


### Section: Gear Assemblies

><code>gear\_data = [planetary\_gears](gears.scad#function-planetary_gears)(mod=|circ\_pitch=|diam\_pitch=, n, max\_teeth, ring\_carrier=|carrier\_ring=|sun\_carrier=|carrier\_sun=|sun\_ring=|ring\_sun=, [helical=], [gear\_spin=]);</code>  


### Section: Computing Gear Dimensions

><code>circ\_pitch = [circular\_pitch](gears.scad#function-circular_pitch)(circ\_pitch);</code>  &nbsp; &nbsp; <code>circ\_pitch = [circular\_pitch](gears.scad#function-circular_pitch)(mod=);</code>  
><code>circ\_pitch = [circular\_pitch](gears.scad#function-circular_pitch)(diam\_pitch=);</code>  

><code>dp = [diametral\_pitch](gears.scad#function-diametral_pitch)(circ\_pitch);</code>  &nbsp; &nbsp; <code>dp = [diametral\_pitch](gears.scad#function-diametral_pitch)(mod=);</code>  
><code>dp = [diametral\_pitch](gears.scad#function-diametral_pitch)(diam\_pitch=);</code>  

><code>mod = [module\_value](gears.scad#function-module_value)(circ\_pitch);</code>  &nbsp; &nbsp; <code>mod = [module\_value](gears.scad#function-module_value)(mod=);</code>  
><code>mod = [module\_value](gears.scad#function-module_value)(diam\_pitch=);</code>  

><code>pr = [pitch\_radius](gears.scad#function-pitch_radius)(pitch, teeth, [helical]);</code>  
><code>pr = [pitch\_radius](gears.scad#function-pitch_radius)(mod=, teeth=, [helical=]);</code>  

><code>or = [outer\_radius](gears.scad#function-outer_radius)(circ\_pitch, teeth, [helical=], [clearance=], [internal=], [profile\_shift=], [shorten=]);</code>  
><code>or = [outer\_radius](gears.scad#function-outer_radius)(mod=, teeth=, [helical=], [clearance=], [internal=], [profile\_shift=], [shorten=]);</code>  
><code>or = [outer\_radius](gears.scad#function-outer_radius)(diam\_pitch=, teeth=, [helical=], [clearance=], [internal=], [profile\_shift=], [shorten=]);</code>  

><code>rr = outer\_radius(mod=|circ\_pitch=|diam\_pitch=, teeth, [helical], [pressure\_angle=], [clearance=], [internal=], [profile\_shift=], [backlash=]);</code>  

><code>ang = [bevel\_pitch\_angle](gears.scad#function-bevel_pitch_angle)(teeth, mate\_teeth, [drive\_angle=]);</code>  

><code>thick = [worm\_gear\_thickness](gears.scad#function-worm_gear_thickness)(pitch, teeth, worm\_diam, [worm\_arc=], [crowning=], [clearance=]);</code>  
><code>thick = [worm\_gear\_thickness](gears.scad#function-worm_gear_thickness)(mod=, teeth=, worm\_diam=, [worm\_arc=], [crowning=], [clearance=]);</code>  

><code>dist = [worm\_dist](gears.scad#function-worm_dist)(mod=|diam\_pitch=|circ\_pitch=, d, starts, teeth, [profile\_shift], [pressure\_angle=]);</code>  

><code>dist = [gear\_dist](gears.scad#function-gear_dist)(mod=|diam\_pitch=|circ\_pitch=, teeth1, teeth2, [helical], [profile\_shift1], [profile\_shift2], [pressure\_angle=], [backlash=]);</code>  

><code>dist = [gear\_dist\_skew](gears.scad#function-gear_dist_skew)(mod=|diam\_pitch=|circ\_pitch=, teeth1, teeth2, helical1, helical2, [profile\_shift1], [profile\_shift2], [pressure\_angle=]</code>  

><code>ang = [gear\_skew\_angle](gears.scad#function-gear_skew_angle)(teeth1, teeth2, helical1, helical2, [profile\_shift1], [profile\_shift2], [pressure\_angle=]</code>  

><code>total\_shift = [get\_profile\_shift](gears.scad#function-get_profile_shift)(mod=|diam\_pitch=|circ\_pitch=, desired, teeth1, teeth2, [helical], [pressure\_angle=],</code>  

><code>x = [auto\_profile\_shift](gears.scad#function-auto_profile_shift)(teeth, [pressure\_angle], [helical], [profile\_shift=]);</code>  
><code>x = [auto\_profile\_shift](gears.scad#function-auto_profile_shift)(teeth, [pressure\_angle], [helical], get\_min=);</code>  
><code>x = [auto\_profile\_shift](gears.scad#function-auto_profile_shift)(teeth, min\_teeth=);</code>  

><code>shorten = [gear\_shorten](gears.scad#function-gear_shorten)(teeth1, teeth2, [helical], [profile\_shift1], [profile\_shift2], [pressure\_angle=]);</code>  

><code>shorten = [gear\_shorten\_skew](gears.scad#function-gear_shorten_skew)(teeth1, teeth2, helical1, helical2, [profile\_shift1], [profile\_shift2], [pressure\_angle=]);</code>  


## LibFile: hinges.scad

### Section: Hinges

><code>[knuckle\_hinge](hinges.scad#module-knuckle_hinge)(length, offset, segs, [inner], [arm\_height=], [arm\_angle=], [fill=], [clear\_top=], [gap=], [round\_top=], [round\_bot=], [knuckle\_diam=], [pin\_diam=], [pin\_fn=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  

><code>[living\_hinge\_mask](hinges.scad#module-living_hinge_mask)(l, thick, [layerheight=], [foldangle=], [hingegap=], [$slop=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  


### Section: Snap Locks

><code>[apply\_folding\_hinges\_and\_snaps](hinges.scad#module-apply_folding_hinges_and_snaps)(thick, [foldangle=], [hinges=], [snaps=], [sockets=], [snaplen=], [snapdiam=], [hingegap=], [layerheight=], [$slop=]) CHILDREN;</code>  

><code>[snap\_lock](hinges.scad#module-snap_lock)(thick, [snaplen=], [snapdiam=], [layerheight=], [foldangle=], [hingegap=], [$slop=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  

><code>[snap\_socket](hinges.scad#module-snap_socket)(thick, [snaplen=], [snapdiam=], [layerheight=], [foldangle=], [hingegap=], [$slop=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  


## LibFile: joiners.scad

### Section: Half Joiners

><code>[half\_joiner\_clear](joiners.scad#functionmodule-half_joiner_clear)(l, w, [ang=], [clearance=], [overlap=]) [ATTACHMENTS];</code>  
><code>vnf = [half\_joiner\_clear](joiners.scad#functionmodule-half_joiner_clear)(l, w, [ang=], [clearance=], [overlap=]);</code>  

><code>[half\_joiner](joiners.scad#functionmodule-half_joiner)(l, w, [base=], [ang=], [screwsize=], [$slop=]) [ATTACHMENTS];</code>  
><code>vnf = [half\_joiner](joiners.scad#functionmodule-half_joiner)(l, w, [base=], [ang=], [screwsize=], [$slop=]);</code>  

><code>[half\_joiner2](joiners.scad#functionmodule-half_joiner2)(l, w, [base=], [ang=], [screwsize=])</code>  
><code>vnf = [half\_joiner2](joiners.scad#functionmodule-half_joiner2)(l, w, [base=], [ang=], [screwsize=])</code>  


### Section: Full Joiners

><code>[joiner\_clear](joiners.scad#module-joiner_clear)(l, w, [ang=], [clearance=], [overlap=]) [ATTACHMENTS];</code>  

><code>[joiner](joiners.scad#module-joiner)(l, w, base, [ang=], [screwsize=], [$slop=]) [ATTACHMENTS];</code>  


### Section: Dovetails

><code>[dovetail](joiners.scad#module-dovetail)(gender, w=|width, h=|height, slide|thickness=, [slope=|angle=], [taper=|back\_width=], [chamfer=], [r=|radius=], [round=], [extra=], [entry\_slot\_length=], [$slop=])</code>  


### Section: Tension Clips

><code>[snap\_pin](joiners.scad#module-snap_pin)(size, [pointed=], [anchor=], [spin=], [orient]=) [ATTACHMENTS];</code>  
><code>[snap\_pin](joiners.scad#module-snap_pin)(r=|radius=|d=|diameter=, l=|length=, nub\_depth=, snap=, thickness=, [clearance=], [preload=], [pointed=]) [ATTACHMENTS];</code>  

><code>[snap\_pin\_socket](joiners.scad#module-snap_pin_socket)(size, [fixed=], [fins=], [pointed=], [anchor=], [spin=], [orient=]) [ATTACHMENTS];</code>  
><code>[snap\_pin\_socket](joiners.scad#module-snap_pin_socket)(r=|radius=|d=|diameter=, l=|length=, nub\_depth=, snap=, [fixed=], [pointed=], [fins=]) [ATTACHMENTS];</code>  

><code>[rabbit\_clip](joiners.scad#module-rabbit_clip)(type, length, width, snap, thickness, depth, [compression=], [clearance=], [lock=], [lock\_clearance=], [splineteps=], [anchor=], [orient=], [spin=]) [ATTACHMENTS];</code>  


### Section: Splines

><code>[hirth](joiners.scad#module-hirth)(n, ir|id=, or|od=, tooth\_angle, [cone\_angle=], [chamfer=], [rounding=], [base=], [crop=], [anchor=], [spin=], [orient=]</code>  


## LibFile: linear\_bearings.scad

### Section: Generic Linear Bearings

><code>[linear\_bearing\_housing](linear_bearings.scad#module-linear_bearing_housing)(d, l, tab, gap, wall, tabwall, screwsize) [ATTACHMENTS];</code>  

><code>[linear\_bearing](linear_bearings.scad#module-linear_bearing)(l, od, id, length) [ATTACHMENTS];</code>  


### Section: lmXuu Linear Bearings

><code>[lmXuu\_housing](linear_bearings.scad#module-lmxuu_housing)(size, tab, gap, wall, tabwall, screwsize) [ATTACHMENTS];</code>  

><code>[lmXuu\_bearing](linear_bearings.scad#module-lmxuu_bearing)(size) [ATTACHMENTS];</code>  


### Section: lmXuu Linear Bearing Info

><code>diam\_len = [lmXuu\_info](linear_bearings.scad#function-lmxuu_info)(size);</code>  


## LibFile: modular\_hose.scad

### Section: Modular Hose Parts

><code>[modular\_hose](modular_hose.scad#module-modular_hose)(size, type, [clearance], [waist\_len], [anchor], [spin], [orient]) [ATTACHMENTS];</code>  

><code>r = [modular\_hose\_radius](modular_hose.scad#function-modular_hose_radius)(size, [outer]);</code>  


## LibFile: nema\_steppers.scad

### Section: Motor Models

><code>[nema\_stepper\_motor](nema_steppers.scad#module-nema_stepper_motor)(size, h, shaft\_len, [$slop=], ...) [ATTACHMENTS];</code>  


### Section: Masking Modules

><code>[nema\_mount\_mask](nema_steppers.scad#module-nema_mount_mask)(size, depth, l, [$slop], ...);</code>  


### Section: Functions

><code>info = [nema\_motor\_info](nema_steppers.scad#function-nema_motor_info)(size);</code>  


## LibFile: polyhedra.scad

### Section: Polyhedra

><code>[regular\_polyhedron](polyhedra.scad#module-regular_polyhedron)([name],[index=],[type=],[faces=],[facetype=],[hasfaces=],...) [CHILDREN];</code>  
><code>[regular\_polyhedron](polyhedra.scad#module-regular_polyhedron)(..., [or=|r=|d=],[ir=],[mr=],[side=],[facedown=],[anchor=], ...) [CHILDREN];]</code>  
><code>[regular\_polyhedron](polyhedra.scad#module-regular_polyhedron)(..., [draw=], [rounding=], [stellate=], [repeat=], [rotate\_children=]) [CHILDREN];</code>  
><code>[regular\_polyhedron](polyhedra.scad#module-regular_polyhedron)("trapezohedron", [longside=],[h=], ...) [CHILDREN];</code>  

><code>info = [regular\_polyhedron\_info](polyhedra.scad#function-regular_polyhedron_info)(info, ...);</code>  


## LibFile: sliders.scad

### Section: Modules

><code>[slider](sliders.scad#module-slider)(l, w, h, [base=], [wall=], [ang=], [$slop=]) [ATTACHMENTS];</code>  

><code>[rail](sliders.scad#module-rail)(l, w, h, [chamfer=], [ang=]) [ATTACHMENTS];</code>  


## LibFile: tripod\_mounts.scad

### Section: 

><code>[manfrotto\_rc2\_plate](tripod_mounts.scad#module-manfrotto_rc2_plate)([chamfer],[anchor],[orient],[spin]) [ATTACHMENTS];</code>  


## LibFile: walls.scad

### Section: Walls

><code>[sparse\_wall](walls.scad#module-sparse_wall)(h, l, thick, [maxang=], [strut=], [max\_bridge=]) [ATTACHMENTS];</code>  

><code>[sparse\_wall2d](walls.scad#module-sparse_wall2d)(size, [maxang=], [strut=], [max\_bridge=]) [ATTACHMENTS];</code>  

><code>[sparse\_cuboid](walls.scad#module-sparse_cuboid)(size, [dir], [maxang=], [struct=]</code>  

><code>[hex\_panel](walls.scad#module-hex_panel)(shape, wall, spacing, [frame=], [bevel=], [bevel\_frame=], [shift=], [h=|height=|l=|length=], [anchor=], [orient=], [spin=])</code>  

><code>[corrugated\_wall](walls.scad#module-corrugated_wall)(h, l, thick, [strut=], [wall=]) [ATTACHMENTS];</code>  

><code>[thinning\_wall](walls.scad#module-thinning_wall)(h, l, thick, [ang=], [braces=], [strut=], [wall=]) [ATTACHMENTS];</code>  

><code>[thinning\_triangle](walls.scad#module-thinning_triangle)(h, l, thick, [ang=], [strut=], [wall=], [diagonly=], [center=]) [ATTACHMENTS];</code>  

><code>[narrowing\_strut](walls.scad#module-narrowing_strut)(w, l, wall, [ang=]) [ATTACHMENTS];</code>  


## LibFile: wiring.scad

### Section: Modules

><code>[wire\_bundle](wiring.scad#module-wire_bundle)(path, wires, [wirediam], [rounding], [wirenum=], [corner\_steps=]);</code>  


## LibFile: hooks.scad

### Section: 

><code>[ring\_hook](hooks.scad#module-ring_hook)(base\_size, hole\_z, or, od=, [ir=], [hole=], [rounding=], [fillet=], [hole\_rounding=], [anchor=], [spin=], [orient=])</code>  



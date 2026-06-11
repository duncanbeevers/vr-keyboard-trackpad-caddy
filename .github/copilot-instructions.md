# AI Copilot Instructions for Keyboard-Trackpad-Slider

This repository contains OpenSCAD designs for a custom slide-out Keyboard, Trackpad, and Slider tray assembly using the Belfry OpenSCAD Library v2 (BOSL2).

To ensure high-quality, elegant, and mechanically sound contributions, all AI systems and agents must follow these instructions and plan their changes using the provided resource documents.

---

## 🛠️ The Repository Toolbox (`/Resources`)

A collection of local BOSL2 documentation files is available in the `Resources/` folder. **You must consult these files before executing any geometry modifications or adding features.**

1. **[Resources/CheatSheet.md](Resources/CheatSheet.md)** - Rapid syntax lookups for constants, direction vectors (`LEFT`, `RIGHT`, `FRONT`, `BACK`, `BOTTOM`, `TOP`), transformation helpers (`move()`, `up()`, `down()`, `fwd()`, `back()`), and standard shapes.
2. **[Resources/Tutorial-Rounding_the_Cube.md](Resources/Tutorial-Rounding_the_Cube.md)** - Explains how to round and chamfer cube-like shapes using `cuboid()`, `prismoid()`, and `rounded_prism()`. Explains specifying edges using directional vector combinations (e.g. `TOP + RIGHT` or `edges=BOTTOM`) and how to mask or use built-in parameters.
3. **[Resources/BOSL2-Attachments-Master.md](Resources/BOSL2-Attachments-Master.md)** - Complete reference on the BOSL2 attachment and anchoring system (`attach()`, `align()`, parent-child relative placements) which avoids manual translation math.
4. **[Resources/screws.scad.md](Resources/screws.scad.md)** - Detailed guide on metric/standard fasteners. Use this to model screw threads and tight-clearance screw holes utilizing functions like `screw()` and `screw_hole()`.
5. **[Resources/hinges.scad.md](Resources/hinges.scad.md)** - Documentation on building robust hinge structures.

---

## 📋 Planning & Execution Protocol

Before editing any OpenSCAD files (such as `trays.scad`):

1. **Information Gathering**:
   - Locate the modules/methods that need alteration in [trays.scad](trays.scad).
   - Identify which documents in `Resources/` are relevant to your task (e.g., fastener clearances -> [Resources/screws.scad.md](Resources/screws.scad.md)).
2. **Formulate a Structured Plan**:
   - Write down your planned changes as a set of logical steps.
   - Reference the concepts and function signatures retrieved from the `Resources/` files to justify your design decisions.
3. **Adhere to the Codebase Style**:
   - Use clean, relative BOSL2 positioning (`align()`, `attach()`, `tag()`) rather than nested, hard-to-maintain native OpenSCAD translations (`translate()`, `difference()`).
   - Use configuration variables defined in the header of [trays.scad](trays.scad) (like `$slop`, `$fn`, `WALL_THICKNESS`) for printer tolerances and dimensional bounds.

---

## 🤖 Custom Gem / Agent Instructions

For additional user-scoped rules, check the Custom Gem Instructions file at `.github/gemini-gem-instructions.md`. Keep those instructions in mind for all tasks in this repository.

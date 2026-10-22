# How a self-expanding heart valve opens, drawn one frame at a time

**Subtitle:** A 34-second film of capsule pullback, nitinol seating, and pericardial coaptation. Here is what the picture computes, what the metallurgy papers actually say, and what this drawing refuses to claim.

**Paste notes for Medium**

- Title as written above. Do not append a keyword list.
- Subtitle is the deck under the title.
- Tags: Transcatheter Aortic Valve, Nitinol, Medical Animation, Heart Valve, Biomedical Engineering
- Canonical film: https://mizcausevic-dev.github.io/tavr-deployment-jig/
- Source: https://github.com/mizcausevic-dev/tavr-deployment-jig
- Draft date: 22 October 2026
- Byline: Miz Causevic, Kinetic Gain. I drew the jig. I am not claiming a clinical credential, and this piece is not medical advice.

---

A self-expanding transcatheter aortic valve does not inflate. It is crimped inside a capsule, parked across a stenotic native valve, and uncovered from the inflow end. The nickel-titanium frame then returns toward the shape it was set to. Three pericardial cusps, already sewn to that frame, open in systole and meet in diastole.

That sentence is the whole procedure, minus the patient. The film at the link above is that sentence, stretched to 34.0 seconds: 1,020 frames at 30 fps. You can pause it, step it, and deep-link any frame with `?f=`. Frame 400 is the cutaway. Frame 660 is the closed valve, looking down the bore. Frame 996 is the three-quarter section with flow lines.

It is a stylized educational motion study. It is not a device, not a patient case, and not a named commercial valve. The rest of this piece is how to read the 34 seconds without mistaking a drawing for a result.

## The job of the 34 seconds

Most explainer cuts of this procedure jump from "catheter in" to "valve open." The part worth teaching sits in the middle: which end uncovers first, what the cells do as they widen, where the native cusps go, and what "closed" looks like when three leaflets meet.

The page is one HTML file. No build step, no external scripts, no account. A frame is a pure function of its index. The same number always draws the same picture, which is why a URL can point at a beat the way a figure number points at a panel.

If your browser asks for reduced motion, the film loads paused. Space plays and pauses. Arrow keys step one frame, Shift steps fifteen. Keys 1 through 5 jump the five phases. Home and End go to the ends. The scrubber pauses on pointer down.

## Five beats, and the frame where each one starts

The clock is explicit on the page. These are the same boundaries.

**0.0 to 5.0 seconds. Frames 0 to 149. Axial alignment.**

An oblique view looks up the stenotic native valve. Coral marks the calcified cusps and the annular lumps. A delivery catheter crosses the orifice. The on-screen label says 14F. On the French scale one unit is one third of a millimeter, so 14 French is 14/3 mm, about 4.7 mm. That is the definition of the unit applied to the label. The shaft in the drawing has a radius of 0.155 in a world where the annulus radius is about 1. Do not convert that radius into millimeters. Gold marker bands slide onto the annular plane and settle between frames 24 and 132.

**5.0 to 10.0 seconds. Frames 150 to 299. Capsule pullback.**

The outer capsule moves toward the aorta. Rows of the frame that the lip has passed leave the crimped radius. Rows the lip has not reached stay closed. Inflow uncovers first. The cells are diamonds: 18 columns, 12 rows, odd rows shifted half a step. As a row opens, the axial spacing of that row shortens, from 0.145 to 0.058 in the same arbitrary units. The frame gets shorter as it gets wider. That foreshortening is a picture of diamond cells opening, not a measured implant length.

**10.0 to 17.0 seconds. Frames 300 to 509. Radial expansion.**

The camera cuts the root open. The frame finishes seating. Native cusps, drawn as dark tissue with a coral free margin, are pushed out into the sinuses. Two coronary ostia sit on the posterior wall, lateral to the frame, so the cut does not erase them and the frame is not drawn across them. From frame 328 to frame 430 the delivery catheter withdraws. If it stayed, the cutaway would be a pole through the valve.

**17.0 to 25.0 seconds. Frames 510 to 749. Leaflet coaptation.**

The camera is almost orthographic and looks down the bore. Three ivory cusps open and close. One cycle is 30 frames, which is one second, which is 60 beats per minute. The cusps start opening over the first 7 percent of the cycle, stay open until 33 percent, and finish closing by 45 percent. The rest of the second they are shut. That duty cycle is a timing choice so the eye can see both states. It is not a measured ejection time.

The word on the film is coaptation. It means the free edges meet. It does not mean zero paravalvular leak. A skirt that might seal the annulus is discussed in the device literature. This drawing does not include one, and it does not score a leak.

**25.0 to 34.0 seconds. Frames 750 to 1019. Hemodynamic sweep.**

The camera dollies back to a three-quarter cut. Sixteen pink lines cross the lumen. Each line is a particle plus a short trail. The trail is sampled with the open amount of the frame you are looking at, so a line does not jump across the cycle. Speed on the line increases when the valve is open. The lines are straight on purpose. They show direction and the fact of pulsatility. They are not a Navier-Stokes solution, not wall shear, and not a pressure gradient.

## What the metal is doing, and what the code is doing

The useful distinction is between a material fact and a parameter in a drawing.

Steblovnik and Bunc, writing in the *Journal of Cardiovascular Development and Disease* in 2022, separate the two deployment families. Balloon-expandable frames are expanded by inflating a balloon, usually during rapid ventricular pacing. Self-expanding frames are held compressed by a capsule. The capsule is pulled back under fluoroscopy. The frame, a nickel-titanium alloy, expands toward the shape it was given. Their review also notes that this style of deployment can allow resheathing and repositioning when the position is wrong, and that the leaflets on approved devices are treated bovine or porcine pericardium sewn to the frame. A sealing skirt is one of the later design responses to paravalvular regurgitation. I am using that paper for the mechanism, not for a head-to-head of brands. The film is generic. It is not Evolut, Sapien, Portico, Navitor, Acurate, or Allegra.

Maleckis and colleagues, in *Annals of Biomedical Engineering* in 2018, describe the same alloy from the stent-mechanics side, in peripheral arteries rather than the aortic root. The part that transfers is the material. Nitinol is superelastic only between the austenite-finish temperature and the martensite-deformation temperature. In that window, elastic recovery can reach about 10 percent strain, far above the sub-1 percent recovery of ordinary alloys. Manufacturers heat-set the open shape and tune the austenite-finish temperature below body temperature, so that once the stent is released inside the body it is in the austenitic form and returns toward that open shape without a balloon. Laser-cut stents are cut from tube and shape-set in the open form. That is why the uncovered struts in the film are drawn as a laser-cut diamond lattice rather than a braid.

None of that is solved inside the page. There is no phase fraction, no stress, no Newton of radial force, no nickel-ion term. The deployment state is four scalars:

- `lip`, 0 until frame 150, then a smoothstep to 1 by frame 300.
- `settle`, 0 until frame 300, then a smoothstep to 1 by frame 510.
- `delivery`, the catheter withdrawal, frames 328 to 430.
- `open`, the leaflet cycle, gated on between frames 524 and 548 so the cusps do not pop in mid-camera-move.

A row at normalized height `v` stays crimped while `v` is still inside the capsule. Once the lip has passed, the row's expansion is a smoothstep over a 0.14 band of height, multiplied by a seated amount that itself moves from 0.84 to 1.00 during the third phase. The crimped radius is 0.19. The seated radius runs from 0.90 at the inflow to 1.02 at the outflow. The last row is the easy bug: if "at or past the lip" means crimped, then a lip of exactly 1 leaves the outflow crown closed and the down-bore view becomes a spoked wheel. The code treats a lip at or above 0.97 as fully off, and then every row, including the crown, takes the seated radius.

That is the whole "simulation." It is a schedule a person can scrub. The metallurgy explains why a schedule shaped like unsheathing is the right story. The schedule does not prove the metallurgy.

## Why the leaflets are one shell, not a mesh

The first version of the cusps was a grid of quads. The grid read as spokes. A viewer looking for coaptation saw structure that was only tessellation. The shipped drawing uses one filled polygon per cusp: an attachment arc on the frame, a free edge, and the belly between them. Three circumferential fiber arcs sit on that shell. A Y is stroked at the center only while the cusp is mostly shut, open amount under 0.4. Past that, the orifice is the hole, and an extra Y would be decoration.

The closed free edge is the other picture decision. If only the middle of each cusp reaches the center, the shut valve is a trefoil with a hole. The free edge is pulled to a radius of about 0.012 within the central 80 percent of each cusp, using a smoothstep on the distance to the nearest commissure. Three cusps then fill the circle, and the Y sits on a meeting line instead of floating in a gap. When the cusp opens, the middle of the free edge moves out to about half the attachment radius, so the orifice reads as a rounded triangle.

Leaflet opacity follows `settle`, not the capsule lip. The cusps appear as the frame finishes seating, which keeps the pullback readable. The tissue is ivory, `#FFF1E6`, against teal struts, `#00F5D4`. Native calcium is coral, `#FF5A5F`. Gold, `#E4C36A`, is reserved for the marker bands. The root wall is a narrow shade from `#2A1820` to `#4A3038`. A wide shade turned the wall into a faceted pink grid.

Steblovnik and Bunc report published thickness ranges for the two pericardial sources used in approved devices: porcine pericardium about 0.14 to 0.20 mm, bovine about 0.32 to 0.42 mm, which is one reason thinner porcine tissue shows up when catheter profile matters. The film does not pick a species and does not draw thickness. Ivory means "treated pericardium, sewn to a frame." Species, fixation chemistry, and thickness are outside the drawing.

## What I will not let the film say

| On screen, or easy to infer | Grade | Read it as |
| --- | --- | --- |
| The label "14F" | Unit conversion | 14/3 mm, about 4.7 mm, on the French scale. Not a measured shaft. |
| Capsule pullback, inflow first | Textbook mechanism, drawn | Matches the unsheathing description in Steblovnik and Bunc 2022. Timing is authored. |
| Diamond cells widen and the frame shortens | Picture of a laser-cut lattice | Cell counts and the 0.145 to 0.058 spacing are design numbers. |
| Nitinol returns to a set shape without a balloon | Material fact, cited | Maleckis et al. 2018, for the alloy. This page does not compute strain. |
| About 10 percent recoverable strain | Cited material limit | Their review of superelastic nitinol between Af and Md. Not a strain in this frame. |
| Native cusps pinned into the sinuses | Picture decision | The pin amount is a function of mean expansion. No contact force. |
| Ostia lateral to the frame | Picture decision | Placed so the cutaway still shows them. Not an anatomic survey. |
| Cusps meet at the center | Picture decision | Coaptation, as labeled. Not a leak grade. |
| One beat per second | Timing choice | 30 frames at 30 fps. Not a patient's rate. |
| Pink lines through the lumen | Illustration | Sixteen kinematic tracers. Not CFD. |
| Any brand name, gradient, pacemaker rate, or rupture rate | Absent on purpose | Those numbers live in clinical papers. They are not a property of this file. |

The pacemaker comparison and the paravalvular-regurgitation discussion in Steblovnik and Bunc are real parts of that review. I am not repeating the rates here. A film with no conduction system and no leak path cannot carry them, and a generic frame should not borrow a brand's outcomes.

## How to scrub it if you are checking the claims

Open the film. Then:

1. `?f=40` should show the stenotic coral cusps, the catheter, the gold markers, and a crimped frame still inside a faint capsule. Expansion reads 0 percent.
2. `?f=220` should show a widening teal cone as the capsule retracts. Inflow is open. Outflow is not.
3. `?f=400` should show the cutaway, the diamond lattice, a coronary ostium on the wall, coral at the annulus, and the catheter leaving. Leaflets are not the subject of this frame.
4. `?f=660` should show an ivory disc, a teal ring, and a Y. The readout is diastole.
5. A frame in the open half of a later cycle, for example around frame 636 if you want systole in the down-bore section, should show a triangular orifice rather than a Y.
6. `?f=996` should show the three-quarter root, one cusp sail, and pink lines crossing the frame. The lines are straight. That is the schematic, not a rendering error.

If a still disagrees with that list, the still wins and the copy should change. I checked frames 40, 400, 660, and 996 in headless Chrome at 1440 by 900 on 22 October 2026, from the file that was published with this draft. Frames 220 and 636 are described from the same function, not from a second screenshot pass.

## What I would build next, and what I would not

The next useful version is a second schedule on the same camera: a balloon-expandable beat, so a student can see pacing, inflation, and a frame that plastically holds its shape instead of recovering it. Same disclaimer, same refusal to name a product.

I would not add a radial-force readout, a calcium score, or a "no leak" badge. Each of those is a number the drawing does not have. I would not add a form. The page collects nothing.

The same player, with the palette and the phase rail left alone, can carry any other crimped-then-released implant: a peripheral stent, an occluder, a venous valve. The part that does not transfer is the anatomy around it. Swap the root, the ostia, and the leaflet function. Keep the rule that a frame index draws one picture, and that the footer says what the picture is not.

## Questions the film is meant to answer

**What does self-expanding mean?**

The frame is compressed inside a capsule and released. It moves toward a shape set during manufacture because the alloy is superelastic at body temperature. A balloon is not what opens it. Steblovnik and Bunc 2022 describe that deployment. Maleckis et al. 2018 describe why the alloy can do it.

**Why a capsule instead of a balloon?**

The capsule is the constraint. Pulling it back is the deployment. Balloon-expandable valves are a different family: the frame is expanded by inflation, typically during rapid pacing. This film is only the first family.

**What is coaptation?**

The free edges of the three cusps meet when the valve is shut, so the drawing can show a closed lumen. It is not a measurement of regurgitation and not a claim that the seal around the frame is complete.

**What is the coral?**

Calcified native cusp margins and annular plaque, drawn as lumps so the stenotic orifice and the seating surface are visible. Not a calcium score.

**Why do the cells shorten as they open?**

A diamond that gets wider gets shorter. The row spacing lerps from 0.145 to 0.058 as that row expands. The numbers are in annulus-radius units.

**Is 14 French a real diameter in the picture?**

It is a real unit on the label. One French is one third of a millimeter, so the label denotes about 4.7 mm. The drawn shaft is not scaled from a manufacturer's outer diameter.

**Are the flow lines a simulation?**

No. Sixteen particles advect along the axis, faster when the valve is open, with the open amount frozen along each trail. They show where the pulse goes. They do not show how the blood solved the flow.

**Can I use a single frame in a lecture?**

Yes. Link `?f=` plus the frame number, and keep the footer sentence in the same slide: stylized educational motion study, not a device, not a patient, not a named valve.

## Sources

Steblovnik K, Bunc M. Technical Aspects and Development of Transcatheter Aortic Valve Implantation. *Journal of Cardiovascular Development and Disease*. 2022 Aug 22;9(8):282. doi:10.3390/jcdd9080282. PMC9409777. Open access. Used for the balloon-expandable versus self-expanding deployment distinction, the capsule, nitinol returning to a set shape at body temperature, pericardial leaflets, and the existence of sealing skirts as a design response. Brand outcomes in that review are not properties of this film.

Maleckis K, Anttila E, Aylward P, Poulson W, Desyatova A, MacTaggart J, Kamenskiy A. Nitinol Stents in the Femoropopliteal Artery: A Mechanical Perspective on Material, Design, and Performance. *Annals of Biomedical Engineering*. 2018;46(5):684-704. doi:10.1007/s10439-018-1990-1. PMC5975366. Used for superelastic recovery up to about 10 percent strain between the austenite-finish and martensite-deformation temperatures, shape-setting in the open form, and expansion on release without a balloon. Their clinical context is the femoropopliteal artery, not the aortic valve. I am citing the material, not their patency table.

French scale: one French equals one third of a millimeter. Applied here only to the 14F label.

The film and this draft: Miz Causevic, Kinetic Gain, 22 October 2026. https://mizcausevic-dev.github.io/tavr-deployment-jig/

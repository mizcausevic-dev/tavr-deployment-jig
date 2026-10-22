# Self-expanding transcatheter valve

Stylized 34-second motion study of self-expanding transcatheter valve deployment, nitinol expansion, and pericardial leaflet coaptation.

Live film: <https://mizcausevic-dev.github.io/tavr-deployment-jig/>

Source: <https://github.com/mizcausevic-dev/tavr-deployment-jig>

The long-form draft is [article-Cursor.md](article-Cursor.md).

## What it is

A single static page. Canvas 2D, no build, no network calls, no form. One frame is a pure function of its index, so the scrubber and `?f=` land on the same picture every time.

1,020 frames, 30 fps, 34.0 seconds. World scale is arbitrary: the annulus radius is about 1. Nothing on screen is a millimeter measurement except the 14-French label, which is a unit conversion, not a measured catheter.

## Who it is for

People who need the deployment sequence in their head before they read a device manual: fellows, biomedical engineers, motion designers, and anyone teaching the difference between unsheathing a nitinol frame and inflating a balloon. It is a picture of a mechanism. It is not a sizing tool and not a case review.

## Why the picture is built this way

Self-expansion is a lip moving up the frame, then a settle. The camera, the cutaway, the leaflets, and the streamlines are keyed to that same clock so a reader can stop on one beat and name it.

## How to run

Open `index.html` in a browser. On GitHub Pages the same file is the site root.

| Control | Action |
| --- | --- |
| Play, or click the canvas | Play and pause |
| Space | Play and pause, unless focus is on a button or the scrubber |
| Scrubber | Seek. Pointer down pauses |
| Left and right arrows | One frame. Shift moves 15 frames |
| 1 to 5 | Jump to a phase |
| Home, End | Frame 0, frame 1019 |
| `?f=400` | Open paused on that frame |
| Reduced motion | Starts paused |

`window.__valve.render` and `window.__valve.stateAt` are exposed for stills.

## The five beats

| Phase | Frames | Clock | What you should see |
| --- | --- | --- | --- |
| 01 Axial alignment | 0 to 149 | 0.0 to 5.0 s | Oblique axial view. A 14-French catheter crosses a stenotic native valve. Gold marker bands settle on the annular plane. |
| 02 Capsule pullback | 150 to 299 | 5.0 to 10.0 s | The capsule retracts toward the aorta. Uncovered cells leave the crimped radius. Inflow uncovers first. |
| 03 Radial expansion | 300 to 509 | 10.0 to 17.0 s | Cutaway. The frame finishes seating and pins the native cusps into the sinuses. Coronary ostia stay lateral to the frame. The delivery system withdraws from frame 328 to 430. |
| 04 Leaflet coaptation | 510 to 749 | 17.0 to 25.0 s | Orthographic down-bore view. Three ivory cusps open and meet. One cardiac cycle is 30 frames, one second, 60 bpm. |
| 05 Hemodynamic sweep | 750 to 1019 | 25.0 to 34.0 s | Reverse dolly to a three-quarter section. Sixteen schematic streamlines cross the lumen. |

## Palette

| Swatch | Hex | Reads as |
| --- | --- | --- |
| Lumen | `#0B0D13` | Background |
| Aortic root | `#2A1820` to `#4A3038` | Wall |
| Nitinol | `#00F5D4` | Uncovered frame |
| Pericardium | `#FFF1E6` | Prosthetic leaflets |
| Plaque | `#FF5A5F` | Annular calcium and native free margins |
| Markers | `#E4C36A` | Radiopaque bands |

Covered stent struts are a muted gray-green. They turn teal once the capsule lip has passed.

## What the drawing computes

- Stent: 18 columns by 12 rows. Odd rows are offset half a step. Diamond links plus inflow and outflow rings.
- Crimped radius 0.19. Expanded radius runs from 0.90 at the inflow row to 1.02 at the outflow row, in annulus-radius units.
- Row spacing shortens from 0.145 to 0.058 as a row opens. That is foreshortening of the cells, not a measured axial length.
- Pullback lip moves from 0 to 1 across frames 150 to 299. Until the lip is fully off, a row at or above the lip stays crimped. Once the lip is off, every row, including the outflow crown, takes the seated radius. Settle then runs from 0.84 to 1.00 across frames 300 to 509.
- Leaflets are one filled shell per cusp, plus three fiber arcs. The closed free edge sits near radius 0.012 along most of its length so the three cusps fill the circle. A Y is drawn only while the open amount is under 0.4.
- Streamlines hold the open amount of the displayed frame for every sample on the trail. They are a laminar bundle. They are not a flow solve.

## Product card

1. **Product.** A scrubbable anatomy jig of generic self-expanding transcatheter valve deployment.
2. **User.** A learner who needs the sequence, not a diameter.
3. **Why it wins.** The clock, the labels, and the non-claims are in the same frame as the picture.
4. **Structure.** One HTML file. Frame index in, pixels out.
5. **Discovery.** GitHub Pages, the repo README, and the Medium draft.
6. **Engagement.** Play, scrub, phase jumps, deep link `?f=`.
7. **Conversion.** None. No form, no account, no lead.
8. **Money.** None on this page. The asset is a teaching film and a portfolio piece.
9. **Launch.** Public repo `tavr-deployment-jig`. Pages serves the `gh-pages` branch from `/`.
10. **After launch.** Correct a picture only when a still disagrees with the phase copy. Do not add outcome numbers.

## Publish

`publish-Cursor.sh` creates the public repo if needed, pushes `main` and `gh-pages`, sets Pages to the `gh-pages` root, and writes the About line plus topics.

```bash
./publish-Cursor.sh
```

`gh` must already be authenticated as the owner. The script reads the login from `gh api user`.

## Disclaimer

Stylized educational motion study. Not a medical device, not a patient case, and not a named commercial valve. Coronary ostia are drawn lateral to the frame. Coaptation and annular contact are picture decisions, not a performance claim. The coral is a marker for calcium, not a calcium score. The pink lines are not computational fluid dynamics.

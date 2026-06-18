# Schema Notes

`CascadeDecaysIO.jl` follows the `ThreeBodyDecaysIO.jl` document style and
extends the topology representation to binary cascade trees with more than
three final-state particles.

## Document Sections

A complete document built by `amplitudeSerializationDict` contains at least:

- `distributions`: model entries such as `HadronicUnpolarizedIntensity`.
- `functions`: named lineshapes and form factors referenced by chains.

Additional sections can be supplied by the user:

- `domains`: allowed ranges for variables.
- `misc`: free-form metadata and validation checksums.
- `parameter_points`: named numerical points used by validation or examples.

## Decay Description

Each distribution contains a `decay_description` dictionary with:

- `kinematics`: initial-state and final-state particle masses, names, indices,
  and spins.
- `reference_topology`: nested array representation of the reference cascade.
- `chains`: weighted chain descriptions.

## Topology Nodes

Topology nodes use final-state indices as leaves. Nested arrays describe
intermediate subsystems.

For example,

```json
[[[1, 2], 3], 4]
```

means that particles `1` and `2` form a subsystem, that subsystem combines with
particle `3`, and the resulting subsystem combines with particle `4`.

Generated mass variables and function names use delimiter-safe labels such as
`m1_2_3sq`. This avoids collisions for multi-digit final-state labels.

## Spins and LS Values

`CascadeDecays.jl` and `ThreeBodyDecays.jl` often store angular momenta as
doubled integers. The JSON writer emits ordinary angular-momentum units:

- `Propagator(2, ...)` is written as `"spin": 1`.
- `RecouplingLS((0, 2))` is written as `"l": 0`, `"s": 1`.

## Validation

Validation follows the `ThreeBodyDecaysIO.jl` convention. A validation bundle is
inserted into top-level sections:

- `misc.amplitude_model_checksums` stores expected values.
- `parameter_points` stores the named coordinates used for those checks.

This keeps validation independent of a particular nested `decay_description`
field and makes the format easier to share with readers that already understand
ThreeBodyDecaysIO-style files.

## Current Limitations

- Reader support is not implemented yet.
- Domains and validation points are user-supplied; CD-IO does not infer physical
  phase-space boundaries.
- Unsupported lineshapes raise an `ArgumentError` naming the missing type.

# CascadeDecaysIO.jl

`CascadeDecaysIO.jl` writes `CascadeDecays.jl` cascade models to
amplitude-serialization-style dictionaries and JSON files.

The package is currently writer-first. It serializes kinematics, cascade
topologies, propagators, vertices, referenced functions, and the standard
top-level document sections used by amplitude-serialization files. Reader and
round-trip support are planned but not implemented yet.

## What It Provides

- `serializeToDict` for low-level schema fragments and decay descriptions.
- `amplitudeSerializationDict` for complete JSON-ready documents.
- Section setters such as `setDomains!`, `setVariables!`, `setValidation!`,
  and `setParameterPoints!`.
- `writeJson` for formatted JSON output.
- Schema fragments compatible with the `ThreeBodyDecaysIO.jl` naming style,
  generalized to multi-step cascade topologies.

## Documentation Map

- [Writer workflow](@ref) shows the recommended path from a
  `CascadeDecays.jl` model to a JSON file.
- [Schema notes](@ref) explains how CD-IO maps cascade objects into the
  amplitude-serialization document layout.
- [API reference](@ref) lists public functions and docstrings.

## Status

This package is experimental. The writer is useful for producing structured
model descriptions, but downstream readers for four-body cascade models are
still under development.

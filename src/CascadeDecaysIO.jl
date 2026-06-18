module CascadeDecaysIO

using CascadeDecays
using HadronicLineshapes
using JSON
using OrderedCollections
using ThreeBodyDecays

import CascadeDecays:
    CascadeSystem,
    ConstantLineshape,
    DecayChain,
    DecayTopology,
    SystemSpinParities,
    child_line_inds,
    consumed_by,
    incoming_line_ind,
    isfinal_line_ind,
    nvertices,
    propagating_line_inds,
    root_line_ind

export appendFunction!,
    amplitudeSerializationDict,
    serializeToDict,
    setDomains!,
    setDistributions!,
    setFunctions!,
    setMisc!,
    setParameterPoints!,
    setSection!,
    setValidation!,
    setVariables!,
    writeJson

include("writer.jl")

end

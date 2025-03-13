# PlantUML.jl

Brings [PlantUML](https://plantuml.com) render to Julia

![License](https://img.shields.io/github/license/tz-lom/PlantUML.jl) ![GitHub branch status](https://img.shields.io/github/checks-status/tz-lom/PlantUML.jl/master) ![GitHub Tag](https://img.shields.io/github/v/tag/tz-lom/PlantUML.jl)
[![Documentation](https://img.shields.io/badge/Documentation-blue)
](https://tz-lom.github.io/PlantUML.jl)

## Quick start

```julia
using PlantUML

uml1 = puml"A->B"  # string handy syntax
uml2 = PUML("A->B") # Dynamic creation of the object

svg = repr(MIME("image/svg+xml", uml1))
png = repr(MIME("image/png", uml2))
```
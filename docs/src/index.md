# PlantUML package

Allows to render [PlantUML](https://plantuml.com/) diagrams with Julia

## Usage

```julia
using PlantUML

uml1 = puml"A->B"  # string handy syntax
uml2 = PUML("A->B") # Dynamic creation of the object

svg = repr(MIME("image/svg+xml", uml1))
png = repr(MIME("image/png", uml2))
```
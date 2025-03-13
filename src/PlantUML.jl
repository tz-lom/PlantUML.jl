module PlantUML
using Graphviz_jll
using PlantUML_jll

export @puml_str, PUML

struct PUML
    uml::String
end

"""
    puml"UML here"

Creates PlantUML object.
That object can be rendered to image with `show`
"""
macro puml_str(s::String)
    return :($PUML($s))
end

function render(uml::String; type::String)
    in = IOBuffer(uml)
    out = IOBuffer()
    run(pipeline(`java -jar $(PlantUML_jll.plantuml_path) -graphvizdot $(Graphviz_jll.dot_path) -t$type -pipe`, stdin=in, stdout=out, stderr=stderr))
    seekstart(out)
    read(out)
end

function Base.show(io::IO, ::MIME"image/svg+xml", puml::PUML)
    write(io, render(puml.uml, type="svg"))
    return nothing
end

function Base.show(io::IO, ::MIME"image/png", puml::PUML)
    write(io, render(puml.uml, type="png"))
    return nothing
end


end # module PlantUML

using Test
using PlantUML

@testset "Render" begin
    puml = puml"A->B"

    @test puml.uml == "A->B"

    @test repr(puml) == raw"""PUML("A->B")"""

    expected_svg =
        r"""^<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" .+</svg>$"""

    svg_pipe = IOBuffer()
    show(svg_pipe, MIME("image/svg+xml"), puml)

    svg = read(seekstart(svg_pipe), String)
    @test occursin(expected_svg, svg)

    png_pipe = IOBuffer()
    show(png_pipe, MIME("image/png"), puml)


    @test png_pipe.size > 0
    @test read(seekstart(png_pipe), 4) == [0x89, 0x50, 0x4e, 0x47] # PNG header

end
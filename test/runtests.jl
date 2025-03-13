using Test
using PlantUML

@testset "Render" begin
    puml = puml"A->B"
 
    @test puml.uml == "A->B"

    @test repr(puml) == raw"""PUML("A->B")"""

    expected_svg = raw"""<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" contentStyleType="text/css" data-diagram-type="SEQUENCE" height="111px" preserveAspectRatio="none" style="width:67px;height:111px;background:#FFFFFF;" version="1.1" viewBox="0 0 67 111" width="67px" zoomAndPan="magnify"><defs/><g><g><title>A</title><rect fill="#000000" fill-opacity="0.00000" height="34" width="8" x="12.473" y="39.0679"/><line style="stroke:#181818;stroke-width:0.5;stroke-dasharray:5.0,5.0;" x1="16" x2="16" y1="39.0679" y2="73.0679"/></g><g><title>B</title><rect fill="#000000" fill-opacity="0.00000" height="34" width="8" x="45.4959" y="39.0679"/><line style="stroke:#181818;stroke-width:0.5;stroke-dasharray:5.0,5.0;" x1="48.946" x2="48.946" y1="39.0679" y2="73.0679"/></g><g class="participant participant-head" data-participant="A"><rect fill="#E2E2F0" height="33.0679" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="22.946" x="5" y="5"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="8.946" x="12" y="26.9659">A</text></g><g class="participant participant-tail" data-participant="A"><rect fill="#E2E2F0" height="33.0679" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="22.946" x="5" y="72.0679"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="8.946" x="12" y="94.0339">A</text></g><g class="participant participant-head" data-participant="B"><rect fill="#E2E2F0" height="33.0679" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="23.1" x="37.946" y="5"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="9.1" x="44.946" y="26.9659">B</text></g><g class="participant participant-tail" data-participant="B"><rect fill="#E2E2F0" height="33.0679" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="23.1" x="37.946" y="72.0679"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="9.1" x="44.946" y="94.0339">B</text></g><g class="message" data-participant-1="A" data-participant-2="B"><polygon fill="#181818" points="37.4959,51.0679,47.4959,55.0679,37.4959,59.0679,41.4959,55.0679" style="stroke:#181818;stroke-width:1;"/><line style="stroke:#181818;stroke-width:1;" x1="16.473" x2="43.4959" y1="55.0679" y2="55.0679"/></g><!--SRC=[SzIrSm80]--></g></svg>"""

    svg_pipe = IOBuffer()
    show(svg_pipe, MIME("image/svg+xml"), puml)

    @test read(seekstart(svg_pipe), String) == expected_svg

    png_pipe = IOBuffer()
    show(png_pipe, MIME("image/png"), puml)


    @test png_pipe.size > 0
    @test read(seekstart(png_pipe), 4) == [0x89, 0x50, 0x4e, 0x47] # PNG header

end
using Tar, SHA, Downloads, GZip, TOML, Inflate, SHA

version = "1.2024.8"
url = "https://github.com/plantuml/plantuml/releases/download/v$(version)/plantuml-$(version).jar"
#Downloads.download(url, "./plantuml.jar")

Tar.create((x) -> begin
    @warn x
    x == "./plantuml.jar"
end, "./", "./plantuml.tar")

fh = GZip.open("plantuml.tar.gz", "w")
write(fh, open("plantuml.tar", "r"))
close(fh)


open("../Artifacts.toml", "w") do io
    TOML.print(
        io,
        Dict(
            "plantuml" => Dict(
                "git-tree-sha1" =>
                    Tar.tree_hash(IOBuffer(inflate_gzip("plantuml.tar.gz"))),
                "download" => Dict(
                    "sha256" => bytes2hex(open(sha256, "plantuml.tar.gz")),
                    "url" => "https://github.com/tz-lom/PlantUML.jl/releases/download/plantuml-v$(version)/plantuml.tar.gz",
                ),
            ),
        ),
    )
end
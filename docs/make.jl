using Documenter
using PlantUML
using Pkg

PROJECT_TOML = Pkg.TOML.parsefile(joinpath(@__DIR__, "..", "Project.toml"))
VERSION = PROJECT_TOML["version"]
NAME = PROJECT_TOML["name"]
AUTHORS = join(PROJECT_TOML["authors"], ", ") * " and contributors"


println("Starting makedocs")


makedocs(
    authors = AUTHORS,
    sitename = "PlantUML.jl",
    format = Documenter.HTML(prettyurls = haskey(ENV, "CI")),
    pages = ["Description" => "index.md"],
)

println("Finished makedocs")

deploydocs(repo = "github.com/tz-lom/PlantUML.jl.git", push_preview = true)

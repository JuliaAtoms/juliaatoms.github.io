using Documenter

include("deptree.jl")

makedocs(
    sitename = "JuliaAtoms",
    pages = [
        "Home" => "index.md",
        "Package hierarchy" => "pkg_hierarchy.md",
    ],
    format = Documenter.HTML(
        edit_link = "source",
    ),
)

deploydocs(
    repo = "github.com/JuliaAtoms/juliaatoms.github.io.git",
    branch = "master",
    devbranch = "source",
)

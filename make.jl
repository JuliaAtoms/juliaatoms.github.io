using Documenter

makedocs(
    sitename = "JuliaAtoms",
    pages = [
        "Home" => "index.md",
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

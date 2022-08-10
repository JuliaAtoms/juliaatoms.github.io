using GraphViz
using Pkg
using TOML

regi = findfirst(reg -> reg.name == "General", Pkg.Registry.DEFAULT_REGISTRIES)
reg = first(Pkg.Registry.find_installed_registries(stdout, [Pkg.Registry.DEFAULT_REGISTRIES[regi]]))
@show REGISTRY = reg.path


function get_pkg_info(pkgs, uuid::AbstractString)
    uuid ∈ keys(pkgs) || return nothing
    p = pkgs[uuid]
    TOML.parse(open(joinpath(REGISTRY, p["path"], "Package.toml")))
end
get_pkg_info(pkgs, uuid::Base.UUID) = get_pkg_info(pkgs, string(uuid))

pkgs = TOML.parse(open(joinpath(REGISTRY, "Registry.toml")))["packages"]

ismypkg(p) = !isnothing(p) && (occursin("JuliaAtoms", p["repo"]) ||
    occursin("JuliaApproximation", p["repo"]) ||
    occursin("JuliaNLSolvers", p["repo"]))

function get_shape(p)
    occursin("JuliaAtoms", p["repo"]) && return ("ellipse","red")
    occursin("JuliaApproximation", p["repo"]) && return ("box","blue")
    occursin("JuliaNLSolvers", p["repo"]) && return ("diamond","green")
    ("house","black")
end

tree = mktempdir() do dir
    buf = IOBuffer()
    try
        Pkg.activate(dir)
        Pkg.add("AtomicStructure")

        write(buf, "digraph {\nranksep=\"1.0 equally\";\n")
        deps = Pkg.dependencies()

        for (pu,p) in deps
            pinfo = get_pkg_info(pkgs, pu)
            ismypkg(pinfo) || continue
            shape,color = get_shape(pinfo)
            write(buf, p.name, " [shape=\"$shape\", color=\"$color\"];\n")
            for (d,du) in p.dependencies
                dinfo = get_pkg_info(pkgs, du)
                ismypkg(dinfo) || continue
                write(buf, p.name, " -> ", d, ";\n")
            end
        end
        write(buf, "}\n")
    finally
        Pkg.activate(".")
    end
    String(take!(buf))
end

graph = GraphViz.Graph(tree)
GraphViz.layout!(graph, engine="dot")

open("src/pkg_hierarchy.svg","w") do file
    show(file, "image/svg+xml", graph)
end

using GraphViz
using Pkg
using TOML
using Tar
using CodecZlib

regi = findfirst(reg -> reg.name == "General", Pkg.Registry.DEFAULT_REGISTRIES)
reg = first(Pkg.Registry.find_installed_registries(stdout, [Pkg.Registry.DEFAULT_REGISTRIES[regi]]))
reg_archive = joinpath(dirname(reg.path), TOML.parse(open(reg.path))["path"])
@assert occursin(r".tar.gz$", reg_archive)
@assert isfile(reg_archive)

@info "Decompressing registry" reg_archive
REGISTRY = open(reg_archive) do arc
    Tar.extract(GzipDecompressorStream(arc))
end

@info "Registry extracted to $(REGISTRY)"
registry_toml = TOML.parse(open(joinpath(REGISTRY, "Registry.toml")))

pkgs = registry_toml["packages"]

function get_pkg_info(pkgs, uuid::AbstractString)
    uuid ∈ keys(pkgs) || return nothing
    p = pkgs[uuid]
    TOML.parse(open(joinpath(REGISTRY, p["path"], "Package.toml")))
end
get_pkg_info(pkgs, uuid::Base.UUID) = get_pkg_info(pkgs, string(uuid))

ismypkg(p) = !isnothing(p) && (occursin("JuliaAtoms", p["repo"]) ||
    occursin("JuliaApproximation", p["repo"]) ||
    occursin("JuliaNLSolvers", p["repo"]))

function get_shape(p)
    occursin("JuliaAtoms", p["repo"]) && return ("ellipse","___red_color")
    occursin("JuliaApproximation", p["repo"]) && return ("box","___blue_color")
    occursin("JuliaNLSolvers", p["repo"]) && return ("diamond","___green_color")
    ("house","black")
end

tree = mktempdir() do dir
    buf = IOBuffer()
    try
        Pkg.activate(dir)
        Pkg.add("AtomicStructure")

        write(buf, "digraph {\nranksep=\"1.0 equally\";\nbgcolor=\"none\";\n")
        deps = Pkg.dependencies()

        for (pu,p) in deps
            pinfo = get_pkg_info(pkgs, pu)
            ismypkg(pinfo) || continue
            shape,color = get_shape(pinfo)
            write(buf, p.name, " [shape=\"$shape\", color=\"$color\", style=\"filled\", fillcolor=\"___fill_color\", fontcolor=\"___font_color\"];\n")
            for (d,du) in p.dependencies
                dinfo = get_pkg_info(pkgs, du)
                ismypkg(dinfo) || continue
                write(buf, p.name, " -> ", d, "[color=\"___edge_color\"];\n")
            end
        end
        write(buf, "}\n")
    finally
        Pkg.activate(".")
    end
    String(take!(buf))
end

for (suffix,(fill_color,font_color,edge_color,
             red_color,blue_color,green_color)) in [("",("none","black","black","red","blue","green")),
                                                    ("-dark",("none","white","white","crimson","dodgerblue","springgreen"))]
    graph = GraphViz.Graph(replace(tree,
                                   r"___fill_color" => fill_color,
                                   r"___font_color" => font_color,
                                   r"___edge_color" => edge_color,
                                   r"___red_color" => red_color,
                                   r"___blue_color" => blue_color,
                                   r"___green_color" => green_color))
    GraphViz.layout!(graph, engine="dot")

    open("src/pkg_hierarchy$(suffix).svg","w") do file
        show(file, "image/svg+xml", graph)
    end
end

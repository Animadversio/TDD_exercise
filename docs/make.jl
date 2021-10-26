using TDD
using Documenter

DocMeta.setdocmeta!(TDD, :DocTestSetup, :(using TDD); recursive=true)

makedocs(;
    modules=[TDD],
    authors="binxu.wang <binxu.wang@wustl.edu> and contributors",
    repo="https://github.com/Animadversio/TDD.jl/blob/{commit}{path}#{line}",
    sitename="TDD.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://Animadversio.github.io/TDD.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/Animadversio/TDD.jl",
    devbranch="main",
)

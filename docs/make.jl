using FinancialModelingPrepAPI
using Documenter

DocMeta.setdocmeta!(FinancialModelingPrepAPI, :DocTestSetup, :(using FinancialModelingPrepAPI); recursive=true)

makedocs(;
    modules=[FinancialModelingPrepAPI],
    authors="Bernard Brenyah <pimpfada@gmail.com>",
    repo="https://github.com/PyDataBlog/FinancialModelingPrepAPI.jl/blob/{commit}{path}#{line}",
    sitename="FinancialModelingPrepAPI.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://PyDataBlog.github.io/FinancialModelingPrepAPI.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/PyDataBlog/FinancialModelingPrepAPI.jl",
    devbranch="main",
)

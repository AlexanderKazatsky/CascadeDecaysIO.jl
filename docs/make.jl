using CascadeDecaysIO
using Documenter

const DOCS = @__DIR__
const REPO_SLUG = get(ENV, "GITHUB_REPOSITORY", "RUB-EP1/CascadeDecaysIO.jl")
const REPO_URL = "https://github.com/$(REPO_SLUG)"
const QMD = joinpath(DOCS, "writer_workflow.qmd")
const GFM = joinpath(DOCS, "writer_workflow.md")
const TUTORIAL = joinpath(DOCS, "src", "writer-workflow.md")

function render_writer_workflow!()
    cd(DOCS) do
        run(`quarto render $(basename(QMD)) --to gfm`)
    end
    isfile(GFM) || error("expected Quarto output at $(GFM)")
end

function documenter_tutorial_page(gfm_path::AbstractString)
    body = read(gfm_path, String)
    meta = "```@meta\nCurrentModule = CascadeDecaysIO\nEditURL = \"../writer_workflow.qmd\"\n```\n\n"
    return meta * body
end

DocMeta.setdocmeta!(
    CascadeDecaysIO,
    :DocTestSetup,
    :(using CascadeDecaysIO);
    recursive = true,
)

render_writer_workflow!()
write(TUTORIAL, documenter_tutorial_page(GFM))

makedocs(;
    modules = [CascadeDecaysIO],
    authors = "RUB-EP1 and contributors",
    repo = "$(REPO_URL)/blob/{commit}{path}#{line}",
    sitename = "CascadeDecaysIO.jl",
    doctest = false,
    checkdocs = :none,
    format = Documenter.HTML(;
        canonical = "https://$(replace(lowercase(REPO_SLUG), '/' => ".github.io/"))",
        repolink = REPO_URL,
    ),
    pages = [
        "Home" => "index.md",
        "Writer workflow" => "writer-workflow.md",
        "Schema notes" => "schema.md",
        "API reference" => "api-reference.md",
    ],
)

deploydocs(; repo = "github.com/$(REPO_SLUG)")

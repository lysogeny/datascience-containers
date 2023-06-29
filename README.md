# Base data science container

A container for data science things.

Based on the `jupyter/datascience-notebook`.

## Contents

Since this builds on the `jupyter/datascience-notebook`:

- Jupyter Lab
- Python with common packages (`matplotlib`, `pandas`, `numpy`, ...)
- R with common packages (`tidyverse`)
- Julia with some packages

Additionally:

- `jupyter-lsp` Plugin for LSP support
- `LanguageServer.jl`, `r-languageserver` and `pyright` language servers
- `jupyter_vim` for vim-like key binds
- `jupyterlab_execute_time` for cell execution times

Additional Julia packages:

- `CSV.jl`
- `DataFrames.jl`
- `DataFramesMeta.jl`
- `Plots.jl`
- `StatsPlots.jl`

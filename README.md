# Base data science container

A container for data science things.

Based on the `jupyter/datascience-notebook`.

## Running

```sh
podman run --rm -v "${PWD}":/home/jovyan/work --name jupyter -p 8888:8888 --userns=keep-id:uid=1000,gid=100 {container}
```

Replace `{container}` with the relevant container.

Or you can build on the container:

```Dockerfile
FROM {container}
RUN mamba install -c conda-forge
```

Build the image and run the container

```sh 
podman build -f Containerfile -t extended-jupyter && podman run --rm -v "${PWD}":/home/jovyan/work --name jupyter -p 8888:8888 --userns=keep-id:uid=1000,gid=100 extended-jupyter
```

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

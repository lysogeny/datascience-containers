# Base data science container

A container for data science things.

Based on the `jupyter/datascience-notebook`.

## Running

Use a `run` label

```sh
podman container runlabel -n jupyter run ghcr.io/lysogeny/jupyter-ds-base:master
```

Or manually

```sh
podman run --rm \
    -v "${PWD}":/home/jovyan/work:Z \
    --name jupyter \
    -p 8888:8888 \
    --userns=keep-id:uid=1000,gid=100 \
    ghcr.io/lysogeny/jupyter-ds-base:master
```

Build the image and run the container

```sh 
podman build -f base/Containerfile -t extended-jupyter 
podman run --rm \
    -v "${PWD}":/home/jovyan/work \
    --name jupyter \
    -p 8888:8888 \
    --userns=keep-id:uid=1000,gid=100 \
    extended-jupyter
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

## Layering

To layer this you may want to do something like this

```Dockerfile
FROM ghcr.io/lysogeny/jupyter-ds-base:master

USER ${NB_USER}

RUN mamba install -c conda_forge scanpy
RUN julia -e 'using Pkg; Pkg.add("DifferentialEquations"); Pkg.precompile()'
```

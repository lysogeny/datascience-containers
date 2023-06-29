FROM docker.io/jupyter/datascience-notebook:2022-10-09
# Install jupyterlabextensions
RUN mamba install --yes -c conda-forge jupyterlab-lsp jupyterlab_vim jupyterlab_execute_time
# Install Language Servers
RUN set -eux; \
    mamba install --yes -c conda-forge r-languageserver; \
    npm install --no-save pyright; \
    julia -e "using Pkg; Pkg.add(\"LanguageServer\"); Pkg.precompile()"
# Override some settings
ADD overrides.json /opt/conda/share/jupyter/lab/settings/overrides.json
# Add some julia packages
RUN julia -e "using Pkg; Pkg.add([\"CSV\", \"DataFrames\", \"DataFramesMeta\", \"Plots\", \"PyPlot\", \"StatsPlots\"])"
RUN julia -e "using Pkg; Pkg.update(); Pkg.gc(); Pkg.precompile()"
# Cleanup
USER root
RUN set -eux; \
    mamba clean --all -f -y; \
    fix-permissions $CONDA_DIR; \
    fix-permissions /home/$NB_USER
USER ${NB_USER}

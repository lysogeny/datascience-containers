FROM docker.io/jupyter/datascience-notebook:2022-10-09
# Install jupyterlabextensions
RUN mamba install --yes -c conda-forge jupyterlab_vim jupyterlab_execute_time
# Install Language Servers
RUN mamba install --yes -c conda-forge 'jupyterlab-lsp' 'python-lsp-server[all]' 'r-languageserver'
RUN julia -e "using Pkg; Pkg.add(\"LanguageServer\")"
# Setup LSP in jupyter
ADD overrides.json /opt/conda/share/jupyter/lab/settings/overrides.json
# Cleanup
USER root
RUN set -eux; \
    mamba clean --all -f -y; \
    fix-permissions $CONDA_DIR; \
    fix-permissions /home/$NB_USER
USER ${NB_USER}

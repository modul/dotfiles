function updateVim
    set -lx SHELL (which sh)
    vim +BundleInstall! +BundleClean +qall
end

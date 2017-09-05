puppet apply --modulepath=modules:static-modules $1 --hiera_config hiera.yaml --environment=prod "${@:2}"

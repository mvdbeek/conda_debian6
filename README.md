Dockerfile for easy building on Debian 6
-------

Our local cluster uses debian6, which is not combatible with biocondas GLIBC
>=2.14. We can use this container to easily (re-)build some packages.

To build a new package, add or update a new recipe and run `conda-build
<path_to_recipe_dir>`.  Then you can use `anaconda upload
<path_to_built_package>` to upload the new package to your own namespace.

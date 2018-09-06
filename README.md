# [INNS 2019](https://innsbddl2019.org/tutorial/)

[![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/IlyaKisil/inns-2019/master?urlpath=lab/)


## Available options for setting up a working environemt:

1.  Run Jupyter Lab on [**Mybinder.org**](https://mybinder.org/) (the easiest and fastest option)

    Use binder badge at the top of this page

2.  Run Jupyter Lab in **Docker** container
    ```
    $ git clone https://github.com/IlyaKisil/inns-2019.git
    $ cd inns-2019
    $ make image
    $ make container
    ```

3.  Run Jupyter Lab locally
    ```
    $ git clone https://github.com/IlyaKisil/inns-2019.git
    $ cd inns-2019
    $ make venv
    $ make jl-session
    ```
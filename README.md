# [INNS 2019](https://innsbddl2019.org/tutorial/)

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/IlyaKisil/inns-2019/master?urlpath=lab/tree/notebooks/0_Table_of_contents.ipynb)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents** generated with [DocToc](https://github.com/thlorenz/doctoc) 

Last Update: 2019-04-08

- [I want to follow along in a Cloud](#i-want-to-follow-along-in-a-cloud)
- [I want to follow along on my PC](#i-want-to-follow-along-on-my-pc)
  - [Getting source files](#getting-source-files)
  - [Preparing working environment](#preparing-working-environment)
- [Reporting problems and issues](#reporting-problems-and-issues)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## I want to follow along in a Cloud

-   This is as simple as clicking on the `binder` badge above
-   No headache with installation and/or configuration
-   Requires internet connection
-   Fresh environment when binder session expires

Although, this option comes at the cost of lower computational resources being available to you, but it will be sufficient for the introductory purpose of this tutorial.

> **Note:** It may take a couple of minutes to launch a `binder` server. If it takes longer then that, try to refresh the web page before [reporting this issue](#reporting-problems-and-issues).

    
## I want to follow along on my PC

###  Getting source files

Preferred option is to clone this repository using [git](https://git-scm.com/downloads).
```bash
git clone https://github.com/IlyaKisil/inns-2019.git
```

Alternatively, you can download a ZIP folder with all materials for this assignment by using the `Clone or Download` button (in green color) at the top of this page.

###  Preparing working environment

If you are on **Unix**, then simply execute in terminal:

```bash
cd inns-2019
./boostrap-venv.sh
```

If you are on **Windows**, then you can replicate `bootstrap-ven.sh` with the following steps:
1.  Open Anaconda prompt and execute:

    ```bash        
    cd inns-2019
    conda create -y --name "inns-2019" python=3.6.5
    conda activate "inns-2019"
    pip  install -r requirements.txt    
    python -m ipykernel install --user --name "inns-2019" --display-name "inns-2019"
    ```
    
1. Then download [this dataset](http://www.commsp.ee.ic.ac.uk/~csp-mandic/html/projects/inns_2019/data/) and extract it into the `data` directory.


 > **Note:** Regardless, of your operating system, make sure that you have [Anaconda]((https://www.anaconda.com/download/)) and [Jupyter Lab](https://github.com/jupyterlab/jupyterlab#installation) installed.


### Start Jupyter Lab
```bash
cd inns-2019
jupyter lab
```

## Reporting problems and issues

Please use one of [these forms](https://github.com/IlyaKisil/inns-2019/issues/new/choose) which supports `markdown` text formatting. It would also be helpful if you include as much relevant information as possible. This could include screenshots, code snippets etc.
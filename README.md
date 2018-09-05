# INNS 2019

[![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/IlyaKisil/inns-2019/master?urlpath=lab/)

1.  In Dockerfile could use
```
EXPOSE 8888

ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root"]
```

2. 
```angular2html
jupyter lab --port=8888 --ip=0.0.0.0 --allow-root
```
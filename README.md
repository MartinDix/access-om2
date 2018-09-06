[![Build Status](https://travis-ci.org/a-parkinson/access-om2.svg?branch=master)](https://travis-ci.org/a-parkinson/access-om2)

# ACCESS-OM2

ACCESS-OM2 is a global coupled ice ocean model. It is being developed through a collaboration with [COSIMA](http://www.cosima.org.au), [ARCCSS](http://www.arccss.org.au) and [CSIRO](http://www.csiro.au). It builds on the [ACCESS-OM](https://publications.csiro.au/rpr/pub?pid=csiro:EP125880) model originally developed at CSIRO.

The model consists of the [MOM](https://mom-ocean.github.io) ocean model, [CICE](http://oceans11.lanl.gov/trac/CICE) ice model, and a file-based atmosphere called [YATM](https://github.com/OceansAus/libaccessom2) coupled together using the [OASIS3-MCT](https://portal.enes.org/oasis) coupler. Regridding is done using [ESMF](https://www.earthsystemcog.org/projects/esmf/) and [KDTREE2](https://github.com/jmhodges/kdtree2).

ACCESS-OM2 comes with a number of standard configurations. These include ice and ocean at 1, 1/4 and 1/10th degree resolution forced by [JRA-55](http://jra.kishou.go.jp/JRA-55/index_en.html)
and [CORE2](http://www.clivar.org/clivar-panels/omdp/core-2) atmospheric reanalyses.

# Where to find information

To find information, start at the [ACCESS-OM2 wiki](https://github.com/OceansAus/access-om2/wiki).

Requests for help and other issues associated with the model, tools or configurations can be registered as [ACCESS-OM2 issues](https://github.com/OceansAus/access-om2/issues).

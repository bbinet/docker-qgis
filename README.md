docker-qgis
===========

[QGIS](https://github.com/bbinet/docker-qgis): the QGIS opensource desktop GIS
in a docker container.


Build
-----

To create the image `bbinet/qgis`, execute the following command in the
`docker-qgis` folder:

    docker build -t bbinet/qgis .

You can now push the new image to the public registry:
    
    docker push bbinet/qgis


Run
---

Then, when starting your qgis container, you will want to share the X11
socket file as a volume so that the QGIS windows can be displayed on your
Xorg server. You may also need to run command `xhost +` on the host.

    $ docker pull bbinet/qgis

    $ docker run -it --name qgis \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=unix$DISPLAY \
        bbinet/qgis

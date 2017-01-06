FROM debian:stretch
MAINTAINER Bruno Binet <bruno.binet@gmail.com>

RUN apt-get update && apt-get install -y \
	ca-certificates \
	dirmngr \
	gnupg \
	gdal-bin \
	proj-bin \
	python-geopy \
	--no-install-recommends \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 942D6AD5DF3E75DEA9AF72B2073D307A618E5811 \
	&& echo "deb http://qgis.org/debian stretch main" >> /etc/apt/sources.list.d/qgis.list \
	&& apt-get update && apt-get install -y \
		qgis python-qgis qgis-plugin-grass \
		--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENV LANG en-US

ENTRYPOINT [ "/usr/bin/qgis" ]

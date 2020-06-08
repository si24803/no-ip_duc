# An image to run no-ip (https://www.noip.com) Dynamic Update Client (duc) to periodically update your IP to DNS mapping

Alpine based no-ip DUC image for deployment in Docker if you need to assign a docker server via Dynamic DNS
A volume has to be used to persist the initial configuration and the container must be ran twice at first: one for creating the duc config files and the other for running the noip duc client. I ended up controling this behaviour with the INIT environement variable. If it's given with the run command, then the config process prompt will start. If you already have a config file and key, you just have to map the folder where they lay to <pre>/opt/noip2/conf</pre>

This setup was made on Windows, but can be run everywhere Docker runs.

## Build

Build in local docker

<pre>docker build -t noip-duc .</pre>

## Create noip duc config files

<pre>docker run -it --rm -v c:\development\docker-no-ip-duc\conf:/opt/noip2/conf -e INIT=true noip-duc</pre>

## Run noip duc

<pre>docker run -d --name noip-duc --restart always -v c:\development\docker-no-ip-duc\conf:/opt/noip2/conf si24803/docker-no-ip-duc:latest</pre>

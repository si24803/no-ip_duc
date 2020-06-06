# no-ip_duc

Alpine based no-ip DUC for deployment in Docker if you need to access a docker server via DNS
A volume has to be used to persist the initial configuration and the container must be ran twice at first: one for creating the config and the other for starting the noip duc client. I ended up controling this behaviour with the INIT environement variable. If it's given at run, then the config process prompt will start. If you already have a config file and key, you just have to map the folder were thay lie to <pre>/opt/noip2/conf</pre>

## Build

<pre>docker build -t noip-duc .</pre>

## Config

<pre>docker run -it -v c:\development\docker-no-ip-duc\conf:/opt/noip2/conf -e INIT=true noip-duc</pre>

## Running

<pre>docker run -it -v c:\development\docker-no-ip-duc\conf:/opt/noip2/conf noip-duc</pre>

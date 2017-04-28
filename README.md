This Dockerfile builds an image of gost-2.4-dev20170303. Based on debian:oldstable-slim with the image size of 23MB.  
***  
#### Quick Start  
This image uses ENTRYPOINT to run the containers as an executable.  
`docker run -d -p 8080:8080 mixool/gost -L=ss://chacha20:password@:8080`  
You can configure the service to run on a port of your choice. Just make sure the port number given to docker is the same as the one given to gost.  
***  
#### Create shadowsocks server and client:  
* shadowsocks server  
`docker run -d -p 8080:8080 mixool/gost -L=ss://chacha20:password@:8080`  
* shadowsocks client  
`docker run -d -p 8080:8080 --net=host mixool/gost -L=:8080 -F=ss://chacha20:password@s_ip:8080`  
then try with cURL:  
`curl -x 127.0.0.1:8080 https://myip.today`  
    * please note this will share the networking interface with the hostand `-L=:8080` will listen on ALL interfaces on this host,use `-L=127.0.0.1:8080` if you want to listen on localhost only  
***  
#### Deploy in app.arukas.io:  
* 8080-TCP/CMD `-L=:8080`  
    *　client: chrome+switchyomega HTTPS Endpoint:443  
    *　gost client: `-L=:8080 -F=socks5://s_ip:s_port`  
* 8088-UDP/CMD `-L=http2+kcp://:8088`  
    *　gost client: -L=:8080 -F=http2+kcp://s_ip:s_port  
* 8080-TCP,8088-UDP,8338-tcp/CMD `-L=:8080 -L=http2+kcp://:8088 -L=ss://chacha20:password@:8338`  
    * gost client: `-L=:8080 -F=?`  　
***  　
#### More          　 
For more details: [&copy;Mybolg](https://mixool.blogspot.ca/2017/04/dockergost.html)  
For more command line options, refer to: [github/gost](https://github.com/ginuerzh/gost)  

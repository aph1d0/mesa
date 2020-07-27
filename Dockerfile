FROM evbauer/mesa_lean:12778.01
#RUN mkdir -p /home/docker/docker_work/2.7_ovrs_0.1  
WORKDIR /home/docker/docker_work
#COPY . .
#VOLUME /opt/mesa/MESA-Docker/docker_work/mesa_automated_docker/docker_work/2.7_ovrs_0.1
CMD ["./mk"]
CMD ["./rn"]
#CMD ["top"]
 

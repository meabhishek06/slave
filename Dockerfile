FROM centos
RUN bash /root/slave1/ku.sh
COPY client.key /mnt
COPY client.crt /mnt
COPY ca.crt /mnt
COPY myfile /mnt
CMD sudo cp myfile /.kube/config
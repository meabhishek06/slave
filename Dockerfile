FROM centos
RUN yum install curl -y
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN cp kubectl /usr/bin
#RUN bash /root/slave1/ku
COPY client.key /mnt
COPY client.crt /mnt
COPY ca.crt /mnt
COPY myfile /mnt
CMD sudo cp myfile /.kube/config
#RUN dnf install openssh-server-7.8p1-4.el8.x86_64 -y
#RUN /usr/sbin/sshd -D
#RUN systemctl enable sshd
#RUN firewall-cmd --zone=public --permanent --add-service=ssh
#RUN firewall-cmd --reload
#RUN /bin/kill -HUP $MAINPID
RUN yum install -y openssh-server
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''
ADD src/sshd/sshd_config /etc/ssh/sshd_config 
RUN echo root:welcome1 | chpasswd
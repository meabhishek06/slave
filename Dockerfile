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
RUN yum update -y;yum install openssh* -y;yum install vim -y;yum install initscripts -y;
RUN /bin/kill -HUP $MAINPID

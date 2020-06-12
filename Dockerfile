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
RUN dnf install openssh-server -y
RUN /usr/sbin/sshd -D $OPTIONS $CRYPTO_POLICY
RUN systemctl enable sshd
RUN firewall-cmd --zone=public --permanent --add-service=ssh
RUN firewall-cmd --reload
RUN /bin/kill -HUP $MAINPID

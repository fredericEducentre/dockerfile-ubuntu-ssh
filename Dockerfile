# Use a base image with the desired OS (e.g., Ubuntu, Debian, etc.)
FROM ubuntu:latest
# Install SSH server
RUN apt-get update
RUN apt-get install -y openssh-server ca-certificates curl gnupg lsb-release
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bullseye stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN apt-get update
RUN apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
# Create an SSH user
RUN useradd -rm -d /home/test -s /bin/bash -g root -G sudo -u 1001 test
# Set the SSH user's password (replace "password" with your desired password)
RUN echo 'test:test' | chpasswd
# Allow SSH access
RUN mkdir /var/run/sshd
# Expose the SSH port
EXPOSE 22
EXPOSE 8080/tcp
EXPOSE 9000/tcp
EXPOSE 50000/tcp
EXPOSE 5432/tcp
EXPOSE 5000/tcp
# Start SSH server on container startup
CMD ["/usr/sbin/sshd", "-D"]

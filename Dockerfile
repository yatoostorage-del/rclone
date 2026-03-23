FROM jellyfin/jellyfin:latest

RUN apt-get update && apt-get install -y curl unzip && \
    curl https://rclone.org/install.sh | bash && \
    apt-get clean

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8096
CMD ["/start.sh"]

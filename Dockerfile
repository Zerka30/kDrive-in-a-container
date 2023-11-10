FROM debian:latest

LABEL maintainer="contact@zerka.dev"

ENV KDRIVE_EMAIL "changeme"
ENV KDRIVE_PASSWORD "changeme"
ENV KDRIVE_ID "changeme"
ENV KDRIVE_URL "https://${KDRIVE_ID}.connect.kdrive.infomaniak.com"

# Installez les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    davfs2 \
    ca-certificates \
    fuse

# Crée le répertoire où vous monterez le drive
RUN mkdir /mnt/kdrive

# Copiez le fichier de configuration WebDAV
RUN echo "${KDRIVE_URL} ${KDRIVE_EMAIL} ${KDRIVE_PASSWORD}"
COPY davfs2/secrets /etc/davfs2/secrets

# Définir les permissions appropriées pour le fichier secrets
RUN chmod 600 /etc/davfs2/secrets

# Commande pour monter le drive au démarrage du conteneur
ENTRYPOINT ["sh", "-c", "mount -t davfs ${KDRIVE_URL} /mnt/kdrive && tail -f /dev/null"]

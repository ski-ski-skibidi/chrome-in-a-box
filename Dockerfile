# Base docker image
FROM debian:sid

# Install Chrome
RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	hicolor-icon-theme \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpango1.0-0 \
	libpulse0 \
	libv4l-0 \
	fonts-symbola \
	--no-install-recommends \
	&& curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
	&& apt-get update && apt-get install -y \
	google-chrome-stable \
	--no-install-recommends \
	&& apt-get purge --auto-remove -y curl \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /src/*.deb

nvelagapudi@fultonscienceacademy.org
#!/bin/bash

# Set the UID for the chrome user
CHROME_UID=1000
CHROME_USER=chrome

# Check if the user already exists; if not, create the user with UID 10000
if ! id -u $CHROME_USER > /dev/null 2>&1; then
    useradd -u $CHROME_UID -m -d /home/$CHROME_USER -G audio,video $CHROME_USER
    echo "User $CHROME_USER created with UID $CHROME_UID"
else
    echo "User $CHROME_USER already exists."
fi

# Set up the Downloads directory for the chrome user
mkdir -p /home/$CHROME_USER/Downloads
chown $CHROME_USER:$CHROME_USER /home/$CHROME_USER/Downloads

echo "Setup complete: User $CHROME_USER has UID $CHROME_UID and Downloads directory created."


RUN useradd -u 1000 -m -d /home/chrome -G audio,video chrome && mkdir /home/chrome/Downloads && chown chrome /home/chrome/Downloads

COPY local.conf /etc/fonts/local.conf


USER chrome


ENTRYPOINT [ "google-chrome" ]

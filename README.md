# chrome-in-a-box
Isolated chrome web browser in a docker container

### Build the image

Before building, edit the Dockerfile and make sure the chrome user is created with the same UID of the user (your UID) that will run the container (RUN useradd -u **1000**). After doing that, build the container like this:

```
docker build -t chrome .
```

###

## Running a chrome container

Run the following command while loged in as the user specified by the UID in the Dockerfile:

```
bash run.sh
```

Note, if you are not root, you'll have to be a member of the "docker" group in /etc/groups for this to work.

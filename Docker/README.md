# Docker Environment  
The dockerfile contains the instructions to build the docker image which provides a replicated working environment to work with AutoPatch. The container allows users to run AutoPatch right away as it contains all the necessary dependencies, modifies LLVM, and builds it beforehand. The user is presented with a bash shell upon running the container, where they can run AutoPatch.

## Building the Docker Image
To build the docker image, run the following command from the root directory of the repository (the AutoPatchCode directory, not this directory):
```
sudo docker build -t my_image:latest -f ./Docker/Dockerfile .  
```

Change the image name and tag accordingly.  

## Running the Docker Image
To run the docker image after building it, run the following command in the same directory as the previous command:
```
sudo docker run -it my_image:latest
```
This presents the user with a bash shell where they can run AutoPatch.

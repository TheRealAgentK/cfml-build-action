#FROM foundeo/minibox:latest AS build
FROM ortussolutions/commandbox as build

# Install tools in Commandbox
RUN ["box", "install", "fixinator"]
RUN ["box", "install", "cfml-compiler"]
RUN ["box", "install", "commandbox-codechecker"]
RUN ["box", "install", "commandbox-cflint"]


# Copies CB modules into filesyste,
FROM ortussolutions/commandbox:latest
COPY --from=build /root/.CommandBox/cfml/modules /root/.CommandBox/cfml/modules 

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

# Use latest apache2 image as base image.
FROM httpd:2.4

# Install wget and unzip
RUN apt-get update -y && \
    apt-get install wget -y && \
    apt-get install unzip -y


# Change Directory to the path that host apache2 default website
WORKDIR /usr/local/apache2/htdocs/

# Download source code from github repository
RUN wget https://github.com/Zenitugo/SCISSORS-WEBSITE_PROJECT/archive/refs/heads/master.zip


# Unzip folder
RUN unzip master.zip

# Copy unzipped files into apache2 html default directory
RUN cp -r SCISSORS-WEBSITE_PROJECT-master/. .

# Delete unwanted files
RUN rm -rf SCISSORS-WEBSITE_PROJECT-master master.zip


# Expose container port
EXPOSE 80

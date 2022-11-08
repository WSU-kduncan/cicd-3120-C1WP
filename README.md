## Part One

First you will need to install docker. I am on mac, so I followed the instructions provided [here](https://docs.docker.com/desktop/install/mac-install/)

[Another Resource](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/How-to-dockerize-Apache-httpd-web-servers)

With Docker Desktop running in the background, open a new terminal and create a file named `Dockerfile`
The Dockerfile should start with `FROM httpd:2.4` to pull an image to use as a template for our custom image
`COPY ./website/ /usr/local/apache2/htdocs/` will copy our website folder into the specified folder of our image

back in terminal, run `docker build -t {ImageName} .`
you can see if your image was successfully created with `docker images`

To run: `docker run -d --name {NameTag} -p {DesiredPortNumber}:80 {ImageName}`

In your browser `localhost:{DesiredPortNumber}` will show you your website
# Part One

First you will need to install docker. I am on mac, so I followed the instructions provided [here](https://docs.docker.com/desktop/install/mac-install/)

[Another Resource](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/How-to-dockerize-Apache-httpd-web-servers)

With Docker Desktop running in the background, open a new terminal and create a file named `Dockerfile`
The Dockerfile should start with `FROM httpd:2.4` to pull an image to use as a template for our custom image
`COPY ./website/ /usr/local/apache2/htdocs/` will copy our website folder into the specified folder of our image

back in terminal, run `docker build -t {ImageName} .`
you can see if your image was successfully created with `docker images`

To run: `docker run -d --name {NameTag} -p {DesiredPortNumber}:80 {ImageName}`

In your browser `localhost:{DesiredPortNumber}` will show you your website

# Part Two

Create a DockerHub account
After verifying your account, the homescreen will have a "Create Repository" button; likely center left screen.
Create a public repository and give it a name.

### Secrets
In your repository on github, select Settings >> Secrets >> Actions >> New repository secret 
Add your DockerHub username and password

### Set up a workflow
I used information from [github](https://docs.github.com/en/actions/publishing-packages/publishing-docker-images#publishing-images-to-docker-hub) and [docker](https://docs.docker.com/build/ci/github-actions/) to set up my workflow file

I set up my workflow file to run on every push. It uses the `docker/build-push-action@v3` to publish the image to my docker hub repository. Make sure to define in the metadata section your username and docker repository, mine looked like `images: caupp7wsu/proj5_dock` and I referenced this to tag the image on push.

# Part Three

I set up an EC2 instance using my cloud formation template from Project3.
Download docker with `sudo apt-get install docker.io`, you may need to run `sudo apt-get update` first

Check if the installation succeeded with `sudo docker run hello-world` and get ready to set up some more configuration files.

We will write a restart shell script to restart the container whenever the image is updated and dont forget to give it execute permissions

Next install webhook `sudo apt-get install webhook` 

Additionally, create a json file to define the endpoint you will use. Make sure to include the script file and define what the URL will be.
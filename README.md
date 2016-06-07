# developer-workflow
An example git repo to introduce the [development process](https://opensource.ncsa.illinois.edu/confluence/display/NDS/Developer+Workflows) followed by the developers of NDS Labs.

This example will walk you through the various workflows that developers of NDS Labs are expected to follow while developing the platform.

# Getting Started
* Walk through of [New Developer Workflow](https://opensource.ncsa.illinois.edu/confluence/display/NDS/New+Developer+Workflow)

## Retrieve Your Nebula Password
Specify your AD username, then execute the following command to retrieve your Nebula password:

```bash
export AD_USERNAME=
ssh ${AD_USERNAME}@public-linux.ncsa.illinois.edu cat /afs/ncsa/projects/openstack/etc/users/${AD_USERNAME}/password
```

### Create an SSH Keypair
* Log into Nebula and expand the Compute dropdown.
* Select Access & Security, navigate to the Key Pairs tab, and click the Create Key Pair button.
* Walk through the wizard to generate an SSH key pair.

Your browser should automatically download a private key (a .pem file).

### Allocate a development VM
* At the top, choose the project: NDS-hackathon.
* Create a new Instance using:
** Flavor: pick some large or medium flavor; should have 2+ cores and 8+GB RAM
** Boot from image: CoreOSAlpha
** Access & Security - Key Pair: Associate your SSH keypair
** Access & Security - Security Groups:
*** remote SSH
*** remote HTTP

Once the machine is created and running, be sure to associate a Floating (public) IP:
* On the right side of the Instances page, click the Actions dropdown next to your new machine and select **Associate Floating IP**.
* You can then pick from a list of available public IP addresses to assign to this node.

Now, you should be able to use your .pem key to SSH into it using the floating IP:
```bash
ssh -i path/to/download/private/key.pem core@141.142.xxx.xxx
```

## Create Account: OpenSource
Sign up for an account on NCSA OpenSource!

Once approved by the admin, you should be able to access our full Atlassian suite including:
* JIRA
* HipChat
* Confluence Wiki
* Many more!

At the top-right of the [NCSA OpenSource Confluence homepage](https://opensource.ncsa.illinois.edu/confluence/#all-updates), you should see a button labeled "Sign Up".

## Create Account: GitHub
Sign up for an account on [GitHub](http://www.github.com)!

At the top-right of this page, you should see a button labeled "Sign Up".

## Create Account: DockerHub
Sign up for an account on DockerHub!

At the top-right of the [DockerHub](http://www.hub.docker.com) homepage, you should see a button labeled "Sign Up".

# [JIRA](https://opensource.ncsa.illinois.edu/confluence/display/NDS/JIRA+Workflows)
* Walk through of expected JIRA Story Workflow

# [Git](https://opensource.ncsa.illinois.edu/confluence/display/NDS/Git+Workflows)
* Walk through of Git Forking / Feature Branching Workflows

# [Docker](https://opensource.ncsa.illinois.edu/confluence/display/NDS/Docker+Workflows)
* Walk through of building / pushing a Docker image

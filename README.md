# developer-workflow
An example git repo to introduce the [development process](https://opensource.ncsa.illinois.edu/confluence/display/NDS/Developer+Workflows) followed by the developers of NDS Labs.

This example will walk you through the various workflows to ease development of the NDS Labs platform through organization.

# Getting Started
First time running through this workflow?

You will need access to an account on each of:
* OpenStack (Nebula)
* NCSA OpenSource
* GitHub
* DockerHub

For help getting access to these resources, see [Getting Started](https://github.com/bodom0015/developer-workflow/blob/master/getting-started.md).

# [JIRA](https://opensource.ncsa.illinois.edu/confluence/display/NDS/JIRA+Workflows)
* Walk through of expected JIRA Story Workflow

We use JIRA to track progress of any and all development work. Each issue comes in the form of a JIRA ticket.

There are several different types of tickets, each with their own workflow and deliverables that may differ from the other issue types:
* Story - a single use case contributing to the addition of an Epic (aka New Feature)
* Epic / New Feature - a high-level description of a new feature, comprised of several Story tickets breaking down the technical work invloved
* Bug - functionality that differs from the expected use case of the system

Less common issue types:
* Improvement - enhancement of existing functionality without adding new features
* Requirements - discussion / investigation tickets that will often yield more tickets for the backlog
* (Technical/Sub) Task - any other small portion of work that we would like to track in JIRA
* Processing Request - TBD
* Comment - TBD

# [Git](https://opensource.ncsa.illinois.edu/confluence/display/NDS/Git+Workflows)
* Walk through of Git Forking / Feature Branching Workflows

We use GitHub to track and manage all changes to the NDS Labs codebase. In order to ease collaboration, we follow a forking + feature branching workflow, described in more detail below.

Common Terminology:
* **Fork**: to take a repository from GitHub and create your own copy of it within the site, allowing you to isolate your changes from the rest of the code until you are ready to submit them.
* **Clone**: to take a repository from GitHub and create a local copy, allowing you to make changes from your local machine.
* **Branch**: to create a new "instance" of the repository that can be independently modified without disrupting other branches. This can help partition your changes into more reviewable pieces.
* **Commit**: to save your local modifications into your local clone.
* **Push**: to save your local commits back to your fork.
* **Pull Request**: to move a particular set of commits between branches, often from a feature branch and into "master".

# [Docker](https://opensource.ncsa.illinois.edu/confluence/display/NDS/Docker+Workflows)
* Walk through of building / pushing a Docker image



# Example
For example, take a look at this example JIRA ticket [NDS-161](https://opensource.ncsa.illinois.edu/jira/browse/NDS-161).

The general lifecycle followed by a JIRA ticket is:
Open -> In Progress -> In Review -> Resolved -> Closed

* Open: work has not been started on this ticket
* In Progress: work is currently done on this ticket
* In Review: work from this ticket is currently being reviewed
* Resolved: the work from this ticket is complete, and all PRs merged, but release artifacts may still need to be created or deployed
* Closed: all work from this ticket is complete, and the necessary release artifacts have been created
                              
## JIRA: Assign
The first step in beginning a new increment of work starts by assigning a JIRA ticket to yourself.

Click the link above and click on the "Assignee" field at the top-right. A dropdown should display allowing you to choose yourself as the Assignee.

Choose **Start Progress** (or **Reopen** for closed tickets) to move the ticket to the **IN PROGRESS** state.

## Git: Development
Now that the ticket has been assigned and marked In Progress, you are now ready to start completing the work described by this ticket.

The general workflow for making code modifications is:
Fork -> Clone -> Branch -> Commit -> Push -> Pull Request

### Forking a Repository
At the top-right of this page, click the **Fork** button. Click this button after logging into GitHub with your credentials.

Once the repository is finished forking, you will notice that it is now called **YOUR_GITHUB_USER/developer-workflow**. 

Feel free to modify your personal fork in any way you see fit.

### Cloning a Repository
Now you can grab a local copy of your repository by clicking the green "Clone or download" button at the top-right.

At a terminal on your local machine, copy the url of the GitHub repo and substitute it into the following command:
```bash
git clone https://github.com/YOUR_GITHUB_USER/developer-workflow.git
```

You should see git download your clone and once it completes, you should be able to **cd** into the local copy.

### Creating a Branch
Since we are working on a small piece of incremental work, organizing the changes into branches will likely help you keep track of which changes are for which features.

We tend to name these "feature branches" after the JIRA ticket's ID (i.e. NDS-161).

For example, using the ticket above, we would execute one of the following sets command to create a new branch for its work:
```bash
git checkout -b NDS-161
```
  OR
```bash
git branch NDS-161
git checkout NDS-161
```

### Commit + Push
Now let's say you want to make a change to your local clone.

For example, let's add **emacs** to the list of tools installed within the Dockerfile.

Open up the Dockerfile and you will see:
```
RUN apt-get -qq update && \
    apt-get -qq install vim nano curl
```

Add **emacs** at the end of the line here.

## Docker: Testing
What about testing the changes you have just made?

Ideally all code should be packaged as a Docker image, allowing for easy reuse and bootstrapping for testing.

To build the image described by a Dockerfile:
```bash
docker build -t ndslabs/dev-workflow .
```

To tag the image with the desired version tag:
```bash
docker tag ndslabs/developer-workflow:latest ndslabs/dev-workflow:NDS-161
```

To push the image to DockerHub and make it available to others:
```bash
docker push ndslabs/dev-workflow:NDS-161
```

NOTE: The first time you push to Docker from a new machine, you will need to execute the following command first to provide your DockerHub credentials before it will allow you to push:
```bash
docker login
```

## GitHub: Pull Request

## All: Review
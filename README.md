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
We use JIRA to track progress of any and all development work. Each issue comes in the form of a JIRA ticket.

## Lifecycle
The general lifecycle followed by each JIRA ticket is:
Open -> In Progress -> In Review -> Resolved -> Closed

* Open: work has not been started on this ticket
* In Progress: work is currently done on this ticket
* In Review: work from this ticket is currently being reviewed
* Resolved: the work from this ticket is complete, and all PRs merged, but release artifacts may still need to be created or deployed
* Closed: all work from this ticket is complete, and the necessary release artifacts have been created
                           
## Issue Types
There are several different types of tickets, each with their own workflow and deliverables that may differ from the other issue types:
* Story - a single use case contributing to the addition of an Epic (aka New Feature)
* Epic / New Feature - a high-level description of a new feature, comprised of several Story tickets breaking down the technical work invloved
* Bug - functionality that differs from the expected use case of the system

### Less common Issue Types
* Improvement - enhancement of existing functionality without adding new features
* Requirements - discussion / investigation tickets that will often yield more tickets for the backlog
* (Technical/Sub) Task - any other small portion of work that we would like to track in JIRA
* Processing Request - TBD
* Comment - TBD

# [Git](https://opensource.ncsa.illinois.edu/confluence/display/NDS/Git+Workflows)
We use GitHub to track and manage all changes to the NDS Labs codebase. In order to ease collaboration, we follow a forking + feature branching workflow, described in more detail below.

## Terminology:
* **Remotes**: allow you to pull to / push from your local workspace from / to different git repositories
* **Upstream**: the git repo from which a personal fork originated
* **Origin**: your personal fork of a particular repo

The general workflow for making code modifications is:
Fork -> Clone -> Branch -> Commit -> Push -> Pull Request

* **Fork**: to take a repository from GitHub and create your own copy of it within the site, allowing you to isolate your changes from the rest of the code until you are ready to submit them.
* **Clone**: to take a repository from GitHub and create a local working copy, allowing you to make changes from your local machine.
* **Branch**: to create a new "instance" of the repository that can be independently modified without disrupting other branches. This can help partition your changes into more reviewable pieces.
* **Commit**: to save your local modifications into your local clone.
* **Push**: to save your local commits back to your fork.
* **Pull Request**: to move a particular set of commits between branches, often from a feature branch and into "master".

### Forking
Forking allows users to keep their modifications separate from those of other users. This way, each user can manage their own sets of branches and need not worry about cluttering up the upstream repository.

### Feature Branching
Feature branching is a strategy to confne unrelated sets of changes to different branches. This allows the user to more freely move between tasks by switching branches, without running the risk of committing unrelated code changes.

# [Docker](https://opensource.ncsa.illinois.edu/confluence/display/NDS/Docker+Workflows)
We use Docker to package up all test / release code for easy deployment!

## Build
To build an image described by a Dockerfile:
```bash
docker build -t [User/]Image[:Tag] .
```

NOTE: If no Tag is specified, **latest** will be assumed.

## Tag
The above notation of "user/img:tag" is used throughout Docker to refer to a specific image tag from a particular organization.

To tag the image with the desired version tag (usually a JIRA ticket ID):
```bash
docker tag user/img:oldtag user/img:newtag
docker tag user/oldimg:tag user/newimg:tag
docker tag olduser/img:tag newuser/img:tag
```

## Push
To push the image to DockerHub and make it available to others:
```bash
docker push user/img:tag
```

NOTE: The first time you push to Docker from a new machine, you will need to execute the following command first to provide your DockerHub credentials before it will allow you to push:
```bash
docker login
```

# Example
For example, take a look at this example JIRA ticket [NDS-161](https://opensource.ncsa.illinois.edu/jira/browse/NDS-161). Typcially, you will want to **only** do work that has been addressed in the ticket:
* If a ticket is too vague, it can be discussed / updated / commented on to provide more detailed information
* If a ticket enables more work that is not already covered under another ticket, a new ticket can be created to encompass the new work
* If a ticket is too large or unwieldy, it can be split out into separate tickets if possible
   
## JIRA: Assign
The first step in beginning a new increment of work starts by assigning a JIRA ticket to yourself.

Click the link above and click on the "Assignee" field at the top-right. A dropdown should display allowing you to choose yourself as the Assignee.

Once the ticket has been assigned, click **Start Progress** at the top (or **Reopen** for closed tickets) to move the ticket to the **IN PROGRESS** state.

## Git: Development
Now that the ticket has been assigned and marked In Progress, you are now ready to start completing the work described by this ticket.

### Forking a Repository
At the top-right of this page, click the **Fork** button. Click this button after logging into GitHub with your credentials.

Once the repository is finished forking, you will notice that it is now called **YOUR_GITHUB_USER/developer-workflow**. 

This is your personal fork that only you have access to push (by default). You can modify your personal fork in any way you see fit without affecting the upstream repository.

### Cloning a Repository
Now you can **Clone** a local copy of your personal fork by clicking the green "Clone or download" button at the top-right. From here, you can copy the HTTPS endpoint for this repository into your clipboard.

At a terminal on your local machine, paste the URL into the following command:
```bash
git clone https://github.com/YOUR_GITHUB_USER/developer-workflow.git
cd developer-workflow/
git remote add upstream https://github.com/nds-org/developer-workflow.git
```

You should now have a working copy of the source on your local machine.

#### Synchronization
Your local repository will not automatically keep itself up-to-date with the changes from the original source repo.

That means that for any modifications made to that repo, you will need to be **Pull** (aka **Merge**) these changes in manually.

To merge in changes from your personal fork:
```bash
git pull origin master
```

To merge in changes from the original source repo:
```bash
git pull upstream master
```

### Creating a Branch
Since we are working on a small piece of incremental work, organizing the changes into **Branches** will likely help you keep track of which changes are for which features.

We tend to name these "feature branches" after the JIRA ticket's ID (i.e. NDS-161).

For example, using the ticket above, we would execute the following command to create a new branch for this work:
```bash
git checkout -b NDS-161
```

### Commit + Push
Now let's say you want to make a change to your local clone.

For example, let's add **emacs** to the list of tools installed within the Dockerfile.

Open up the Dockerfile in a text-editor and you will see:
```bash
RUN apt-get -qq update && \
    apt-get -qq install vim nano curl
```

Add **emacs** at the end of the line here, and then **Commit** your changes:
```bash
git commit -a -m "Test commit"
```

You can then **Push** to export any local commits from your local machine to your personal fork in bulk:
```bash
git push origin master
```


## Docker: Testing
What about testing the changes you have just made?

Ideally all code should be packaged as a **Docker image**, allowing for easy reuse and bootstrapping for testing.

Build, tag, and run a test Docker image to verify that your changes have been packaged correctly:
```bash
docker login
docker build -t dev-workflow .
docker tag dev-workflow ndslabs/dev-workflow:NDS-161
```

If everything looks like it is running correctly from the test image, go ahead and push the image to DockerHub:
```bash
docker push ndslabs/dev-workflow:NDS-161
```

## GitHub: Pull Request
So now all of your code is up on your feature branch of your personal GitHub fork and it has an associated test docker image. Let's say you are satisfied with your changes and the quality of your test Docker image. The last step before Review is to create a **Pull Request** (aka **PR**) containing your desired changes. This is effectively a "diff" on GitHub between your feature branch and the upstream repo with a conversation attached.

To create a PR, go to your personal fork and click the "New Pull Request" button at the top-left. You should then be able to choose which fork/branch you are merging to or from.

NOTE: 99.9% of the time, you will be creating PRs from your personal fork and feature branch into the upstream repo's "master" branch.

## All: Review
Once the PR is created, a comment should be added to the associated JIRA ticket containing links to any relevant:
* JIRA: Test case(s)
* DockerHub: Test docker image(s)
* Confluence: Documentation update(s)
* GitHub: Pull request(s)

The ticket can be moved to "In Review" and assigned to the tester/reviewer, who should review these items for errors.

The reviewer should follow a process normally consisting of the following steps, in order:
* Read and make sure you understand the test case(s)
* Run the test docker image(s) and walk-through the provided test case(s)
* Review any documentation update(s) for obvious flaws
* If everything above is acceptable, review and merge any related pull request(s)

### Problems with Test Artifacts?
If the reviewer finds that any of the following are true, the reviewer should consult with the developer that created the pull request:
* the ticket is overly ambiguous
* the test case is overly ambiguous
* using the test image, the test case does not pass as written
* the documentation provided is overly ambiguous
* changes exist in the pull request that do not match the ticket description
* changes exist in the pull request that are not understood, or oppose best-practices

### Merge Conflicts
Problems with merge conflicts? Take a deep breath and follow the guide below:

https://opensource.ncsa.illinois.edu/confluence/display/NDS/Resolving+Merge+Conflicts

## Success!
Once the Pull Request(s) have been merged, the ticket is marked as **Resolved** and re-assigned back to the original developer, who should then create any release artifcats for it.

This might include:
* NDS Labs API Server image
* NDS Labs WebUI image
* NDS Labs CLI
* other Docker images


Once release artifacts have been created, the ticket can safely be marked as **Closed**

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

## Assign
The first step in beginning a new increment of work starts by assigning a JIRA ticket to yourself.

Click the link above and click on the "Assignee" field at the top-right. A dropdown should display allowing you to choose yourself as the Assignee.

Choose **Start Progress** (or **Reopen** for closed tickets) to move the ticket to the **IN PROGRESS** state.

## Fork + Clone + Branch
Now that it has been assigned and progress has been started, you are now ready to perform the work described by this ticket.

### Forking a Repository
At the top-right of this page, click the **Fork** button. Click this button after logging into GitHub with your credentials.

Once the repository is finished forking, you will notice that it is now called **YOUR_GITHUB_USER/developer-workflow**. 

Feel free to modify your personal fork in any way you see fit.

### Cloning a Repository
Now you can grab a local copy of your repository by clicking the green "Clone or download" button at the top-right.

Copy the url of the git repo and substitute 

### Creating a (Feature) Branch


## Commit + Push

## Pull Request

## Review
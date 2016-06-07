# developer-workflow
An example git repo to introduce the [development process](https://opensource.ncsa.illinois.edu/confluence/display/NDS/Developer+Workflows) followed by the developers of NDS Labs.

This example will walk you through the various workflows that developers of NDS Labs are expected to follow while developing the platform.

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

We use JIRA to track progress of any and all development work. Each issue comes in the form of a JIRA ticket. There are several different types of tickets, each with their own workflow and deliverables that mya differ from the other issue types:
* Story - a single use case contributing to the addition of an Epic (aka New Feature)
* Epic / New Feature - a high-level description of a new feature, comprised of several Story tickets breaking down the technical work invloved
* Bug - functionality that differs from the expected use case of the system

Less common issue types:
* Improvement - enhancement of existing functionality without adding new features
* Requirements - discussion / investigation tickets that will often yield more tickets for the backlog
* (Technical/Sub) Task - any other small portion of work that we would like to track in JIRA
* Processing Request - TBD
* Comment - TBD

For example, take a look at this example JIRA ticket [NDS-161](https://opensource.ncsa.illinois.edu/jira/browse/NDS-161).

# [Git](https://opensource.ncsa.illinois.edu/confluence/display/NDS/Git+Workflows)
* Walk through of Git Forking / Feature Branching Workflows

# [Docker](https://opensource.ncsa.illinois.edu/confluence/display/NDS/Docker+Workflows)
* Walk through of building / pushing a Docker image

# Engineering IAM Model for GCP

## Purpose

- Our most sensitive resources need to be accessed in a secure manner
- The most sensitive part of our data is our customer’s data and that lives in our cloud environment
- Providing access to engineers based on their job requirements and adopting a least privilege standard keeps our data secure from unintended access

## Process

- We adopt a least privilege access policy where engineers are only assigned permissions that are necessary for them to be successful in their daily tasks
- Least privilege access also prevents users from having excessive permissions such as admin access when it isn't necessary for their job success.
- This process is achieved through department and division designation.

### Initial setup

- Once an engineer joins, they are assigned to their respective department and division
- Our automated workflow then assigns this user to specific permission groups based on this designation
- The backend recognizes the user’s group and associates the permissions with the users of that group.

### User changing departments

- This process would associate the user with the correct groups once their role has been updated in the HR tool.

### In case of a user’s departure from the company,

- The removal of user’s account from the main system will remove them from any groups, which in turn will remove all permissions from that user as well

### BreakGlass scenario:

- In situations where a user is working on an issue that requires their permissions to be escalated temporarily
- The user must request permission for this escalation
- Once approved, the user is then added to a pre defined group that has escalated permissions
- This is done via a workflow that recognizes the temporary nature of the escalation and hence a time limit is set for this access.
- At the end of the time limit, either the user gets new approval for extension of their permissions or they are automatically removed from this group, hence deescalating their permissions to the original ones assigned per their job responsibilities.

## Prevent Permission Creep:

- How do we prevent permission creep from this setup?
- This happens in two scenarios
  - A user has permissions that they should not have long term
  - A group has permissions that it should not have long term
- The first scenario is handled via the workflow that assign a user to the right groups based on their department and division
- The second scenario is addressed via our backend infrastructure code.
- In this case, infrastructure code runs at a designated interval.
- The code has the baseline of what permissions should be assigned to which group
- If there are any changes made outside of this code, they will be reverted back at the next execution of this code.
- The code is kept in a repository so all changes to it are auditable and approved before being merged.

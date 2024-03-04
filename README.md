#     DevOps
#### Devops practices enable development and operations teams to conceive, build and deliver secure software at top speed, through automation, collaboration, fast feedback, and iterative improvement. 

#### CI 
Continuous integration is the practice of integrating all your code changes into the main branch of a shared source code repository early and often, automatically testing each change when you commit or merge them, and automatically kicking off a build. With continuous integration, errors and security issues can be identified and fixed more easily, and much earlier in the development process.

By merging changes frequently and triggering automatic testing and validation processes, you minimize the possibility of code conflict, even with multiple developers working on the same application. A secondary advantage is that you don't have to wait long for answers and can, if necessary, fix bugs and security issues while the topic is still fresh in your mind.

Common code validation processes start with a static code analysis that verifies the quality of the code. Once the code passes the static tests, automated CI routines package and compile the code for further automated testing. CI processes should have a version control system that tracks changes so you know the version of the code used.

#### CD
Continuous delivery is a software development practice that works in conjunction with CI to automate the infrastructure provisioning and application release process.

Once code has been tested and built as part of the CI process, CD takes over during the final stages to ensure it's packaged with everything it needs to deploy to any environment at any time. CD can cover everything from provisioning the infrastructure to deploying the application to the testing or production environment.

With CD, the software is built so that it can be deployed to production at any time. Then you can trigger the deployments manually or move to continuous deployment, where deployments are automated as well.
Continuous deployment enables organizations to deploy their applications automatically, eliminating the need for human intervention. With continuous deployment, DevOps teams set the criteria for code releases ahead of time and when those criteria are met and validated, the code is deployed into the production environment. This allows organizations to be more nimble and get new features into the hands of users faster.

#### IoT (Internet of Things)
The Internet of Things (IoT) describes the network of physical objects—“things”—that are embedded with sensors, software, and other technologies for the purpose of connecting and exchanging data with other devices and systems over the internet.
For example Smart home devices, smartwatches, pacemakers, self-driving cars

#### Bicep
Bicep is a domain-specific language (DSL) that uses declarative syntax to deploy Azure resources. In a Bicep file, you define the infrastructure you want to deploy to Azure, and then use that file throughout the development lifecycle to repeatedly deploy your infrastructure. Your resources are deployed in a consistent manner.
Bicep provides concise syntax, reliable type safety, and support for code reuse. Bicep offers a first-class authoring experience for your infrastructure-as-code solutions in Azure.

#### Azure Subscription

![SUBSCRIPTION IMG](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-setup-guide/media/organize-resources/scope-levels.png)

Every Azure AD tenant may have multiple Azure subscriptions. The grade of subscription at which the consumer invoiced is depending on consumption. In addition, it enables a logical separation for administrative simplification. A firm can ordinarily have a primary tenant, and each of its cloud-using divisions can have multiple subscriptions for their individual Azure account environments.

#### Azure Resource Groups
A resource group is a container that holds related resources for an Azure solution. The resource group can include all the resources for the solution, or only those resources that you want to manage as a group. One benefit of using RGs in Azure is grouping related resources that belong to an application together, as they share a unified lifecycle from creation to usage and finally, de-provisioning.

#### Blob Storage Type
A "blob," which is short for Binary Large Object, is a mass of data in binary form that does not necessarily conform to any file format. 
That is what Blob storage is optimized for storing this type of data, serving images or documents directly to a browser, storing files for distributed access, streaming video and audio, writing to log files, storing data for backup and restore, disaster recovery, and archiving, storing data for analysis by an on-premises or Azure-hosted service.

#### Git- Source Control
##### 1. Pull Request
A pull request is a proposal to merge a set of changes from one branch into another. In a pull request, collaborators can review and discuss the proposed set of changes before they integrate the changes into the main codebase. Pull requests display the differences, or diffs, between the content in the source branch and the content in the target branch.

##### 2. Branch
In Git, a branch is a pointer to one specific commit, while a commit is a snapshot of your repository at a specific point in time.

##### 3. Commit

# comp698-final Documentaton by Dilpreet Singh

* Why use git?
We should use git because it gives us ability to secure data with never lose capability since we can anytime undo changes that is accessible at all times online to you and to others developers who are permitted and multiple people can work on a project at same time. Also it is easy to learn and use. 

* Why write an application in golang?
It is because Golang is easy to learn and read code open source programming language with easy accessibility of go libraries. It also gives us capability of automation. You can even edit and run programs directly on the web as it does not require JVM.

* What purpose does Travis CI serve?
The purpose of Travis CI is to perform continuous integration on codes we upload to git repositories through commits. Its looks for errors and compare new changes with old files and find possible errors.

* What is the purpose of terraform?
Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Purpose of terraform in this project was to deploy docker images and containers.

* Why use virtualized resources?
Virtualized servers gives developers ability to set up and configure a server a system and also it is best for testing and reusing it as developers can have multiple versions running with ability to destroy it anytime.

* Include a diagram of the architecture from laptop to GCP
For this project:
  

In general:
  

* Why use bash commands vs clicking through UI?
One reason using bash command over UI would be it gives a better understanding to user about where, when, how and what is happening. It also builds a skill for users as it help them become more proficient with bash command. Also, more features and be utilized through bash command than UI such as sudo functionally. 

* Why docker vs installing application directly on the host?
Docker would be better because it gives was ability to build, test on production environment and even repeat developments. Docker has containers which allows us to commit changes to Docker images and version control them. Plus with Docker it has less requirement vs directly installing usually require more things.

* What protections are there against accidentally introducing bad code into production?
One, use Github, because all changes are reversible. Second, implement Travis-CI for continuous integration which checks code each time before merging to master whenever there is a commit. It’s always better to prevent bad thing from happening than having to fix it. Other ways would be have a staging server for testing before pushing it to production.



## Below are step by step documentation of how this system was built and why each step is important:


1. In order to create a new Github repository, go to github.com and login. Once logged in, click new to create new repository. 
*Name the new repository, as in this case while building this system it was “comp698-final” . The name of the new repository has to be unique from your other repositories, otherwise you will get an error as it will state it already exists.
* Most of the time it is better to initialize the new repository with README.md because it is a very convenient place to document the project or to give instructions about the project.
For this final project, I have used README.md for documentation of my project.
Even-though adding a license is a optional step for publicly open source project, it is always better to add one for incase because 1. It only takes two seconds to add one and 2. It helps audience get a clear disclaimer of project about limitations of the projects and permission such as if it okay to use for commercial use, modifications, distribution or private use, etc.
For this final project, I have used MIT Licenses in hope to secure my work even-though it does not really secures it as it give free permission for any use.
* Next step is to clone the repository to your local system. For this you may either download a zip directly from github.com/ [repo] or you can git clone using the terminal.
For this I git clone the repository to my desktop because Desktop is efficient to access since we have to go back and for at very frequent times while doing projects related to git hub. To clone, I ran this command on terminal after I ‘cd’ into location where I want my clone repository:

git clone https://github.com/idilpreetsingh/comp698-final.git

* Protecting the master branch I also very important in order to prevent accidental edits to file on master branch.I configured the GitHub repository to protect the master branch by going settings > branches of the comp698-final repo. Then I selected branch I want to protect which in this case was master branch. Once selected master branch we can protect it by checking ‘protect this branch’ and inside it also check ‘require status check to pass before merging. I used continuous-integration/travis-ci. So I check that as well. And also checked ‘include administrators’ to even admins don't make errors. At last, hit ‘save’ to save the changes. Github asks to enter GitHub password to verify it is admin who is making these changes.


2. Next assignment was to start hello-world server. I used golang because I will be running the server on google cloud platform. I started building the server by create main.go and main_test.go as instructed and provided by the professor using helloworld-source and saved it at local repository. To push these files to master branch at GitHub, I created a new branch ‘helloworld’, added the files to the new branch, commit the changes to the branch which appropriate message, pushed the branch. Then I used GitHub to pull request and merge it to master branch. I used this method to push file because it was more convenient to keep track and securely keep all the files at all places.
Main.go contains the final output of the the project and port number and main_test.go is testing file to check if output matches expected output. 

Link to helloworld source (provided by professor): https://github.com/mathyourlife/comp698-final/tree/helloworld-source

Link to Merge PR:
https://github.com/idilpreetsingh/comp698-final/pull/2


3. Next step was to add a Dockerfile. The process to add the Dockerfile was similar as adding main.go and main_test.go in the previous process of adding those file. First I created local Dockerfile using sublime by copying the code from helloworld-dockerfile branch. To push these files to master branch at GitHub, I created a new branch ‘helloworld’, added the files to the new branch, commit the changes to the branch which appropriate message, pushed the branch. Then I used GitHub to pull request and tried merge it to master branch but was unsuccessful because it required .travis.yml file for testing.

Link to helloworld-docker (provided by professor):
https://github.com/mathyourlife/comp698-final/tree/helloworld-dockerfile

Link to Merge PR: 
https://github.com/idilpreetsingh/comp698-final/pull/3


4. & 5. Next step was to add travis-ci for Pull Request validation from provided file in branch name helloworld-travis-ci. I followed the same procedure as in past. First I created .travis.yml using sublime by copying the code from helloworld-travis-ci branch. Also added functional-test.sh for triggering built. To push these files to master branch at GitHub, I created a new branch ‘helloworld’, added the files to the new branch, commit the changes to the branch which appropriate message, pushed the branch. Then I used GitHub to pull request and ran travis-ci test and merge it to master branch because travis-ci build trigger was successfully passed. 
Also for some reason Dockerfile wouldn’t merge without travis-ci test pass so i needed to add .travis.yml file before merging Dockerfile, so it was merged in this pull request.

Link to helloworld source (provided by professor):
https://github.com/mathyourlife/comp698-final/tree/helloworld-dockerfile

Link to Merge PR: 
https://github.com/idilpreetsingh/comp698-final/pull/3


6. Building trigger is one of the one of the main step to while starting to build a server. I used Google Cloud Platform Console to set up build trigger. To create new build trigger, i first selected the right project in which i want to build new trigger which in this case was ‘ds-1067’. Then in the left nav, i clicked ‘Build triggers’. To create a new trigger, click ‘Add trigger’. I used Github to link host repository for build source by selecting ‘Github’ from the possible option and then selected comp698-final repository because that is where i had my code and hit ‘Continue’. To Set up trigger profile and setting, i named the trigger ‘helloword-master’ and select ‘Branch’ as type with master. For build configuration i used Dockerfile which was perviously added to the code. For image name i used ‘gcr.io/comp698-ds1067/$REPO_NAME:$COMMIT_SHA’. 
After creating the trigger, hit ‘run ‘Run trigger’ to ‘master’, and waited until it was successful.


7. Next step was to create terraform to deploy helloworld version to 1 staging server. To add terraform configuration files, to first created a subfolder ‘terraform’ at local repository and added ‘main.tf’ to it. I used sublime to edit the code of main.tf from homework assignments from previous weeks to work more effieciently. I changed the instance server name to ‘staging-server’ and group manager name to ‘staging-hellworld-manger’ and also made some other additions and organized the code so it looks neat and saved the file in the ‘terraform’ subfolder. To push this file to github, i followed same procedure, created branch ‘terraform-config’, checkout to ‘terraform-config’, did it git status to confirm changes, add ‘terraform’ subdirectory to branch, commit, push the branch, pull request through github, waited for travis-ci to pass build and merged to master.
To clone tthe repo and perform apply terraform, i logged into ‘terraform-configuration’ instance on terminal using ‘gcloud compute ssh terraform-configuration’ and git clone comp698-final repository to ‘terraform-configuration’ instance by running this command ‘git clone https://github.com/idilpreetsingh/comp698-final.git’. 
To initialize terraform, I cd into comp698-final repo, and ran command ‘terraform init’. To apply the server, I cd into terraform and run this command to apply the server ‘terraform apply’ and it was successfully initialized.
To ensure if website loads, i found the external IP by running this command ‘gcloud compute instances list’. It gave me list of all the instances with IP addesses and showing if it is running. Since it was running, i copied the external IP of staging server and pasted in a browser and web page loaded successfully with displaying “
Issue encountered: I had to rename the base_instance_name to fix a issue i encountered and redo entire thing because one of my previous instance name was same so i was getting error while terraform apply.

Link to Merge PR:
https://github.com/idilpreetsingh/comp698-final/pull/4
https://github.com/idilpreetsingh/comp698-final/pull/5/commits/d8d7d74632425eb2fa3fe3e011b332c0671ffe7c

Terminal output:
dilpreetsingh@terraform-configuration:~/comp698-final/terraform$ gcloud compute instances list
NAME                             ZONE           MACHINE_TYPE   PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP    STATUS
student-sandbox                  us-central1-a  f1-micro                    10.128.0.2   35.193.90.229  RUNNING
terraform-configuration          us-central1-a  f1-micro                    10.128.0.3   35.202.99.191  RUNNING
staging-helloworld-manager-zd8l  us-central1-f  n1-standard-1               10.128.0.4   35.225.36.39   RUNNING
my-app-dev                       us-east1-b     f1-micro                    10.142.0.3   35.231.163.2   RUNNING
my-app-prod                      us-east1-b     f1-micro                    10.142.0.2   35.227.50.90   RUNNING




8. In order two have two instances running at same time, next step was to add bootstrap-source to the repo at github and terraform-configuration server. To add the source, i added static subfolder with provided files, also updated Docker file to copy static subfolder code for bootstrap, and at last also updated functional-test.sh, main.go and main-test.go that contains output of webpages and accessibility to web pages program. 
To push changes to github, i followed same procedure as previously, created branch ‘bootstrap-source’, checkout to ‘bootstrap-source’, did it git status to confirm changes, added updated and new files to branch, commit, push the branch, pull request through github, waited for travis-ci to pass build and merged to master. 
To push changes to terraform server, i logged into ‘terraform-configuration’ instance on terminal using ‘gcloud compute ssh terraform-configuration’ and cd into the repo and run command ‘git pull’ to update all the changes and pull new and updated files. 
To ensure merged changes successfully build  a new image, i went to GCP and check Build history of triggers.

Link to helloworld-docker (provided by professor):
https://github.com/mathyourlife/comp698-final/tree/bootstrap-source

Link to Merge PR:
https://github.com/idilpreetsingh/comp698-final/commit/d0f8fdd7a98aa152d706f01f6bfac2cb33f1cc5b


9. Final step was to deploy full bootstrap app to staging server and hello world response to production server. To do so, i updated the code of main.tf and creating prod instances and prod manager with desired output based on new image and old image i got from GCP. 
To push changes to github, i followed same procedure as previously, created branch ‘prod-stag’, checkout to ‘prod-stag’, did it git status to confirm changes, add ‘main.tf’ subdirectory to branch, commit, push the branch, pull request through github, waited for travis-ci to pass build and merged to master. 
To push changes to terraform server, i logged into ‘terraform-configuration’ instance on terminal using ‘gcloud compute ssh terraform-configuration’ and cd into the repo and run command ‘git pull’ to update all the change to main.tf. 
To apply changes, run the command ‘terraform apply’ in terraform subfolder. But got error because i repeated same missing what i did in step 7. So i had to change all the instances names. I did so and re did the entire thing which was made changes locally, pushed to github, pulled changed at terraform server. 
To apply the changed and run server, i ran command ‘terraform apply’ . This time apply was successfully completed. 
To check and get external IP i ran command ‘gcloud compute instances list’ and verified that it is running on server as well as on Web. Final result of production was showing Hello World output and staging server was showing bootstrap app.

dilpreetsingh@terraform-configuration:~/comp698-final/terraform$ gcloud compute instances list
NAME                              ZONE           MACHINE_TYPE   PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP    STATUS
student-sandbox                   us-central1-a  f1-micro                    10.128.0.2   35.193.90.229  RUNNING
terraform-configuration           us-central1-a  f1-micro                    10.128.0.3   35.202.99.191  RUNNING
prod-bootstrap-manager2-k65s      us-central1-f  n1-standard-1               10.128.0.6   35.224.9.225   RUNNING
staging-helloworld-manager2-d469  us-central1-f  n1-standard-1               10.128.0.7   104.197.59.29  RUNNING
my-app-dev                        us-east1-b     f1-micro                    10.142.0.3   35.231.163.2   RUNNING
my-app-prod                       us-east1-b     f1-micro                    10.142.0.2   35.227.50.90   RUNNING

Link to Merge PR:
https://github.com/idilpreetsingh/comp698-final/commit/78468f8e3fd32ef92aa1aaf75fc396cede55b44d
https://github.com/idilpreetsingh/comp698-final/commit/ef67daeb68cbb97be31d19bb2a666aa318c47556

Link to servers:
Prod-bootstrap-manager2-k65s: http://35.224.9.225
Staging-helloworld-manager2-d469: http://104.197.59.29/home


(Note: i forget to mention above, i used ‘git log’ frequency throughout the final to see if files updating was successful while push to repositories)

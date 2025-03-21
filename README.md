   PROJECT NAME:   CI/CD Pipeline Automation with Jenkins, Ansible, GitHub & AWS, Docker


   ABOUT:
       Setting up 2 EC2 servers, which will act as master and client server where we will be accessing the client server from master server via SSH configuration. And then will also install ansible playbook and setting it up so that we can run and install the docker in client server. Here we are using ngnix server for running our website using master EC2. This project also include github and jenkins, so that we can update our new website code to the github and then jenkins will pull the new updated website file and the jenkins would push it to the client EC2 server, which will be next mounted to the ngnix server which got installed. By this our fully automated CICD website is good to go.



   PROJECT STEPS:
       First go to AWS account. Create an VPC for both private and public EC2 server. Here we are communicating client server which will be in the private server and master will be public--- this is optional, you can create both in public server too.
       You can also, attach the load balancer, autoscaling, cloudwatch to the client EC2 server.
       Once the EC2 is created, you will have to generate the private key using cmd ssh-keygen rsa -t on both server, and go to .SSH>>>authoru=ized keys and copy it to the client server .ssh folder.
       Tranfer the pem key using winscp and type in the cmd, ssh -i ec2-user@ip of the client. This is to make sure that the Master is able to Communicate with client without password.
       And make sure to edit the sshd_config file.

       Now you will have to install the Ansible----> pip3 install ansible -y
       Once the download is complete, type ansible and click on tab to check it is installed.

       Now this is where you write the ansible playbook to run and install the docker in the client server.
       Create a file saying install-docker.yml  ----> this is to install the docker the docker in the client--->>the cmd is in the github path Projects/main/Ansible-Playbook/Install_docker.yml you can refer this
       You will also have to create a file which contains Ec2 clients IP.
       Now the file to run the docker image---->>run-docker.yml ----->>you will find the cmd here--->>https://github.com/Rakshithk1/Projects/main/Ansible-Playbook/running_container.yml

       You can see that in the install-docker file, there is cmd to install the docker.
       And in run-docker, you can see we have ran ngnix image, you can run any image like apache. And also we have mounted the local EC2 client volume path where the website index.html file is to the ngnix index.html path. So, that the website files which will get updated in the client EC2 index would be automatically be updated to the ngnix index path.

      
       

       Now, You can write all the codes in the github repo, and make a files for each.


       INSTALLING JENKINS:
         On your master server, you need to install jenkins, you can refer the jenkins.io website>>document to install it. 
         Once it is installed, go to Master Ec2 in AWS >>>click on the instance>>security>>security groups>>and enable the port 8080.
         And then enter the cmd, systemctl start jenkins >>>copy the master EC2 ip and paste it in the browser and at the end at 8080. ex: ip:8080
         Now the jenkins dashboard will open you need to set it up.

         Go to new job>>select pipeline>>scp polling>> end enter the code:

                pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Rakshithk1/Projects.git'
            }
        }

        stage('Deploy to Client via Ansible') {
            steps {
                sh '''

                    cd Ansible-Playbook/
                    ansible-playbook -i inventory deploy.yml
                '''
            }
        }
    }
}


       Here the code is to pull the github repo and include where the files are present. 
       Next is the shell cmd where it needs to run the deploy file.  
       #[[[[ the format will be given in the jenkins itself, you can click on jenkins syntax. ]]]]
       About the deploy.yml file ------ this file contains the cmd to push the index file which was pulled from git to the destination, which would be our client EC2 path.
       Make sure the git also have the inventory file which contain the Client EC2's IP. 

 Conclusion: 
      Now when ever the code is pushed to the index file of the github, it will be pulled by the jenkins and moves to the Client Ec2 path, which will be next moved to the ngnix path which is created in the  docker. By this our fully automated CICD website is good to go.
       

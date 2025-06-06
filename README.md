1. EC2 Instance runs Node Exporter
2. Prometheus (on separate EC2) scrapes metrics
3. Grafana visualizes real-time performance
4. CloudWatch triggers Lambda when CPU > 70%
5. Lambda sends a Slack alert


## 🛠️  Setup Guide

- [x] Configure Node Exporter on EC2
- [x] Install Prometheus and set up targets
- [x] Deploy Grafana + Import Node Exporter dashboard (ID: 1860)
- [x] Add AWS Lambda alert for CPU usage
- [x] Send Slack alert via Lambda




import json
import urllib.request

def lambda_handler(event, context):
    webhook_url = 'https://hooks.slack.com/services/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'
    message = {
        "text": "🚨 Lambda Alert (no requests layer): This is Rakshith's EC2 Monitoring bot from AWS Lambda!"
    }

    data = json.dumps(message).encode('utf-8')
    req = urllib.request.Request(webhook_url, data=data, headers={'Content-Type': 'application/json'})

    try:
        with urllib.request.urlopen(req) as response:
            status_code = response.getcode()
    except Exception as e:
        status_code = 500
        print(f"Request failed: {e}")

    return {
        'statusCode': status_code,
        'body': json.dumps('Slack alert sent successfully!')
    }

~




You need to create a account in the slack and create the channel and copy the webhook. Then you need to go to lambda and enter the above code. Make sure to update the permission in configuration, cloudwatchfullaccess, and SNS and lambdabasicexicution role.
Once this is done, go to the ec2  and enter the stress cpu command to load the CPU. And watch the cloudwatch alarm. Also you need to set up the cloudwatch and select the lambda and update the threshold, Once the CPU perentage hits 70%, you can see those in the cloudwatch watch graph, and the state will change to in alarm, the lamda will be triggered and the email will be sent to the slack.
You can then make this into the fully monitoring by using promothoes, graphna. 
Create another instance and install promethoues and grapana and in the main instance install node exporter, make sure to update the needed ip in the promeothos yaml file of the second instance.
Once the service is started, you can access the monitoring dashboard and then go to the main instance and update the CPU load and check the grapana. You I have used (In Grafana → Left menu → Dashboards → Import
Enter dashboard ID: 1860). You can see the graph there and also in the cloudwatch, you will also be alertted in the slack email.



#!/bin/bash
aws codedeploy create-deployment \
    --application-name Cloud1-codedeploy-app \
    --deployment-group-name \
    --github-location repository=viruskizz/42bangkok-cloud-1,commitId=commit-id
#!/usr/bin/env node

import * as cdk from "@aws-cdk/core";
import { RdsStack, AppInfo } from "@rylabs/ry-cdk-tools/lib/rds";
import { InstanceType, InstanceSize, InstanceClass } from "@aws-cdk/aws-ec2";
import { RailsPipelineStack, RailsStack } from "@rylabs/ry-cdk-tools/lib/rails";

const env = {
  account: "Enter Your AWS Account ID",
  region: "us-east-1",
};

const appInfo: AppInfo = {
  // Name of the app, in lower title case format. Use for naming AWS resources.
  name: "enterAppName",

  // Short name of the environment. Use for naming AWS resources.
  environment: "envShortName",

  // Environment name.
  orgName: "Enter Your Organization Name",

  // Author name.
  author: "Enter Your Name",
};

// Github repo owner name
const ownerName = "enter-repo-owner-name";

// Github repo name
const repoName = "enter-repo-name";

// AWS VPC ID
const vpcId = "enter-vpc-id";

// Server EC2 Instance type
const instanceType = InstanceType.of(InstanceClass.T2, InstanceSize.MEDIUM);

const app = new cdk.App();
const vpc = { vpcId };

// Database with medium T2 instance
const rds = new RdsStack(app, "rdsProd", {
  env,
  vpc,
  appInfo,
  instanceType,
});

// Rails
const rails = new RailsStack(app, appInfo.name, {
  env,
  appInfo,
  vpc,
  databaseAccess: {
    instance: rds.dbInstance,
    databaseName: rds.dbInstance.databaseName,
    securityGroup: rds.securityGroup,
    username: rds.dbInstance.masterUsername,
    password: rds.dbInstance.masterPassword,
  },
  defaultProcess: {
    healthCheckPath: "/_healthcheck",
  },
});

// Rails Pipeline
const pipelineName = `${appInfo.name}Pipeline${appInfo.environment.toUpperCase}`;
const pipeline = new RailsPipelineStack(app, pipelineName, {
  env,
  appInfo,
  environment: rails.ebEnvironment,
  ownerName,
  repoName,
});

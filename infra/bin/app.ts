#!/usr/bin/env node

import * as cdk from "@aws-cdk/core";
import { RdsStack, AppInfo } from "@rylabs/ry-cdk-tools/lib/rds";
import { InstanceType, InstanceSize, InstanceClass } from "@aws-cdk/aws-ec2";
import { RailsPipelineStack, RailsStack } from "@rylabs/ry-cdk-tools/lib/rails";

const env = {
  account: "",
  region: "us-east-1"
};

const appInfo: AppInfo = {
  name: "myApp",
  environment: "prod",
  orgName: "RYLabs",
  author: "Kaine Wright"
};

const pipelineName = `${appInfo.name}Pipeline${appInfo.environment.toUpperCase}`;
const repoName = "rails-starter";

const app = new cdk.App();

const vpc = { vpcId: "" };

// Database with medium T2 instance
const rds = new RdsStack(app, "rdsProd", {
  env,
  vpc,
  appInfo,
  instanceType: InstanceType.of(InstanceClass.T2, InstanceSize.MEDIUM)
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
  }
});

// Rails Pipeline
const pipeline = new RailsPipelineStack(app, pipelineName, {
  env,
  appInfo,
  environment: rails.ebEnvironment,
  ownerName: appInfo.orgName,
  repoName: repoName
});

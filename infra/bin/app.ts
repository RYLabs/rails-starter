#!/usr/bin/env node

import * as cdk from "@aws-cdk/core";
import { RdsStack } from "@rylabs/ry-cdk-tools/lib/rds";
import { InstanceType, InstanceSize, InstanceClass } from "@aws-cdk/aws-ec2";
import {
  RailsPipelineStack,
  RailsStack,
  AppInfo,
  Conventions,
} from "@rylabs/ry-cdk-tools/lib/rails";

const env = {
  account: "AWS_ACCOUNT_ID",
  region: "us-east-2",
};

const appInfo: AppInfo = {
  // Name of the app, in lower title case format. Use for naming AWS resources.
  name: "app name here",

  // Short name of the environment. Use for naming AWS resources.
  environment: "staging",

  // Environment name.
  orgName: "Company name",

  // Author name.
  author: "Your name here",
};

// Github repo owner name
const ownerName = "Github repo owner name";

// Github repo name
const repoName = "Github repo name";

// Branch this environment deploys from
const branchName = "develop";

// AWS VPC ID
const vpcId = "vpc-ID#####";

// Ruby stack
const solutionStackName = "64bit Amazon Linux 2 v3.2.2 running Ruby 2.7";

// Instance type for Rails servers
const railsInstanceType = InstanceType.of(
  InstanceClass.T3,
  InstanceSize.MEDIUM
);

const dbInstanceIdentifier = "app-staging";
const dbInstanceEndpointAddress =
  "AWS_RDS_ENDPOINT.rds.amazonaws.com";
const dbPort = 5432;
const dbName = "app_staging";
const dbSecurityGroup = "sg-########";
const dbUsername = "appstagingdbuser";
const dbPassword = {
  secretId: "appnamestagingdbMasterPasswor-######",
  jsonField: "password",
};

const app = new cdk.App();
const vpc = { vpcId };
const conventions = new Conventions(appInfo);

/*
 * Setup VPC instance
 * 
 * Two options, manually create VPC instance using the AWS Dashboard
 * or use the below code to create a VPC with max Availability zone default is set to 2
 * 
 * import { VpcStack } from "@rylabs/ry-cdk-tools/lib/stacks";
 * 
 * const vpcName = `${conventions.eqn('camel')}Vpc` 
 * const vpc = new VpcStack(app, vpcName, {} )
 * 
 * aditional params
 * const vpc = new VpcStack(app, vpcName, {maxAzs: 4} )
 * 
 * After Vpc has been created obtain the vpcId.
 * vpc.vpc.vpcId
 * 
 */

// TODO: Add tip to use ignoreHealthCheck when setting up for the first time

/*
 *  Setup an RDS database for use by the Rails application
 */
/*
const instanceClass = InstanceType.of(InstanceClass.T2, InstanceSize.MEDIUM);
const rds = new RdsStack(app, `${conventions.eqn('camel')}Rds`, {
  env,
  vpc,
  appInfo,
  instanceClass,
});
*/

// Rails
const rails = new RailsStack(app, `${conventions.eqn("camel")}`, {
  env,
  appInfo,
  vpc,
  railsEnvironment: appInfo.environment,
  solutionStackName,
  ec2InstanceTypes: [railsInstanceType.toString()],
  databaseAccess: {
    instance: {
      instanceIdentifier: dbInstanceIdentifier,
      instanceEndpointAddress: dbInstanceEndpointAddress,
      port: dbPort,
      securityGroups: [],
    },
    databaseName: dbName,
    securityGroup: dbSecurityGroup,
    username: dbUsername,
    password: dbPassword,
  },
  defaultProcess: {
    healthCheckPath: "/_healthcheck",
  },
  command: {
    ignoreHealthCheck: true,
  },
});

// Rails Pipeline
const pipelineName = `${conventions.eqn("camel")}Pipeline`;
const pipeline = new RailsPipelineStack(app, pipelineName, {
  env,
  appInfo,
  environment: rails.ebEnvironment,
  ownerName,
  repoName,
  branchName,
});
pipeline.addDependency(rails);

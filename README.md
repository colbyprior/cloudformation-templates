# Cloudformation template
Upload configuration to a S3 bucket and use `cloudformation.yml` to deploy a new cloudformation stack.

This deploys a EC2 in an autoscalling group (min 1 max 1) and uses Puppet in the user-data to setup Apache and attach an Elastic IP.

## References
Use the following references for developing new cloudformation templates.
 - [Cloudformation Reference](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
 - [AWS CLI Reference](http://docs.aws.amazon.com/cli/latest/index.html)
 - [Puppet 3.7 Reference](https://docs.puppet.com/puppet/3.7/type.html)
 - [Yaml Syntax Reference](http://docs.ansible.com/ansible/latest/YAMLSyntax.html)

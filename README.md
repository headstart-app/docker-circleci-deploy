The `Dockerfile` used to generate the Docker image which is used as `executor` in our CircleCI pipelines.

The generated image will have installed binaries required by our various CI/CD pipelines:
 - Node 12
 - AWS CLI
 - Transcrypt
 - Terraform
 - Python 3
 - httpie
 - json
 - etc.

## How it happens
When the `master` branch of this repository is updated, CircleCI will build a new Docker image from the `Dockerfile` and it will send it to the ECR in our AWS global account.

That Docker image will then be available to be used as [`executor`](https://circleci.com/docs/2.0/configuration-reference/?section=reference#executors-requires-version-21) by the CircleCI pipelines of our various projects. The ECR image tag is partially hardcoded in the configuration - only the patch number is created by using the CircleCI job number (provided by the [built-in env variable](https://circleci.com/docs/2.0/env-vars/#built-in-environment-variables)`$CIRCLE_BUILD_NUM`).

Minor and major changes should be done when we plan to maintain and update multiple version of the image. For example, we changed it from 0.1 to 0.2 when we updated Node 10 to Node 12 on this image. That allows apps on the older version of Node to continue using 0.1.X versions.

The existing images won't be overwritten and the other projects' CircleCI configurations have to be explicitly updated in order to use the new image as `executor`.

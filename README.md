# New Relic Boilerplate

This has two subparts intended to more easily install java new relic agent alongside java apps inside kubernetes

## Docker
Image to be added to a helm deploy for a java application that will add the necessary new relic agent to the applications filesystem. The image version tag will indicate the new relic agent that has been installed on this image.

Created using a base busybox image, allowing size to be small (~25 MB), and runs a simple sleep command to keep the pod alive alongside your java agent.

## Helm
This is a subchart to more easily add required details for a java application. Adds templates and basic new relic config file. 

Automatically will add a new relic config file as a configmap with app name set to global.name value of helm chart using this subchart.

Documentation of subcharts and overriding values: https://github.com/helm/helm/blob/master/docs/chart_template_guide/subcharts_and_globals.md

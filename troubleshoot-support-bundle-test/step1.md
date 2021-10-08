# Install Support-bundle

The easiest way to [install](https://troubleshoot.sh/docs/#installation) `support-bundle` is use [krew](https://krew.dev/), the kubectl plugin manager. The following script will run the krew installer and put it on the `$PATH`.

`bash /root/krew.sh`{{execute}}

With `krew` installed, the install is as easy as: `kubectl krew install support-bundle.`{{execute}}


## JUNK HERE

For this lab we will manually install the plugin using the latest binary on github. We can download and install with the following command: 

```
curl -sSL "https://github.com/replicatedhq/troubleshoot/releases/download/v0.14.0/support-bundle_linux_amd64.tar.gz" -o support-bundle.tar.gz \
  && tar zxf  support-bundle.tar.gz \
  && sudo mv support-bundle /usr/local/bin/kubectl-support-bundle
```{{execute}}

If you need to have those files created at the start of the scenario, you can define them as [assets](https://katacoda.com/scenario-examples/scenarios/upload-assets).

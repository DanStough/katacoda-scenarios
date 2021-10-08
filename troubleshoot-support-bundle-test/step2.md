Generating a support bundle requires you to specify the information you'd like to collect from the cluster that's relevant to troubleshooting your application.

To get started, let's use the MVP `support-bundle` [spec](https://troubleshoot.sh/docs/support-bundle/collecting/):


<pre class="file" data-filename="support.yaml" data-target="replace">apiVersion: troubleshoot.sh/v1beta2
kind: SupportBundle
metadata:
  name: supportbundle-tutorial
spec:
  collectors: []
  analyzers: []
</pre>

Save this as in the IDE Tab.

Now get that bundle!
`kubectl support-bundle support.yaml`{{execute}}

This generates an archive in the user's `$HOME` directory. 
We can expand this by running `tar zxf support-bundle*.tar.gz`{{execute}}.

something to open here

For a more advanced spec, you can check at the examples or [this one](https://github.com/replicatedhq/kots/blob/master/pkg/supportbundle/defaultspec/spec.yaml) used for on-premise kubernetes clusters with [KOTS](https://kots.io/).

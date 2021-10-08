Generating a support bundle requires you to specify the information you'd like to collect from the cluster that's relevant to troubleshooting your application.

To get started, let's use the MVP `support-bundle` [spec](https://troubleshoot.sh/docs/support-bundle/collecting/):

```yaml
apiVersion: troubleshoot.sh/v1beta2
kind: SupportBundle
metadata:
  name: supportbundle-tutorial
spec:
  collectors: []
  analyzers: []
```

Save this as in the editor as `support.yaml`.

Now get that bundle!
`kubectl support-bundle support.yaml`{{execute}}

This generates an ar

For a more advanced spec, you can check at the examples or [this one](https://github.com/replicatedhq/kots/blob/master/pkg/supportbundle/defaultspec/spec.yaml) used for on-premise kubernetes clusters with [KOTS](https://kots.io/).

Now let's debug an application running in production!

We've started an app in the cluster that is having some problems.
`support-bundle` will allow us to collect all the information we need to triage issues in one fell swoop.

Our application is a **Deployment** in the `trouble` **Namespace**. 
It has the following pod label: `app=trouble`. 

Let's create a custom `support-bundle` spec, `trouble-1.yaml`, that grabs the logs for this container.
We can use the [Pod Logs Collector](https://troubleshoot.sh/docs/collect/logs/) to gather this infomation

<pre class="file" data-filename="trouble-1.yaml" data-target="replace">apiVersion: troubleshoot.sh/v1beta2
kind: SupportBundle
metadata:
  name: supportbundle-tutorial
spec:
  collectors: 
  - logs:
    name: trouble app
    selector:
    - app=trouble
</pre>

Let's collect the bundle and extract it.

```bash
kubectl support-bundle trouble-1.yaml
tar zxf support-bundle*.tar.gz -C support-bundle --strip-components=1
```{{execute}}

If we review review XXX, we can see there are no replicas of this deployment running. 

In the next step will dig deeper into this mystery and see if we can shrink the diagnostic loop using **Analyzers**.

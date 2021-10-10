#!/bin/bash
rm -rf ./support-bundle*
mkdir support-bundle

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: trouble
---
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: trouble
  name: trouble
  namespace: trouble
spec:
  replicas: 2
  selector:
    matchLabels:
      app: trouble
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: trouble
    spec:
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchExpressions:
              - key: app
                operator: In
                values:
                - trouble
            topologyKey: "kubernetes.io/hostname"
      nodeSelector:
        gpu: sooper-gpu
      containers:
      - image: busybox
        name: trouble
        env:
        - name: SOOPER_SECRET
          value: cccccctteeeufbfeecdhrevfnrcbtgfcvikuhvvdllcj
        command:
        - "/bin/sh"
        - "-c"
        - "echo Starting Trouble... && echo SOOPER_SECRET:$(SOOPER_SECRET) && echo TROUBLE ENGAGED (ノ ゜Д゜)ノ ︵ ┻━┻ && sleep 3600"
EOF

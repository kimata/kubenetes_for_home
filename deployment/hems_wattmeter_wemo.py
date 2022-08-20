apiVersion: apps/v1
kind: Deployment
metadata:
  name: wattmeter-wemo
  namespace: hems
  labels:
    app: wattmeter-wemo
spec:
  replicas: 1
  selector:
    matchLabels:
      app: wattmeter-wemo
  template:
    metadata:
      labels:
        app: wattmeter-wemo
    spec:
      hostNetwork: true
      containers:
      - name: wattmeter-wemo
        image: registry.green-rabbit.net/library/wattmeter_wemo:latest
        imagePullPolicy: Always
        env:
        livenessProbe:
          exec:
            command:
              - /opt/wattmeter_wemo/src/healthz.py
          initialDelaySeconds: 120
          periodSeconds: 60
          timeoutSeconds: 1
          successThreshold: 1
          failureThreshold: 3
      dnsPolicy: Default
      nodeSelector:
        kubernetes.io/hostname: hems

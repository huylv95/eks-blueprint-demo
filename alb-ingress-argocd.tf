apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: argocd-ingress
  namespace: argocd
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/backend-protocol: HTTPS
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
    alb.ingress.kubernetes.io/tags: Environment=dev
    alb.ingress.kubernetes.io/listen-ports: '[{"HTTP": 80, "HTTPS": 443}]'
    alb.ingress.kubernetes.io/certificate-arn: arn:aws:acm:ap-southeast-1:485281474722:certificate/7061dc3a-0535-4348-be93-4dcc23619365
spec:
  rules:
    - host: argocd.example.com  # Update this with your domain
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: argo-cd-argocd-server
                port:
                  number: 443
## Get password:
#kubectl get secrets/argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d
## Trick: update /etc/hosts to access with domain
#3.0.2xxx.8 argocd.example.com
#54.151.xx.242 argocd.example.com
#3.1.223.xx  argocd.example.com
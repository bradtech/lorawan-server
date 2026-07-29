# Lorawan Server - ChirpStack v4 Infrastructure as Code (IaC) & GitOps

This repository provides full Infrastructure as Code (IaC) and GitOps manifests to deploy an open-source, standalone **ChirpStack v4** LoRaWAN Network Server stack.

---

## 🏗️ Architecture

```
[ Dragino DLOS8N Gateway ]
         │ (UDP Port 1700 - Semtech Packet Forwarder)
         ▼
[ ChirpStack Gateway Bridge ] ──► [ Mosquitto MQTT ]
                                        │
                                        ▼
                           [ ChirpStack v4 (Port 8080) ]
                            ├── PostgreSQL 14
                            ├── Redis 7
                            └── Webhook HTTP ──► [ Brad API / n8n ]
```

---

## 🚀 Deployment Modes

1. **Podman Quadlets (Edge / Local systemd)**:
   Located under [`iac/podman/`](./iac/podman/). Uses rootless systemd unit files for automatic startup and unprivileged container execution (`USER 1000:1000`).
2. **Kubernetes & ArgoCD (GitOps)**:
   Located under [`iac/k8s/`](./iac/k8s/). Includes Kustomize base manifests and [`argocd-application.yaml`](./iac/k8s/argocd/argocd-application.yaml) for automated sync on Kubernetes clusters.

---

## 📡 Dragino DLOS8N Integration

1. Log into your Dragino DLOS8N Web UI (`http://192.168.1.100`).
2. Navigate to **LoRaWAN WAN** -> **LoRaWAN Sub-Band / Server**.
3. Select **Custom / Semtech UDP Packet Forwarder**.
4. Set **Server Address** to your ChirpStack Gateway Bridge IP/hostname, and **Port** to `1700` (UDP).

---

## 📚 Documentation
- See [`HOWTO.md`](./HOWTO.md) for step-by-step deployment instructions for both Podman and ArgoCD.

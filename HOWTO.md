# HOWTO: Deploying ChirpStack v4 LoRaWAN Server (Podman & ArgoCD)

This guide provides step-by-step instructions to deploy ChirpStack v4 using Podman Quadlet or Kubernetes via ArgoCD.

---

## 1. Podman Quadlet Deployment (Rootless / Edge)

1. Copy Quadlet unit files into your systemd user configuration directory:
   ```bash
   mkdir -p ~/.config/containers/systemd/
   cp iac/podman/* ~/.config/containers/systemd/
   ```

2. Reload systemd daemon to generate container services:
   ```bash
   systemctl --user daemon-reload
   ```

3. Start ChirpStack service:
   ```bash
   systemctl --user start chirpstack.service
   ```

4. Verify service status and logs:
   ```bash
   systemctl --user status chirpstack.service
   journalctl --user -u chirpstack.service -f
   ```

---

## 2. Kubernetes Deployment via ArgoCD (GitOps)

1. Create the `lorawan` namespace in your Kubernetes cluster:
   ```bash
   kubectl create namespace lorawan
   ```

2. Apply the ArgoCD AppProject and Application manifests:
   ```bash
   kubectl apply -f iac/k8s/argocd/argocd-appproject.yaml
   kubectl apply -f iac/k8s/argocd/argocd-application.yaml
   ```

3. Verify ArgoCD sync status:
   ```bash
   argocd app get chirpstack-lorawan-server
   ```

---

## 3. Connecting the Dragino DLOS8N Gateway

1. Run the connection diagnostic script:
   ```bash
   ./bin/test-dragino-connection.sh
   ```

2. Access the ChirpStack Web UI at `http://<SERVER_IP>:8080` (Default credentials: `admin` / `admin`).

3. Navigate to **Gateways** -> **Add Gateway**:
   - **Gateway Name**: Dragino DLOS8N
   - **Gateway EUI**: Found on the back sticker of the Dragino DLOS8N.
   - **Stats Interval**: 30 seconds.

4. Verify that the Gateway status turns **Online** and heartbeats are received.

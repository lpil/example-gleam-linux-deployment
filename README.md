# conan

1. Create Wisp web app 
2. Push to GitHub
3. Add container building workflow
4. Get server ubuntu LTS
5. On server:
  1. `apt install podman`
  2. Verify podman+systemd by creating a container
      ```ini
      # /etc/containers/systemd/webapp.container

      [Container]
      Image=ghcr.io/lpil/example-gleam-linux-deployment:1.0.0-blue
      PublishPort=8000:80
      ```
  3. `systemctl reload-daemon`
  4. `systemctl status webapp`
  5. `systemctl start webapp`
  6. `systemctl status webapp`

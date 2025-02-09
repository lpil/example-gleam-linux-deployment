# conan

1. Get server
2. On server:
  1. `dnf install podman`, wait a million years.
  2. Verify podman+systemd by creating a container
      ```ini
      # /etc/containers/systemd/webapp.container

      [Container]
      Image=docker.io/caddy
      PublishPort=80:80
      ```
  3. `systemctl reload-daemon`
  4. `systemctl status webapp`
  5. `systemctl start webapp`
  6. `systemctl status webapp`
3. Create Wisp web app 
3. Push to GitHub
4. Add container building workflow

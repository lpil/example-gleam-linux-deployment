# conan

1. Create Wisp web app 
2. Push to GitHub
3. Add container building workflow
4. Get server ubuntu LTS
5. Configure DNS to point some domain at your server IP.
6. On server:
  1. `apt install podman caddy`
  2. ```ini
      # in /etc/containers/systemd/webapp.container
      [Container]
      Image=ghcr.io/lpil/example-gleam-linux-deployment:1.0.0-blue
      PublishPort=8000:8000
      ```
  3. `systemctl reload-daemon`
  4. `systemctl status webapp`
  5. `systemctl start webapp`
  6. `systemctl status webapp`
  7. ```toml
    YOUR_DOMAIN_NAME_HERE {
            reverse_proxy localhost:8000
    }
     ```
  8. `systemctl restart caddy`

## Tips & tricks

If you want to run podman containers without a reverse proxy on the host
then you need to `ufw default allow FORWARD`.

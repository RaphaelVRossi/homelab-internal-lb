# Homelab Internal Load Balancer

Centralize access to applications on your home server by using a load balancer.
Instead of typing its IP address and port for the service (e.g., pihole,
vaultwarden) you can use a simpler hostname such as `pihole.casa` or
`vault.casa` without having to remember which ports those services use.

To run locally:
```bash
make run
```

See other commands with:
```bash
make help
```

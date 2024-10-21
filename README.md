# Docker environment variable precedence

According these docker [docs](https://docs.docker.com/compose/how-tos/environment-variables/envvars-precedence/):

1. Set using `docker compose run -e` in the CLI.
2. Set with either the environment or `env_file` attribute but with the value interpolated from your shell or an environment file. (either your default `.env` file, or with the `--env-file` argument in the CLI).
3. Set using just the environment attribute in the Compose file.
4. Use of the `env_file` attribute in the Compose file.
5. Set in a container image in the `ENV` directive. Having any `ARG` or `ENV` setting in a Dockerfile evaluates only if there is no Docker Compose entry for environment, `env_file` or run `--env`.

## testing

run these commands to see the precedence in action:

```bash
docker compose run --rm -e C="From CLI" app
```

```bash
# A=From Dockerfile
# B=From Dockerfile
# C=From CLI
# D="From docker-compose environment"
# E=From .env_file
```

```bash
docker compose run --rm -e C="From CLI" --env B app
```

```bash
# A=From Dockerfile
# B=From .env (shell interpolation)
# C=From CLI
# D="From docker-compose environment"
# E=From .env_file
```

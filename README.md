# nginx-static

Dead simple docker container to serve a directory of files over http. Configure it via environment settings

| Setting | Description |
| --- | --- |
| `STATIC_ROOT` | Directory inside the container to server. Defaults to `/var/www` |
| `STATIC_URL` | URL that nginx will serve the directory as. Default to `/` |

## Example

    docker run -ti --rm -e STATIC_URL="/static/" -v `pwd\`:/var/www -p 8010:80 nginx-static

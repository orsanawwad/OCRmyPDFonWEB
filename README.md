# OCRmyPDFonWEB

Streamlit Web UI for OCRmyPDF. Its codebase is tiny, so if you want to modify it, it should be straightforward. It is also stateless, making it easy to deploy. No volumes. No configuration.

This fork adds support for passing multiple languages to OCRmyPDF API call, make sure to build a new image to enable multi language usage (see Develop section)

![screenshot](screenshot.png "Screenshot")

## Requirements

* docker

## Usage

```
docker run --rm -p 127.0.0.1:8501:8501 razemio/ocrmypdfonweb
```

Or with compose

```
version: "3.9"
services:
  ocrmypdfonweb:
    container_name: ocrmypdfonweb
    restart: unless-stopped
    image: razemio/ocrmypdfonweb
    ports:
      - "8501:8501"
```

Open http://localhost:8501

## Develop

```
docker build -t razemio/ocrmypdfonweb:dev . # Only needed after you changed requirements.txt
docker run --rm -it -p 127.0.0.1:8501:8501 -v ${PWD}/server.py:/app/server.py razemio/ocrmypdfonweb:dev
```

With compose

```
version: "3.9"
services:
  ocrmypdfonweb:
    container_name: ocrmypdfonweb
    restart: unless-stopped
    build:
      context: .
    ports:
      - "8501:8501"
```

Happy coding :)

## FAQ

### Why?

To keep your non-tech significant other happy. The terminal can be a dark place for some people.

### Why do you use OCRmyPDF version 12.7.2?
It is the last version which supports remove background. Which is somewhat impossible to find in normal PDF editors. Otherwise, OCRmyPDF works flawlessly, and I yet haven't found an issue which makes me want to upgrade.

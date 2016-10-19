kraken-docker
=============

Docker container for the [kraken OCR engine](https://github.com/mittagessen/kraken).

## Usage

Basically, replace `kraken` in every call with `docker run --rm -it kbai/kraken`, e.g.

`kraken --help` -> `docker run -it kbai/kraken --help`

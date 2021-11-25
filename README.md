# nomad-spk-dsm7

Build Synology DSM7-compatible SPK install package for Hashicorp's Nomad

## Usage

To download the nomad release binary and build the Synology SPK:
```
./build.sh
```

The `config.sh` file contains configuration vars that define things like the
nomad version to download. Update as needed.

## TODOs

* Make the `start-stop-status` script actually do something useful so you can
  start/stop the service using the DSM UI.

* Figure out how to correctly setup symlinks for installed binaries in DSM7.

* Include sample server/client configuration that meets common needs?

* Improve the initial install / upgrade process, or at a minimum document what
  you need to do to get it running.

* Better handle architectures other than amd64/x86_64. The SPK INFO file
  generated currently hard-codes the package architecture as noarch because the
  Synology developer docs leave something to be desired there.

## Inspiration

* https://github.com/numkem/nomad-spk - Build scripts and config for generating
  a DSM6-compatible SPK archive for Nomad

* https://github.com/prabirshrestha/synology-package-template - very minimal
  set of scripts for generating a DSM7-compatible SPK install archive

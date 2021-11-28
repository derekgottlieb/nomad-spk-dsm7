# nomad-spk-dsm7

Build Synology DSM7-compatible SPK install package for Hashicorp's Nomad

## Usage

Release artifacts are available at
https://github.com/derekgottlieb/nomad-spk-dsm7/releases. Download the
appropriate architecture and either install via the Synology DSM UI or copy the
file to the Synology and install by logging in via ssh and running `sudo
synopkg install /path/to/nomad.spk`.

On first install, a sample nomad config will be copied to
`/var/packages/nomad/etc/nomad.conf` that should work if you want to run a
single all-in-one setup with both a nomad server and client running on the
Synology. Edit this file to suit your needs (e.g., server clustering, integrate
with consul, etc). It should be preserved when upgrading by installing newer
versions of the SPK package.

Starting/stopping the nomad service via the DSM UI isn't working quite yet, so
you'll need to log in via ssh and run `sudo synosystemctl start pkg-nomad` to
start it.

### Build

To download the nomad release binary and build the Synology SPK for amd64, arm, and arm64:
```
./build.sh
```

To only download and build the Synology SPK for a single architecture:
```
./build.sh amd64
```

The `config.sh` file contains configuration vars that define things like the
nomad version to download. Update as needed.

## TODOs

* Make the `start-stop-status` script actually do something useful so you can
  start/stop the service using the DSM UI.

* Figure out how to correctly setup symlinks for installed binaries in DSM7.

* The SPK INFO file generated currently hard-codes the package architecture as
  noarch because the Synology developer docs leave something to be desired
  there (relevant appendix appears to be missing in their developer docs).

## Inspiration

* https://github.com/numkem/nomad-spk - Build scripts and config for generating
  a DSM6-compatible SPK archive for Nomad

* https://github.com/prabirshrestha/synology-package-template - very minimal
  set of scripts for generating a DSM7-compatible SPK install archive

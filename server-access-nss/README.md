# libnss_flantauth

A library to store users in a sqlite db.

## Build

```bash
./build.sh
```

#### build and install into /lib/x86_64-linux-gnu/

```bash
./build.sh install
```

You can change a database path using env variable `NSS_FLANTAUTH_PASSWD_PATH`:

```bash
export NSS_FLANTAUTH_PASSWD_PATH=/etc/my/sql.db
```


## Installation

Put libnss_flantauth.so.2 into `/lib/x86_64-linux-gnu` or `/usr/lib64` and add `flantauth` service to `passwd`, `group` and `shadow` databases in nsswitch.conf:

```
passwd:   files flantauth
group:    files flantauth
shadow:   files flantauth
```

## Example

This repository has `example` folder with simple database and a script:

```
cd example
./run.sh
```

`run.sh` will build libnss_flantauth.so.2 in `out` directory and run different versions of Debian and Ubuntu to test against users.db file.


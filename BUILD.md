# Building ircDDBGateway

## Windows
Deleting this section - if you need Windows support, get original.

## Linux

You need to ensure that wxGTK is already installed on your machine.

Debian, Ubuntu(prior to 20.04):
```sh
sudo apt-get install build-essential git libwxgtk3.0-gtk3-dev libwxgtk3.0-dev
```

Ubuntu 20.04
```sh
sudo apt-get install build-essential git libwxgtk3.0-gtk3-dev

```

To install them from scratch, you need wxGTK, on Ubuntu you can install it with
apt-get (see above) or you can go to the source site. <http://www.wxwidgets.org>. 
If you do a "make install" the binaries all go to the right places, but you still
need to 'setup' somethings. Run the setup-irdddb.sh script in the LinuxSetup 
directory. 

(NOTE: I never tried to remove all the GUI bits, sorry to install a bunch
of un-needed libraries on your linux box.)

To actually build the software, type "make" in the same directory as this file
and all should build without errors, there may be a warning or two though. Once
compiled log in as root or use the sudo command, and do "make install".

You can optionally specify some make variables to alter the default behavior:

| Parameter | Default   | Description                       |
| --------- | --------- | --------------------------------- |
| BUILD     | `debug`   | `debug` or `release`              |
| TARGET    | _not set_ | when set to `opendv`, installs files in legacy locations |
| DATADIR   | `/usr/share/ircddbgateway` | where AMBE voice and host lists are kept |
| LOGDIR    | `/var/log` | location of log files            |
| CONFDIR   | `/etc`     | location of configuration files  |
| BINDIR    | `/usr/bin` | program binaries installed here  |
| DESTDIR   | _not set_  | destination for staged build     |

### Example

```sh
cd ircDDBGateway
make -j4 BUILD=release CONFDIR=/etc/opendv DATADIR=/usr/share/opendv LOGDIR=/var/log/opendv BINDIR=/usr/bin
sudo make install
```

This would build and install all the programs in this repo using 4 threads
(parallel build jobs), in release mode (no debug symbols) with a modified
logging to /var/log/opendv.

### Install Linux Config Files
```sh
In the LinuxSetup folder, there is a script I wrote to 'setup' the other files/system things
to make ircddbgateway run as a daemon on an Ubuntu host. This includes creating the opendv user,
setting up the log directory and logrotate, plus adding the systemd configuration file.

There is also a directory (share) full of audio files needed for voice annoucements which goes
into /usr/share/opendv. This directory also has the hostnames for the various reflectors on the 
DPLUS, CCS, DCS and DExtra networks. (sorry, they are all pretty old, please let me know if you
have more current ones) 
```


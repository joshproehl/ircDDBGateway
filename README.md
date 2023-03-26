This is the ircDDB Gateway. It allows a D-Star Repeater to interface into callsign routing via ircDDB and all of the different reflector types. It includes many facilities, including:

* Supports Icom stacks.
* Supports homebrew repeaters.
* Icom DD mode under Linux with Internet access.
* Callsign routing via ircDDB.
* D-Plus REF reflectors.
* DExtra XRF reflectors.
* DCS reflectors.
* XLX reflectors.
* CCS7 routing.
* D-RATS data transfers.
* Gateway DPRS data to APRS-IS.
* Full multi lingual text and voice announcements.
* DTMF or UR call control.
* Remote control interface.
* StarNet server.
* Ability to set policies for reflector usage.

There are many external programs that allow for inserting voice or text messages, as well as remote control operation.

While the original versions all built on Windows using Visual Studio 2017 on x86 and x64, this version has been 
modified to work like 'normal' Linux apps and is unlikely to still build on Windows. I wanted the logs to be
writen to /var/log like normal Linux apps and made several changes so they go to /var/log/opendv. I have tested 
it on 64-bit Linux and assume it would still build and work on 32-bit. I have no idea if the GUI programs still 
work, as I don't use them.

I recommend starting with the default ircddbgateway configuration file that John Hays - K7VE wrote and published.
(Original source can be grabbed by: 

sudo curl -L -s -o /etc/opendv/ircddbgateway https://raw.githubusercontent.com/nwdigitalradio/udrc-tools/master/udrc-setup/ircddbgateway

After editing the file to suit your setup, save it to /etc/opendv/ircddbgateway

Assuming the build worked, you can start it using: $ sudo systemctl start ircddbgatewayd
and tail the logs with $ sudo tail -f /var/log/opendv/ircddgatewayd.log

de KU7M

[GPL 3.0](https://www.gnu.org/licenses/gpl-3.0.html)

# Build and installing
## Regular build
```shell
make -j4 BUILD=release CONFDIR=/etc/opendv DATADIR=/usr/share/opendv LOGDIR=/var/log/opendv BINDIR=/usr/bin
sudo make install
```
Now you should edit the configuration in the file /etc/ircddbgateway to match your needs.
```shell
sudo systemctl enable ircddbgatewayd.service #enable service
sudo service ircddbgatewayd start
```

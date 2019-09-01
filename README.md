# nas_btrfs_stats
Simple script to create a sensor for PRTG by Paessler which uses the output of ***btrfs dev stats*** to show the health of your Btrfs volume.

Sensor tested on DS 918+

### Prerequisites

Be sure you have set correct logon values for SSH in your device.

I personally use "Login via private key" with an user especially for monitoring which also may use sudo for this script without a password.

![Screenshot1](https://github.com/WAdama/nas_btrfs_stats/blob/master/images/ssh_settings.png)

**HINT:** Since DSM 6.2.2 for SSH access the user has to be member of the local Administrators group on your Synology NAS.

### Installing

Place the script to /var/prtg/scriptsxml on your Synology NAS and make it executable. (You may have to create this directory structure because PRTG expects the script here.)

```
wget https://raw.githubusercontent.com/WAdama/nas_btrfs_stats/master/nas_btrfs_stats.sh

chmod +x nas_ab_status.sh
```

On your PRTG system place the file prtg.standardlookups.nas.btrfsstats.ovl in *INSTALLDIR\PRTG Network Monitor\lookups\custom* and refresh it under **System Administration / Administrative Tools**

In PRTG create under your device which represents your Synology a SSH custom advanced senor.

Choose under "Script" this script and enter under "Parameters" the name of the volume you want to monitor: e.g. volume1.

![Screenshot1](https://github.com/WAdama/nas_btrfs_stats/blob/master/images/nas_btrfs_stats.png)

This sensor will go to warning if one or more value show one or more errors.

![Screenshot1](https://github.com/WAdama/nas_btrfs_stats/blob/master/images/nas_btrfs_stats_sensor.png)

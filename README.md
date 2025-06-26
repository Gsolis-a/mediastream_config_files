# MediaStream Technical Test

This repository contains the configurations and scripts created for the MediaStream technical test.

## Implementation Summary:
- Created RAID0 array mounted at /mediastream
- Configured Nginx with two sites (public and localhost-only)
- Set up ProFTPD with appropriate security settings
- Installed MongoDB 4.x with daily backups
- Created data collection scripts and processed logs as required

Note: Configuration files have been sanitized to remove sensitive information.

and wy im configurating nginx to manage the access only from the localhost its because:
	1 the restrictions is only where i need it ( application lvl)
	2 its simplier than a ip tables firewall rule
	3 if i made a mistake confif in the nginx, only the nginx service will be afected instead if i doit on the ip tables it maybe affect all the system
	4 easy to maintain
	5 avoid overhead in packet procesing at the kernel lvl

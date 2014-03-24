check_gluster_status
=======

This check is intended for nagios / nrpe.
For nrpe, edit ``nrpe.cfg`` and define like so:  
**command[check_gluster_status]=sudo /usr/lib/nagios/plugins/check_gluster_status**  
run ``visudo`` and add:  
**nrpe    ALL=(ALL) NOPASSWD: /usr/lib64/nagios/plugins/check_gluster_status**  


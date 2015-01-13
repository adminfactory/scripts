check_tcp_conn
=======
This check is intended for nagios / nrpe.  
For nrpe, edit ``nrpe.cfg`` and define like so:  
**command[check_tcp_conn]=/usr/lib/nagios/plugins/check_tcp_conn**  

OK if connections < 1000
Warning if connections > 1000
Critical if connections > 1500

Obviously, these should be changed according to your own needs.

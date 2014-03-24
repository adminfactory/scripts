check_galera
=======

This check is intended for nagios / nrpe. Available arguments are: ``status``, ``wsrep_connected``, ``wsrep_ready``
For nrpe, edit ``nrpe.cfg`` and define like so:  
**command[check_galera_status]=/usr/lib/nagios/plugins/check_galera status**  
**command[check_galera_wsrep_rdy]=/usr/lib/nagios/plugins/check_galera wsrep_connected**  
**command[check_galera_wsrep_conn]=/usr/lib/nagios/plugins/check_galera wsrep_ready**  

The following variables should be customized:  
``$user``  
``$host``  
``$port``  
``$pass``  
or simply change the ``$COM`` command.  

check_redis
=======
Based on check_mysql_slave.  
No alerting, only meant to show status.  
This check is intended for nagios / nrpe. Available arguments are: ``role``, ``keys``
For nrpe, edit `nrpe.cfg` and define like so:  
**command[check_redis_role]=/usr/lib/nagios/plugins/check_redis role**
**ommand[check_redis_keys]=/usr/lib/nagios/plugins/check_redis keys**

The following variables should be customized:  
``$host``  
``$port``  
``$pass``  
or simply change the ``$COM`` command.  

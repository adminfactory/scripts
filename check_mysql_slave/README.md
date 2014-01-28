check_mysql_slave
=======
This check is intended for nagios / nrpe. Available arguments are: ``seconds``, ``io_running``, ``sql_running``.  
For nrpe, edit ``nrpe.cfg`` and define like so:  
**command[check_slave_seconds]=/usr/lib/nagios/plugins/check_mysql_slave seconds**  
**command[check_slave_io]=/usr/lib/nagios/plugins/check_mysql_slave io_running**  
**command[check_slave_running]=/usr/lib/nagios/plugins/check_mysql_slave sql_running**    

The following variables should be customized:  
``$user``  
``$host``  
``$port``  
``$pass``  
or simply change the ``$COM`` command.  

The ``seconds`` trigger sends a CRITICAL status if *Seconds_Behind_Master* is greater than 100000 seconds and a WARNING status if *Seconds_Behind_Master* is greater than 0.  

Obviously, these should be changed according to your own needs.

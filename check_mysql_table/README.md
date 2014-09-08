check_mysql_table
=======

This check is intended for nagios / nrpe. It warns if MySQL has crashed tables on the monitored database.  
Available arguments are: ``status [db_name]``  
For nrpe, edit nrpe.cfg and define like so:  
**command[check_mysql_table]=/usr/lib/nagios/plugins/check_table status [db_name]**  

The following variables should be customized:  
``$user``  
``$host``  
``$port``  
``$pass``

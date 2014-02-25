#!/bin/bash

#password ?
OPTS="-p`cat /path/to/passfile`"

w|grep load

        MSQLADM="mysqladmin $OPTS status"

echo "Uptime: `$MSQLADM|awk {'print $2'}` secs = ~$((`$MSQLADM|awk {'print $2'}` / 60 / 60)) hours, Total Queries: `mysql $OPTS -e "show global status"|grep Queries|awk {'print $2'}`", Queries/s avg: `$MSQLADM|awk {'print $22'}`, Slow queries: `$MSQLADM|awk {'print $9'}`
echo

        QC="`mysql $OPTS -e "show global status;"|grep -v Variable`"
        QCV="`mysql $OPTS -e "show global variables;"|grep -v Variable`"

echo Query Cache Type: `echo "$QCV"|grep query_cache_type|awk {'print $2'}`
echo Query Cache Size: `echo "$QCV"|grep query_cache_size|awk {'print $2'}` bytes
echo `echo "$QC"|grep Qcache_free_memory` bytes
echo Query Cache Limit: `echo "$QCV"|grep query_cache_limit|awk {'print $2'}` bytes

echo Minimum Cacheable Result: `echo "$QCV"|grep query_cache_min_res_unit|awk {'print $2'}` bytes
echo `echo "$QC"|grep Qcache_free_blocks`
echo `echo "$QC"|grep Qcache_lowmem_prunes`
echo `echo "$QC"|grep Qcache_total_blocks`
echo `echo "$QC"|grep Qcache_queries_in_cache`

echo `echo "$QC"|grep Qcache_not_cached`
echo `echo "$QC"|grep Qcache_inserts`
echo `echo "$QC"|grep Qcache_hits`
echo
echo `echo "$QCV"|grep thread_cache_size`
echo `echo "$QC"|grep Threads_cached`
echo `echo "$QC"|grep Threads_created`
echo
echo `echo "$QCV"|grep join_buffer_size|grep -v optimizer_switch`
echo `echo "$QCV"|grep sort_buffer_size|grep -v myisam_sort_buffer_size|grep -v optimizer_switch|grep -v aria_sort_buffer_size`
echo `echo "$QCV"|grep myisam_sort_buffer_size`
echo `echo "$QCV"|grep read_buffer_size`
echo `echo "$QCV"|grep read_rnd_buffer_size`

echo `echo "$QCV"|grep tmp_table_size`
echo `echo "$QCV"|grep max_heap_table_size`
echo `echo "$QC"|grep Created_tmp_tables`
echo `echo "$QC"|grep Created_tmp_disk_tables`
echo
###########

###########
echo    key_read

echo `echo "$QCV"|grep key_buffer_size`

        KREQ="`mysql $OPTS -e "show global status like '%key_read%';"|grep read_requests|awk {'print $2'}`"
        KR="`mysql $OPTS -e "show global status like '%key_read%';"|grep reads|awk {'print $2'}`"

echo Key_read_requests $KREQ
echo Key_reads $KR
echo key_reads / key_read_requests ratio: `echo "($KREQ / $KR)"|bc`:1
echo efficiency: `echo "(1-$KR / $KREQ) * 100"|bc -l`%

echo
###########

###########
echo `echo "$QCV"|grep table_open_cache`
echo "`mysql $OPTS -e "show global status like 'open%tables%';"|grep -v "Variable_name"`"
###########

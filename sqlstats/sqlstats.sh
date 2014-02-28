#!/bin/bash

#password ?
OPTS="-p`cat /path/to/passfile`"

w|grep load

        MSQLADM="mysqladmin $OPTS status"

echo "Uptime: `$MSQLADM|awk {'print $2'}` secs = ~$((`$MSQLADM|awk {'print $2'}` / 60 / 60)) hours, Total Queries: `mysql $OPTS -e "show global status"|grep Queries|awk {'print $2'}`", Queries/s avg: `$MSQLADM|awk {'print $22'}`, Slow queries: `$MSQLADM|awk {'print $9'}`
echo

        QC="`mysql $OPTS -e "show global status"|grep -v Variable`"
        QCV="`mysql $OPTS -e "show global variables"|grep -v Variable`"

echo Query Cache Type: `echo "$QCV"|grep query_cache_type|awk {'print $2'}`
echo -ne Query Cache Size: `echo "$QCV"|grep query_cache_size|awk {'print $2'}` bytes \\t
echo `echo "$QC"|grep Qcache_free_memory` bytes
echo -ne Minimum Cacheable Result: `echo "$QCV"|grep query_cache_min_res_unit|awk {'print $2'}` bytes \\t
echo Query Cache Limit: `echo "$QCV"|grep query_cache_limit|awk {'print $2'}` bytes

echo `echo "$QC"|grep Qcache_free_blocks`
echo `echo "$QC"|grep Qcache_lowmem_prunes`
echo `echo "$QC"|grep Qcache_total_blocks`
echo `echo "$QC"|grep Qcache_queries_in_cache`

echo `echo "$QC"|grep Qcache_not_cached`
echo `echo "$QC"|grep Qcache_inserts`
echo `echo "$QC"|grep Qcache_hits`
echo
echo -ne `echo "$QCV"|grep thread_cache_size` \ \ 
echo -ne `echo "$QC"|grep Threads_cached` \ \ 
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
echo `echo "$QCV"|grep key_buffer_size`

        KREQ="`echo "$QC"|grep Key_read_requests|awk {'print $2'}`"
        KR="`echo "$QC"|grep Key_reads|awk {'print $2'}`"
        KRU="`echo "$QC"|grep Key_blocks_used|awk {'print $2'}`"
        KRF="`echo "$QC"|grep Key_blocks_unused|awk {'print $2'}`"

echo -ne Key Used Memory: `echo "$KRU * $(echo "$QCV"|grep key_cache_block_size|awk {'print $2'})"|bc` \ \ 
echo Key Free Memory: `echo "$KRF * $(echo "$QCV"|grep key_cache_block_size|awk {'print $2'})"|bc`
echo -ne Key_read_requests $KREQ \ 
echo Key_reads $KR
echo -ne key_reads / key_read_requests ratio: `echo "($KREQ / $KR)"|bc`:1,\ 
echo efficiency: `echo "(1-$KR / $KREQ) * 100"|bc -l`%

echo
###########

###########
echo -ne `echo "$QCV"|egrep "(table_cache)|(table_open_cache)"` \\t
echo -ne "`echo "$QC"|grep Open_tables`" \\t
echo "`echo "$QC"|grep Opened_tables`"

echo -ne `echo "$QCV"|grep open_files_limit` \\t
echo "`echo "$QC"|grep Open_files`"


###########

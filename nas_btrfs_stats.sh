#!/bin/bash
# Version 1.0
VOL=$1

ERRTOTAL=0
while read line ; do
IFS="." read DEVICE ERRMESSAGE <<< `echo $line | awk '{ print $1 }'`
ERRCOUNT=`echo $line | awk '{ print $2 }'`
eval $ERRMESSAGE=$ERRCOUNT
ERRTOTAL=$((ERRTOTAL + ERRCOUNT))
done <<<"$(btrfs dev stats /$VOL)"
if [ $ERRTOTAL == 0 ]
then STATUS=0
else STATUS=1
fi

echo "<?xml version=\"10.0\" encoding=\"UTF-8\" ?><prtg>
<result><channel>Status</channel><value>$STATUS</value><ShowChart>0</ShowChart><ValueLookup>prtg.standardlookups.nas.btrfsstats</ValueLookup></result>
<result><channel>Write IO Errors</channel><value>$write_io_errs</value><unit>Count</unit></result>
<result><channel>Read IO Errors</channel><value>$read_io_errs</value><unit>Count</unit></result>
<result><channel>Flush IO Errors</channel><value>$flush_io_errs</value><unit>Count</unit></result>
<result><channel>Corruption Errors</channel><value>$corruption_errs</value><unit>Count</unit></result>
<result><channel>Generation Errors</channel><value>$generation_errs</value><unit>Count</unit></result>
<text>Volume: $VOL</text></prtg>"
exit
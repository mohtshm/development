for %G in (D:\Mohtisham\Data\2014\changes\November\contenttable\*.sql) do sqlcmd /S 192.168.100.6 /d bhomesupdated -U Bhomes_Select -P Bhomes_Select123  -i"%G"
pause
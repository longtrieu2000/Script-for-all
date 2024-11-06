#mở crontab config 
crontab -e 
    
    0 3 * * * /path/to/your sh #chạy script vào lúc 3h AM

    05 00 * * * /bin/bash /home/vt_admin/backup-data/backup_script.sh >> /home/vt_admin/backup-data/backup.log

    * * * * * cd /opt/sd_agent;./sd_agent_monitor.sh

    */5 * * * * /u01/deployments/mysafe_log.sh

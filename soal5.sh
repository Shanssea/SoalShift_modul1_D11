 
awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog | awk 'NF < 13' >> /home/sea/Documents/Sisop/Modul_1/soal5.log

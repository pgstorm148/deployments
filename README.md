# Deployment Scripts overview
Scripts to help check the deployment and use for deployment automations
1. Verify That the Deployment Was Successful
After deploying an application, the first step is to verify that it's running correctly. This script checks if a given service (e.g., Nginx) is active.
Script: check_service_status.sh
- systemctl is-active --quiet $SERVICE checks if the service is running.
- If it’s not, it attempts to restart it.

2. Clear Old Log Files
Log files accumulate over time and can consume disk space. This script deletes logs older than 7 days.
Script: clear_old_logs.sh
- find $LOG_DIR -type f -name "*.log" -mtime +7 finds logs older than 7 days.
- -exec rm -f {} deletes them.

3. Perform a Database Health Check
Ensure that the database is responsive post-deployment.
Script: db_health_check.sh
- mysqladmin ping checks if the database is online.
- If it’s down, an alert is displayed.

4. Restart Services Based on Logs
Detect errors in logs and restart services if necessary.
Script: restart_on_error.sh
- grep -qi "fatal error" $LOG_FILE checks for critical errors.
- If found, it restarts the application.

5. Run a Post-Deployment Smoke Test
A smoke test ensures that the application is working correctly.
Script: smoke_test.sh
- curl --silent --fail $URL makes a request to the application.
- If the request fails, an alert is triggered.

6. Sync Configuration Files Across Servers
Double checks that all servers have the latest configuration.
Script: sync_config.sh
- rsync -avz copies configuration files to remote servers.

7. Generate SSL Certificate Expiry Alerts
Monitor SSL certificate expiration and send alerts.
Script: check_ssl_expiry.sh
- Extracts SSL certificate expiration date and alerts if less than 30 days remain.

8. Archive and Backup Deployment Files
Backup to prevent data loss.
Script: backup_deployment.sh
- Creates a timestamped tarball of deployment files.

9. Check System Resource Utilization
Monitor CPU, memory, and disk usage.
Script: check_resources.sh
- Displays real-time CPU, memory, and disk usage.

10. Restart a Service if CPU Usage Is Too High
Auto-restart services if CPU usage exceeds 90%.
Script: cpu_monitor.sh
- Uses top to check CPU usage and restarts the service if it’s too high.

11. Auto-Scale Application Based on Load
Dynamically scale up instances when traffic is high.
Script: auto_scale.sh
- Monitors system load and scales up instances accordingly.

12. Notify Team of Deployment Completion
Send an email or Slack notification after deployment.
Script: notify_team.sh
- Sends an email notification when the deployment finishes.

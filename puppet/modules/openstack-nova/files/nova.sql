CREATE DATABASE IF NOT EXISTS nova;
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'%' IDENTIFIED BY 'nova';
FLUSH PRIVILEGES;

HumHub - Social Network Kit
===========================

[![Build Status](https://travis-ci.org/humhub/humhub.svg?branch=master)](https://travis-ci.org/humhub/humhub)
[![Yii2](https://img.shields.io/badge/Powered_by-Yii_Framework-green.svg?style=flat)](http://www.yiiframework.com/)

HumHub is a feature rich and highly flexible OpenSource Social Network Kit written in PHP.

It's perfect for individual:
- Social Intranets
- Enterprise Social Networks
- Private Social Networks

More information:
- [Homepage & Demo](http://www.humhub.org)
- [Documentation & Class Reference](http://docs.humhub.org)
- [Licence](http://www.humhub.org/licences)

# OnTimeSocial

Follow the following steps to install OnTimeSocial, a HumHub-based Social Portal designed for providing assistance to remote instructors in creating, managing and tracking VR sessions. The portal was designed with the usecase of vSocial, a VR Learning environment for children with Autism.

# This portal is installed in command line

1. Install Lamp Server
    sudo apt-get install lamp-server^
# Save the 'root' password as 'admin'

2. Install the various php libraries that HumHub requires. 
    sudo apt-get install php-zip php-gd php-intl php-curl php-mbstring
    
3. MySQL Database settings
    mysql -u root -p (password: admin)
    create database humhub;
    create user 'humhub'@'localhost' identified by '123456';
    grant all on humhub.* to 'humhub'@'localhost' identified by '123456';
    flush privileges;
    exit;
# It is important to remember the 'humhub' user's password as it is later used to setup the portal on the User Interface

4. Git Clone our customized web portal
    cd /var/www/html/
    sudo git clone https://github.com/sainuguri/HumHub-vSocial.git
    sudo mv HumHub-vSocial humhub
    cd humhub
    mysql -u root -p humhub<Dump.sql

5. Restart Apache2
sudo systemctl restart apache2

# Configured settings:  
# Hostname: localhost
# MySQL username: humhub
# MySQL password: 123456
# Database: humhub

# Login details:
username: saisn.67
password: 123456

# Go to the web browser and open "your-ip-address/humhub" and login with the above details (you can create or update username/password). Our customization which mainly includes: 
- Rewards page: To keep track of the progress of each student during a session
- Session Tracking: Allows the instructor to create a session, invite students and allows the instructor to set the rewards of each student and to monitor the EEG-converted-to-emotions levels of each student during the session.


# We are working on "Automating" this process using Docker containers.

Thank you for coming to this project and in case of any issues, comments or suggestions, please contact Sai Nuguri at saisn.67@gmail.com or Dr. Prasad Calyam at calyamp@missouri.edu.



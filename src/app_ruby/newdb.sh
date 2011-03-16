#!/bin/sh
mysql -h localhost -u root -p <db/create.sql
rake db:migrate


#!/bin/bash

echo "Migrating database"
python manage.py migrate --noinput
#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Created on Mon Jan  2 23:22:16 2017

@author: Quanyin Tang
"""
# Filename: backup_ver1.py
import os
import time
source = ['E:\\2','E:\\1']
target_dir = 'E:\\Backup'
today = target_dir + os.sep + time.strftime('%Y%m%d')
now = time.strftime('%H%M%S')
comment = input('Enter a comment-->')
if len(comment) == 0:
    target = today + os.sep + now + '.zip'
else:
    target = today +os.sep +now + '_' + comment.replace(' ','_') + '.zip'

if not os.path.exists(today):
    os.mkdir(today)
    print('Success ', today)

zip_command = "zip -qr {0} {1}".format(target, ' '.join(source))
print(zip_command)
if os.system(zip_command) == 0:
    print('Successful ', target)
else:
    print('Failed')
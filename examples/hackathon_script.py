import pymysql
import pandas.io.sql as sql
import pandas as pd
import numpy as np
import re
from matplotlib import pyplot as plt
import seaborn as sns

cnxn = pymysql.connect(host='health-db-internet.c6clocfz5zxy.us-east-1.rds.amazonaws.com',
                       port=3306,
                       user='data_hacker',
                       passwd='hack_pw')

wmt_data = pd.DataFrame()

sql_command = \
'select distinct(d.Recipient_State), '\
    'avg(d.Total_Amount_of_Payment_USDollars) '\
    'from CMS_open_payments_2014.general_payment_data d '\
    'where d.Physician_Specialty like \'{}\' '\
        'group by d.Physician_Specialty, d.Recipient_State;'.format('%Allopathic%')

print 'starting call to sql'
df = sql.read_sql(sql_command, cnxn)
print '\nfinished processing ask\n'




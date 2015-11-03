# This code gives an example of how to use pandas to read
# one of the datasets into a dataframe

import pymysql
import pandas.io.sql as sql
import pandas as pd

# first connect to the database
cnxn = pymysql.connect(host='health-db-internet.c6clocfz5zxy.us-east-1.rds.amazonaws.com',
                       port=3306,
                       user='data_hacker',
                       passwd='hack_pw')

# For example, let's figure out how much each state paid in 2014 for Allopathic care
sql_command = \
'select distinct(d.Recipient_State), '\
    'avg(d.Total_Amount_of_Payment_USDollars) '\
    'from CMS_open_payments_2013.general_payment_data d '\
    'where d.Physician_Specialty like \'{}\' '\
        'group by d.Physician_Specialty, d.Recipient_State;'.format('%Allopathic%')

# This one line does it all!
print 'starting call to sql'
df = sql.read_sql(sql_command, cnxn)
print '\nfinished processing ask\n'

# now do your favorite pandas stuff..


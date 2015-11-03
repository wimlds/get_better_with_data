#Install RMySQL - this works on Macs
#install.packages("RMySQL")

# For Windows: http://biostat.mc.vanderbilt.edu/wiki/Main/RMySQL 

library("RMySQL")


# Connect to the database
conn_cms <- dbConnect(MySQL(),user="data_hacker", 
                    host="health-db-internet.c6clocfz5zxy.us-east-1.rds.amazonaws.com", 
                    password='hack_pw',
                    port=3306)

# For example, let's figure out how much each state paid in 2014 for Allopathic care
result <- dbGetQuery(conn_cms,"select distinct(d.Recipient_State),
avg(d.Total_Amount_of_Payment_USDollars)
from CMS_open_payments_2013.general_payment_data d
where d.Physician_Specialty like '%Allopathic%' 
group by d.Physician_Specialty, d.Recipient_State;"); 

# Make sure you close your connection to the database. 
#You will need to connect again if you want to run another query. 
dbDisconnect(conn_cms);


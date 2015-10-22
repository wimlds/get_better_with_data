# Medicare Provider Utilization and Payment Data
rm -r download-data/Medicare-provider-util-payment-data
mkdir download-data/Medicare-provider-util-payment-data
cd download-data/Medicare-provider-util-payment-data

# Detailed Data - Tab Delimited Format
wget http://download.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Downloads/Medicare_Provider_Util_Payment_PUF_CY2013.zip
unzip Medicare_Provider_Util_Payment_PUF_CY2013.zip -d tab-delimited
rm Medicare_Provider_Util_Payment_PUF_CY2013.zip

# Summary Tables
wget http://download.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Downloads/Medicare_Physician_and_Other_Supplier_NPI_Aggregate_CY2013.zip
wget http://download.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Downloads/Medicare_National_HCPCS_Aggregate_CY2013.zip
wget http://download.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Downloads/Medicare_State_HCPCS_Aggregate_CY2013.zip

unzip Medicare_National_HCPCS_Aggregate_CY2013.zip -d summary-tables
unzip Medicare_Physician_and_Other_Supplier_NPI_Aggregate_CY2013.zip -d summary-tables
unzip Medicare_State_HCPCS_Aggregate_CY2013.zip -d summary-tables

rm Medicare_National_HCPCS_Aggregate_CY2013.zip
rm Medicare_Physician_and_Other_Supplier_NPI_Aggregate_CY2013.zip
rm Medicare_State_HCPCS_Aggregate_CY2013.zip

aws s3 cp ../Medicare-provider-util-payment-data/ s3://health-datasets/Medicare-provider-util-payment-data --recursive

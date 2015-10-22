# CMS Open Payments
rm -r download-data/CMS-open-payments
mkdir download-data/CMS-open-payments
cd download-data/CMS-open-payments

# setup 2013 data
wget http://download.cms.gov/openpayments/PGYR13_P063015.ZIP
unzip PGYR13_P063015.ZIP -d 2013
rm PGYR13_P063015.ZIP

# setup 2014 data
wget http://download.cms.gov/openpayments/PGYR14_P063015.ZIP
7za x PGYR14_P063015.ZIP -o2014
rm PGYR14_P063015.ZIP

aws s3 cp ../CMS-open-payments/ s3://health-datasets/CMS-open-payments --recursive
cd ../..



# Elhadad dataset
rm -r download-data/Elhadad-dataset
mkdir download-data/Elhadad-dataset
cd download-data/Elhadad-dataset

git clone git@github.com:bwallace/w3phi-2015.git
aws s3 cp ../Elhadad-dataset/ s3://health-datasets/Elhadad-dataset --recursive
cd ../..



# 2010 Chronic Conditions PUFs
rm -r download-data/chronic-conditions-PUFs
mkdir download-data/chronic-conditions-PUFs
cd download-data/chronic-conditions-PUFs

wget https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/BSAPUFS/Downloads/PUF_Disclaimer.pdf
wget https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/BSAPUFS/Downloads/2010_ChronicConditions_PUF.zip
wget https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/BSAPUFS/Downloads/2010_ChronicConditions_DataDictionary.pdf
wget https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/BSAPUFS/Downloads/2010_ChronicConditions_GenDoc.pdf
wget https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/BSAPUFS/Downloads/2010_ChronicConditions_DUG.zip
wget https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/BSAPUFS/Downloads/2008_Chronic_Conditions_PUF.zip
wget https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/BSAPUFS/Downloads/2008_Chronic_Conditions_PUF_Data_Dictionary.pdf
wget https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/BSAPUFS/Downloads/2008_Chronic_Conditions_PUF_GenDoc.pdf
wget https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/BSAPUFS/Downloads/2008_Chronic_Conditions_PUF_DUG.zip
wget https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/BSAPUFS/Downloads/2008_Enrollment_and_User_Rates.pdf

unzip 2008_Chronic_Conditions_PUF.zip
unzip 2008_Chronic_Conditions_PUF_DUG.zip
unzip 2010_ChronicConditions_DUG.zip
unzip 2010_ChronicConditions_PUF.zip

rm 2008_Chronic_Conditions_PUF.zip
rm 2008_Chronic_Conditions_PUF_DUG.zip
rm 2010_ChronicConditions_DUG.zip
rm 2010_ChronicConditions_PUF.zip

aws s3 cp ../chronic-conditions-PUFs/ s3://health-datasets/chronic-conditions-PUFs --recursive
cd ../..



# NPDB Malpractice claims
rm -r download-data/NPDB-malpractice-claims
mkdir download-data/NPDB-malpractice-claims
cd download-data/NPDB-malpractice-claims

wget http://www.npdb.hrsa.gov/resources/NpdbPublicUseDataAscii.zip
wget http://www.npdb.hrsa.gov/resources/NpdbPublicUseDataSpss.zip

unzip NpdbPublicUseDataAscii.zip
unzip NpdbPublicUseDataSpss.zip
 
rm NpdbPublicUseDataAscii.zip
rm NpdbPublicUseDataSpss.zip
 
aws s3 cp ../NPDB-malpractice-claims/ s3://health-datasets/NPDB-malpractice-claims --recursive
cd ../..



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
cd ../..



# SPARCS
rm -r download-data/SPARCS
mkdir download-data/SPARCS
cd download-data/SPARCS

wget https://health.data.ny.gov/api/views/ivw2-k53g/rows.csv?accessType=DOWNLOAD -O Hospital_Inpatient_Discharges_by_Facility__SPARCS___Beginning_2009.csv
wget https://health.data.ny.gov/api/views/q6hk-esrj/rows.csv?accessType=DOWNLOAD -O Hospital_Inpatient_Discharges__SPARCS_De-Identified___2009.csv
wget https://health.data.ny.gov/api/views/npsr-cm47/rows.csv?accessType=DOWNLOAD -O Hospital_Inpatient_Discharges__SPARCS_De-Identified___2013.csv
wget https://health.data.ny.gov/api/views/swz6-xxvm/rows.csv?accessType=DOWNLOAD -O Hospital_Inpatient_Discharges_by_Patient_County_of_Residence__SPARCS___Beginning_2009
wget https://health.data.ny.gov/api/views/xyfc-qbbr/rows.csv?accessType=DOWNLOAD -O All_Payer_Inpatient_Quality_Indicators__IQI__by_Hospital__SPARCS___Beginning_2009.csv
wget https://health.data.ny.gov/api/views/iqp6-vdi4/rows.csv?accessType=DOWNLOAD -O Hospital_Inpatient_Prevention_Quality_Indicators__PQI__for_Adult_Discharges_by_County__SPARCS___Beginning_2009.csv

aws s3 cp ../SPARCS/ s3://health-datasets/SPARCS --recursive
cd ../..

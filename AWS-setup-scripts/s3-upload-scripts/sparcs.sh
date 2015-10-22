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

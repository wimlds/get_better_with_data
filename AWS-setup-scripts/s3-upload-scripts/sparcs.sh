# SPARCS
rm -r download-data/SPARCS
mkdir download-data/SPARCS
cd download-data/SPARCS

wget https://health.data.ny.gov/api/views/u4ud-w55t/rows.csv?accessType=DOWNLOAD -O Hospital_Inpatient_Discharges__SPARCS_De-Identified___2012.csv
wget https://health.data.ny.gov/api/views/npsr-cm47/rows.csv?accessType=DOWNLOAD -O Hospital_Inpatient_Discharges__SPARCS_De-Identified___2013.csv

aws s3 cp ../SPARCS/ s3://health-datasets/SPARCS --recursive

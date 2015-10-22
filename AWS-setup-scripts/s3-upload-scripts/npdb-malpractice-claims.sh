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

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

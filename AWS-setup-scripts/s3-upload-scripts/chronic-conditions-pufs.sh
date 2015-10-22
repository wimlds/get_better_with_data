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

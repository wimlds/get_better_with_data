# Elhadad dataset
rm -r download-data/Elhadad-dataset
mkdir download-data/Elhadad-dataset
cd download-data/Elhadad-dataset

git clone git@github.com:bwallace/w3phi-2015.git
aws s3 cp ../Elhadad-dataset/ s3://health-datasets/Elhadad-dataset --recursive

#!/bin/bash
set -e

cd /home/ubuntu/mlops-71052402033

docker build -t student-result-predictor .

docker stop student-result-predictor 2>/dev/null || true
docker rm student-result-predictor 2>/dev/null || true

docker run -d 
  --name student-result-predictor 
  --restart unless-stopped 
  -p 80:5000 
  student-result-predictor

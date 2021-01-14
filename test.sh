#!/bin/sh

set -ex

rm ./out/output.html || true
rm ./out/output2.html || true
rm ./out/output3.json ./out/output3.html || true
# .${BINARY} -name "KVM Linux" -repo "github.com/kubernetes/minikube/" -pr "6096" -in "testdata/minikube-logs.json" -out "./out/output.html" -details "0c07e808219403a7241ee5a0fc6a85a897594339"
# .${BINARY} -name "KVM Linux" -repo "github.com/kubernetes/minikube/" -pr "6096" -in "testdata/Docker_Linux.json" -out "./out/output2.html" -details "0c07e808219403a7241ee5a0fc6a85a897594339"

# get the json output for the scheduled stop testdata and make sure it is correct
# by comparing it to our expected output
# we only want to compare the first 9 lines, where we make sure the number of tests is correct

.${BINARY} -name "Docker Windows" -repo "github.com/kubernetes/minikube/" -pr "10132" -in "testdata/scheduled-stop-windows.txt" -out ./out/output3.html | head -9 > ./out/output3.json
cmp ./out/output3.json testdata/expected-scheduled-stop-windows.json

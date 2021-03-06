# Copyright 2012 Citrix Systems, Inc. Licensed under the
# Apache License, Version 2.0 (the "License"); you may not use this
# file except in compliance with the License.  Citrix Systems, Inc.
# reserves all rights not expressly granted by the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 
# Automatically generated by addcopyright.py at 04/03/2012
zoneid=1
templateid=3
account="u"
x=$1
y=$2
p=$3
q=$4

for i in `seq 1 3`
do
	serviceOfferingId=10
	query="GET	http://127.0.0.1/client/?command=deployVirtualMachine&zoneId=$zoneid&hypervisor=Simulator&templateId=$templateid&serviceOfferingId=$serviceOfferingId&account=$account&domainid=1	HTTP/1.0\n\n"
	echo -e $query | nc -v -q 20 127.0.0.1 8096
done

sleep 15s

for x in `seq $x $y`
do
	destroy="GET  http://127.0.0.1:8096/client/?command=destroyVirtualMachine&id=$x	HTTP/1.0\n\n"
	echo -e $destroy | nc -v -q 60 127.0.0.1 8096
done

sleep 240s

for i in `seq 1 30`
do
	serviceOfferingId=9
	query="GET	http://127.0.0.1/client/?command=deployVirtualMachine&zoneId=$zoneid&hypervisor=Simulator&templateId=$templateid&serviceOfferingId=$serviceOfferingId&account=$account&domainid=1	HTTP/1.0\n\n"
	echo -e $query | nc -v -q 20 127.0.0.1 8096
done

sleep 150s

for x in `seq $p $q`
do
	destroy="GET  http://127.0.0.1:8096/client/?command=destroyVirtualMachine&id=$x	HTTP/1.0\n\n"
	echo -e $destroy | nc -v -q 60 127.0.0.1 8096
done

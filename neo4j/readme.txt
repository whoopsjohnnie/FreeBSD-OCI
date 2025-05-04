

john@lab /scratch/john/development/FreeBSD-OCI/neo4j>sudo bash ./create.sh 
This Dir: /zall/scratch/john/development/FreeBSD-OCI/neo4j
neo4j successfully created!
vnet: 0 -> 1
ip4_addr: none -> vnet1|10.88.88.193/24
interfaces: vnet0:bridge0 -> vnet1:bridge1
mount_fdescfs: 1 -> 1
mount_procfs: 0 -> 1
No default gateway found for ipv6.
* Starting neo4j
  + Started OK
  + Using devfs_ruleset: 1016 (iocage generated default)
  + Configuring VNET OK
  + Using IP options: vnet
  + Starting services OK
  + Executing poststart OK
...
neo4j_env:  -> JAVA_HOME=/usr/local/openjdk11/
neo4j_enable:  -> YES
Directories in use:
home:         /usr/local/neo4j
config:       /usr/local/etc
logs:         /var/log/neo4j
plugins:      /usr/local/neo4j/plugins
import:       /usr/local/neo4j/import
data:         /var/db/neo4j
certificates: /usr/local/neo4j/certificates
licenses:     /usr/local/neo4j/licenses
run:          /var/run
Starting Neo4j.
Started neo4j (pid:22762). It is available at http://localhost:7474
There may be a short delay until the server is ready.


john@lab /scratch/john/development/FreeBSD-OCI/neo4j>sudo bash ./destroy.sh 
This Dir: /zall/scratch/john/development/FreeBSD-OCI/neo4j
* Stopping neo4j
  + Executing prestop OK
  + Stopping services OK
  + Tearing down VNET OK
  + Removing devfs_ruleset: 1016 OK
  + Removing jail process OK
  + Executing poststop OK

This will destroy jail neo4j

Are you sure? [y/N]: y
Destroying neo4j
john@lab /scratch/john/development/FreeBSD-OCI/neo4j>



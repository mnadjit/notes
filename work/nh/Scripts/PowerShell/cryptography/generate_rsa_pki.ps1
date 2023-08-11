<#
	CA prikey password:
	Ep^9K30J6x#C!uNl

	Certificate prikey password:
	qT*39Rz3w53CYmN1

	10.96.106.223
	203.2.88.17
	

	Northern Health Medirecords Integration (UAT)
	Northern Health ICT Integration
	Northern Health
	Epping
	Victoria
#>


# Generate a new private key and a public CA certificate
openssl req -x509 -days 3650 -newkey rsa:4096 -keyout ca-key.pem -out ca.pem -config req_ca_uat.conf 

# Generate a new private key for the new certificate
openssl genrsa -out cert-key.pem 4096
# Geneate a Certificate Signing Request (CSR)
openssl req -new -sha256 -config req_uat.conf -key cert-key.pem -out cert.csr
# Create the certificate
openssl x509 -req -sha256 -days 1095 -in cert.csr -CA ca.pem -CAkey ca-key.pem -out cert.pem -extfile req_uat.conf -extensions 'v3_req' -CAcreateserial

# import certificate and private key into a pfx format file
openssl pkcs12 -export -chain -CAfile .\ca.pem -in .\cert.pem -inkey .\cert-key.pem -name "NH Integration UAT" -caname "NH Integration CA" -out nh_integration_uat.p12 

# create a .crt version of the pem certificate
openssl pkcs12 -chain -nokeys -in ./nh_integration_uat.p12 -out ./nh_integration_uat.crt

# import certificate into Local Machine Trusted Root 
Import-Certificate -FilePath ./nh_integration_uat.crt -CertStoreLocation Cert:\LocalMachine\Root
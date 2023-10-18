# Lesson 6B - Implement PKI Management

- how can we install and maintain PKI for our private networks

# Certificate & Key management

Key Management

- manage cryptographic keys throughout their lifecycle
1. Key Generation - create a secure key pair 
2. Certificate Generation - assign the public key to an identity
3. Storage - store the private key securely
    1. prevent unauthorized access, loss, or damage of the key
4. Revocation - revoke a key if it is compromised
5. Expiration/Renewal - revoke if expired, generate new key material if renewing
- can be centralized or decentralized
    - centralized - one admin or authority is responsible for key management
    - decentralized - each individual responsible for their own key management

# Key Recovery & Escrow

- must log and key activities to detect compromise
- keys (especially keys for self-signing) may be subject to M-of-N controls
    - M —  # of admins present for access to be granted
        - M must be greater than 1
    - N — total # of admins w/ access to the system
        - N must be greater than M
    - **M-of-N Example: Nuclear Launch Protocol**
        1. There are 5 keys required to launch a nuclear missile.
        2. Each key is held by a different high-ranking officer.
        3. The missile system is designed such that at least 3 out of these 5 keys must be used simultaneously to authorize the launch.
        
        In this example, the M-of-N control is implemented as 3-of-5 control.
        

************************Key Recovery************************

- If the key used to decrypt data is lost or damaged, the encrypted data cannot be recovered unless a backup of the key has been made.
- Drawback -
    - if you make multiple backups of a key, it is  more difficult to ensure that the key is not compromised
    - if the key is not backed up, the storage system represents a single point of failure.
- Key recovery
    - secure process for backing up keys and/or recovering data encrypted with a lost key.
    - may use M-of-N control
    - may place keys in escrow
        - a 3rd party will hold the keys for you
            - useful an org does not have the means to safely store keys
            - involves great deal of trust with the 3rd party

# Certificate Expiration

- all certificates have a limited duration
    - root certs have longer durations (10+ years)
    - users/devices - 1 year is standard
- Renewal process occurs prior to expiration
    - possible to use existing key (aka “key renewal”)
    - generate a new key (aka “rekeyed”)
        - if old key is compromised or no longer considered long enough
- Options after a cert expires
    1. Key Destruction: erase by overwriting, destroying a hardware device (if stored in HW) 
        1. drawback - previously encrypted data will be unreadable
    2. Key Archiving - securing keys for purpose of backup, recovery, or regulatory compliance

# Certificate Revocation Lists

**Certificate Revocation** 

- **Revocation** — if it no longer valid. Cert cannot be reinstalled or used again
- Certificate Suspension - temporarily stopped. can be re-enabled
- Examples of Suspension:
    1. Private key compromised
    2. Business Closed
    3. User left the company
- Revocation reasons:
    1. Unspecified
    2. Key Compromise
    3. CA Compromise
    4. Superseded
    5. Cessation of Operation
- Suspended cert given title of “Certificate Hold”

****Certificate Revocation List (CRL)****

- method of notifying users if a cert is valid, revoked, or supsended
- CAs maintain and distribute the CRL

**********Risks**********

1. certificate may still be accepted if the CA has not published an up-to-date CRL
2. Browser not configured to perform CRL checking (ie legacy software)

### Online Certificate Status Protocol Responders

- protocol used for obtaining the revocation status of an individual digital certificate.
    - Alternative to Certificate Revocation Lists (CRLs),
    - Provides more timely information about the revocation status of certificates.
- Process
    1. Client needs to validate a certificate and sends that request to an OCSP responder to get cert status
    2. The OCSP responder queries the CA for that particular certificate
    3. OCSP sends response to client
- Drawbacks
    - creates a tremendous amount of traffic to a CA database
    - OCSP can be used to monitor and record client browser activity
- Mitigation - conduct OCSP stapling
    1. SSL/TLS web server obtains a time-stamped OCSP response from the CA
    2. when client queries a certificate, if it’s within the accepted time range, the server returns the already queried certificate to the client

# Certificate Pinning

- threat actors may attempt to substitute a malicious but trusted certificate into the chain to snoop on the “secure connection”
    - aka a MiTM attack
- Pinning - client programmed to only accept predefined certs or public keys
    - certificate data may be embedded in an app
    - HPKP (HTTP Public Key Pinning) submitting public keys to an HTTP browser via an HTTP header
        - method has been deprecrated for security issues

# Certificate Formats

“Digital certificates can be saved and exchanged in various formats. Certain systems or applications might require a specific format.”

- Encoding - encoding determines how the actual data is formatted and stored.
    - Base64 encoding is often used when there's a need to send binary data
- File Extension - suffix at the end of a filename.
    - Suggests the type of data and the encoding format, but it’s not dictated by the encoding format

### Encoding

1. DER (Distinguished Encoding Rules) - certificates and keys are processed as a binary
    1. not common
2. PEM (Privacy-enhanced Electronic Mail) - ASCII text using Base64
    1. Identifier - “BEGIN CERTIFICATE” string
    2. *export a cert in certlm to show BASE64*

### File Extensions

- a convention and not a standard
- DER and .PEM can be used as file extensions
    - .PEM is not recognized by Windows but is the most widely used extension for ASCII
    format files in Linux.
- CRT and .CER extensions can also be used, but they are not well-standardized.
    - “Most of the confusion arises from the way Windows handles certificates.”
    - In Linux, .CRT is most likely to represent an ASCII certificate.
    - In Windows, the most common extension is .CER, but this does not tell you whether the file format is binary or ASCII

### Contents

- a certificate file can contain more than one certificate
- PKCS#12 format  (Public Key Cryptography Standards)- allows the export of the private key w/ the cert.
    - uses:
        - Transfer private key to a host that can’t generate its own keys
        - Backup/Archive a private key
    - normally password-protected; always binary
    - usually have .PFX extension in Windows
    - .P12 in MacOS
    - Linux - cert and key are stored as files
- P7B format - implements PCKS #7 - bundling multiple certificates in the same file\
    - typically ASCII
    - uses:
        - deliver chain of certificates that must be trusted by the processing host
        - Associated w/ S/MIME to encrypt email messages
        - do not contain a private key
        - Linux - .PEM extension

# OpenSSL

- in Windows -
    - use AD Certificate Services to manage the Certificate infrastructure
    - certutil can be used powershell as well
- Linux - use OpenSSL (compatible w/ Windows as well)

### **OpenSSL Configuration**

**Root CA**

openssl genrsa -aes256 -out cakey.pem 4096

- generating an rsa key pair for the CA
- 4096 is the key length

openssl req -config openssl.cnf -key cakey.pem -new -x509 -days 7300 -sha256 -out cacert.pem

- creating the certificate for the CA
- using the default configuration file openssl.cnf
- SHA256 is hash function to use when signing the cert

**CSR (Certificate Signing Request)**

openssl req -nodes -new -newkey rsa:2048 -out www.csr -keyout www.key

- -nodes = key not encrypted with a passphrase
- after command submission, fill out the CN, FQDN, cert info

****************************************************************************Transmit the CSR file to the CA server****************************************************************************

openssl ca -config openssl.cnf -extensions webserver -infiles www.csr -out www.pem

- `ca` utility, which is used for certificate authority (CA) functions, like signing CSRs.
- read from the www.csr certificate signing request
- extensions - cert meant for a web server
- produce the certificate for the requestor called www.pem

************************************************View the New Certificate************************************************

openssl x509 -noout -text -in www.pem

- x509 display a cert using x509 standard
- output it in text form

openssl verify -verbose -cafile cacert.pem www.pem

- checks valididaty of a certifcate against the CA certificate
- -verbose shows the details of the cert
- -cafile specifies the cA certificate
- www.pem will be checked

### OpenSSL Key & Certificate Management

openssl rsa -aes256 -in www.key -out www.key.bak

- use this command to export a copy of private key to be held in escrow as a backup
- .bak is the backup file extension

openssl x509 -outform der -in www.pem -out www.der

- converts certificate to .der format

openssl pkcs12 -export -inkey www.key -in www.pem -out www.pfx

- creating .pfx file exporting the certificate and key for use in windows

# Certificate Issues

- common issues when rejecting a server certificate
    - check for expiration, revocation, suspension
    - Check key usage settings
        - VPN and email are strictly configured
    - Check subject name and adress is correcdt
        - if a client tries to connect to a sever by IP instead of the FQDN, the certificate may be rejected
    - Check chain of trust
        - root and intermediate CA certificates must be installed beofre a leaf certificate can be trusted
            
            *trusted roots in certlm*
            
    - check that time and date settings of the server and client are in sync
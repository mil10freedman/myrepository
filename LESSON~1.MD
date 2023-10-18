# Lesson 6A - Implement Certificates & Certificate Authorities

- show [skillstorm digital certificate](http://www.skillstorm.com)

Public/Private Key Review

- “When you want others to send you confidential messages, you give them your
public key to use to encrypt the message. The message can then only be decrypted
by your private key, which you keep known only to yourself.”
- “When you want to authenticate yourself to others, you create a signature and sign it by encrypting the signature with your private key. You give others your public key to use to decrypt the signature. As only you know the private key, everyone can be assured that only you could have created the signature.”
- drawback of public key cryptography - identity of parties not validated
- Public Key Infrastructure - framework to manage digital certificates and validate identities

# Certificate Authority

- A CA is a trusted entity that issues digital certificates.
    - verifies the identity of the certificate requestor before issuing a certificate
    - ensures the certificate contains the correct public key for that requestor.
- For internal networks can use Windows Active Directory or OpenSSL in Linux
    - equivalent issuing ID cards for your family
    - can use certlm.msc for local windows certificate management
        - *show Trusted Root CAs in certlm*
        - *show RootCA in skillstorm cert*
- 3rd party CA
    - similar to the DMV that issues certs (show passport, birth certificate, lease agreement to get a license)
    - Examples - IdenTrust, DigitCert, Godaddy, GlobalSign
    - Functions
        - Validate Identity of Requester
        - Requester submits a Certificate Signing Request
        - Certificate Renewal & Revocation
        - Maintain Root & Intermediate Certificates

# PKI Trust Model

- the trust model is critical in PKI
- It shows how users and differnt CAs are able to trust each other

### Single CA

- one CA responsible for issuing all the certificates within that environment.
- users trust that CA and no other.
- drawback - if that CA is exposed entire system is exposed
- use cases
    - internal applications where the user base is known

### Hierarchical (Intermediate CA)

- a single CA (called the root) issues certificates to several intermediate CAs.
- The intermediate CAs issue certificates to subjects (leaf or end entities).
- Advantage: different intermediate CAs can be set up with different certificate policies, enabling users to perceive clearly what a particular certificate is designed for.
- Each leaf certificate can be traced back to the root CA along the certification path aka certificate chaining, or a chain of trust.
- The root's certificate is self-signed
    - a digital certificate that is signed by the same entity whose identity it certifies, rather than by a trusted Certificate Authority (CA)
- Drawback - root certificate is still a single point of failure
    - mitigation - take root CA offline until it needs to issue/revoke certificats for intermediate CAs
    - intermediate CAs can manage certificates for subjects
- online CA - available to accept and process certificate signing requests, publish certificate revocation lists, and perform other certificate management tasks.
- offline CA - CA is disconnected from any network and usually kept in a powered-down state.

*show intermeidate & root CA for [skillstorm.com](http://www.skillstorm.com)*

# Registration Authorities & CSRs

**************Registration Authority**************

- CA may delegate identity validation to an RA
    - RA receives requests for digital certificates and verifies the individual's identity before the CA can issue the certificate.
- Verification Process
    - in Windows AD, users may be receive a certificate by authenticating to AD
    - Commercial CA - perform tests to validate identity
        - domain validation - verify applicant has control over the domain asking them to make a change to a DNS record
        - Organization Validation - confirm legal existence of the org by checking official databases
- Certificate Signing Request (CSR)
    - subject completes a CSR when requesting a certificate from a CA
    - the file is a Base64 ASCII file that also contains the public key
    - CA reviews the CSR, checks identity, and issues the Cert

# Digital Certificates

- provides a means of proving the ownership of a public key,
    - much like how a traditional ID card verifies your identity.
- Certificates can be used by:
    - People (online authentication)
    - Web servers (SSL/TLS certificates for encrypting web traffic)
    - client devices - device can authenticate to a VPN gateway
    - Oraganzizitons: set up internal encryption protocols
- Certs are based on the X.509 standard
- Based on X.509 Certificates contain:
    - *bring up a cert in certlm for comparison*
    
    ![Untitled](Lesson%206A%20-%20Implement%20Certificates%20&%20Certificate%20A%200d55dc78967b47e4b717160e2794ebd4/Untitled.png)
    
- When certificates were first introduced, the common name (CN) attribute was used
to identify the FQDN by which the server is accessed
    - such as [www.comptia.org](http://www.comptia.org/).
    - There was no standardization and different organizations used different kinds of information
    - if orgs have additional names they would like to include in the browser they should now use the Subject Alternative Name
        - may include comptia.org, members.compita.org, learn.comptia.org
    - * indicates this certificate is valid for all subdomains

# Types of Certificates

**************************************Certificate Type************************************** 

- the purpose or function of a digital certificate
- set by configuring the Key Usage Attribite
    - Microsoft also uses Enhanced Key Usage - provides additional attributes
    - standard values - server authN, client authN, code signing,
- extensions provide additional information about a cert
    - key usage - if cert used for purposes other than indicated in Key Usage, cert should be rejected
        - prevents web server for signing an email message
- certificate policy - defines the uses of certificate types issued by the CA and can be configured as standard certificate template

### Web Server Certificate

- server certificate - validate the identity of a website
- Drawback of PKI with websites is that anyone can register a domain
    - may be able hard to determine what sites are trustworthy
    - Certain sites may require different validations based on they type of site
- Domain Validation —proving the ownership of a particular domain.
    - Example - responding to an email to the authorized domain contact or by publishing a text record to the domain.
    - This process can be highly vulnerable to compromise
- Extended Validation —subjecting to a process that requires more rigorous checks on the subject's legal identity and control over the domain or software being signed
    - verify phone number
    - check DBA names (Doing Business As)
    - Business License verification

### Other Certificate Types

******************Machine/Computer Certificates******************

- certificates allocated to servers, PCs, smartphones, tablets, IoT devices
    - Examples: domain controllers, member servers, client workstations, routers, firewalls
- use cases
    - prevent network access w/o valid domain certificate

****************************************Email/User Certificate****************************************

- signs and encrypts emails
    - Secure Multipart Internet Message Extensions (S/MIME) or Pretty Good Privacy (PGP)
    - user’s email address is the SAN (subject alternative name) and CN (common name)
- user certificates can be used for
    - standard users
    - administrators
    - smart card logon/users
    - recovery agent users (ability to recover encrypted data)
        - user with ability to decrypt files they didn’t originally encrypt

********Code Signing Certificates********

- issued to a software publisher to validate the code they devloeped
- used to sign executables or DLLs

**********Root Certificate**********

- identifies the CA itself
- self-signed cert
- best practice at least 2048 bits, but nromally 4096 bits
- CN for a root cert is the CA itself
- if a machine or user has a self-cert, it’s marked untrustworthy by a system
- 

![Untitled](Lesson%206A%20-%20Implement%20Certificates%20&%20Certificate%20A%200d55dc78967b47e4b717160e2794ebd4/Untitled%201.png)
# Topic 7C - Implement Authentication Technologies

# Smart-Card Authentication

- programming cryptographic information onto a card equipped w/ a secure processing chip
    - chip stores digital certificate, private key, and PIN to activate the card

**For Kerberos authentication, smart-card logon works as follows:**

1. ~~The user presents the smart card to a reader and is prompted to enter a PIN.~~
2. ~~Inputting the correct PIN authorizes the smart card's cryptoprocessor to use its
private key to create a Ticket Granting Ticket (TGT) request, which is transmitted
to the authentication server (AS).~~
3. ~~The AS is able to decrypt the request because it has a matching public key and
trusts the user's certificate, either because it was issued by a local certification
authority or by a third-party CA that is a trusted root CA.~~
4. ~~The AS responds with the TGT and Ticket Granting Service (TGS) session key~~

# Key Management Devices

- security of the private key is critical
- even a network admin should not have access to private key
    - must have a separate way to generate keys for users
- Ways
    1. smart card- embed a cryptoprocessor in the chip to generate new key material
    2. USB key - 
    3. Trusted Platform Module (TPM) -  a secure cryptoprocessor enclave implemented on a PC, laptop, smartphone, or network appliance.
        1. usually inside the CPU
        2. modification is highly restricted
- these devices are normally provisioned as individual devices
- Hardware Security Module (HSM) - network device designed to perform PKI mangemnet of network devices. capabilities
    - act as archive or escrow
    - optimized for certificate services
    - tamper-evident - mechanism that provides visible evidence if tampering or unauthorized access has occurred
    - small attack surace

# Extensible Authentication Protocol/IEEE 802.1x

- scenarios for remote authentication:
    - user accessing wireless network and needs to authenticate to a newotk database
    - connecting to a netowrk via switch and the user is required to be authenticated before that device can communicate
    - connecting over to network over public network via VPN
- Extensible Authenticaiton Protocol (EAP)
    - authentication framework for deploying multiple types of authentication protocols
        - digital certificate
        - secure tunnel for credential transprot
        - smart card authentication
    - EAP messages can be transported via different networking protocols
        - Over 802.1X EAP messages are carried directly over LANs without a point-to-point protocol.
- IEEE 802.1X - Port-based Network Access Control - allows use of EAP method when a device conntects to an Ethernet switch port, WAP, or VPN gateway. Uses the AAA architecture:
    - Supplication - device requesting access
    - Network Access server - edge network applaince (switches, APs, VPN gateways)
        - aka radius client
    - AAA server- authentication server in the local network
        - main AAA servers are RADIUS & TACACS+

# Remote Authentication Dial-In Service

- NAS device (RADIUS client) is configured with the IP address of the RADIUS server and w/ a shared secret.
- Authentication Process
    1. Supplicant (User’s device) connects to NAS
    2. NAS prompts user for credentials (PAP, CHAP, EAP)
        1. NAS supports EAP over LAN (EAPoL) for credential support
    3. Supplicant sumbits credentials to RADUIS server using shared secret
    4. AAA servers replies with Access-Accept or Access-Reject packet
- used for network access control

# Terminal Access Controller Access-Control System

- used for centralizing logins of administrative accounts
    - allows for network admins to be allocated privileges on each switch, router, AP, fireweall
- TCP Port 49
- all TACACS+ packets is encrypted excel for header
    - supports C and I
- separates the AAA architecture
    - each function is performed under a distinct protocol
    - allows for granular control - privileges for uesrs, groups, roles, per-command authorizations

# Token Keys & Static Codes

- smart-card authN works when you have granular control over user accounts/devices on the network
- tokens work without the need for digital certificate and the management required to use them

**********************************One-Time Password**********************************

- generated automatically w/o user input
- not vulnerable to PW guessing or sniffing attacks
- generated using a hash function plus a syncronization value (timestamp or counter0
- SecurID oken from RSA
- FIDO U2F (Fast Identity Online Universal Second Factor)

# Open Authentication

************************************************Initiative for Open Authenticaiton (OATH) —************************************************ industry body to develop open, strong authentication

- open - a system that any enterprise can link into to perform authentication of users and devices across different networks
- strong - based on 2 or 3 factor authN or 2-step verification, and two algorithms for OTPs

**********HMAC-Based One-Time Password Algorithm (HOTP)**********

- generates an OTP BASED on a shared secret and a counter value
- both the server and authenticating device share a secret key
- both maintain a counter than increments with each authentication attempt
- HOTP algorithm combines secret key and counter value to produce the one time password

************************Time-Based One-Time Password Algorithm (TOTP)************************

- refinement of HOTP
- drawbacks
    - tokens can persist unexpired
- TOTP combines the shared secret plus a value derived from the local time (of the server and device)
    - auto expires after a short window
    - server and client device must be synced
- Google Authenticator

![Untitled](Topic%207C%20-%20Implement%20Authentication%20Technologies%2099522d2d1b9640ccab1d8fadf6cd9130/Untitled.png)

# 2-Step Verification

- out-of-band mechanisms
- send a resource assumed to be safely controller by the user
    - SMS
    - Phone call
    - push notificaiton
    - email
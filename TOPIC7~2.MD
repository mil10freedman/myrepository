# Topic 7B - Implement Knowledge-Based Authentication

- primarily involves passwords;
- how can implement knowledge-based protocols within a network

# Local, Network, & Remote Authentication

The operating system can serve as the authentication provider

- standard - PIN or PW
- Linux - login
- Microsoft - logon or sign-in
- credentials are stored as hashes
    - user inputs the password. the OS hashes the PW and compares the hash against the one stored in the database

### Windows Authentication

- Local Sign-In - the Local Security Authority (LSA) compares the hash stored in the Security Accounts Manager DB
- Network Sign-In — LSA can pass credentials to a network device
    - Kerberos is preferred
    - legacy may use NT LAN Manger (NTLM) authentication
- Remote Sign-In — authentication over a VPN or web protal

### Linux Authentication

- local user account names stored in /etc/passwd
- password stored in /etc/shadow
- SSH - used for network login
    - can use cryptographic keys instead of a password
- in many cases you’re going to have different devices with different authentication schemes
    - Pluggable Authentication Module (PAM) - package for enabling differetn authentication providers
    - smart-card login, application authentication. SSH

### Single Sign-On

![Untitled](Topic%207B%20-%20Implement%20Knowledge-Based%20Authenticatio%203619d066949c490392a57e55d304e26d/Untitled.png)

- user can authenticate to a local device or service and be authenticated to other applications without having to enter credentials again
    - ie Kerberos

# Kerberos Authentication

- SSO network authentication protocol for proving identity *(look up definition of Kerberos)
- implemented by Windows AD

********************Components********************

1. Clients - users/devices that want access to resources
2. Service Server (aka Server) - machine/application the client wants access to 
3. Key Distribution Center (KDC) - trusted 3rd party that provides authentication services
    1. Authentication Service - authenticates users; provides them with a Ticket Granting Ticket (TGT)
    2. Ticket Granting Server (TGS) - issues service tickets that allow clients to access public services

**************************Kerberos Authentication**************************

1. Client contacts Authentication Server to request a Ticket Granting Ticket (TGT) 
2. The AS checks if the client account is present. Verifies the password against the Active Directory Data Base. AS provides client with
    1. TGT that contains client name, IP address, time stamp, validity period. This is encrypted using the KDC’s secret key
    2. TGS Session key - use for communications b/w client and the Ticket Granting service. this is encrypted using the hash of the client’s password

********************************************Kerberos Authorization********************************************

- the client can decrypt the TGS session key b/c it’s encrypted with the hash of their PW but not the TGT b/c its encrypted using the KDC’s secret key
    - ensures client can interact with servers but not alter the TGT
1. **Requesting Service Access**: When the client wants to access a specific service, it sends the TGT to the Ticket Granting  Server (TGS), requesting a service ticket for that particular service.
2. The client sends the TGS a copy of its TGT and the name of the application server it wishes to access plus the TGS session key 
3. TGS responds with:
    1. Service Session Key - for use b/w client and application server
    2. Service Ticket  - contains info about the client and the service session key
4. Client forwards service ticket to the app
5. App Server decrypts service ticket
6. Server Responds to the request

Kerberos Drawbacks:

- KDC is single point of failure
- best practice to have backup KDC servers

# PAP, CHAP, and MS-CHAP

**Password Authentication Protocol (PAP)**

- authentication protocol that allows a user to prove their identity to a system by sending a valid username and password
- sends usernames and passwords in plaintext
- used with PPP (Point-to-Point Protocol)
- obsolete unless an encrypted tunnel is established first
- works over serial and dial up connections

****************************************************************************************************Challenge Handshake Authentication Protocol (CHAP)****************************************************************************************************

- also developed as part of PPP for authenticating over a remote link
- Has its own three way handshake
    1. Challenge - server challenges the client, sending a randomly generated message
    2. Response - client responds w/ a hash calculated from the server challenge message and the client password
    3. Verification - server performs its own hash using the password hash stored for the client
- handshake is repeated periodically thought the connection to guard against replay attacks

**MS-CHAPv2 - Microsoft Implementation of CHAP**

- vulnerable b/c of its implementation of NTLM hashes w/o credentials being passed in a secure tunnel

# Password Attacks

P**laintext/unencrypted attack -** password storage or network authentication does not use encryption

- PAP
- HTTP/FTP
- Telnet

********************************Online attack -******************************** threat actor interacts w/ authentication service directly. 

- web login, VPN Gateway
- attacker uses a DB of known passwords or list of passwords that have been cracked offline
- IoC - repeatedly failed logons followed by a successful of logon
- Mitigation - restricting number of logons, shunning attempts from known bad IP addresses
- **********Password Spraying**********
    - attacker chooses one or more common passwords and tries them in conjunction with multiple usernames

****************************Offline Attacks****************************

- attacker has obtained a DB of the hashes
    - Linux - /etc/shadow
    - Windows Active Directory - `%SystemRoot%\NTDS\NTDS.DIT`
    - `%SystemRoot%\system32\config\SAM`
- IoC - file system audit log that records a malicious account accessing one of these logs
- Threat actors may read credentials from host memory
- Capture traffic of CHAP/MS-CHAP during client response to a server challenge

# Brute-Force & Dictionary Attacks

- legacy hashes cryptographically weak
- some databases are configured for backwards compatibility

**Brute-Force Attack**

- attempts every possible combination in the output space to match a capture hash and guess the plaintext
- output space is determined by the algorithm (128 bit MD5 or 256 bit SHA-256)
- more outspace = more difficult to crack
- brute force attacks can be distributed across multiple components like high-end graphics cards to speed up the process

************************************Dictionary & Rainbow attacks************************************

Dictionary attacks - used when there is a good chance of guessing the likely value of the plaintext (i.e. non-complex password)

- truly random password's possible combinations can be astronomically high (making brute-forcing impractical in a reasonable time frame), many people use easily guessable passwords or phrases.

Rainbow Attacks - refines the dictionary approach. attacker uses a list of precomputed look up table of possible passwords and their matching passwords

- use salting to slow rainbow attacks

******************************Hybrid Attack****************************** 

- combine dictionary and brute force attack
- dictionary word and then appends or prepends combinations of characters or numbers to that word.
    - brady1, brady!
    - substitute “s” with “5” or “o” with ‘0”

# Password Crackers -

- Windows - Cain & L0phtrack
- most PW crackers run on Linux
- Hashcat can use several modes
    - dictionary mode, wordlists, brute-force

# Authentication Management

- users choose bad passwords and reuse them across multiple sites
- Password managers  generate a unique, strong password for each web-based account
    - Password Key - USB tokens for connecting to PCs and smartphones
    
    ![Untitled](Topic%207B%20-%20Implement%20Knowledge-Based%20Authenticatio%203619d066949c490392a57e55d304e26d/Untitled.webp)
    
    - Password Vault - SW based manager; typically a cloud service
        - can USB key as backup
        - Apple’s iCloud Keychain, Windows Credential Manger
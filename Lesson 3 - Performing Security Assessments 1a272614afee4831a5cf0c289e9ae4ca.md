# Lesson 3 - Performing Security Assessments

- Security Assessment - processes and tools that evaluate the attack surface
- Network Reconnaissance - maps the potential attack surface by identifying the nodes and connections that make up the network
    - run scans using both command-line and GUI topology discovery tools.
- footprinting - create a profile of the target network; scan for domains, hosts, IP ranges, and routes b/w networks

# ipconfig, ping, arp

“footprint a network using these tools”

- ipconfig - show the configuration of network interface in windows
    - MAC, IPv4, IPv6, default gateway
- ifconfig - config for network interfaces in Linux
- ping (Internet Control Message Protocol) - probe a host on a particular IP address or host name
- arp—display the local machine's Address Resolution Protocol (ARP) cache.
    - The ARP cache shows the MAC address of the interface associated with each IP address the local host has communicated with recently

# IP Scanners & Nmap

“using tools such as ping is time consuming and non-stealthy, and does not return detailed results.”

- An **IP scanner** performs host discovery and identifies how the hosts are connected together in an internetwork.
- **Service discovery** which operating systems are in use, which network services each host is running, and, if possible, which application software is underpinning those services
- Footprinting - detailed analysis of services on a particular host
    - each OS or application software that underpins a network service responds to probes in a unique way.
    - allows the scanning software to guess at the software name and version,
    - Described as banner grabbing, where the banner is the header of the response returned by the application.
- **Nmap Security Scanner** - use diverse methods of host discovery, some of which can operate stealthily and serve to defeat security mechanisms such as firewalls and intrusion detection.([nmap.org](http://nmap.org/)) is one of the most popular open-source IP scanners.
    - The tool is open-source software with packages for most versions of Windows, Linux, and macOS. It can be operated with a command line or via a GUI (Zenmap)
- Service Discovery w/ Nmap
    - **TCP SYN (-sS**)—this is a fast technique also referred to as half-open scanning, as the scanning host requests a connection without acknowledging it. The target's response to the scan's SYN packet identifies the port state.
    - UDP scans (-sU)—scan UDP ports. As these do not use ACKs, Nmap needs to wait for a response or timeout to determine the port state, so UDP scanning can take a long time. A UDP scan can be combined with a TCP scan.
    - **Port range (-p)**—by default, Nmap scans 1000 commonly used ports, as listed in its configuration file. Use the -p argument to specify a port range.
- Fingerprinting w/ Nmap
    - sV,  -o, -A switch to probe a host more intensively
        - Protocol
            - HTTP, DNS, SMTP
        - Application Name and Version
            - Apache Web Server
        - OS type and version
            - Linux, Windows, etc
        - Device Type
            - Switches, routers, network attached storage, printers, webcams

# netstat and nslookup

additional service discovery tools in Windows and Linux

- netstat—show the state of TCP/UDP ports on the local machine (windows and linux).
    - You can use netstat to check for service misconfigurations (perhaps a host is running a web or FTP server that a user installed without authorization).
    - You may also be able to identify suspect remote connections to services on the local host or from the host to remote IP addresses
    - most useful netstat output is to show which process is listening on which ports.
- nslookup/dig—query name records for a given domain using a particular DNS resolver under Windows (nslookup) or Linux (dig).
    - An attacker may test a network to find out if the DNS service is misconfigured.
    - A misconfigured DNS may allow a zone transfer, which will give the attacker the complete records of every host in the domain, revealing a huge amount about the way the network is configured.

# Additional Recon/Discovery Tools

- OSINT - The Harvester - scans public data sources to gather email, names, IPs, URLs, subdomains
- dnsenum - more robust way of DNS querying than dig and who is
    - standard DNS query, attempts to determine IP address ranges in use
- scanless
- curl - command line client for performing data transfers over several protocols including HTTP
    - can submit HTTP, GET, POST, PUT requests as part of web vulnerability testing
    - supporsts FTP, IMAP, LDAP, SMB, SMTP
- Nessus - tests services and version information to determine software vulnerabiltiies

# Packet Capture

- Packet analysis refers to deep-down frame-by-frame scrutiny of captured frames.
- Protocol analysis means using statistical tools to analyze a sequence of packets, or
packet trace
- Packet capture by
    - SPAN (Switched Port Analyzer) aka Mirror Port - network switch copies frames to another destination port for collection
    - TAP (Test Access Port) - insert device into cable to capture frames
        - typically placed inside a firewall to determine what malicious activity got passed the firewall
- Tools for packet capture
    - tcpdump for Linux; saves files in  .pcap file for analysis later
- Packet Analsyis with Wireshark
    - perform traffic analysis
    - can break down data according to OSI layer, protocol, function
    - Wireshark - open source graphical packet capture and analysis utility for most operating systems
    - Follow TCP stream - reconstructs the packet contents for a TcP session

# Packet Injection and Replay

- send forged or spoofed network traffic for recon techniques
- hping - open-source spoofing tool; craft netowrk packets to bypass firewalls and IDS
    - perform host/port detection, traceroute, Denial of Service (flood-based Dos attacks from randomized source IPs)
- tcpreplay - takes previously captured traffic saved to a .pcap files and replays thru a network interfac
    - if you capture suspect traffic, you can replay it thru a monitored network interface to test intrusion detection ruels

# Exploitation Framework

- exploitation framework - uses vulnerabilities identified by an autoamted scanner and launches scripts or software to deliver matching exploits. Consists of:
    - Database of exploit code targeting Common Vulnerabiltieis and Exposures
    - Exploit coupled with payload to open a command shell, create a user, install software
    - Metasploit is the best known exploit fraemwork
        - available on Linux and Windows
- ZAP Attack Proxy (ZAP) scanning tools and scripts for web app and mobile scurity testing
- Pacu - recon and exploitation of Amazon Web Services

# Netcat

- tests connectivity, port scanning, and fingerprintg
- establish connection with remote machines.
    - configure Netcat as a backdoor. set up a listener on the victim machine and pipe traffic from a program

[Lesson 3B - Explain Security concerns w/ General Vulnerability Types](Lesson%203%20-%20Performing%20Security%20Assessments%201a272614afee4831a5cf0c289e9ae4ca/Lesson%203B%20-%20Explain%20Security%20concerns%20w%20General%20Vu%201202c66d015949c495893d8d1eb55174.md)

[Lesson 3C - Summarize Vulnerability Scanning Techniques](Lesson%203%20-%20Performing%20Security%20Assessments%201a272614afee4831a5cf0c289e9ae4ca/Lesson%203C%20-%20Summarize%20Vulnerability%20Scanning%20Techn%20aa6d574eaf6d40cbb03d30ad934af88e.md)

[Lesson 3D - Explain Penetration Testing Concepts](Lesson%203%20-%20Performing%20Security%20Assessments%201a272614afee4831a5cf0c289e9ae4ca/Lesson%203D%20-%20Explain%20Penetration%20Testing%20Concepts%20def0928a0ed940f5a79c3bf5f09052a5.md)
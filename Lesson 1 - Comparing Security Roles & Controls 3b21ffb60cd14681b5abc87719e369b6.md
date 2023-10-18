# Lesson 1 - Comparing Security Roles & Controls

# Information Security

- Information security (or infosec) - protection of data resources from unauthorized access, attack, theft, or damage.
- Implement infosec based off CIA Triad
    - Confidentiality - Information should only be known to certain people
    - Integrity - Data is stored and transferred as intended and that any modification is authorized
    - Availability - Information is accessible to those authorized to view or modify it
    - Non-repudiation -Subjects cannot deny creating or modifying data
- Information security and cybersecurity tasks can be classified as five functions
    - **Identify**—develop security policies and capabilities. Evaluate risks, threats, and vulnerabilities and recommend security controls to mitigate them.
    - **Protect**—procure/develop, install, operate, and decommission IT hardware and software assets with security as an embedded requirement of every stage of this operations life cycle.
    - **Detect—**perform ongoing, proactive monitoring to ensure that controls are effective and capable of protecting against new types of threats. **Respond**—identify, analyze, contain, and eradicate threats to systems and data security.
    - **Recover**—implement cybersecurity resilience to restore systems and data if other controls are unable to prevent attacks.
- Examples of Infosec
    - Access Control & User Privileges
    - Auditing logs and events
    - Incident Reporting & Response

### Info Sec Roles & Responsibilities

- Overall responsibility for security - allocated to a dedicated department, run by a Director of Security, Chief Security Officer (CSO), or **Chief Information Security Officer (CISO)**
- **Managers** may have responsibility for a domain, such as building control, Information Communications Technology (ICT), or accounting
- **Technical and specialist staff** have responsibility for implementing, maintaining, and monitoring the policy.
    - May be core competency of systems and network administrators, or there may be dedicated security administrators (i.e. **Information Systems Security Officer (ISSO**))
- **Non-technical staff** have the responsibility of complying with policy and with any relevant legislation.

### Info Sec Business Units

- S**ecurity Operations Center (SOC) s**ecurity professionals monitor and protect critical information assets across business functions
    - (finance, operations, sales/marketing)
- **Development and operations (DevOps)** encourage collaboration between developers and system administrators.
    - By creating a highly orchestrated environment, IT personnel and developers can build, test, and release software faster and more reliably.
- **DevSecOps -** adds security as a primary consideration at every stage of software development and deployment
    - developers would create insecure code; hardcode credentials;
- A dedicated isingle point of contract for security incidents are:
    - Cyber incident response team (CIRT)
    - Computer security incident response team (CSIRT)/
    - Computer emergency response team (CERT)
    - This function might be handled by the SOC or it might be established as an independent business unit.

# Security Controls

- A **security control** is a measure or mechanism put in place to reduce or mitigate potential risks to information and information systems.
    - Enhances confidentiality, integrity, availability, or non-repudiation of a system
    - **Technical**—the control is implemented as a system (hardware, software, or firmware).
        - Example - firewalls, anti-virus software, and OS access control models are technical controls. Technical controls may also be described as logical controls.
    - **Operational**—the control is implemented primarily by people rather than systems.
        - Example - security guards and training programs are operational controls rather than technical controls.
    - **Managerial**—the control gives oversight of the information system.
        - Example - risk identification or a tool allowing the evaluation and selection of other security controls.
- Security controls can also be classified in types according to the goal or function they perform:
    - **Preventive**—eliminate or reduce the likelihood that an attack can succeed. Operates before an attack can take place.
        - Access control lists (ACL) configured on firewalls, Anti-malware software also acts as a preventative control,
        - Directives and standard operating procedures (SOPs) can be thought of as administrative versions of preventative controls.
    - **Detective**—  identify and record any attempted or successful intrusion. A detective control operates during the progress of an attack.
        - Logs provide one of the best examples of detective-type controls.
    - **Corrective**— eliminate or reduce the impact of an intrusion event. A corrective control is used after an attack.
        - Example - backup system that can restore data that was damaged during an intrusion.
    - **Physical**— alarms, gateways, locks, lighting, security cameras, and guards that deter and detect access to premises and hardware
    - **Deterrent**—not physically or logically prevent access, but psychologically discourages an attacker from attempting an intrusion.
        - signs and warnings of legal penalties against trespass or intrusion
    - **Compensating**—Substitute for a principal control, as recommended by a security standard, and affords the same (or better) level of protection but uses a different methodology or technology.
        - isolating legacy equipment on your network

# Frameworks

- A **cybersecurity framework (CSF) -** list of activities and objectives undertaken to mitigate risks.
    - Helps business demonstrate cybersecurity capabilities or regulatory compliance
- Represent "best practice" in IT security governance generally.
- The **National Institute of Standards and Technology (NIST) Cybersecurity Framework (CSF)** focuses exclusively on IT security for US businesses and government
    - **NIST's Risk Management Framework (RMF) -** maintain acceptable risk levels for federal agencies
        - ~~ensure information systems meet security requirements and continue to maintain acceptable risk levels for federal agencies~~
    - **NIST Federal Information Processing Standards (FIPS)** - legally mandated standards for federal agencies to use when handling sensitive (but not classified) information
    - **Special Publications** cover a wide range of topics, including cybersecurity best practices, guidelines, and recommendations.
        - **NIST SP 800-53 -** catalog of security and privacy controls for federal information systems
- The **International Organization for Standardization (ISO)** has produced a cybersecurity framework
    - **ISO 27000** Series of information security standards
    - • **ISO 31K – Enterprise Risk Management Framework -**
        - ERM - considers risk across all factors: financial, customer service, legal liability cyber
- **Cloud Security Alliance (CSA)-** assist cloud service providers (CSP) in setting up and delivering secure cloud platforms
- **Statements on Standards for Attestation Engagements (SSAE)** are audit specifications developed by the American Institute of Certified Public Accountants (AICPA)
    - **Service Organization Control (SOC2)—** evaluates internal controls implemented by the service provider when storing and processing customer data.
        - An SOC2 Type I report assesses the system design
        - Type II report assesses the ongoing effectiveness of the security architecture over a period of 6-12 months..
    - **SOC3**—a less detailed report certifying compliance with SOC2. SOC3 reports can be freely distributed

# Benchmarks

- detailed implementation guidance on the deployment of servers and apps
- Center for Internet Security - evaluation of security posture. Helps with compliance with NIST/ISO frameworks
    - product benchmarks - Windows Desktop/Server, macOS, Linux, web browser, OS
- 3rd Party Assessments -
    - Department of Defense Cyber Exchange provides **Security Technical Implementation Guides (STIGs)** with hardening guidelines for a variety of software and hardware solutions
- **Open Web Application Security Project (OWASP)** is a not-for-profit, online community that publishes several secure application development resources, such as the Top 10 list of the most critical application security risks

# Regulations

**SOX** stands for **Sarbanes-Oxley Act** -protect investors by improving the accuracy and reliability of corporate disclosures.

**The Computer Security Act of 1987** - established minimum security standards, assigned roles and responsibilities. [repealed by FISMA in 2002](https://www.cisa.gov/topics/cyber-threats-and-advisories/federal-information-security-modernization-act)

**FISMA** stands for **Federal Information Security Modernization Act**, The Department of Homeland Security’s administers information security policies for non-national security federal systems

**General Data Protection Regulation (GDPR)** - protects the personal data and privacy rights of individuals within the EU

**GLBA** stands for **Gramm-Leach-Bliley Act** - federal law that imposes privacy rules on financial institutions regarding the collection and sharing of consumers’ nonpublic personal information (NPI). 

**California Consumer Privacy Act (CCPA)** - Grants Californian residents enhanced rights regarding the collection, use, and sharing of their personal information.

**Health Insurance Portability and Accountability Act** - Protects the privacy and security of individuals' health information

PCI DSS stands for **Payment Card Industry Data Security Standard -** standard used to handle credit cards from major card brands its use is mandated by the card brands. [It was created to better control cardholder data and reduce credit card fraud](https://www.pcisecuritystandards.org/)

![Untitled](Lesson%201%20-%20Comparing%20Security%20Roles%20&%20Controls%203b21ffb60cd14681b5abc87719e369b6/Untitled.png)
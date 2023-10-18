# Lesson 2 - Explaining Threat Actors & Threat Intelligence

- What are vulnerability, a threat, and a risk?
    - **Vulnerability** is a weakness that could be triggered accidentally or exploited intentionally to cause a security breach.
        - improperly configured or installed hardware or software
        - Delays in applying and testing software and firmware patches
        - Untested software and firmware patches
    - **Threat** is the potential for someone or something to exploit a vulnerability and breach security. A threat may be intentional or unintentional.
        - Threat Actor - person or thing that poses the threat is called a threat actor
    - **Risk** is the likelihood and impact of a threat actor exploiting a vulnerability.
- **attack surface** is all the points at which a malicious threat actor could try to exploit a vulnerability.
- **attack vector** is the path that a threat actor uses to gain access to a secure system
    - Email—the attacker sends a malicious file attachment via email
    - Misconfigured fireall
    - Legacy software

### Attributes of Threat Actors

- Known vs Unknown
    - "static" known threats, such as viruses or rootkits, Trojans, botnets, and specific software vulnerabilities.
        - It is relatively straightforward to identify and scan for these types of threats with automated software.
    - Modern cybersecurity threats means that it is important to be able to describe and analyze behaviors.
        - This analysis involves identifying the attributes of threat actors in terms of location, intent, and capability
- External vs Internal
    - **external threat actor or agent** is one that has no account or authorized access to the target system.
        - A malicious external threat must infiltrate the security system using malware and/or social engineering
    - **internal (or insider) threat actor** is one that has been granted permissions on the system.
        - employee, contractors, and business partners
- Intent vs Motivation
    - **Intent** what an attacker hopes to achieve from the attack
        - intent could be to vandalize and disrupt a system or to steal something.
    - **motivation** is the attacker's reason for perpetrating the attack.
        - A malicious threat actor could be motivated by greed, curiosity, or some sort of grievance, for instance.
- Malcious vs Unintentional
    - Malciious  - goal to disrupt or steal info
    - Accdiental  - accidents, oversights, mistakes
- **Capability** refers to a threat actor's ability to craft novel exploit techniques and tools.
    - does threat actor relies on commodity attack tools that are widely available on the web or create their own tools
    - The most capable threat actor groups receive funding from nation states and criminal syndicates.

### Types of Threat Actors

- Black Hat - Unauthorized
- White Hat - Authorized (pentester)
- Grey Hat - find vulnerabilties w/o approval but may not attempt to exploit
- A **script kiddie -** use tools without necessarily understanding how they work or having the ability to craft new attacks.
    - Script kiddie attacks might have no specific target or any reasonable goal other than gaining attention or proving technical abilities.
- **hacktivist group**, such as Anonymous, WikiLeaks, or LulzSec, uses cyber weapons to promote a political agenda
- **nation states** have developed cybersecurity expertise and will use cyber weapons to achieve both military and commercial goals.
- **Advanced Persistent Threat (APT)** Rather than think in terms of systems being infected with a virus or Trojan, an APT refers to the ongoing ability of an adversary to compromise network security—to obtain and maintain access
- **State actors**  goals of state actors are primarily espionage and strategic advantage
    - attack energy and health networks
- criminal syndicate - operate criminal profit, but typical activities are financial fraud (both against individuals and companies) and extortion
- **competitors -** aim at theft or at disrupting a competitor's business or damaging their reputation.
- **insider threat** arises from an actor who has been identified by the organization and granted some sort of access.

# Threat Intelligence Sources

- **Threat research** is a counterintelligence gathering effort in which security companies and researchers attempt to discover the tactics, techniques, and procedures (TTPs) of modern cyber adversaries.
- Threat Resource Sources
    - Companies and academic institutions engaged in primary cybersecurity research.
    - Security solution providers with firewall and anti-malware platforms derive a lot of data from their own customers' networks.
    - As they assist customers with cybersecurity operations, they are able to analyze and publicize TTPs and their indicators.
    - Analysis of the deep web (not indexed by a search engine)
        - TOR
- Analyzing Threat Intel
    - A **tactic, technique, or procedure (TTP)** is a generalized statement of adversary behavior.
        - Campaign strategy and approach (tactics)
            - Initial Access
        - Generalized attack vectors (techniques)
            - Spear-Phishing
        - Specific intrusion tools and methods (procedures).
            - Establish a backdoor/reverse shell
    - **Indicator of compromise** - sign that an asset or network has been successfully attacked or is continuing to be attacked.
        - Suspicious emails
        - Suspicious registry and file system changes
        - Unknown port and protocol usage
- **Threat Data Feed -** provides organizations with real-time or near-real-time information about emerging threats, vulnerabilities, and malicious activities.
    - Data is formatted and structured using STIX (Structured Threat Information Expression)
        - makes it easier for different systems to understand the threat intel
    - Data transmitted (Trusted Automated eXchange of Indicator Information)
        - protocol for communicating in secure and automated manner
- **Vulnerability Database**: A repository that collects, maintains, and disseminates information about identified vulnerabilities in software and hardware.
    - Vulnerability DB structures DB using STIX, and shares with TAXII
- Artificial Intelligence
    - impractical amount of the threat intel
    - AI analyzes data and uses analytics to predict future threats
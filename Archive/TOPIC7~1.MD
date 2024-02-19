# Topic 7A - Summarize Authentication Design Concepts

![Untitled](Topic%207A%20-%20Summarize%20Authentication%20Design%20Concept%2072ee96e9a9eb4e5eb556488d1e73d136/Untitled.png)

- combination of security controls to allow access to network resources

# Identity & Access Management

IAM - processes, technologies, and policies used to manage digital identities and their access to various resources

- Identities/Subjects - users, devices, software
- objects - the resources

**IAM Components**

- Identification - account or ID that represents the user, device, or process
    - State your name
- Authentication - proving the subject is who they claim to be
    - License
- Authorization - determining what subject is allowed to do, resources they can access
    - General Admission, Guest List, Bottle Service
- Accounting - monitoring and logging subject activities to ensure policy adherence
    - CCTV records activities in the club

# Authentication Factors

**Something You Know**

- the knowledge factor
- logon - username & password
    - passphrase is longer and easier to remember than a password
    - “Iwillbeacybersecruityproffessional”
- PIN (Personal Identification Number)
    - combination of numbers
- swipe patterns on touch-based devices
- used with password rest
    - “What’s your mother’s maiden name”

**********************************Something You Have**********************************

- the ownership factor; must possess something
- smart card, fob, phone
    - aka “hard tokens”
- uniquely generated access code to your phone
    - “aka soft token”

******************************Something You Are/Do Authentication******************************

- the biometric factor
- psychological and behvioral identifiers
- fingerprint, gait

# Authentication Design

- must support the CIA triad

******************************Confidentiality******************************

- credentials must be secured safely

**************Integrity**************

- authentication mechanism is reliable and can’t be counterfeited

**Availability**

- does not impede workflows of users

The context dictates design as well

- passwords are well suited for a single device or network access
- requiring a PIN for hundreds of employees who enter a building at the same time will be impractical
    - holding the door open will impact integrity

# MFA

- combination of multiple authentication factors
    - something you know + something you have
        - Password + one time pass code
        - PIN + smart card

# Authentication Attributes

- attribute - non-unique property that provides context to authentication; cannot be used independently

************Somewhere You Are************

- describes the location of the subject
- geolocation or IP address
    - IP could identify if subject is on the network
- can act as continuous authentication mechanism
    - lose access when geolocation or IP address changes (leave the premises)

********************************Something You Can Do********************************

- the way you walk or hold your phone
- typing rhythm
- mouse movement/clicking patterns

************************Something You Exhbit************************

- emphasis on personality traits
- the way you use smart phone apps or web search engines

****************************Something You Know**************************** 

- web of trust - individuals vouch for or sign the cryptographic keys of others in a decentralized network of trust
- in a country club - you must be invited by someone to join in
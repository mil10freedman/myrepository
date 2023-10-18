# Topic 8A - Implement Identity & Account Types

# Identity Management Controls

- on a private network, a digital identity is represented by an account
- a newtork admin issues and manages accounts and each user is responsible for protecting their credentials
- public networks require extra cryptographic material to ensure integrity of an account

### Certificates and Smart Cards

- In PKI a CA managers identities
- a user’s private key can be stored in a PM , smart card or USB key to authenticate to devices

### Tokens

- In SSO, a user authetnicates to an IdP and receives a cryptographic token
- A user presents this token to apps as proof of authenticaion
- tokens must resist a replay attack where a threat actor will attempt to capture and use the token

### Identity Provider

- service that provisions a user account and process authentication requests
- Local site
    - Active Directory - Local Directory
    - same site operates both the identity provisioning and the application provisioning
    - Kerberos
- 3rd party cloud services
    - implement federated identity management
    - user creates a digital identity w/ one provider, but other sites can use that identity to authorize use of an application
    
    ![Untitled](Topic%208A%20-%20Implement%20Identity%20&%20Account%20Types%2070a3602a231a444fb47d4f54773860a3/Untitled.png)
    

# Background Check & Onboarding Policies

- IAM involves IT and HR. Personnel management occurs in three phases:
    - Recruitment (hiring) -
        - candidates must be located and selected for job roles
        - background checks must be performed on candidates
    1. Operations - HR maanges comms of policy and training to employees
        1. HR must include IT security policies and training
    2. Termination or sepration - HR notifies employee but IT must handle account offboarding 
        1. 
-
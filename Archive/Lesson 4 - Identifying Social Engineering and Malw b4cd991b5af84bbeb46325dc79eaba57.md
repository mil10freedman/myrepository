# Lesson 5D - Summarize Other Cryptographic Technologies

**Quantum Computing**

- Development of computer technologies centered around  quantum theory.
    - Quantum theory explains the behavior of matter and energy on the quantum (or sub-atomic) scale.
- Classical computers use bits (0s and 1s) as the smallest unit of data
    - Quantum computers use qubits (”quantum bits”)
    - A qubit can represent a 0, a 1, or both 0 and 1 simultaneously due to the principle of superposition.
    - Superposition - quantum system can exist is multiple states at the same time
    - Entanglement - the state of one particle becomes intertwined with the state of the other, no matter the distance between them.
        - Changing the state of one instantly affects the state of the other.
        - “It allows quantum computers to be in multiple states and perform operations on those states simultaneously, making certain calculations vastly more efficient than they would be on classical computers.”
    - Public Key Cryptography relies on the difficulty of solving complex mathematic problems
        - Quantum computing is expected to easily break these algorithms
            - RSA
            - ECC
- Cryptographic Agility
    - capacity fora system to adopt an alternative cryptographic algorithm in response to the detection of vulnerabilities in the current algorithm
        - The ability to switch out cryptographic tools (like algorithms or protocols) quickly and smoothly, without causing disruptions or vulnerabilities in the system.
        - Critical as advances in quantum computing are made

# Homomorphic Encryption

- A company collects privacy-sensitive data on subjects but wants to provide that data to a 3rd party to conduct data analytics
    - data is subject to privacy laws; can’t share unencrypted data
    - Homomorphic encryption - allows the receiving company to perform statistical calculations on fields within the data while keeping the data set as a whole encrypted
        - can separate identity from data
    - example: voting - want to tally the votes but no attribution to who cast it

# Blockchain

**Blockchain** 

- decentralized digital ledger that records transactions across multiple computers.
- Each record is referred to as a block and is run through a hash function.
- **block** - contains data, a timestamp, and a cryptographic hash of the previous block, creating a linked chain.
    - Ensures that each historical transaction has not been tampered with.
    - the block is recorded in a public ledger
- public ledger - it records transactions in a manner that is transparent to all participants in the network

[Public Ledger Example](Lesson%205D%20-%20Summarize%20Other%20Cryptographic%20Technolo%20ca74d783ed5045b49927f0c13fdee476/Public%20Ledger%20Example%2030b1d4f38bce43fa93655c891a31df6a.md)

- ledger is distributed in a peer-to-peer network
- Applications
    - financial transactions, online voting, identity management, data storage
        - eliminates the need for middle men (banks, credit card companies to process transactions.) the block chain and nodes validate transactions.
        - Ensures integrity of voting machines
        - eliminates single point of failure of storing data in one place b/c its distributed across multiple nodes

# Steganography

- “hidden writing”
- practice of concealing a file, message, image, or video within another file, message, image, or video.
    - goal - hide a secret message, so that to the unsuspecting observer, only the non-secret information appears.
    - “security by obscurity”
    - can be used to support integrity and non-repudiation
        - Digital watermarking
            - embed a unique identifier of the artist
        - embed metadata - like timestamps, hashes of the original content
- threat actor could hide information in TCP packet data fields to exfiltrate data and hide from monitoring solutions
- “**Difference from Cryptography**:
    - While both steganography and cryptography are methods to secure information, they serve different purposes.
    - Cryptography focuses on making the content unreadable, steganography focuses on keeping the very existence of the message secret.”

![Untitled](Lesson%205D%20-%20Summarize%20Other%20Cryptographic%20Technolo%20ca74d783ed5045b49927f0c13fdee476/Untitled.png)
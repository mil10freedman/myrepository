# Lesson 5C - Summarize Cryptographic Use Cases & Weaknesses

- all cryptographic functions and ciphers are not created equal

# Cryptography & Authentication & Non-Repudiation

**Cryptographic Primitive**

- A single hash function, symmetric cipher, or asymmetric cipher
    - single hash, encryption algorithm, message authentication code

**Cipher Suite** 

- A complete cryptographic system with multiple cryptographic primitives
    - combination of primitives results in different cryptographic strengths/weaknesses

**Non-Repudiation**

- linked to identification and authentication
    - depends on only the recipient being able to encrypt and decrypt the message
- Complete this using public key cryptography
    - release the public key to the internet
    - private key stored safely (could additionally be protected by a password)
    - when a user needs to authenticate use the private key and hash as the digital signature
        - recepient can decrypt message with public key

# Cryptography Supporting Confidentiality

Cryptography removes the need to store or transfer messages over secure media

- but asymmetric encryption does support bulk encryption
    - RSA 2048 bit key can only encrypt 245 bytes of data
    - must use symmetric encryption (AES) for bulk encryption
    - but distribution with symmetric encryption is difficult

**Data-at-Rest**

- File Encryption - user’s private key is stored in secure storage (i.e. Trusted Platform Module)
    - private key only available after user is authenticated (password, biometric authN, etc.)
    - Public key encrypts randomly generated AES (symmetric) key.
    - when user needs encrypted information, uses private key to unencrypt the AES key which unencrypts the data
- Transpiration encryption - uses perfect forward secrecy (PFS)
    - HTTPS - web server stores private key and releases public key to the internet via digital certificates
    - go thru the process of exchanging public keys, generating temporal symmetric session keys based on the agreed upon ciphers

# Cryptography & Integrity & Resiliency

- hashing supports integrity
- combine hashing with a shared secret to create a Message authentication code (MAC) to prevent MitM attacks
- cryptography can be used to design highly resilient control systems
    - control system - consists of sensors, workstations, servers, complex operating logic
    - if the message is changed at any point during transmission, the hash changes
    - each host has its own private key that is used to secure communication. so that even if one private key is compromised the rest of the transmission it can only affect that one device
- Cryptography with Computer code
    - can be used for obfuscation or the art of making a message difficult to read
        - encryption - at some point the application code needs to be decrypted and executed
        - how do you securely store a key for decryption?
        - Developers try to embed the encryption key within the source code using security by obscurity - aka white box cryptography
            - this solution is not robust and has been thwarted by hackers

# Cryptographic Performance Limitations

- Speed - symmetric ciphers and hash functions are much faster and used for large amounts of data
- Time/latency - time to establish secure channels or process transactions
    - latency - different from the data rate
    - examples - generating digital signature, exchanging keys (DH Key Exchange), generating session keys
    - certain data requires low latency (voice/video); latency of protocol negotiation must be fast enough to not impact signal quality
- Size - longer keys are more secure
    - more computationally difficult to determine
    - not all keys are equal - 256-bit ECC key is stronger than 2048-bit RSA key
- Computational Overhead - each cipher has unique performance characteristics
    - varying CPU and memory resources
- Tradeoffs
    - Low-power devices - lack of storage capacity, power, processing power
        - embedded systems, hand-held devices, contactless smart card vs a mobile phone or laptop

# Cryptographic Security Limitations

### Entropy & Weak Keys

- Entropy - measure of disorder, unpredictability, randomness
    - goal - make text unintelligible to unauthorized person
    - Cipher text must be highly entropic
    - plaintext has low entropy.
    - weak keys have lower entropy than desired
        - DES & RC4
    - Even if a cipher (AES) is strong, it may not be when implemented in a programming library
- “How do we create entropy?”
    - Random number generation -
        - True Random Number Generator (TRNG)
        - Pseudo RNGP (PRNG)

### Predictability & Reuse

- both lead to lower entropy (aka randomness)
    - RC4 exhibits predictability which is why it is deprecated
- Initialization Vector -
    - some ciphers use CBC (Cipher Block Chaining)
    - adds randomness to block ciphers so that even if the same data is encrypted by two different blocks, two different cipher texts will be generated
- Nonce - “number used once” or never reused
    - Examples - ephemeral session keys, can be stored in cookie to prevent session hijacking
- Salt -  random string/value added to the password when hashing to keep the same passwords from having the same hash
    - thwarts rainbow attacks and dictionary attacks
        - dictionary attack - precomputed hashes of common words
    
    ![Untitled](Lesson%205C%20-%20Summarize%20Cryptographic%20Use%20Cases%20&%20We%203233471491ef415dbc42046e3aede6e0/Untitled.png)
    

### Longevity & Cryptographic Attacks

- weaknesses in cipher suites are likely to be unsafe in the near-term b/c of cracking
- longevity - measure of confidence in a cipher over years
    - as computers get faster and advanced hacking techniques are created, current algorithms may become weak or obsolete
        - ECC over RC4/DES/3DES
        - SHA-256 over SHA-1/MD5

### Man-in-the Middle & Downgrade Attacks

**MiTM**

- identity authentication is critical
- Alice requests Bob’s public key but an attacker intercepts the message and provides their public key instead.
- Alice never validated Bob’s identity
- why we use digital certificates
- ~~Because Alice hasn’t validated Bob’s identity (ie driver’s license for entry) she doesn’t know this is not Bob’s key~~
    - ~~Alice uses my public key to encrypt her message~~
    - ~~I decrypt with my private key~~
    - ~~I encrypt the data with Bob’s public key~~
    - ~~Bob decrypt’s the data with his private key~~
    - ~~I am sitting in the middle of this exchange as Alice and Bob communicate~~

**Downgrade Attack**

- clients and servers must negotiate the cipher suites to use to secure messages
    - AES vs DES
    - ECC vs RSA
- a threat attacker may attempt to force the use of weaker protocols to take advantage of weaker ciphers
    - using SSL 3.0 vs TLS 1.3

**Key Stretching**

- the system first hashes the password using a cryptographic hash function.
- Instead of storing the result of that single hash, the system will then hash the password multiple times in a loop. This repeated hashing might be done thousands, or even millions, of times.
- increases the computational effort required to brute-force guess them
- ~~taking a password or key and making it more secure by putting it thru thousands of rounds of a cryptographic functions to make it more difficult to compute~~
    - ~~adds computational overhead to brute-force~~
- One method of performing key stretching is Password-Based Key Derivation Function 2 (PBKDF2) which is used with (Wi-Fi Protected Access or WPA)

### Collisions & Birth

**Collision** 

- when two different inputs produce the same output hash.
- Since hash functions take an input and return a fixed-size string of bytes, there are inevitably going to be more possible inputs than outputs.
- Finding such a collision for a strong hash function should be extremely difficult, requiring an impractical amount of computation.
- “What is the chance that 2 people in a room have the same birthday?”
    - “What about 3 or 4 or 20 people”
    - “there’s better than a 50% chance that if you put 23 people in a room that 2 people have the same birthday”
- How does this relate to collisions? “What’s the probability of two inputs sharing the same hash”
    - An attacker picks two random inputs and picks their hashes
    - with enough inputs they may be able to check to see if the same hash has been seen before with a different input
    - A hashing function with only 1 million outputs would only need 1,178 random inputs before there was a greater than 50% chance that a hash was found
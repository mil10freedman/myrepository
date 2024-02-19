# Topic 7D - Summarize Authentication Concepts

# Biometric Authentication

- accounts for physiological feature (fingerprint or iris pattern) or behavior pattern (voice signature, typing pattern)

********************************Steps in Setting Up********************************

1. Enrollment
    1. scanned by biometric reader and converted to binary (template)
    2. each subsequent scan compares to current scan to stored scan with a degree of tolerance
- Determining if a biometric authentication is right for a situation
    - False Rejection Rate - legitimate user is not recognized (aka Type I error).
    - False Rejection Rate - interloper is accepted
        - interloper - unauthorized individual who gains access to a system
    - Crossover Error Rate (CER) - point where FRR and FAR meet. lower CER is more efficient and reliable
        - Errors reduced by tuning the system
    - Throughput (speed) - time required to complete a template for each user and the time required to reauthenticate
    - Failure to Enroll Rate (FER) - incidents where a template cannot be created/matched for a user during enrollment
    - Cost/implementation - some scanners are more expensive or not easy to implement based on the form factor (phone vs laptop)
    - Privacy Concerns
    - Inaccessible to people with disabilities

# Fingerprint Recognition

- most widely used
- sensor has a capactive cell that detects unique pattern of ridges
- non-intrusive
- moisture/dirt may impact readings
- Drawbacks:
    - threat actor obtains copy of fingerprint, create a mold, fool the scanner
    

# Facial Recognition

- records size and shape of the face, distance between each eye, width of nose
- enrollment - record under optimum lighting conditions
- high false acceptance and rejection rates
- retinal scan - infrared light is shone into eye they to ID the pattern of blood vessels
    - one of the most accurate, but expensive
    - disease can cause false negatives (cataracts)
- iris scan - matches surface patterns of the eye using near-infrared imaging
    - less intrusive and quicker than iris
    - similar level of accuracy, less affected by disease
    - involve din high volume apps (airport security)
    - potential spoofing - high-resolution eye photo

# Behavioral Technologies

- voice recognition - cheap HW and SW but obtaining template can be difficult
    - background noise and time-consuming
    - subject to impersonation
- Gait analysis - produces a template of human movement (locomotion)
    - camera-based or smart-phone features (accelerometer and gyroscope)
- Signature recognition - relatively easy to spoof but difficult to fake the signing process
    - measures stroke, speed, and pressure
- Typing - speed and pattern of a user inputting a passphrase
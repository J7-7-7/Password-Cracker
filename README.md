# Password_Analyzer_and_Cracker
Cracking passwords from popular data breches for educational purpose.

# Part 1: Yahoo
Upon reviewing the file, it's evident that it's a MySQL database dump with passwords displayed in clear text, without any encryption or hashing. To extract these plaintext passwords, I carried out the following procedure:
By dividing the content at the ':' delimiter, I was able to identify the password at the second position. Since the passwords were not encrypted, the extraction was relatively straightforward.

# Part 2: LinkedIn
The file 'SHA1.txt' contains hashed passwords. Upon inspection, it's clear that each hash consists of 40 hexadecimal characters, corresponding to 160-bit SHA1 hashes. While SHA1 is no longer considered a secure cryptographic method, decrypting it would still be a time-consuming endeavor, potentially taking months. Therefore, I opted to employ a dictionary attack, leveraging a list of 10 million frequently used passwords to attempt matching with the hashed entries in the list.
Replaced the first 5 characters to ‘00000’ as lot of the hashes given in the file 
had them and still remained 40 characters. So, I assumed the first 5 had be 
replaced by ‘00000’.Then compared them to the hashes in SHA.txt given.

# Part 3: Formspring
Upon inspecting the file, I noticed it contains 64 hexadecimal characters corresponding to 256-bit SHA256 hashes. The nature of the SHA-256 algorithm means it's non-reversible. As a result, I employed a dictionary containing commonly used passwords to compare against the list of hashes. However, when matching the SHA-256 hashes from the wordlist with those in formspring.txt, there was no successful correlation.
When I delved into articles about the data breach, I found a statement in Security Week that read: “Following the breach, we quickly rectified the vulnerability and transitioned our hashing methods from sha-256 with randomized salts to bcrypt to enhance our security measures.” This indicates that the hashes were salted.

I began my decryption attempts using the same wordlist from earlier, first incorporating simple one-digit numerical salts ranging from 0-9. After applying these salts, I hashed them with SHA256 and juxtaposed them with the hashes in the formspring.txt file.

I then expanded my efforts, experimenting with two and three-digit salts, eventually succeeding in deciphering over 100 passwords.

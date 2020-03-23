# Lecture 9 - Security and Cryptography

## Exercises

### Exercise 1

#### Exercise 1 - Task 1

Task: Calculate the number of bits of entropy a password has. This password is a concatenation of five lower-case dictionary words where each word is selected uniformly at random from a dictionary of size 100,000.

Answer: ~83 bits.

Process: The formula is `bits = log_2(num_possibilities)`, so we need to calculate the number of possibilities. It should be `100_000 ** 5`. This is `1e+25`. `log_2(1e+25)` is equal to `83.048`, so there are approximately 83 bits of entropy.

#### Exercise 1 - Task 2

Task: Calculate the number of bits of entropy a password has. This password is chosen as a sequence of 8 random alphanumeric characters (including both lowercase and uppercase). Ex: `rg8Ql34g`.

Answer: ~48 bits.

Process: There are 62 characters that are alphanumeric including both lower and upper. There are 8 digits, so the number of possibilities is `62 ** 8` or `2.1834011e+14`. This has 47.63357 bits of entropy using the formula.

#### Exercise 1 - Task 3

Task: Discuss which is the stronger password.

Answer: The first one is.

#### Exercise 1 - Task 4

Task: If an attacker can guess 10,000 passwords per second, calculate on average how long it will take for the attacker to break each of the two passwords.

Answer: For the first, approx. 893 years. For the second, approx. 30667829147641 years.

Process: `(2 ** 48) / 10_000 = 28147497671.1 seconds ~= 893 years`. `(2 ** 83) / 10_000 = 9.67140660000000049e+20 seconds ~= 30667829147641 years`.

### Exercise 2

Task: Download a Debian image from a mirror and cross-check the hash with the hash retrieved from the official Debian site.

Command: `exa | rg "^debian.*$" | xargs sha256sum > mirror-debian.txt && cmp {mirror-debian,official-debian}.txt`

### Exercise 3

Task: Encrypt a file with AES encryption, inspect the contents, decrypt it and then ensure the files are the same.

Command:

```
touch ex3.txt
...insert some text content into ex3.txt...
openssl aes-256-cbc -salt -in ex3.txt -out ex3.enc.txt
...I used "password" as the password. Very secure...
cat ex3.enc.txt
...Output was some whack stuff...
openssl aes-256-cbc -d -in ex3.enc.txt -out ex3.dec.txt
cmp ex3.txt ex3.dec.txt
```

### Exercise 4

#### Exercise 4 - Task 1

Task: Set up SSH keys (don't use RSA, use the more secure ED25519 keys).

Done.

#### Exercise 4 - Task 2

Skipped.

#### Exercise 4 - Task 3

Skipped.

#### Exercise 4 - Task 4

Task: Sign a Git commit with `git commit -C`, then verify the signature on the commit with `git show --show-signature`.

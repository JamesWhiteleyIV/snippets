#### Encrypt
```bash
gpgtar --encrypt --symmetric --output taxes.gpg --gpg-args="--passphrase=XXXXXXXX --batch" taxes
```

#### Decrypt
```bash
mkdir decrypted
gpgtar --decrypt taxes.gpg
```


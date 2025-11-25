# dotfiles
Brandon's dotfiles

## Winsupply specific environment variables

Place the following in a file in the config folder and ensure that the extension is .local (git won't track)
```sh
# AD Credentials
export WIN_USERNAME=exampleUsername
export WIN_PASSWORD=examplePassword

# Nexus
export NEXUS_USERNAME=$WIN_USERNAME
export NEXUS_PASSWORD=$WIN_PASSWORD

# Vault
export OKTA_USERNAME=${WIN_USERNAME}@winsupply.com
export OKTA_PASSWORD=$WIN_PASSWORD
```
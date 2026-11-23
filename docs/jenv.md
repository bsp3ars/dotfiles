# jenv

## Main Repository

> You should use the installation steps provided on the README.md

https://github.com/jenv/jenv

## OpenJDK Package Locations

| OS    | Command                                       | jenv Install Command                          |
| -     | -                                             | -                                             |
| Linux | `update-alternatives --list java`             | `jenv add /usr/lib/jvm/java-25-openjdk-amd64` |
| macOS | `/usr/libexec/java_home -v VERSION_NUMBER`    | `jenv add $(/usr/libexec/java_home -v 25)`    |


## Useful Commands

```bash
# Set the global version
jenv global 25

# Have jenv manage your JAVA_HOME variable
jenv enable-plugin export

# Verify that jenv is setup correctly
jenv doctor
```

To quickly update the managed Java versions, simply delete the contents of the versions folder using `rm -rf ~/.jenv/versions/` and then add them again using the correct install command for your OS.
# Git Config

To set up the basic settings, run the interactive `install.sh` script.

## Commit Signing

You can use the `gh` tool to quickly set this up:

```bash
# Generate key
ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/id_ed25519_signing

# Add key to GitHub account
gh auth login
gh ssh-key add ~/.ssh/${id}.pub --type signing

# Use key
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
git config --global commit.gpgsign true
```

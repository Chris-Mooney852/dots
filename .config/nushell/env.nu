# env.nu
#
# Installed by:
# version = "0.101.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

# Init zoxide
zoxide init nushell | save -f ~/.zoxide.nu

# init starship
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

$env.NCSPOT_CACHE_DIRECTORY = '/run/user/1000/ncspot'

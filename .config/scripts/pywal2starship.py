import toml
import os
from pathlib import Path

def load_config_files():
    """Load both TOML configuration files."""
    # Adjust these paths to match your actual file locations
    home = Path.home()
    colors_path = home / ".cache/wal/colors-alacritty.toml"  # Default pywal colors location
    starship_path = home / ".config/starship/starship.toml"  # Default starship config location

    try:
        with open(colors_path) as f:
            colors_config = toml.load(f)

        with open(starship_path) as f:
            starship_config = toml.load(f)

        return colors_config, starship_config, starship_path
    except FileNotFoundError as e:
        print(f"Error: Could not find configuration file: {e.filename}")
        return None, None, None

def update_starship_colors(colors_config, starship_config):
    """Update the Starship config with colors from pywal."""
    # Get colors from pywal config
    normal_colors = colors_config['colors']['normal']

    # Update character module colors
    if 'character' in starship_config:
        starship_config['character']['success_symbol'] = f"[• ](bold fg:{normal_colors['green']}) "
        starship_config['character']['error_symbol'] = f"[• 󰅙](bold fg:{normal_colors['red']}) "

    # Update git_branch module colors
    if 'git_branch' in starship_config:
        starship_config['git_branch']['style'] = f"bg:{normal_colors['green']}"
        starship_config['git_branch']['format'] = f"[$symbol $branch(:$remote_branch)](fg:{normal_colors['green']})"

    # Update username module colors
    if 'username' in starship_config:
        starship_config['username']['style_user'] = f"bold fg:{normal_colors['cyan']}"
        starship_config['username']['style_root'] = f"fg:{normal_colors['red']} bold"
        starship_config['username']['format'] = f"[$user]($style)"

    # Update directory module colors
    if 'directory' in starship_config:
        starship_config['directory']['style'] = f"fg:{normal_colors['green']}"
        starship_config['directory']['format'] = f'[$path ]($style)'

    # Update cmd_duration module colors
    if 'cmd_duration' in starship_config:
        starship_config['cmd_duration']['format'] = f'[ $duration](bold fg:{normal_colors["yellow"]})'

    return starship_config

def save_starship_config(config, path):
    """Save the updated Starship configuration."""
    try:
        # Create backup of current config
        backup_path = path.with_suffix('.toml.backup')
        os.replace(path, backup_path)

        # Save new config
        with open(path, 'w') as f:
            toml.dump(config, f)
        print(f"Successfully updated Starship config at {path}")
        print(f"Backup saved at {backup_path}")
    except Exception as e:
        print(f"Error saving configuration: {e}")
        # Restore backup if save failed
        if backup_path.exists():
            os.replace(backup_path, path)
            print("Restored backup due to save error")

def main():
    # Load configurations
    colors_config, starship_config, starship_path = load_config_files()
    if not all([colors_config, starship_config, starship_path]):
        return

    # Update colors
    updated_config = update_starship_colors(colors_config, starship_config)

    # Save updated configuration
    save_starship_config(updated_config, starship_path)

if __name__ == "__main__":
    main()

#!/usr/bin/env bash


# Set Terminal Settings 
# Get the list of profiles
PROFILES=$(dconf list /org/gnome/terminal/legacy/profiles:/)

# Extract the default profile ID
DEFAULT_PROFILE_ID=$(echo "$PROFILES" | grep '^:' | sed 's/^://;s/\///')

# Set the scrollbar policy to 'never' for each profile
for PROFILE_ID in $DEFAULT_PROFILE_ID
do
    # Check if the current profile ID matches the one provided
    if [ -n "$PROFILE_ID" ]; then
        # Set the scrollbar policy for this profile
        dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/scrollbar-policy "'never'"
        echo "Scrollbar policy set to 'never' for profile $PROFILE_ID."

        # Set the background to trasparent 
        dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/use-transparent-background true
        echo "Transparent Background set to true for profile $PROFILE_ID."

        dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/audible-bell false

        dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/background-transparency-percent 20
        
        dconf write /org/gnome/desktop/interface/monospace-font-name "'Fira Code 12'"

        #dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/use-system-font false

        #dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/font "'Fira Code 12'"

        dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/audible-bell false

    else
        echo "Could not determine the profile ID."
    fi
done

mkdir -p ~/.config/gtk-3.0
cp gtk.css  ~/.config/gtk-3.0/.
echo "Added padding to gnome terminal"


# General Desktop changes
dconf write /org/gnome/desktop/peripherals/touchpad/click-method "'areas'"

dconf write /org/gnome/desktop/interface/clock-format "'12h'"

dconf write /org/gtk/settings/file-chooser/clock-format "'12h'"
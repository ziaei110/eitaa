#!/bin/bash

# Function to add menu item for GNOME
add_to_gnome() {
    # Create a desktop entry file
    echo "[Desktop Entry]
    Type=Application
    Name=My Application
    Exec=/path/to/myapplication
    Icon=/path/to/myapplication.png
    Categories=Utility;" | sudo tee /usr/share/applications/myapplication.desktop > /dev/null

    # Update the GNOME menu
    sudo update-desktop-database
}

# Function to add menu item for Xfce
add_to_xfce() {
    # Create a desktop entry file
    echo "[Desktop Entry]
    Type=Application
    Name=My Application
    Exec=/path/to/myapplication
    Icon=/path/to/myapplication.png
    Categories=Utility;" | sudo tee /usr/share/applications/myapplication.desktop > /dev/null

    # Update the Xfce menu
    xfce4-panel --reload
}

# Function to add menu item for LXDE
add_to_lxde() {
    # Create a desktop entry file
    echo "[Desktop Entry]
    Type=Application
    Name=My Application
    Exec=/path/to/myapplication
    Icon=/path/to/myapplication.png
    Categories=Utility;" | sudo tee /usr/share/applications/myapplication.desktop > /dev/null

    # Update the LXDE menu
    lxpanelctl restart
}

# Function to add menu item for KDE
add_to_kde() {
    # Create a desktop entry file
    echo "[Desktop Entry]
    Type=Application
    Name=My Application
    Exec=/path/to/myapplication
    Icon=/path/to/myapplication.png
    Categories=Utility;" | sudo tee /usr/share/applications/myapplication.desktop > /dev/null

    # Update the KDE menu
    kbuildsycoca5
}

# Function to add menu item for LXQt
add_to_lxqt() {
    # Create a desktop entry file
    echo "[Desktop Entry]
    Type=Application
    Name=My Application
    Exec=/path/to/myapplication
    Icon=/path/to/myapplication.png
    Categories=Utility;" | sudo tee /usr/share/applications/myapplication.desktop > /dev/null

    # Update the LXQt menu
    lxqt-panelctl restart
}

# Function to add menu item for Openbox
add_to_openbox() {
    # Create a desktop entry file
    echo "[Desktop Entry]
    Type=Application
    Name=My Application
    Exec=/path/to/myapplication
    Icon=/path/to/myapplication.png
    Categories=Utility;" | sudo tee /usr/share/applications/myapplication.desktop > /dev/null
}

# Check the Linux distribution
if [ -f /etc/debian_version ]; then
    # Debian or Ubuntu
    if [ -x "$(command -v gnome-shell)" ]; then
        # GNOME
        add_to_gnome
    elif [ -x "$(command -v xfce4-panel)" ]; then
        # Xfce
        add_to_xfce
    elif [ -x "$(command -v lxpanelctl)" ]; then
        # LXDE
        add_to_lxde
    elif [ -x "$(command -v kbuildsycoca5)" ]; then
        # KDE
        add_to_kde
    elif [ -x "$(command -v lxqt-panelctl)" ]; then
        # LXQt
        add_to_lxqt
    elif [ -x "$(command -v openbox)" ]; then
        # Openbox
        add_to_openbox
    else
        echo "Unsupported desktop environment."
        exit 1
    fi
elif [ -f /etc/arch-release ]; then
    # Manjaro
    if [ -x "$(command -v gnome-shell)" ]; then
        # GNOME
        add_to_gnome
    elif [ -x "$(command -v xfce4-panel)" ]; then
        # Xfce
        add_to_xfce
    elif [ -x "$(command -v lxpanelctl)" ]; then
        # LXDE
        add_to_lxde
    elif [ -x "$(command -v kbuildsycoca5)" ]; then
        # KDE
        add_to_kde
    elif [ -x "$(command -v lxqt-panelctl)" ]; then
        # LXQt
        add_to_lxqt
    elif [ -x "$(command -v openbox)" ]; then
        # Openbox
        add_to_openbox
    else
        echo "Unsupported desktop environment."
        exit 1
    fi
else
    echo "Unsupported Linuxdistribution."
    exit 1
fi

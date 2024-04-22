#!/bin/bash

# Function to generate filenames in the pattern linux, linux.0, linux.1, ..., linux.n
generate_filename() {
    local basename="linux"
    local counter=0
    local filename="$basename"

    while [ -e "$filename" ]; do
        filename="${basename}.$counter"
        counter=$((counter + 1))
    done

    echo "$filename"
}

# Define path variables
APP_DIR="$HOME/پیام‌رسان/ایتا"
APP_PATH="$APP_DIR/eitaa"
ICON_URL="https://eitaa.com/assets/images/logos/site-logo-larg.png"
ICON_PATH="$APP_DIR/site-logo-larg.png"
DESKTOP_FILE_PATH="$HOME/.local/share/applications/eitaa.desktop"

# Create application directory if it doesn't exist
mkdir -p "$APP_DIR"

# Generate a unique filename for the download
filename=$(generate_filename)

# Download the file and save it with the generated filename
wget https://eitaa.com/app/linux -O "$filename"

# Check if the downloaded file is a directory
if [ -d "$filename" ]; then
    # If it's a directory, assume it's the extracted contents
    mv "$filename" "$APP_DIR/eitaa"
else
    # If it's not a directory, assume it's an archive and extract it
    tar xvf "$filename" -C "$APP_DIR"
    # Assuming the extracted directory is named Eitaa, if not, adjust accordingly
    if [ -d "$APP_DIR/linux" ]; then
        mv "$APP_DIR/linux" "$APP_DIR/eitaa"
    else
        mv "$APP_DIR/Eitaa" "$APP_DIR/eitaa"
    fi
fi

# Download the icon if it doesn't exist
if [ ! -f "$ICON_PATH" ]; then
    wget "$ICON_URL" -O "$ICON_PATH"
fi

# Create the .desktop file
echo "[Desktop Entry]
Name=Eitaa
Comment=Iranian Messenger
Exec=\"$APP_PATH\"
Icon=$ICON_PATH
Type=Application
Categories=Network;InstantMessaging;
Terminal=false" > "$DESKTOP_FILE_PATH"

# Make the .desktop file executable
chmod +x "$DESKTOP_FILE_PATH"

# Make the application executable if it's not already
if [ ! -x "$APP_PATH" ]; then
    chmod +x "$APP_PATH"
fi

# export QT_QPA_PLATFORM=wayland
# ./eitaa &

echo "Eitaa desktop entry has been created successfully."

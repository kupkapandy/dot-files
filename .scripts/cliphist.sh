#!/bin/bash

# Copy test text to clipboard
echo "Test Clipboard" | wl-copy

# Verify clipboard content
clipboard_content=$(wl-paste)
echo "Clipboard Content: $clipboard_content"

# Ensure cliphist has content
cliphist list > /tmp/cliphist_list_output
if [ $? -ne 0 ]; then
  echo "Failed to list clipboard history or history is empty. Please copy something to the clipboard first."
  exit 1
fi

# Display clipboard history for debugging
cat /tmp/cliphist_list_output

# Select entry with rofi
selected=$(cat /tmp/cliphist_list_output | rofi -dmenu -config ~/.config/rofi/regular.rasi)
if [ -z "$selected" ]; then
  echo "No selection made"
  exit 1
fi
echo "Selected: $selected" > /tmp/rofi_selected_output

# Decode the selected entry
decoded=$(echo "$selected" | cliphist decode)
if [ $? -ne 0 ]; then
  echo "Failed to decode selection"
  exit 1
fi
echo "Decoded: $decoded" > /tmp/cliphist_decoded_output

# Copy the decoded entry to clipboard
echo "$decoded" | wl-copy
if [ $? -ne 0 ]; then
  echo "Failed to copy to clipboard"
  exit 1
fi

echo "Selection copied to clipboard successfully"

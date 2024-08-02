
#!/bin/bash

# Define the path to the file containing the links
links_file="links"

# Read the file line by line
while IFS= read -r link
do
  # Ensure the line is not empty
  if [ -n "$link" ]; then
    # List available formats and select the best audio format
    best_audio_format=$(yt-dlp -F "$link" | grep 'audio only' | awk '{print $1}' | head -n 1)

    # Check if a valid audio format was found
    if [ -n "$best_audio_format" ]; then
      # Run the command with the best audio format
      yt-dlp -x -f "$best_audio_format" "$link"
      if [ $? -eq 0 ]; then
        echo "Successfully downloaded: $link"
      else
        echo "Failed to download: $link"
      fi
    else
      echo "No valid audio format found for: $link"
    fi
  fi
done < "$links_file"


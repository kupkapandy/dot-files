#!/usr/bin/env python3

import os
from PIL import Image

# Define the original and target directories
original_directory = "/home/frank/Quotes/"  # Change this to your original directory
target_directory = "/home/frank/Quotes/"      # Change this to your target directory

# Define the target size
target_size = (1440, 2560)

# Ensure the target directory exists
os.makedirs(target_directory, exist_ok=True)

# Iterate through files in the original directory
for filename in os.listdir(original_directory):
    if filename.startswith("quote") and filename.endswith(".png"):
        try:
            # Extract the number from the filename
            number = filename[5:-4]
            
            # Open the image
            original_path = os.path.join(original_directory, filename)
            with Image.open(original_path) as img:
                # Resize the image
                resized_img = img.resize(target_size, Image.Resampling.LANCZOS)
                
                # Create the new filename
                new_filename = f"quote{number}.png"
                new_path = os.path.join(target_directory, new_filename)
                
                # Save the resized image
                resized_img.save(new_path)
                
                print(f"Resized and saved {filename} as {new_path}")
        
        except Exception as e:
            print(f"Failed to process {filename}: {e}")



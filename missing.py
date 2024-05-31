import os
import re

# Function to extract episode number from the filename
def extract_episode_number(filename):
    match = re.search(r'- (\d+) -', filename)
    if match:
        return int(match.group(1))
    return None

# Function to find missing episodes
def find_missing_episodes(root_folder, total_episodes):
    episode_numbers = []

    # Walk through all files in the directory and subdirectories
    for root, dirs, files in os.walk(root_folder):
        for file in files:
            if file.endswith('.mkv'):  # Ensure only MKV files are considered
                episode_number = extract_episode_number(file)
                if episode_number is not None:
                    episode_numbers.append(episode_number)

    # Sort episode numbers and find missing ones
    episode_numbers.sort()
    all_episodes = set(range(1, total_episodes + 1))
    existing_episodes = set(episode_numbers)
    missing_episodes = all_episodes - existing_episodes

    return sorted(missing_episodes)

# Specify the root folder where your files are stored
root_folder = '/path/to/your/files'
total_episodes = 1106

# Find and print the missing episodes
missing_episodes = find_missing_episodes(root_folder, total_episodes)
print("Missing episodes:", missing_episodes)

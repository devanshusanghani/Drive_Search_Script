# drive_search.sh Script

## Overview
The `drive_search.sh` script allows users to search for or extract specific key information types (e.g., phone numbers, URLs, email addresses, IPs, usernames) from files within a directory.

## Usage

```
./drive_search.sh <operation_type> <key_information_type>
```

### Parameters:

- `operation_type`: 
  - `0` for searching files that may contain the specified key information.
  - `1` for extracting the specified key information from all files.
  
- `key_information_type`: Specify the type of key information to search for. Valid options are:
  - `phone`
  - `url`
  - `email`
  - `ip`
  - `username`

## How It Works

1. The script first checks for the correct number of arguments.
2. It defines regex patterns for different types of key information.
3. The script ensures that there are searchable files in the directory.
4. Depending on the `operation_type`:
   - The script either searches files for the specified pattern.
   - Or extracts and displays the specified pattern from the contents of the files.

## Test Cases

### 1. Search for files containing phone numbers:

Command:
```bash
./drive_search.sh 0 phone
```

Output:
(Include a screenshot of the output here)

![Phone Search Screenshot](ss_01.PNG)

### 2. Extract email addresses from all files:

Command:
```bash
./drive_search.sh 1 email
```

Output:
(Include a screenshot of the output here)

![Email Extraction Screenshot](ss_02.PNG)

## Troubleshooting

If you encounter the following error:

```
./drive_search.sh: line 23: syntax error near unexpected token `$'in\r''
'/drive_search.sh: line 23: `case $operation in
```

This suggests that the script has Windows-style line endings. To fix this, you can use the `dos2unix` tool:

```bash
dos2unix ./drive_search.sh
```

---

## Note:
Ensure that you have the necessary permissions to execute the script. If not, you can make the script executable using the command:

```bash
chmod +x drive_search.sh
```

---

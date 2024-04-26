## Email Cleanup Bash Script

This bash script helps you clean up a list of emails by filtering out private addresses from free email providers like Yahoo, Gmail, Rogers, etc. It allows you to focus on relevant addresses that contain specific keywords, such as `info@`, `contact@`, `entertainment@`, etc.

### Usage:

#### Preparation:
- Ensure each email address starts on a new line in your `.txt` file.
- Create a folder containing your email list `.txt` file and the `cleanup.sh` script.

#### Setup:
- Make the `cleanup.sh` script executable by running `chmod +x cleanup.sh` in the terminal.

#### Execution:
- Run the script. You will be prompted to provide:
  - Input and output file names.
  - List of GOOD keywords (related to your list) separated by spaces or commas.
  - List of BAD keywords (free email providers) separated by spaces or commas.

If an email adress contains a good keyword and a bad one, the adress will be kept in the list. (example: keyword = programmation, the address festivalprogrammation@badkeyword.xxx will be kept in the list)

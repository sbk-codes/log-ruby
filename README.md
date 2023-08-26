# log-ruby
## Analaysing and processing log files

### Using Ruby Interpreter
1. **Clone the Repository**: Clone this repository to your local machine using `git clone https://github.com/sbk-codes/log-ruby.git`.

2. **Navigate to the Directory**: Open the terminal and navigate to the directory where you cloned the repository.

3. **Run the Script**: Execute the script(s) by using the Ruby interpreter with the file name.
`ruby calculate_aggregations.rb` or `ruby count_status_codes.rb` or `ruby get_users_with_version.rb`

      Note: To update the input, Go to the file and search for the comment: `# Example call with sample log lines, update your log lines here` and update the variable `log_files`

4. **View Output**: The script will display the output in the terminal.

      Make sure you have Ruby installed on your local machine. You can check your Ruby version with `ruby -v`.
      Note: This method is for running the script directly with Ruby on your local machine.

---

### Using Docker
1. **Clone the Repository**: Clone this repository to your local machine using `git clone https://github.com/sbk-codes/log-ruby.git`.

2. **Navigate to the Directory**: Open the terminal and navigate to the directory where you cloned the repository.

3. **Run Docker Compose**: Execute the following command to run the Docker container using docker-compose:
```
docker-compose run -e FILENAME=calculate_aggregations.rb ruby_app

```
     Note: To run other programs, replace `calculate_aggregations` with `count_status_codes` or `get_users_with_version`

4. **View Output**: The script will display the output in the terminal.

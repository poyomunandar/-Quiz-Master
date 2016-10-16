This rails application theoretically can be installed in any OS. For windows, make sure any issues such as SSL and devkit already installed properly so gem installation will be running fine.
Prerequisite: Ruby version 2.2.3, Rails 5.0, MySQL database is running and ready to use
Steps:
1. Copy the source to the machine. Let's assume this directory is our root directory.
2. Run gem install bundle from command console
3. Run bundle install from command console
4. Modify the database config file in config/database.yml
  - Set the host to the IP of the database machine
  - Set username and password to a working username and password for the MySQL database
5. Run rake db:create from command console
6. Run rake db:migrate from command console
7. Run rails server -e development from command console


HOW TO TEST
1. Open browser, set URL to htp://<server IP>:<server PORT> and press enter. This should open the Manage Questions page for the first time
   
HOW TO RUN THE UNIT TEST
- go to the root directory and run rspec in the command console. Notes: need to have an active database, so make sure the database.yml (test) already pointed to a working database before run the rspec.
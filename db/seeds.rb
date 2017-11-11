# Put data creation code here
# Initiate the data by running 'rake db:seed'
# in the command line after running migrations (rake db:migrate)

# e.g.

User.destroy_all
User.create(f_name: 'Bobby',
l_name: 'McBobberson',
username: 'bob',
password: 'x',
email: 'bm@example.com')

User.create(f_name: 'Nanny',
l_name: 'Elevator',
username: 'El',
password: 'x',
email: 'elb@example.com')

User.create(f_name: 'Jane',
l_name: 'Doe',
username: 'jane',
password: 'j',
email: 'jane@example.com')

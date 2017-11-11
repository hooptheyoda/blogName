# Put data creation code here
# Initiate the data by running 'rake db:seed'
# in the command line after running migrations (rake db:migrate)

# e.g.
#
User.destroy_all
user = User.create(
  f_name: 'Bobby',
l_name: 'McBobberson',
username: 'bob',
password: 'x',
email: 'bm@example.com')


# l_name: 'McBobberson', username: 'bob', email: 'somethingemail', password: 'x')

package 'mysql-server' do
  action :install
end

template '/etc/mysql/my.cnf' do
  mode '644'
  owner 'root'
  group 'root'
  source 'templates/etc/mysql/slave.cnf'
end

service 'mysql' do
  action :start
end


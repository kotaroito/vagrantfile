package 'mysql-server' do
  action :install
end

template '/etc/mysql/my.cnf' do
  mode '644'
  owner 'root'
  group 'root'
  source 'templates/etc/mysql/master.cnf'
end

execute 'mysql' do
  grant_repl = %Q{"GRANT REPLICATION SLAVE ON *.* TO repl@192.168.33.11 IDENTIFIED BY 'repl';"}
  command "echo #{grant_repl} | mysql -uroot"
end

service 'mysql' do
  subscribes :restart, "template[/etc/mysql/my.cnf]"
  action :start
end

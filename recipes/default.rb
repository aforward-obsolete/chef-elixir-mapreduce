
include_recipe "elixir"

cookbook_file "#{node[:elixir_mapreduce][:install_dir]}/map_reduce.ex" do
  source "map_reduce.ex"
  mode 0755
end


# MapReduce.go([["o","a"],["t","g","o"],["t","j","a"],["o","t"]],Collaborator)
cookbook_file "#{node[:elixir_mapreduce][:install_dir]}/collaborator.ex" do
  source "collaborator.ex"
  mode 0755
end
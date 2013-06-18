defmodule Collaborator do
  def map(list), do: map(list,list,HashDict.new [])
  def map([],_,hash), do: hash
  def map([head|tail],list,hash), do: map(tail,list,HashDict.put(hash,head,list))

  def reduce(list), do: reduce(list,[])
  def reduce([],reduced), do: Enum.uniq(reduced)
  def reduce([head|tail],reduced), do: reduce(tail,reduced ++ head)
end
defmodule MapReduce do

  def map(inputs,func), do: map(inputs,func,[])
  def map([],_func,mapped), do: mapped
  def map([head|tail],func,mapped), do: map(tail,func,[ func.(head) | mapped ])

  def shuffle(all_mapped), do: shuffle(all_mapped,HashDict.new)
  def shuffle([],shuffled), do: shuffled
  def shuffle([head|tail],shuffled), do: shuffle(tail,HashDict.merge( HashDict.merge( head, head, fn(_k,v1,_) -> [ v1 ] end), shuffled, fn(_k, v1, v2) -> List.concat(v1,v2) end))

  def reduce_entry({key,data},func,reduced), do: HashDict.put(reduced,key,func.(data))
  def reduce(shuffled, func), do: reduce(HashDict.to_list(shuffled),func,HashDict.new)
  def reduce([], _func, reduced), do: reduced
  def reduce([head|tail], func, reduced), do: reduce(tail,func,reduce_entry(head,func,reduced))

  def go(inputs,module) do
    mapped = map(inputs,fn(x) -> module.map(x) end)
    shuffled = shuffle(mapped)
    reduced = reduce(shuffled, fn(x) -> module.reduce(x) end)
    reduced
  end

end
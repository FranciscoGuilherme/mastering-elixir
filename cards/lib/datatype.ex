defmodule Datatype do
  def definition do
    colors = [{:primary, "red"}, {:secondary, "green"}]
    colors[:primary]
    colors = [primary: "red", secondary: "green"]
    colors[:secondary]
  end
end

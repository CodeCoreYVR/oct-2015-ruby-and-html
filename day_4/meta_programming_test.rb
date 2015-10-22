class MetaProgrammingTest

  [:a, :b, :c, :d, :e].each do |name|
    define_method(name) do
      puts "You called the method #{name}"
    end
  end

  def method_missing(*args)
    print args
  end

end
